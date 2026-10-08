!(import! &self ./prism-execution-fixture)

!(Execution.Reset 1.0)
!(let $plan (hillClimbingPlanner (ball heading-to-agent) (ball heading-to-opponent) &testedActions () &r)
    (Execution.Report Native healthy $plan))

!(Execution.Reset 0.1)
!(let $plan (hillClimbingPlanner (ball heading-to-agent) (ball heading-to-opponent) &testedActions () &r)
    (Execution.Report Native tired $plan))
