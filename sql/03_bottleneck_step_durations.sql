WITH step_durations AS (
  SELECT
    scenario_type,
    case_id,
    step_name,
    EXTRACT(EPOCH FROM (
      MAX(created_at) FILTER (WHERE event_type = 'COMPLETE')
      - MIN(created_at) FILTER (WHERE event_type = 'START')
    )) / 60 AS step_minutes
  FROM public.workflow_events
  WHERE scenario_type IN ('baseline', 'optimized')
  GROUP BY scenario_type, case_id, step_name
)
SELECT
  scenario_type,
  step_name,
  ROUND(AVG(step_minutes)::numeric, 2) AS avg_step_minutes,
  ROUND(MAX(step_minutes)::numeric, 2) AS max_step_minutes
FROM step_durations
WHERE step_minutes IS NOT NULL
GROUP BY scenario_type, step_name
ORDER BY scenario_type, avg_step_minutes DESC;
