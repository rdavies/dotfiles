# CLAUDE.md

Guidance for Claude when working in this repo.

## Commit messages and PR descriptions

- Write every commit message and PR description as if I wrote it myself,
  describing my own change - not as a summary of a conversation with
  Claude.
- Never reference chat history, back-and-forth discussion, or how the
  change came about. No phrases like "per your request," "you asked,"
  "on reflection," "we decided," "following up on," "per your earlier
  feedback," etc.
- State what changed and the technical reason for it, directly and
  logically - nothing about the process that produced the change.

Bad: "Following up on our discussion, reverting this since you preferred
the other approach."

Good: "Revert X in favor of Y: <technical reason Y is correct here>."
