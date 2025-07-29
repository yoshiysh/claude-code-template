# Claude Code Template Project

A comprehensive template repository for Claude Code (claude.ai/code) featuring an intelligent command system, expert personas, and automated workflows to maximize AI-assisted development productivity.

![Claude Code Compatible](https://img.shields.io/badge/Claude%20Code-Compatible-blue)
![GitHub Template](https://img.shields.io/badge/GitHub-Template-success)

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Prerequisites](#prerequisites)
- [Quick Start (3 Steps)](#quick-start-3-steps)
- [Installation](#installation)
- [Template Structure](#template-structure)
- [Command System](#command-system)
- [Expert Personas](#expert-personas)
- [Workflow Commands](#workflow-commands)
- [MCP Integration](#mcp-integration)
- [Customization Guide](#customization-guide)
- [Examples](#examples)
- [Best Practices](#best-practices)
- [Contributing](#contributing)
- [Troubleshooting](#troubleshooting)
- [Documentation](#documentation)
- [Acknowledgments](#acknowledgments)

## Overview

This template provides a sophisticated framework for AI-enhanced development with Claude Code. It includes 50+ specialized commands, 8 expert AI personas, intelligent orchestration, and comprehensive workflow automation.

### What Makes This Template Special

- **🧠 Intelligent Command System**: Context-aware commands that adapt to your project needs
- **🎭 Expert AI Personas**: Specialized assistants for security, architecture, frontend, mobile, QA, and more
- **🔄 Automated Workflows**: Multi-phase development cycles from investigation to deployment
- **🛡️ Built-in Quality Gates**: Automatic code analysis, security checks, and performance optimization
- **📚 Smart Documentation**: Self-maintaining project knowledge base
- **🔌 MCP Server Integration**: Extended AI capabilities through Model Context Protocol

## Key Features

### Core Capabilities

- **Command Framework** - 50+ specialized commands organized by category
- **Expert System** - 8 AI personas with domain-specific expertise
- **Workflow Automation** - End-to-end development workflows
- **Quality Assurance** - Built-in testing, security, and performance checks
- **Documentation Engine** - Automatic documentation generation and maintenance
- **Project Memory** - Intelligent context management across sessions
- **MCP Integration** - Advanced AI server capabilities

### Command Categories

- **GitHub Operations** (`gh/`) - Branch management, PR creation, CI/CD integration
- **Single Commands** (`sc/`) - Focused development tasks
  - Analysis - Code analysis and troubleshooting
  - Development - Implementation and design
  - Documentation - Automated docs generation
  - Quality - Testing and improvements
- **Workflow Commands** (`wf/`) - Multi-phase development processes
- **Common Commands** (`cmn/`) - Shared utilities and cognitive tools

## Prerequisites

### Required Tools
- [Claude Code](https://claude.ai/code) account with API access
- Git 2.0+ for version control
- Node.js 18+ (for command execution and MCP servers)
- Terminal/command line interface
- Your preferred code editor (VS Code recommended)

### Optional Tools
- `jq` - JSON processor for advanced script operations
- `gh` CLI - GitHub command line tool for PR/issue management
- `npm` or `yarn` - Package managers for Node.js dependencies

## Quick Start (3 Steps)

### 1. Use Template

Click the **"Use this template"** button above or [Create from template](https://github.com/yoshiysh/claude-code-template/generate)

### 2. Clone and Configure

```bash
# Clone your new repository
git clone https://github.com/yourusername/your-project-name.git
cd your-project-name

# Install dependencies (if using MCP servers)
npm install

# Configure project details
# Update CLAUDE.md with your project specifics
# Edit .claude/project/SUMMARY.md
```

### 3. Start Development

```bash
# Use workflow commands for comprehensive development
/wf:investigate "your project requirements"
/wf:plan "technical architecture and features"
/wf:implement "core functionality"
/wf:test "comprehensive test coverage"
```

## Installation

### Standard Installation

```bash
# 1. Create from template
gh repo create my-project --template yoshiysh/claude-code-template
cd my-project

# 2. Install MCP dependencies (optional)
npm install

# 3. Configure Claude Code
# Open in Claude Code and let it discover the configuration
```

### Manual Installation

```bash
# 1. Clone the template
git clone https://github.com/yoshiysh/claude-code-template.git my-project
cd my-project

# 2. Remove git history
rm -rf .git
git init

# 3. Create your repository
git add .
git commit -m "Initial commit from Claude Code template"
git remote add origin https://github.com/yourusername/my-project.git
git push -u origin main
```

### Verification

```bash
# Verify installation
ls -la .claude/  # Check Claude configuration
cat CLAUDE.md     # Review project memory
```

## Template Structure

### 📁 Complete File Structure

```text
claude-code-template/
├── .claude/                      # Claude Code configuration
│   ├── agents/                   # Expert AI personas
│   │   └── roles/               # Specialized assistant roles
│   │       ├── analyzer.md      # Root cause analysis expert
│   │       ├── architect.md     # System design specialist
│   │       ├── frontend.md      # UI/UX and frontend expert
│   │       ├── mobile.md        # Mobile development specialist
│   │       ├── performance.md   # Performance optimization expert
│   │       ├── qa.md            # Test engineering specialist
│   │       ├── reviewer.md      # Code review expert
│   │       └── security.md      # Security specialist
│   ├── commands/                 # Command definitions
│   │   ├── gh/                  # GitHub operations
│   │   │   ├── branch.md        # Smart branch management
│   │   │   ├── commit.md        # Intelligent commits
│   │   │   ├── pr-create.md     # PR automation
│   │   │   └── ...              # More GitHub commands
│   │   ├── sc/                  # Single commands
│   │   │   ├── analysis/        # Code analysis tools
│   │   │   ├── dev/             # Development commands
│   │   │   ├── docs/            # Documentation tools
│   │   │   └── quality/         # Quality commands
│   │   ├── wf/                  # Workflow commands
│   │   │   ├── investigate.md   # Research workflow
│   │   │   ├── plan.md          # Planning workflow
│   │   │   ├── implement.md     # Implementation workflow
│   │   │   └── test.md          # Testing workflow
│   │   └── cmn/                 # Common utilities
│   │       ├── cogitation/      # Thinking tools
│   │       ├── design/          # Design utilities
│   │       └── develop/         # Development helpers
│   ├── core/                    # Core system files
│   │   ├── COMMANDS.md          # Command framework
│   │   ├── FLAGS.md             # Flag system
│   │   ├── MCP.md               # MCP integration
│   │   ├── MODES.md             # Operating modes
│   │   ├── ORCHESTRATOR.md      # Intelligent routing
│   │   ├── PERSONAS.md          # Expert personas
│   │   ├── PRINCIPLES.md        # Design principles
│   │   └── RULES.md             # System rules
│   ├── project/                 # Project configuration
│   │   └── SUMMARY.md           # Project overview
│   ├── scripts/                 # Automation scripts
│   │   ├── auto-comment.sh      # Comment automation
│   │   ├── check-ai-commit.sh   # Commit validation
│   │   ├── check-continue.sh    # Continuation logic
│   │   └── ...                  # More scripts
│   └── settings.json            # Claude Code settings
├── .ai-rules/                   # AI behavior rules
│   ├── API_FUNCTION_NAMING.md   # API naming conventions
│   ├── COMMIT_AND_PR_GUIDELINES.md # Git guidelines
│   └── ISSUE_GUIDELINES.md      # Issue templates
├── .mcp.json                    # MCP server configuration
├── CLAUDE.md                    # Project memory entry
└── README.md                    # This file
```

## Command System

### Command Syntax

```bash
# Basic syntax
/[prefix]:[command] [arguments] [--flags]

# Examples
/sc:analyze --focus security
/wf:plan "authentication system"
/gh:commit --breaking
```

### GitHub Operations (`/gh:*`)

Streamlined Git and GitHub workflows:

```bash
/gh:branch --auto              # Auto-generate branch from staged changes
/gh:commit                      # Generate intelligent commit messages
/gh:pr-create                   # Create PR with analysis
/gh:push                        # Smart push with checks
/gh:pr-review                  # Review pull requests
/gh:check-ci                   # Check CI/CD status
```

### Single Commands (`/sc:*`)

Focused development tasks:

```bash
# Analysis commands
/sc:analyze --focus security    # Security-focused analysis
/sc:explain "complex function"  # Code explanation
/sc:troubleshoot "error msg"    # Debug assistance

# Development commands
/sc:implement "feature" --type component
/sc:design "architecture" --patterns
/sc:build --optimize

# Documentation commands
/sc:document "API" --format openapi
/sc:index README.md            # Generate comprehensive docs

# Quality commands
/sc:test --type unit --coverage
/sc:improve --focus performance
/sc:cleanup --target dependencies
```

### Workflow Commands (`/wf:*`)

End-to-end development workflows:

```bash
/wf:investigate "authentication patterns"
# → Research, analysis, recommendations

/wf:plan "secure JWT implementation"
# → Architecture, tasks, specifications

/wf:implement "auth system with refresh tokens"
# → Code generation, best practices

/wf:test "auth flow coverage"
# → Unit, integration, e2e tests
```

## Expert Personas

### Available Specialists

1. **🔍 Analyzer** - Root cause analysis, 5 Whys, systems thinking
2. **🏗️ Architect** - System design, Evidence-First approach, MECE analysis
3. **🎨 Frontend** - UI/UX, WCAG compliance, React/Vue/Angular
4. **📱 Mobile** - iOS/Android, cross-platform, Touch-First design
5. **⚡ Performance** - Core Web Vitals, optimization, RAIL model
6. **🧪 QA** - Test strategies, coverage analysis, automation
7. **👁️ Reviewer** - Code review, Clean Code principles, best practices
8. **🛡️ Security** - OWASP Top 10, vulnerability detection, secure coding

### Activation

Personas activate automatically based on context or can be explicitly invoked:

```bash
/role security "review authentication implementation"
/role-debate "microservices vs monolith" --personas architect,reviewer
/role-help frontend "optimize React performance"
```

## MCP Integration

### Configured Servers

- **GitHub** - Repository operations and automation
- **Notion** - Documentation and knowledge management
- **Context7** - Library documentation and examples
- **Fetch** - Web content retrieval
- **DeepWiki** - GitHub repository insights
- **IDE** - VS Code integration
- **Sequential Thinking** - Complex problem solving

### Usage Example

```bash
# MCP servers enhance command capabilities
/sc:implement "Stripe integration" --use-context7
# → Fetches latest Stripe docs and examples

/wf:investigate "React patterns" --use-deepwiki
# → Analyzes popular React repositories
```

## Customization Guide

### Project Setup

1. **Update Project Memory**
   ```bash
   # Edit CLAUDE.md with your project details
   # Configure .claude/project/SUMMARY.md
   ```

2. **Configure Technology Stack**

   ```bash
   # Add framework-specific files
   npm init -y  # or equivalent
   # Install your dependencies
   ```

3. **Customize Commands**

   ```bash
   # Add project-specific commands in .claude/commands/sc/
   # Modify workflows in .claude/commands/wf/
   ```

### Advanced Configuration

- **Custom Personas** - Add domain-specific experts
- **New Commands** - Create project-specific operations
- **Workflow Extensions** - Add custom development phases
- **MCP Servers** - Integrate additional AI capabilities
- **Hook Scripts** - Automate repetitive tasks

## Examples

### Full Stack Web Application

```bash
# 1. Research and planning
/wf:investigate "modern full-stack architectures with Next.js"
/wf:plan "e-commerce platform with payments"

# 2. Implementation
/sc:implement "product catalog" --type feature --framework nextjs
/sc:implement "shopping cart" --type component --with-tests
/sc:implement "Stripe checkout" --type integration

# 3. Quality assurance
/sc:test --type e2e --scenarios "purchase-flow"
/sc:analyze --focus security --depth deep
/role reviewer "review payment implementation"

# 4. Documentation
/sc:document "API endpoints" --format openapi
/sc:index README.md
```

### Mobile Application

```bash
# 1. Setup and research
/role mobile "React Native vs Flutter comparison"
/wf:investigate "mobile app state management patterns"

# 2. Development
/sc:implement "navigation system" --type mobile --framework react-native
/sc:implement "offline sync" --type feature --with-tests

# 3. Platform-specific
/role mobile "iOS app store requirements"
/sc:implement "push notifications" --platform ios
```

## Best Practices

### Command Usage

1. **Start with Workflows** - Use `/wf:*` commands for comprehensive approaches
2. **Leverage Personas** - Activate relevant experts for specialized tasks
3. **Maintain Context** - Use project memory effectively
4. **Iterate Frequently** - Small, focused commands over large requests
5. **Document Decisions** - Commands automatically maintain documentation

### Project Organization

1. **Consistent Naming** - Follow established patterns
2. **Regular Commits** - Use `/gh:commit` for meaningful messages
3. **Test Coverage** - Aim for >80% with `/sc:test`
4. **Security First** - Regular `/sc:analyze --focus security`
5. **Performance Monitoring** - Use performance persona regularly

## Contributing

### How to Contribute

1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Follow the [commit guidelines](.ai-rules/COMMIT_AND_PR_GUIDELINES.md)
4. Test with multiple project types
5. Submit PR with comprehensive description

### Areas for Contribution

- New expert personas for specialized domains
- Additional workflow commands
- MCP server integrations
- Language-specific command sets
- Documentation improvements

## Troubleshooting

### Common Issues

#### MCP Server Connection Issues

```bash
# Error: MCP server failed to start
npm install -g npx  # Ensure npx is installed
# Check Node.js version
node --version  # Should be 18+
```

#### Command Not Found

```bash
# Ensure you're using the correct prefix
/sc:analyze  # Single command
/wf:plan     # Workflow command
/gh:commit   # GitHub command
```

#### Permission Denied Errors

```bash
# Check hook scripts are executable
chmod +x .claude/scripts/*.sh
```

### Getting Help

- Check the [Command Reference](.claude/core/COMMANDS.md)
- Review [Troubleshooting Guide](.claude/docs/troubleshooting.md)
- Open an issue with detailed error information

## Documentation

### Essential Docs

- 📘 [CLAUDE.md](CLAUDE.md) - Project memory configuration
- 📋 [Command Reference](.claude/core/COMMANDS.md) - Complete command guide
- 🎭 [Personas Guide](.claude/core/PERSONAS.md) - Expert system details
- 🔄 [Workflow Guide](.claude/commands/wf/) - Development workflows
- 🛡️ [Security Guide](.claude/agents/roles/security.md) - Security best practices

### Advanced Topics

- 🧠 [Orchestrator](.claude/core/ORCHESTRATOR.md) - Intelligent routing system
- 🚀 [MCP Integration](.claude/core/MCP.md) - Server capabilities
- 🏁 [Flags System](.claude/core/FLAGS.md) - Command modifiers
- 📐 [Design Principles](.claude/core/PRINCIPLES.md) - Architecture guidelines

## Acknowledgments

- Claude Code team for the excellent AI development platform
- Open source community for MCP server implementations
- Contributors who help improve this template

---

**⭐ Star this repository** to stay updated with new features and improvements. Join our growing community of AI-enhanced developers!

**📢 Feedback Welcome** - Open issues for bugs, feature requests, or discussions about AI-assisted development practices.
