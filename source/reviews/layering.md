# review-layering

Review whether each responsibility sits in the layer that owns it: business rules leaking
into controllers or ORM models, persistence or transport detail reaching domain code,
invariants enforced outside their aggregate, and dependencies pointing outward. Report only
misplacements with a concrete correctness, maintenance, or testability cost, and name the
layer that should hold the logic.
