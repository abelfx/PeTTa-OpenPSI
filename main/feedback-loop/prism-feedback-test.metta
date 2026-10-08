; Entry point in OpenPsi's feedback-loop directory so PeTTa nested imports resolve.
!(import! &self ../mind-agents/action-planner/action-planner-v2)
!(import! &self ../mind-agents/action-planner/prism-openpsi)
!(import! &self ./feedback-loop)

!(add-atom &ruleSpace
    ((: first ((TTV 1 (STV 0.8 0.7))
               (IMPLICATION_LINK (AND_LINK ((Goal init 0.9 0.6) explore))
                                 (Goal middle 1.0 1.0)))) 2))
!(add-atom &ruleSpace
    ((: decoy ((TTV 1 (STV 0.9 0.9))
               (IMPLICATION_LINK (AND_LINK ((Goal init 0.9 0.6) idle))
                                 (Goal deadend 1.0 1.0)))) 9))
!(add-atom &ruleSpace
    ((: second ((TTV 1 (STV 0.8 0.7))
                (IMPLICATION_LINK (AND_LINK ((Goal middle 0.9 0.6) finish))
                                  (Goal target 1.0 1.0)))) 2))

!(let $actions (psi-select-actions Prism init target)
   (let $_ (println! (FEEDBACK_ACTIONS $actions))
        (if (== $actions (explore finish))
            (println! PRISM_OPENPSI_FEEDBACK_DISPATCH_PASS)
            (println! PRISM_OPENPSI_FEEDBACK_DISPATCH_FAIL))))
!(let $actions (psi-select-actions Native init target)
   (println! (OPENPSI_NATIVE_FEEDBACK_ACTIONS $actions)))
