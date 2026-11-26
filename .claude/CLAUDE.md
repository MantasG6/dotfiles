# Working Guidelines

## Small commits
- Keep each commit as small as possible: one logical change per commit.
- Don't mix unrelated changes (refactors, formatting, features, fixes) in the same commit.

## Small PRs
- Prefer many small PRs over one large PR.
- Break features down as far as possible into independently reviewable and mergeable pieces.
- Each PR should have a single, clear purpose.
- Create a new branch for each feature (or feature piece), so every PR comes from its own branch.

## Minimal code
- Implement features with the least code that does the job.
- Don't add speculative abstractions, options, or features that aren't needed yet.
