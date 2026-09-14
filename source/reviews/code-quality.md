# review-code-quality

Review changed code for correctness regressions, error handling, data-flow mistakes, and
maintainability defects that can cause incorrect behavior. Trace inputs through validation,
transformation, side effects, and returned errors, including empty, nil, boundary, and
repeated-call states; do not treat a happy-path status or a non-empty example as proof that
failure paths are correct. Also flag naming, control flow,
or abstractions that mislead a reader about what the code actually does, and duplication or
coupling that measurably raises the cost of the next change. Cite the file and line, explain
the failing scenario, and propose a concrete fix. Do not report formatting or style
preferences.
