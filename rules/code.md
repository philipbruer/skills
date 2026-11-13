# Code

- Plain beats clever and DRY. Abstraction costs every read. It pays only when variance is real.
- Hardcode what is hardcoded. No variables or config arrays for fixed values.
- Three duplicated JSX blocks beat an array plus `map`.
- Few variables. No comments stating the obvious.
- Unsure: mirror the surrounding file exactly.

## Libraries

- Let the library own the logic. Before you write a helper, a type, a union, a cast or a workaround, and in every file you touch, read the installed version's source and types for an API or a type that does the job. Use it however large the refactor, and prove the behavior is unchanged with tests or identical output.
- Treat the installed version as newer than the code around it: a bump adopts nothing by itself.

## Names

- Full names that mirror the hook or entity: `unreadNotificationCount`, not `unreadCount`.
- Same name at every call site. Grep them when renaming.
- Code copied across entities: name locals by role (`mutationFn`, `action`), not subject (`deleteProposalFn`). Subject lives in the outer function name and the input type.
