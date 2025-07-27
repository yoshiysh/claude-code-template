# Issue List

Display current repository's open Issues list with priority ordering.

## Usage

```bash
/pr-issue [options]
```

## Options

- `--state <state>` : Filter by state (open, closed, all) [default: open]
- `--label <label>` : Filter by specific labels
- `--priority` : Sort by priority order
- `--limit <number>` : Maximum number of issues to display [default: 30]

## Basic Examples

```bash
# Get repository information
gh repo view --json nameWithOwner | jq -r '.nameWithOwner'

# Get open Issue information and request to Claude
gh issue list --state open --json number,title,author,createdAt,updatedAt,labels,assignees,comments --limit 30

"Please organize the above Issues by priority and include 2-line overview for each Issue. Generate URLs using the repository name obtained above"
```

## Display Format

```
Open Issues List (Priority Order)

### High Priority
#number Title [Label] | Author | Time since opened | Comment count | Assignee
      ├─ Overview line 1
      └─ Overview line 2
      https://github.com/owner/repo/issues/number

### Medium Priority
(Same format)

### Low Priority
(Same format)
```

## Priority Determination Criteria

**High Priority**

- Issues with `bug` label
- Issues with `critical` or `urgent` labels
- Issues with `security` labels

**Medium Priority**

- Issues with `enhancement` labels
- Issues with `feature` labels
- Issues with assigned maintainers

**Low Priority**

- Issues with `documentation` labels
- Issues with `good first issue` labels
- Issues with `wontfix` or `duplicate` labels

## Label Filtering

```bash
# Get Issues with specific labels only
gh issue list --state open --label "bug" --json number,title,author,createdAt,labels,comments --limit 30

# Filter with multiple labels (AND condition)
gh issue list --state open --label "bug,high-priority" --json number,title,author,createdAt,labels,comments --limit 30
```

## Important Notes

- GitHub CLI (`gh`) is required
- Only displays Issues in open state
- Displays maximum 30 Issues
- Time elapsed is from when Issue was opened
- Issue URLs are auto-generated from actual repository name