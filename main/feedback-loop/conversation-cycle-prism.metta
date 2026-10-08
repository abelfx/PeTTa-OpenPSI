!(import! &self ./conversation-cycle-fixture)
!(let $plan (psi-select-actions Prism Conversation-Started Understand-User-Interests)
    (let $_ (println! (CONVERSATION_CYCLE_PRISM_PLAN $plan))
         (println! (CONVERSATION_CYCLE_PRISM_VALID
                    (isGoalMet? $plan Conversation-Started
                                (Goal Understand-User-Interests 1.0 1.0) &ruleSpace)))))
!(println! (CONVERSATION_CYCLE_PRISM
            (psi-agent-loop-prism Conversation-Started &kb)))
!(println! (CONVERSATION_CYCLE_PRISM_DEMAND (fetchDemand &demandspace competence)))
!(println! (CONVERSATION_CYCLE_PRISM_KB_DEMANDS (queryAll &kb demand)))
