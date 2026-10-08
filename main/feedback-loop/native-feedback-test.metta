; Legacy feedback-loop import must remain usable without PRISM installed.
!(import! &self ./feedback-loop)

!(add-atom &ruleSpace
    ((: direct ((TTV 1 (STV 0.8 0.7))
                (IMPLICATION_LINK (AND_LINK ((Goal init 0.9 0.6) finish))
                                  (Goal target 1.0 1.0)))) 2))

!(let $actions (psi-select-actions Native init target)
   (if (== $actions (finish))
       (println! OPENPSI_NATIVE_COMPAT_PASS)
       (println! OPENPSI_NATIVE_COMPAT_FAIL)))
