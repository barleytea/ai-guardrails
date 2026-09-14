# review-dependencies

Review dependency additions and upgrades for unnecessary scope, abandoned packages, known
security risk, license incompatibility, and lockfile inconsistency. For indirect dependencies,
trace the path with the ecosystem's dependency graph and usage commands rather than relying on
direct-import searches. Check advisory sources and repository metadata instead of trusting release
notes alone, distinguish runtime from test-only impact, and confirm the lockfile records the
intended resolution. Require evidence before claiming a vulnerability or incompatibility, and
report the exact dependency path and affected execution path.
