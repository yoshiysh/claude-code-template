## Code Explain

Provides detailed explanations of code behavior.

### Usage

```bash
# Display file content and request to Claude
cat <file>
"Explain how this code works"
```

### Basic Examples

```bash
# Understanding Rust ownership
cat main.rs
"Explain this from Rust ownership and lifetime perspective"

# Algorithm explanation
grep -A 50 "quicksort" sort.rs
"Explain the mechanism and computational complexity of this sorting algorithm"

# Design pattern explanation
cat factory.rs
"Explain the design patterns used and their benefits"
```

### Integration with Claude

```bash
# Beginner-friendly explanation
cat complex_function.py
"Explain this code line by line in a way that beginners can understand"

# Performance analysis
cat algorithm.rs
"Point out performance issues in this code and provide improvement suggestions"

# Explanation with diagrams
cat state_machine.js
"Explain the processing flow of this code with ASCII art diagrams"

# Security review
cat auth_handler.go
"Point out security concerns in this code"
```

### Detailed Examples

```bash
# Complex logic explanation
cat recursive_parser.rs
"Explain this recursive parser's behavior from the following perspectives:
1. Overall processing flow
2. Role and responsibility of each function
3. Edge case handling
4. Areas for improvement"

# Asynchronous processing explanation
cat async_handler.ts
"Explain this asynchronous processing covering:
1. Promise chain flow
2. Error handling mechanism
3. Presence of concurrent processing
4. Possibility of deadlocks"

# Architecture explanation
ls -la src/ && cat src/main.rs src/lib.rs
"Explain this project's architecture and module structure"
```

### Important Notes

Code explanations don't just describe behavior, but also provide deep insights into why the implementation is structured that way, what benefits it offers, and what potential issues might exist.
