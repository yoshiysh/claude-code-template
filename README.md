# Claude Code Template Project

A simple template repository for Claude Code (claude.ai/code) to streamline new project setup and enhance development productivity.

![Claude Code Compatible](https://img.shields.io/badge/Claude%20Code-Compatible-blue)
![GitHub Template](https://img.shields.io/badge/GitHub-Template-success)

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start (3 Steps)](#quick-start-3-steps)
- [Template Structure](#template-structure)
- [GitHub Template Usage](#github-template-usage)
- [Command Workflow](#command-workflow)
- [Customization Guide](#customization-guide)
- [Examples](#examples)
- [Contributing](#contributing)
- [Documentation](#documentation)

## Overview

This template provides a simple configuration optimized for integration with Claude Code. You can start a new project with minimal setup and add features as needed.

### Key Features

- **🚀 Claude Code Integration**: Optimized project memory configuration
- **📁 Simple Structure**: Start with minimal file structure
- **📚 Documentation Management**: Systematic management of investigation, planning, and implementation records
- **🎯 Flexibility**: Adaptable foundation for any project type

## Quick Start (3 Steps)

### 1. Use Template

Click the **"Use this template"** button above or [Create from template](https://github.com/yoshiysh/claude-code-template/generate)

### 2. Customize Project

```bash
# Clone the new repository
git clone https://github.com/yourusername/your-project-name.git
cd your-project-name

# Update CLAUDE.md with project details
# Edit the project overview section
```

### 3. Start Project

```bash
# Add necessary configuration files
# package.json, requirements.txt, go.mod, etc.
# Create files required for your project
```

## Prerequisites

- [Claude Code](https://claude.ai/code) access
- Git version 2.0 or higher
- Basic familiarity with command-line operations
- Text editor or IDE of choice

## Template Structure

### 📁 File Structure

```text
claude-code-template/
├── .claude/                   # Claude Code configuration
│   ├── commands/              # Custom command definitions
│   │   ├── sc/               # Single commands
│   │   └── wf/               # Workflow commands
│   ├── core/                 # Core system files
│   │   ├── COMMANDS.md       # Command framework
│   │   ├── FLAGS.md          # Flag system
│   │   ├── MCP.md            # MCP server integration
│   │   ├── ORCHESTRATOR.md   # Intelligent routing
│   │   ├── PERSONAS.md       # Expert personas
│   │   └── RULES.md          # System rules
│   ├── project/              # Project-specific configuration
│   │   └── SUMMARY.md        # Project summary
│   └── settings.json         # Claude Code settings
├── .ai-rules/                # AI-related rule settings
│   ├── API_FUNCTION_NAMING.md
│   ├── COMMIT_AND_PR_GUIDELINES.md
│   └── ISSUE_GUIDELINES.md
├── CLAUDE.md                 # Claude Code project memory
└── README.md                 # This file
```

### 🚀 Included Features

- **Claude Code Optimization**: Maximize AI assistance with project memory settings
- **Documentation Management**: Systematic record management for investigation, planning, and implementation
- **AI Rule Settings**: Guidelines for commits, PRs, API naming, etc.
- **Lightweight Structure**: Start minimal and expand gradually

## GitHub Template Usage

### Creating New Repository from Template

1. **Use Template**: Click the "Use this template" button on the GitHub repository page
2. **Enter Repository Information**:
   - Repository name: Enter your new project name
   - Description: Add project description (optional)
   - Public/Private: Select visibility setting
3. **Create**: Click "Create repository from template"

### Initial Setup After Template

```bash
# Clone the created repository
git clone https://github.com/yourusername/your-new-repository.git
cd your-new-repository

# Update CLAUDE.md to match your project
# Customize rules under .ai-rules/ as needed
```

## Command Workflow

### Recommended Development Flow

To efficiently proceed with AI-assisted development, we recommend executing commands in the following order:

1. **investigate**: Understanding existing code and technical research
   ```bash
   # Pre-implementation investigation phase
   # Results are recorded in docs/investigate/
   ```

2. **plan**: Create implementation plan based on investigation results
   ```bash
   # Use investigate results as input
   # Results are recorded in docs/plan/
   ```

3. **implement**: Implementation based on the plan
   ```bash
   # Use plan results as input
   # Results are recorded in docs/implement/
   ```

4. **test**: Testing and verification of implementation
   ```bash
   # Use implement results as input
   # Results are recorded in docs/test/
   ```

### Important Workflow Points

- **Continuity**: Use each phase's results as input for the next phase
- **Record Management**: All work is systematically recorded under docs/
- **Repeatability**: Return to previous phases and re-execute as needed
- **AI Optimization**: Maximize AI assistance in each phase through Claude Code integration

## Customization Guide

### Basic Customization

1. **Update Project Information**

   ```bash
   # Edit the project overview section in CLAUDE.md
   # Update README.md with project-specific content
   # Create package.json, requirements.txt, etc. as needed
   ```

2. **Technology Stack Setup**

   ```bash
   # Add configuration files required for your project
   # Customize build and test scripts
   # Update dependency management files
   ```

3. **Claude Code Integration Customization**

   ```bash
   # Update the development commands section in CLAUDE.md
   # Add project-specific important notes
   ```

### Advanced Customization

- **AI Rules**: Adjust settings in `.ai-rules/` to match your project
- **Add as Needed**: GitHub workflows, security settings, community files, etc.

## Examples

### Real-world Usage Examples

#### Starting a Web Application Project

```bash
# 1. Create from template
gh repo create my-web-app --template yoshiysh/claude-code-template
cd my-web-app

# 2. Set up for Node.js/React
npm init -y
npm install react react-dom

# 3. Update CLAUDE.md with project specifics
# 4. Use workflow commands
/wf:investigate "analyze current web development trends"
/wf:plan "modern React application with TypeScript"
/wf:implement "basic React setup with routing"
/wf:test "component and integration tests"
```

#### API Development Project

```bash
# 1. Create from template
gh repo create my-api --template yoshiysh/claude-code-template
cd my-api

# 2. Set up for Python/FastAPI
python -m venv venv
source venv/bin/activate
pip install fastapi uvicorn

# 3. Follow workflow
/wf:investigate "REST API best practices"
/wf:plan "FastAPI with database integration"
/wf:implement "user authentication endpoints"
/wf:test "API endpoint testing"
```

### Command Examples

```bash
# Analysis and improvement
/sc:analyze --focus security --depth deep
/sc:improve --type performance --safe

# Development workflow
/sc:implement "user dashboard component" --type component --framework react
/sc:test --type e2e --with-coverage

# Documentation and maintenance
/sc:document API --type external --style detailed
/sc:cleanup --target unused-imports --safe
```

## Contributing

### How to Contribute

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes** following the existing patterns
4. **Test your changes** with different project types
5. **Commit your changes**: Use conventional commit format
6. **Push to the branch**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**

### Contribution Guidelines

- Follow the existing file structure and naming conventions
- Update documentation for any new features
- Test with multiple project types (web, API, CLI, etc.)
- Ensure backwards compatibility
- Add examples for new workflow commands

### Reporting Issues

Please use the [Issue Guidelines](.ai-rules/ISSUE_GUIDELINES.md) when reporting bugs or requesting features.

## Documentation

### Core Documentation

- 🔧 [CLAUDE.md](CLAUDE.md) - Claude Code specific settings and project memory
- ⚙️ [.ai-rules/](.ai-rules/) - AI-related rules and guidelines

### Advanced Documentation

- 🎯 [Command Framework](.claude/core/COMMANDS.md) - Comprehensive command system
- 🤖 [MCP Integration](.claude/core/MCP.md) - Model Context Protocol servers
- 🎭 [Expert Personas](.claude/core/PERSONAS.md) - Specialized AI assistants
- 🚀 [Workflow Commands](.claude/commands/wf/) - Multi-phase development workflows

---

**Note**: This template is continuously maintained and follows evolving best practices. ⭐ Star it to stay updated with the latest features and improvements.
