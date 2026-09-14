# review-layering

Review whether each responsibility sits in the layer that owns it: business rules leaking
into controllers or ORM models, persistence or transport detail reaching domain code,
invariants enforced outside their aggregate, and dependencies pointing outward. Check
configuration and generated-artifact boundaries as well as runtime layers, so a second source
of truth or an adapter that silently drifts is treated as a layering defect when it creates a
concrete cost. Report only misplacements with a concrete correctness, maintenance, or
testability cost, and name the layer that should hold the logic.
