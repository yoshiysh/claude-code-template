# PR List

Display current repository's open Pull Requests list with priority ordering.

## Usage

```bash
/pr-list [options]
```

## Options

- `--state <state>` : Filter by state (open, closed, merged, all) [default: open]
- `--draft` : Include or exclude draft PRs (true/false)
- `--priority` : Sort by priority order
- `--limit <number>` : Maximum number of PRs to display [default: 30]

## Basic Examples

```bash
# Get repository information
gh repo view --json nameWithOwner | jq -r '.nameWithOwner'

# Get open PR information and request to Claude
gh pr list --state open --draft=false --json number,title,author,createdAt,additions,deletions,reviews --limit 30

"Please organize the above PRs by priority and include 2-line overview for each PR. Generate URLs using the repository name obtained above"
```

## Display Format

```
Open PR List (Priority Order)

### High Priority
#number Title [Draft/DNM] | Author | Time since opened | Approved count | +additions/-deletions
      ├─ Overview line 1
      └─ Overview line 2
      https://github.com/owner/repo/pull/number

### Medium Priority
(Same format)

### Low Priority
(Same format)
```

## Priority Determination Criteria

**High Priority**

- `fix:` Bug fixes
- `release:` Release work

**Medium Priority**

- `feat:` New features
- `update:` Feature improvements
- Other regular PRs

**Low Priority**

- PRs containing DO NOT MERGE
- Draft PRs with `test:`, `build:`, `perf:`

## Important Notes

- GitHub CLI (`gh`) is required
- Only displays PRs in open state (excludes Drafts)
- Displays maximum 30 PRs
- Time elapsed is from when PR was opened
- PR URLs are auto-generated from actual repository name