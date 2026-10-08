!(import! &self ./prism-execution-fixture)
!(import! &self ../../../main/mind-agents/action-planner/prism-openpsi)

!(Execution.Reset 1.0)
!(let $plan (PRISM.OpenPsi.Plan (ball heading-to-agent) (ball heading-to-opponent) &r 8)
    (Execution.Report Prism healthy $plan))

!(Execution.Reset 0.1)
!(let $plan (PRISM.OpenPsi.Plan (ball heading-to-agent) (ball heading-to-opponent) &r 8)
    (Execution.Report Prism tired $plan))
