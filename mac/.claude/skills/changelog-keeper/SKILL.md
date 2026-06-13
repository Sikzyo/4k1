---
name: changelog-keeper
description: Generates and updates a project's CHANGELOG.md file following the Keep a Changelog 1.1.0 format (https://keepachangelog.com) and Semantic Versioning (https://semver.org). Always use this skill whenever the user asks to create, start, update, maintain, or edit a changelog, change log, version history, or "release notes"; when they describe something they added, changed, fixed, removed, deprecated, or a security patch in their project and want it recorded; or when they ask to "make a release", "release a version", or "move Unreleased into a version". Also applies if they mention a CHANGELOG.md, HISTORY.md, or similar file.
---

# Changelog Keeper (Keep a Changelog 1.1.0)

This skill helps create and maintain a `CHANGELOG.md` file following the [Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/) standard and [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html).

## Key principles of the format

- The changelog is for **humans**, not a dump of the git log.
- Each released version gets its own section, ordered from most recent to oldest.
- Changes are grouped by type (Added, Changed, etc.).
- An `[Unreleased]` section sits at the top of the file to collect changes that haven't been released yet.
- Every released version shows its date in ISO 8601 format (`YYYY-MM-DD`).
- Empty category sections are never included: if a category has no changes for that version, it simply doesn't appear.

## Change categories

Always use these headings (this is the standard, and most tooling recognizes them), in this order whenever several appear in the same version:

1. `### Added` – new features.
2. `### Changed` – changes in existing functionality.
3. `### Deprecated` – features that will soon be removed.
4. `### Removed` – features that have been removed.
5. `### Fixed` – bug fixes.
6. `### Security` – vulnerabilities that were fixed.

## Base template for a new changelog

When the user doesn't have a `CHANGELOG.md` yet, create it with this structure (adapt the language of the intro text to the project's language, but keep the category headings in English):

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - YYYY-MM-DD

### Added

- Description of the first notable change in the project.
```

If the user doesn't have any released version yet, keep only `## [Unreleased]` with the relevant categories and changes, without creating a version section yet.

This skill does **not** add version comparison links at the bottom of the file (the `[1.2.0]: https://.../compare/...` style); it produces a self-contained, simple changelog unless the user explicitly asks otherwise.

## Workflow

### 1. Locate or create the file

- Look for `CHANGELOG.md` (or variants such as `CHANGELOG`, `HISTORY.md`) at the project root or in the folder the user points to.
- If it doesn't exist, create it using the base template above.
- If it exists, **read the whole file before editing it** to understand the current version, the categories already in use, and the writing style (language, verb tense, punctuation), and keep that consistent.

### 2. Add a new entry (unreleased change)

1. Determine the right category using the quick-classification table below. If it's ambiguous, ask the user.
2. Check whether `## [Unreleased]` already has a `### <Category>` subsection.
   - If it does, add the item as a new `- ...` line at the end of that list.
   - If it doesn't, create the subsection in the right place, following the order Added → Changed → Deprecated → Removed → Fixed → Security.
3. Write the entry as a single line, in a descriptive tone aimed at whoever uses the project (what changes from their perspective, not internal implementation details). Examples:
   - ❌ "Refactored the parseInput function in utils.js"
   - ✅ "Improved error handling when importing CSV files with missing columns."
4. If the user describes several changes at once, classify each one into its corresponding category as separate items.

### Quick classification table

| If the user says something like...                                | Category     |
| ----------------------------------------------------------------- | ------------ |
| "I added", "now you can", "new feature / option / endpoint"       | `Added`      |
| "I changed the behavior of", "now X works differently", "renamed" | `Changed`    |
| "I marked X as deprecated", "X will be removed soon"              | `Deprecated` |
| "I removed", "deleted", "the option no longer exists"             | `Removed`    |
| "I fixed a bug/error", "no longer fails when..."                  | `Fixed`      |
| "I fixed a vulnerability", "security patch"                       | `Security`   |

### 3. Make a release (publish a version)

When the user asks to "publish", "release", or "cut a release" for a new version:

1. Read the `## [Unreleased]` section and the latest released version section (the first one with a version number, right below Unreleased).
2. **Suggest the version number** following SemVer, based on what's in `Unreleased`:
   - If there are `Removed` entries, or the user indicates there are backwards-incompatible changes → bump **MAJOR** (`X+1.0.0`, reset MINOR and PATCH to 0).
   - If none of the above but there are `Added` entries → bump **MINOR** (`X.Y+1.0`, reset PATCH to 0).
   - If there are only `Fixed`, non-breaking `Changed`, `Deprecated`, or `Security` entries → bump **PATCH** (`X.Y.Z+1`).
   - If the current version is `0.x.y` (initial development per SemVer), briefly note that the API may be considered unstable and apply the same logic unless the user says otherwise.
   - Show the suggested version and ask for confirmation before writing it; the user may prefer a different number.
3. Use today's date in `YYYY-MM-DD` format, unless the user specifies another date.
4. Move all of `Unreleased`'s content into a new version section, leaving `## [Unreleased]` empty at the top for future changes. For example, this:

   ```markdown
   ## [Unreleased]

   ### Added

   - Something new.

   ### Fixed

   - A bug that was fixed.
   ```

   becomes:

   ```markdown
   ## [Unreleased]

   ## [1.3.0] - 2026-06-13

   ### Added

   - Something new.

   ### Fixed

   - A bug that was fixed.
   ```

### 4. Yanked release

If the user indicates that a released version had to be pulled because of a serious bug or security issue, append `[YANKED]` to the end of that version's heading:

```markdown
## [1.2.1] - 2026-06-13 [YANKED]
```

## Style and formatting

- Dates are always ISO 8601: `YYYY-MM-DD`.
- Each entry is a single list item (`- `) on one line, unless the file already uses sub-lists and the user asks for them.
- Match the language of the rest of the changelog for entry text (if the changelog is in Spanish, write entries in Spanish); category headings always stay in English.
- Don't add version comparison link sections unless the user explicitly asks for them.
- Don't invent changes: if you don't have enough information about what changed, ask the user before writing the entry.
- After editing the file, give the user a brief summary of what was added/moved and which section it ended up in, so they can review it.
