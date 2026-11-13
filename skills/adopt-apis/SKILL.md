---
name: adopt-apis
description: Sweep code for local logic, abstractions, types and workarounds that its installed library versions now provide, and for newer APIs that are cleaner or faster. Adopt them however large the refactor, and prove the behavior unchanged. Use after a dependency bump, or when asked whether code follows the newest APIs, types or conventions of its libraries.
argument-hint: "[libraries, packages or paths]"
---

# Adopt APIs

Make the code use what its installed libraries offer. The installed version is the truth, never the version the code was written for and never memory. Read the installed source for every claim about a library, and cite the `node_modules` file and line it came from. A finding, a replacement or an API signature without that citation is a guess: read the source before using it. `$ARGUMENTS` names the scope. Without it, take every library the code in the working directory imports.

Keep a ledger in the session scratchpad, `adopt-apis.md`, one entry per library, and update it as each step finishes.

## 1. Pin the versions

For each library in scope, resolve the version the code loads by following the importing package's resolution into `node_modules`, never the range in `package.json`. Note every library installed in two versions, because each version is its own API.

Done when every library in scope has its resolved version and path in the ledger.

## 2. Read what the version offers

For each library, read in this order:

1. The docs and agent skills it ships (`skills/`, `docs/`, `README`).
2. Its changelog or release notes, from the oldest version the code could have been written for up to the installed one.
3. Its exported types (`.d.ts`) for every export, option, type helper and deprecation.
4. Its runtime source (`.js`, `.mjs`) for the behavior the types hide.

Fetch the official docs for the installed major version when the package ships none.

Done when each library's entry lists what a call site in scope could use, each item with the file and line or the URL it came from.

## 3. Find the candidates

Check every import and every call site of each library in scope, never a sample, because one candidate usually has siblings. A candidate is code the library already does, or does better:

- A helper, wrapper, abstraction, cache, retry or loop that reimplements a library function.
- A cast (`as any`, `as unknown as`, a non-null `!`), or a hand-written type or union, that a library type or type helper derives.
- A string, a raw query or a shell-out where the library has a builder, an SDK or a typed function.
- A deprecated call, option or import. Turn on the linter's deprecation rule to list them.
- An older library API that a newer one in the installed version replaces, even when the old one still works.
- An option or API the installed version added that does the same work faster or with less: an index, a cache, a batch, a lazier load, a smaller import.
- A workaround, or a comment naming a library bug. Check the installed source, and remove both when the bug is fixed.
- A setting equal to the library's default, or one the library now names differently.
- A pattern the library's docs or shipped skills name as the old way.

Verify each candidate's premise in the installed source before listing it. A finding from an earlier audit, a comment or a memory is a claim to check, not a fact.

Done when every import in scope has been checked, and each candidate has its `file:line`, its replacement and the evidence for it in the ledger.

## 4. Adopt

Apply every candidate however large the refactor. Before writing each replacement, open the installed source of the API it calls and check its signature, options and defaults there. Change every call site, delete the replaced code, and update the docs, rules and comments that describe it.

Prove each one with the strongest check that fits:

| Change | Proof |
|---|---|
| Generated output: SQL, schema, bundle, snapshot | Generate before and after, and compare byte for byte |
| Runtime behavior | A test that runs the real code path |
| Performance | Measure before and after with the same harness, and keep both numbers in the ledger |
| UI or dev server behavior | Run it in the browser or the server and observe it |
| Types only | The type check |

When adopting fixes a bug the old code had, record the behavior change and its proof in the ledger. Skip a candidate only for a reason a reader can check: the replacement changes behavior, the installed version lacks it, or the measurement shows no gain for a performance candidate. Never skip one for its size.

Done when every candidate is adopted with its proof or skipped with its reason, and the formatter, linter, type check and every test pass.

## 5. Report

Reply with one table: library, version, adopted, skipped with reason. Under it, list each behavior change, and each step the user must take, such as a migration or a deploy setting.
