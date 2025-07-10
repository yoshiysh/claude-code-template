# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository is a comprehensive template designed specifically for Claude Code (claude.ai/code) integration. It provides a standardized foundation for new projects with optimized workflows, development tools, and best practices.

### Purpose
- Reduce new project setup time by 50%
- Provide Claude Code optimized configuration and custom commands
- Ensure GitHub template repository standards compliance
- Support multiple technology stacks through examples and configurations
- Implement automated quality management and security practices

### Key Features
- **Claude Code Integration**: Custom slash commands and project memory configuration
- **Multi-Language Support**: Pre-configured .gitignore and examples for Node.js, Python, Go, Rust
- **GitHub Standards**: Complete set of community files (LICENSE, CONTRIBUTING, CODE_OF_CONDUCT, SECURITY)
- **Automated Workflows**: GitHub Actions for CI/CD, security scanning, and dependency management
- **Quality Assurance**: Integrated linting, testing, and validation tools
- **Documentation**: Comprehensive guides for setup, customization, and best practices

### Technology Stack Agnostic Design
This template is intentionally technology-agnostic, providing examples and configurations for popular stacks while remaining flexible for any project type. Choose and customize the components you need.

## Development Commands

Below are example commands for different technology stacks. Uncomment and customize based on your project's requirements:

### Node.js Projects
```bash
# npm install          # Install dependencies
# npm run dev          # Start development server
# npm run build        # Build for production
# npm run test         # Run test suite
# npm run lint         # Run ESLint
# npm run format       # Format code with Prettier
```

### Python Projects
```bash
# pip install -r requirements.txt    # Install dependencies
# python -m venv venv                # Create virtual environment
# source venv/bin/activate           # Activate virtual environment (Unix)
# python manage.py runserver         # Start development server (Django)
# python -m pytest                   # Run tests
# black .                           # Format code
# flake8                            # Lint code
```

### Go Projects
```bash
# go mod download      # Download dependencies
# go run main.go       # Run application
# go build            # Build binary
# go test ./...       # Run tests
# golangci-lint run   # Run linter
# go fmt ./...        # Format code
```

### Rust Projects
```bash
# cargo build         # Build project
# cargo run           # Run application
# cargo test          # Run tests
# cargo clippy        # Run linter
# cargo fmt           # Format code
# cargo check         # Check code without building
```

### Docker Projects
```bash
# docker build -t project-name .           # Build Docker image
# docker run -p 8000:8000 project-name    # Run container
# docker-compose up                        # Start with docker-compose
# docker-compose down                      # Stop containers
```

## Template Usage Guide

### Quick Start (3 Steps)

1. **Use this template**: Click "Use this template" button on GitHub or clone this repository
2. **Customize for your project**: Update CLAUDE.md Project Overview with your specific project details
3. **Select technology stack**: Choose from examples/ directory or add your own configuration

### Detailed Setup Process

1. **Repository Setup**
   - Use GitHub's "Use this template" feature
   - Clone your new repository locally
   - Update repository name and description

2. **Project Customization**
   - Edit this CLAUDE.md file's Project Overview section
   - Update README.md with your project specifics
   - Choose and configure your technology stack from examples/

3. **Development Environment**
   - Install required tools for your chosen stack
   - Set up Claude Code if not already configured
   - Test custom slash commands with `/project:init-project`

4. **GitHub Integration**
   - Enable GitHub Actions workflows
   - Configure Dependabot for dependency updates
   - Set up branch protection rules if needed

5. **Team Collaboration**
   - Review and customize CONTRIBUTING.md guidelines
   - Adapt CODE_OF_CONDUCT.md if necessary
   - Configure issue and PR templates for your workflow

### Available Custom Commands

This template includes several Claude Code custom commands (slash commands):

- `/project:init-project` - Initialize new project with guided setup
- `/project:setup-tech-stack` - Configure technology stack specific settings
- `/project:create-pr` - Automate pull request creation with proper formatting
- `/project:run-tests` - Execute test suite with reporting

### Customization Guidelines

1. **Technology-Specific Setup**
   - Copy relevant files from examples/ to your project root
   - Modify package.json, requirements.txt, go.mod, or Cargo.toml as needed
   - Update .gitignore for additional exclusions

2. **Claude Code Optimization**
   - Customize slash commands in .claude/commands/ for project-specific workflows
   - Add project-specific important notes to this file
   - Configure development commands section above

3. **GitHub Workflows**
   - Modify .github/workflows/ files for your CI/CD requirements
   - Update dependabot.yml for your package manager
   - Customize issue and PR templates

## Important Notes

### File Structure
- `.claude/commands/` - Custom Claude Code slash commands
- `examples/` - Technology stack configuration examples
- `docs/` - Project documentation and guides
- `.github/` - GitHub-specific configuration files

### Security Considerations
- All example configurations follow security best practices
- Dependabot is configured for automated security updates
- Security scanning workflows are included
- Never commit sensitive information (API keys, passwords, etc.)

### Maintenance
- Regularly update dependencies using provided automation
- Review and update documentation as project evolves
- Keep custom commands synchronized with Claude Code updates
- Monitor GitHub Actions for workflow health

### Getting Help
- Check docs/setup-guide.md for detailed instructions
- Review examples/ directory for technology stack specific guidance
- Refer to CONTRIBUTING.md for contribution guidelines
- Use GitHub Issues for questions and bug reports

### Claude Code Integration Notes
- This template is optimized for Claude Code (claude.ai/code)
- Custom commands follow official Claude Code specifications
- Project memory configuration is designed for optimal AI assistance
- All automation respects Claude Code workflow patterns

---

**Note**: This template is actively maintained and follows evolving best practices. Check for updates regularly and contribute improvements back to the community.

