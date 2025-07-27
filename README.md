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

- **🚀 Claude Code Integration**: Pre-configured CLAUDE.md and .claude/ directory for optimal AI assistance
- **📁 Minimal Structure**: Clean foundation that scales with your project needs
- **📚 Workflow Management**: Built-in commands for investigation, planning, implementation, and testing phases
- **🎯 Language Agnostic**: Works with any programming language or framework
- **⚙️ Smart Commands**: Single commands (sc/) and workflow commands (wf/) for common development tasks
- **🛡️ Best Practices**: Pre-configured AI rules for commits, PRs, and code quality

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

- [Claude Code](https://claude.ai/code) account with API access
- Git 2.0+ for version control
- Node.js 18+ (for command execution and MCP servers)
- Terminal/command line interface
- Your preferred code editor (VS Code recommended for optimal Claude Code integration)

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

### 🚀 What's Included

- **Intelligent Command System**: 50+ specialized commands for development workflows
- **MCP Server Integration**: Advanced AI capabilities through Model Context Protocol
- **Expert Personas**: Specialized AI assistants for frontend, backend, security, and architecture
- **Project Memory**: Smart context management that learns from your project
- **Documentation Automation**: Automatic generation and maintenance of project docs
- **Quality Gates**: Built-in code analysis, testing, and improvement suggestions

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

1. **investigate**: Analyze existing code, research technologies, and understand requirements

   ```bash
   /wf:investigate "user authentication patterns in React apps"
   # Results saved to docs/investigate/ with findings and recommendations
   ```

2. **plan**: Create detailed implementation plans based on investigation insights

   ```bash
   /wf:plan "secure JWT authentication with refresh tokens"
   # Generates architecture decisions, task breakdown, and technical specs
   ```

3. **implement**: Execute the plan with AI-guided development

   ```bash
   /wf:implement "authentication system with React context"
   # Creates code, handles edge cases, follows best practices
   ```

4. **test**: Comprehensive testing and validation

   ```bash
   /wf:test "authentication flow end-to-end tests"
   # Generates unit, integration, and e2e tests with coverage
   ```

### Workflow Benefits

- **Intelligent Continuity**: Each phase automatically leverages previous phase outputs
- **Comprehensive Documentation**: All decisions, code, and tests are systematically documented
- **Iterative Refinement**: Easily revisit and improve any phase based on new insights
- **Context Preservation**: Claude Code remembers your project's history and patterns
- **Quality Assurance**: Built-in validation and best practice enforcement at each step
- **Team Collaboration**: Shareable documentation and reproducible processes

## Customization Guide

### Essential Setup Steps

1. **Project Initialization**

   ```bash
   # Update CLAUDE.md with your project details
   # Modify .claude/project/SUMMARY.md with project overview
   # Configure package.json, requirements.txt, or equivalent for your stack
   ```

2. **Technology Stack Configuration**

   ```bash
   # Install dependencies for your chosen framework
   npm install  # for Node.js projects
   pip install -r requirements.txt  # for Python projects
   
   # Configure build tools, linters, and formatters
   # Set up testing framework
   ```

3. **Claude Code Optimization**

   ```bash
   # Customize .claude/core/ files for your workflow preferences
   # Update .ai-rules/ guidelines for your coding standards
   # Configure MCP servers in .claude/settings.json if needed
   ```

### Advanced Configuration

- **Custom Commands**: Add project-specific commands in `.claude/commands/sc/`
- **Workflow Orchestration**: Customize multi-step workflows in `.claude/commands/wf/`
- **Expert Personas**: Tailor AI personalities in `.claude/core/PERSONAS.md`
- **MCP Integration**: Configure specialized servers for your domain
- **CI/CD Integration**: Add GitHub Actions, security scans, and deployment pipelines
- **Team Standards**: Customize `.ai-rules/` for your organization's practices

## Examples

### Real-world Usage Examples

#### Starting a Web Application Project

```bash
# 1. Create from template
gh repo create my-web-app --template yoshiysh/claude-code-template
cd my-web-app

# 2. Set up for Node.js/React
npm init -y
npm install react react-dom typescript @types/react @types/react-dom
npm install -D vite @vitejs/plugin-react eslint prettier

# 3. Update CLAUDE.md with project specifics
# 4. Use workflow commands
/wf:investigate "modern React development patterns and tooling"
/wf:plan "TypeScript React app with Vite and testing setup"
/wf:implement "component architecture with routing and state management"
/wf:test "comprehensive testing strategy with unit and e2e tests"
```

#### API Development Project

```bash
# 1. Create from template
gh repo create my-api --template yoshiysh/claude-code-template
cd my-api

# 2. Set up for Python/FastAPI
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install fastapi uvicorn sqlalchemy alembic pydantic[email] python-jose[cryptography]
pip install -D pytest pytest-asyncio httpx black isort

# 3. Follow workflow
/wf:investigate "FastAPI best practices and production patterns"
/wf:plan "scalable API architecture with authentication and database"
/wf:implement "RESTful endpoints with proper validation and security"
/wf:test "comprehensive API testing with async test client"
```

### Command Examples

```bash
# Code analysis and improvement
/sc:analyze --focus security --depth deep
/sc:improve --type performance --safe
/sc:refactor --target "legacy authentication" --modern

# Feature development
/sc:implement "user dashboard with real-time updates" --type component --framework react
/sc:implement "JWT refresh token rotation" --type security --backend

# Testing and quality assurance
/sc:test --type unit --with-coverage --threshold 90
/sc:test --type e2e --scenarios "user-journey" --browsers chrome,firefox

# Documentation and maintenance
/sc:document "API endpoints" --type openapi --auto-generate
/sc:cleanup --target dependencies --remove-unused
/sc:security --scan vulnerabilities --fix-minor
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
