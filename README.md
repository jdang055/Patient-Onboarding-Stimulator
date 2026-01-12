# Clinical Workflow Optimization Simulator – Patient Onboarding 🩺🩺🩺

This project simulates a clinical patient onboarding workflow using event-level
data to identify operational bottlenecks and measure the impact of workflow
optimization.

## Workflow Modeled
- Intake submitted
- Ops review (manual)
- Provider review
- Completion

Two scenarios were simulated:
- **Baseline:** manual ops review with queue delays
- **Optimized:** automated triage and reduced manual handling

## Key Findings
- Ops review was the primary bottleneck in the baseline workflow
- Average ops review time decreased by ~33% after optimization
- End-to-end onboarding cycle time improved by ~11–15%
- Automation reduced manual queue delays and improved throughput

## Tech Stack
- n8n (workflow simulation)
- Supabase Postgres (event storage)
- SQL (cycle time & bottleneck analysis)

## Why This Matters
This project demonstrates how event-driven data and SQL analysis can be used
to identify inefficiencies in clinical operations and evaluate workflow
improvements before production changes are made.
