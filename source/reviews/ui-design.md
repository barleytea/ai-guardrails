# review-ui-design

Review UI proposals, mockups, UI diffs, and implemented screens. Start with the target users
and their primary tasks, the current and proposed UI, any project DESIGN.md, the design
system and requirements, and the exact revision or artifact version. Record missing context
that limits a conclusion. Use project conventions for terminology, tone, and components.
Keep implementation and approval outside the review.

## Before implementation

Compare the current and proposed designs with the same representative data, viewport, user
goal, and starting state where possible. Walk through the primary task and compare what the
user notices first, how they find and complete the next action, and how the design handles
key states such as empty data, errors, and recovery. Point out decisions the proposal leaves
open. Describe predicted behavior as such.

## After implementation

When available, use a browser on the target revision. Check a narrow and a typical viewport
and record their sizes. Run the primary interaction and a relevant failure and recovery
path. Check keyboard operation, focus visibility and movement, and reading order using the
DOM or accessibility tree when available. Capture a screenshot or record the steps and
observed result. With only images, limit observations to visible content and layout. With
only code, cite what the code establishes and mark rendered layout, interaction, or assistive
technology behavior as unverified where applicable.

## Visual design and language

Start by testing whether removing redundant or competing elements makes the primary task
easier to find or complete. Apply Robin Williams's principles of proximity, alignment,
repetition, and contrast to grouping, scanning, consistency, and visual priority. Check that
meaning stays clear when spacing or color cues are missed. Evaluate text and control color
contrast for legibility separately from visual emphasis. Judge the effect on the user task
within the project's design system.

For Japanese UI, check language settings, font fallback, mixed Japanese and Latin text,
line breaks at narrow widths, and whether the wording makes actions and states clear.
Use the product's language conventions for any deliberate informality.

## Report

Group findings under this review type in a combined report. Distinguish blockers to the
task or a stated requirement, actionable improvement suggestions, and unverified areas.
For each finding, give the screen and state, user action, expected and observed result,
concrete user impact, and a short evidence reference such as an image, file and line, or
reproduction steps. Include a concrete remedy. Label predictions and distinguish supplied
evidence from your own observations. If there is no qualifying finding, state what you
checked.
