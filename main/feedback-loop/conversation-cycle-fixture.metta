; Noninteractive feedback-loop fixture on OpenPsi's repository conversation rules.
!(import! &self ../mind-agents/action-planner/action-planner-v2)
!(import! &self ../mind-agents/action-planner/prism-openpsi)
!(import! &self ./feedback-loop)

!(bind! &kb (new-space))
!(bind! &modulator-space (new-space))
!(insert-modulators &modulator-space)
!(addRulesToSpace &ruleSpace)

(: competence (Goal Understand-User-Interests 1.0 1.0))
!(add-atom &demandspace (demand competence 0.3 0.5 0.1))
!(add-atom &demandspace (demand affiliation 0.3 0.5 0.9))
!(add-atom &demandspace (demand energy 0.3 0.5 0.9))
!(add-atom &kb (demand competence 0.3 0.5 0.1))
