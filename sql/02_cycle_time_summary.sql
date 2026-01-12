WITH runs AS (
  SELECT
    scenario_type,
    case_id,
    MIN(created_at) AS start_time,
    MAX(created_at) AS end_time
  FROM public.workflow_events
  WHERE scenario_type IN ('baseline','optimized')
  GROUP BY scenario_type, case_id
)
SELECT
  scenario_type,
  ROUND(AVG(EXTRACT(EPOCH FROM (end_time - start_time))/60)::numeric, 2) AS avg_cycle_minutes,
  ROUND(MIN(EXTRACT(EPOCH FROM (end_time - start_time))/60)::numeric, 2) AS min_cycle_minutes,
  ROUND(MAX(EXTRACT(EPOCH FROM (end_time - start_time))/60)::numeric, 2) AS max_cycle_minutes,
  COUNT(*) AS cases
FROM runs
GROUP BY scenario_type
ORDER BY avg_cycle_minutes DESC;
