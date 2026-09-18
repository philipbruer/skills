# Code

- Plain beats clever and DRY. Abstraction costs every read. It pays only when variance is real.
- Hardcode what is hardcoded. No variables or config arrays for fixed values.
- Three duplicated JSX blocks beat an array plus `map`.
- Few variables. No comments stating the obvious.
- Unsure: mirror the surrounding file exactly.

## Names

- Full names that mirror the hook or entity: `unreadNotificationCount`, not `unreadCount`.
- Same name at every call site. Grep them when renaming.
- Code copied across entities: name locals by role (`mutationFn`, `action`), not subject (`deleteProposalFn`). Subject lives in the outer function name and the input type.
