# Claude Code Template Project

A comprehensive template repository designed specifically for Claude Code (claude.ai/code) integration. This template provides a standardized foundation for new projects with optimized workflows, development tools, and best practices.

![Claude Code Compatible](https://img.shields.io/badge/Claude%20Code-Compatible-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![GitHub Template](https://img.shields.io/badge/GitHub-Template-success)

## Overview

This template reduces new project setup time by **50%** through pre-configured development environments, automated quality tools, and comprehensive documentation. Whether you're building with Node.js, Python, Go, Rust, or any other technology stack, this template provides the foundation you need.

### Key Features

- **🚀 Claude Code Integration**: Custom slash commands and optimized project memory configuration
- **🔧 Multi-Language Support**: Pre-configured for Node.js, Python, Go, Rust, Java, and more
- **📋 GitHub Standards**: Complete set of community files (LICENSE, CONTRIBUTING, CODE_OF_CONDUCT, SECURITY)
- **⚡ Automated Workflows**: GitHub Actions for CI/CD, security scanning, and dependency management
- **🛡️ Security First**: Built-in security scanning, dependency management, and best practices
- **📚 Comprehensive Documentation**: Setup guides, customization instructions, and best practices
- **🎯 Technology Agnostic**: Flexible foundation that adapts to any project type

## Quick Start (3 Steps)

### 1. Use This Template

Click the **"Use this template"** button above or [create from template](https://github.com/yoshiysh/claude-code-template/generate)

### 2. Customize for Your Project

```bash
# Clone your new repository
git clone https://github.com/yourusername/your-project-name.git
cd your-project-name

# Update CLAUDE.md with your project details
# Edit the Project Overview section with your specific project information
```

### 3. Select Technology Stack

Choose from the `examples/` directory or add your own configuration:

```bash
# For Node.js projects
cp examples/nodejs/* .

# For Python projects  
cp examples/python/* .

# For Go projects
cp examples/go/* .

# For Rust projects
cp examples/rust/* .
```

## Available Features

### 🎛️ Claude Code Custom Commands

This template includes powerful slash commands to accelerate development:

| Command | Description |
|---------|-------------|
| `/project:init-project` | Initialize new project with guided setup |
| `/project:setup-tech-stack` | Configure technology stack specific settings |
| `/project:create-pr` | Automate pull request creation with proper formatting |
| `/project:run-tests` | Execute test suite with comprehensive reporting |

### 📁 Template Structure

```text
claude-code-template/
├── .claude/commands/          # Custom Claude Code slash commands
├── .github/                   # GitHub configuration and workflows
│   ├── workflows/            # Automated CI/CD pipelines
│   ├── ISSUE_TEMPLATE/       # Issue templates
│   └── PULL_REQUEST_TEMPLATE.md
├── examples/                  # Technology stack examples
│   ├── nodejs/               # Node.js configuration
│   ├── python/               # Python configuration
│   ├── go/                   # Go configuration
│   └── rust/                 # Rust configuration
├── docs/                     # Project documentation
│   ├── setup-guide.md        # Detailed setup instructions
│   ├── customization-guide.md # Customization guidelines
│   └── best-practices.md     # Development best practices
├── CLAUDE.md                 # Claude Code project memory
├── README.md                 # This file
├── LICENSE                   # MIT License
├── CONTRIBUTING.md           # Contribution guidelines
├── CODE_OF_CONDUCT.md        # Community standards
├── SECURITY.md               # Security policy
└── .gitignore               # Comprehensive exclusions
```

### 🔄 Automated Workflows

- **Continuous Integration**: Automated testing and validation
- **Security Scanning**: Dependency vulnerability checks and CodeQL analysis
- **Dependency Management**: Automated updates via Dependabot
- **Code Quality**: Linting, formatting, and validation checks
- **Template Validation**: Ensures template integrity and functionality

## Technology Stack Support

This template provides configuration examples for popular technology stacks:

| Technology | Package Manager | Testing | Linting | Additional Tools |
|------------|----------------|---------|---------|------------------|
| **Node.js** | npm/yarn/pnpm | Jest/Vitest | ESLint | Prettier, TypeScript |
| **Python** | pip/poetry | pytest | flake8/black | mypy, pre-commit |
| **Go** | go mod | go test | golangci-lint | gofmt, govulncheck |
| **Rust** | cargo | cargo test | clippy | rustfmt, cargo-audit |
| **Java** | maven/gradle | JUnit | SpotBugs | Checkstyle, PMD |

## Customization Guide

### Basic Customization

1. **Update Project Information**

   ```bash
   # Edit CLAUDE.md Project Overview section
   # Update README.md with your project specifics
   # Modify package.json, requirements.txt, etc. as needed
   ```

2. **Configure Technology Stack**

   ```bash
   # Copy relevant example configurations
   cp examples/your-stack/* .
   
   # Customize build and test scripts
   # Update dependency management files
   ```

3. **Customize Claude Code Integration**

   ```bash
   # Modify .claude/commands/ for project-specific workflows
   # Update CLAUDE.md Development Commands section
   # Add project-specific Important Notes
   ```

### Advanced Customization

- **GitHub Workflows**: Modify `.github/workflows/` for specific CI/CD requirements
- **Security Configuration**: Update Dependabot and security scanning settings
- **Documentation**: Customize guides in `docs/` directory
- **Community Files**: Adapt CONTRIBUTING.md and CODE_OF_CONDUCT.md

## Documentation

- 📖 [Setup Guide](docs/setup-guide.md) - Detailed setup instructions
- 🎨 [Customization Guide](docs/customization-guide.md) - Advanced customization options
- ✨ [Best Practices](docs/best-practices.md) - Development best practices
- 🔧 [Claude Code Integration](CLAUDE.md) - Claude Code specific configuration

## Community

### Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Code of Conduct

This project follows the [Code of Conduct](CODE_OF_CONDUCT.md). Please read it before participating.

### Security

If you discover security vulnerabilities, please see [SECURITY.md](SECURITY.md) for reporting procedures.

### Getting Help

- 🐛 [Report Issues](https://github.com/yoshiysh/claude-code-template/issues)
- 💡 [Request Features](https://github.com/yoshiysh/claude-code-template/issues/new?template=feature_request.md)
- 📚 [Documentation](docs/)
- 💬 [Discussions](https://github.com/yoshiysh/claude-code-template/discussions)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Claude Code](https://claude.ai/code) for AI-powered development assistance
- [GitHub Template Repositories](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository) for inspiration
- The open source community for best practices and tools

---

**Note**: This template is actively maintained and follows evolving best practices. Star ⭐ this repository to stay updated with new features and improvements.

