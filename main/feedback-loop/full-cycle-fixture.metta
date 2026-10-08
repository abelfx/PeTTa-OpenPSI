; Non-interactive fixture for exercising the actual OpenPsi feedback loop.
!(import! &self ../mind-agents/action-planner/action-planner-v2)
!(import! &self ../mind-agents/action-planner/prism-openpsi)
!(import! &self ./feedback-loop)

!(bind! &kb (new-space))
!(bind! &modulator-space (new-space))
!(insert-modulators &modulator-space)

(: competence (Goal target 1.0 1.0))
(: affiliation (Goal target 1.0 1.0))
(: energy (Goal target 1.0 1.0))
!(add-atom &demandspace (demand competence 0.3 0.5 0.1))
!(add-atom &demandspace (demand affiliation 0.3 0.5 0.9))
!(add-atom &demandspace (demand energy 0.3 0.5 0.9))

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

; Keep demand selection fixed; all three demands remain in the modulator space.
!(add-atom &kb (demand competence 0.3 0.5 0.1))
!(println! (FULL_CYCLE_READY (fetchLeastSatisfiedDemand &kb) (get-type competence)))

; Verify every action through the port's own transition implementation.
(= (OpenPsiCycle.Replay $plan $state $goal)
   (if (== $plan ())
       (== $state $goal)
       (let* (($action (car-atom $plan))
              ($rest (cdr-atom $plan))
              ($successors (applyCurrentActions ($action) $state () &ruleSpace)))
             (if (== $successors ())
                 False
                 (let* (($pair (car-atom $successors))
                        (($next) (cdr-atom $pair)))
                       (OpenPsiCycle.Replay $rest $next $goal))))))
