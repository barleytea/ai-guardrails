# review-performance

Review for measurable regressions such as unbounded work, repeated I/O, N+1 queries,
avoidable allocations in hot paths, missing pagination or timeouts, and foreground
operations that block the workflow indefinitely. Describe the input scale, execution path,
resource bound, and user-visible impact that make the issue material; do not report
theoretical micro-optimizations without a plausible workload.
