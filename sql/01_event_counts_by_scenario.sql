SELECT scenario_type, COUNT(*) AS events
FROM public.workflow_events
GROUP BY scenario_type
ORDER BY scenario_type;
