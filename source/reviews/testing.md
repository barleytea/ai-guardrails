# review-testing

Review whether changed behavior is covered by the smallest meaningful existing tests. Map
each behavior change to its concrete failure modes and the layer that owns the proof, then
inspect the repository's actual test targets and CI jobs before recommending commands.
Distinguish unit, integration, end-to-end, generated-code, and runtime checks; do not require
redundant commands or claim coverage from a test that does not execute the changed path.
Flag missing tests only when an untested failure mode is concrete and important. State the
test scenario that proves the issue.
