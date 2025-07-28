# Check Fact

Verify the accuracy of given information by referencing the project's codebase and documentation (docs/, README.md, etc.).

## Usage

```bash
# Basic usage
/check-fact "This Flutter app uses Riverpod for state management"

# Verify multiple pieces of information at once
/check-fact "This project uses GraphQL and manages routing with auto_route"

# Check specific technical specifications
/check-fact "Authentication uses JWT and does not use Firebase Auth"
```

## Verification Process

1. **Information Source Priority**
   - Codebase (most reliable)
   - README.md, documentation in docs/
   - Configuration files (package.json, pubspec.yaml, etc.)
   - Issue and Pull Request discussion history

2. **Assessment Categories**
   - `✅ Correct` - Information fully matches the codebase
   - `❌ Incorrect` - Information is clearly wrong
   - `⚠️ Partially Correct` - Partially accurate but incomplete
   - `❓ Cannot Determine` - Insufficient information for verification

3. **Evidence Documentation**
   - Relevant file names and line numbers
   - Related code snippets
   - Corresponding documentation sections

## Report Format

```
## Fact Check Results

### Verification Target
"[User-provided information]"

### Conclusion
[✅/❌/⚠️/❓] [Assessment result]

### Evidence
- **File**: `path/to/file.dart:123`
- **Content**: [Relevant code/text]
- **Notes**: [Additional explanation]

### Detailed Explanation
[If incorrect: Present correct information]
[If partially correct: Point out inaccurate parts]
[If cannot determine: Explain missing information]
```

## Basic Examples

```bash
# Verify project technology stack
/check-fact "This app uses Flutter + Riverpod + GraphQL architecture"

# Check implementation status
/check-fact "Dark mode is implemented and switchable from user settings"

# Verify architecture
/check-fact "All state management uses Riverpod and BLoC is not used"

# Check security implementation
/check-fact "Authentication tokens are encrypted and stored in secure storage"
```

## Claude Integration

```bash
# Verify after analyzing entire codebase
ls -la && find . -name "pubspec.yaml" -exec cat {} \;
/check-fact "The main dependencies used in this project are..."

# Check specific feature implementation
grep -r "authentication" . --include="*.dart"
/check-fact "Authentication is custom implemented without third-party auth"

# Verify consistency with documentation
cat README.md
/check-fact "All features listed in README are fully implemented"
```

## Use Cases

- **Technical specification writing**: Verify accuracy of documented content
- **Project handover**: Confirm understanding of existing implementation
- **Client reporting**: Fact-check implementation status
- **Technical blog writing**: Validate article content accuracy
- **Interview/presentation material**: Ensure project overview accuracy

## Important Notes

- **Codebase is the most reliable source of truth**
- **When documentation is outdated, prioritize actual implementation**
- **Honestly report "Cannot Determine" when insufficient information**
- **Exercise extra caution when verifying security-related information**
