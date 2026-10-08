; Exercise the repository's actual ping action and state mutation, not only
; symbolic rule replay. This is a one-turn noninteractive agent fixture.
!(import! &self ../../../main/rules/rule)
!(import! &self ../../../main/mind-agents/action-planner/action-planner-v2)
!(import! &self ../ping-pong-v3)
!(import! &self ../../../main/type)

!(addGoal (ball heading-to-agent) 1.0 1.0 &r)
!(addGoal (ball heading-to-opponent) 0.0 1.0 &r)
!(addGoal (ball lost) 0.0 0.0 &r)
!(addGoal (agent motivation) 1.0 1.0 &r)

!(add-atom &r
    ((: r_return
        ((TTV 0 (STV 1.0 1.0))
         (IMPLICATION_LINK
             (AND_LINK ((Goal (ball heading-to-agent) 1.0 1.0) act-ping))
             (Goal (ball heading-to-opponent) 1.0 1.0)))) 1.0))
!(add-atom &r
    ((: r_wait
        ((TTV 0 (STV 1.0 1.0))
         (IMPLICATION_LINK
             (AND_LINK ((Goal (ball heading-to-opponent) 1.0 1.0) act-wait))
             (Goal (ball heading-to-agent) 1.0 1.0)))) 1.0))

(= (Execution.Reset $energy)
    (let* (($_ (setGv (ball heading-to-agent) 1.0 &r))
           ($_ (setGv (ball heading-to-opponent) 0.0 &r))
           ($_ (setGv (ball lost) 0.0 &r))
           ($_ (setGv (agent motivation) $energy &r)))
          ()))

(= (Execution.Report $mode $condition $plan)
    (let* (($applied (executePlan $plan))
           ($opponent (goal-value (ball heading-to-opponent) &r))
           ($lost (goal-value (ball lost) &r))
           ($energy (goal-value (agent motivation) &r)))
          (println! (EXECUTION_RESULT $mode $condition $plan $applied $opponent $lost $energy))))
