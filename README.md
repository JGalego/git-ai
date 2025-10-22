# Git AI

A Git extension that tracks and visualizes changes made by AI systems as sub-nodes and sub-branches in your commit tree, with full team collaboration support.

> *"It's like comparing apples and oranges; they're both delicious"*
>
> ― Cyd Charisse

<img src="git-ai.jpg" alt="Git AI Visualization" width="50%"/>

## Features

- 🤖 **AI Change Tracking**: Mark and track commits made by AI systems
- 🌳 **Visual Commit Tree**: Enhanced git log with AI annotations and sub-branches  
- 📊 **AI Statistics**: View contribution statistics and AI system usage
- 🔀 **Smart Merging**: Merge AI branches with proper conflict resolution
- 📝 **Metadata Storage**: Store AI prompts, models, and context with commits
- 🎨 **Beautiful Visualization**: Unicode and ASCII tree formats with colors
- 🌐 **Remote Collaboration**: Full team synchronization of AI metadata and branches
- ⚙️ **Conflict Resolution**: Handle AI metadata and branch conflicts intelligently

## Installation

### From PyPI (recommended)

```bash
pip install git-ai
```

### From Source

```bash
git clone https://github.com/jgalego/git-ai.git
cd git-ai
pip install -e .
```

### Development Installation

```bash
git clone https://github.com/jgalego/git-ai.git
cd git-ai
pip install -e ".[dev]"
```

## Quick Start

```bash
# Get help
git ai help

# Initialize AI tracking
git ai init

# Start tracking an AI system
git ai track "GitHub Copilot"

# Make AI changes and commit them
git ai commit -m "Add user authentication" --ai-prompt "Create a login system" --ai-model "gpt-4"

# Visualize your AI contributions
git ai tree
git ai stats
```

## Commands

### Core Commands
- `git ai init` - Initialize AI tracking for this repository
- `git ai track <ai-system>` - Start tracking changes for an AI system
- `git ai commit -m <message>` - Commit with AI metadata
- `git ai status` - Show current AI tracking status
- `git ai help` - Show detailed help information

### Visualization Commands
- `git ai tree` - Show commit tree with AI sub-branches
- `git ai log` - Show commit history with AI annotations
- `git ai branches` - Show AI branches structure
- `git ai stats` - Show AI contribution statistics

### Management Commands
- `git ai merge <ai-branch>` - Merge AI branch with conflict resolution
- `git ai config` - Configure AI tracking settings

## Team Collaboration

## Team Collaboration

### Setup for Team
```bash
# Repository owner
git ai init
git ai track "GitHub Copilot"
git ai commit -m "Add auth" --ai-prompt "Create login system"
git push origin --all
git push origin refs/notes/ai

# Team member
git clone <repo>
git fetch origin refs/notes/ai:refs/notes/ai  # Get AI metadata
git ai track "Claude"          # Track their AI system
git ai commit -m "Add dashboard"
git push origin --all
git push origin refs/notes/ai  # Share with team
```

### Daily Workflow
```bash
git pull                       # Get latest changes
git fetch origin refs/notes/ai:refs/notes/ai  # Get AI metadata
# Make AI-assisted changes
git ai commit -m "..." --ai-prompt "..." --ai-model "..."
git push origin --all          # Share changes
git push origin refs/notes/ai  # Share AI metadata
```

## How It Works

git-ai extends Git's functionality by:

1. **Metadata Storage**: Uses Git notes to store AI-specific metadata (prompts, models, timestamps)
2. **Branch Management**: Creates lightweight AI branches prefixed with `ai/`
3. **Commit Annotation**: Marks commits with AI system information
4. **Visual Enhancement**: Provides enhanced log and tree views showing AI contributions
5. **Remote Synchronization**: Syncs AI notes, branches, and configuration across team

### Architecture

```
your-repo/
├── .git/
│   ├── ai/                 # AI configuration
│   │   └── config.json     # AI systems and settings
│   └── notes/
│       └── ai              # AI metadata for commits
├── main                    # Your main branch
├── feature/auth           # Human feature branch
├── ai/copilot/main        # AI sub-branch of main
└── ai/copilot/feature/auth # AI sub-branch of feature
```

### Remote Synchronization

The extension synchronizes:
- **AI Notes**: All metadata about AI contributions
- **AI Branches**: Complete AI branch structure  
- **AI Configuration**: Team-wide AI system settings

## Tree Visualization

git-ai provides enhanced commit visualization:

```
🤖 a1b2c3d4 Add user authentication (alice, 2024-01-15) [AI: GitHub Copilot, Model: gpt-4]
├─ 🌿 b2c3d4e5 Fix validation logic [GitHub Copilot]
└─ 🌿 c3d4e5f6 Add error handling [GitHub Copilot]
👤 d4e5f6g7 Update documentation (bob, 2024-01-14)
🔀 e5f6g7h8 Merge AI changes from ai/copilot/feature (alice, 2024-01-14) [AI: merge]
```

**Legend**: 🤖 AI-generated • 👤 Human-made • 🔀 AI merge • 🌿 AI sub-branch

## Advanced Usage

### Multiple AI Systems
```bash
git ai track "GitHub Copilot"
git ai track "Claude"
git ai track "Custom AI"
git ai stats                   # View contribution breakdown
```

### Code Review Integration
```bash
git ai log --ai-only          # Review only AI contributions
git ai merge ai/copilot/feature --strategy squash
```

### CI/CD Integration
```bash
git ai track "CI Bot"
git ai commit -m "Auto-format code" --ai-model "prettier"
```

## Troubleshooting

### Remote Issues
```bash
# Sync AI metadata with remote
git fetch origin refs/notes/ai:refs/notes/ai
git push origin refs/notes/ai

# Push all AI branches
git push origin --all
```

### Common Issues
- **"git-ai command not found"**: Check if package is installed (`pip list | grep git-ai`)
- **"No active AI session"**: Run `git ai track "Your AI System"`
- **"Not a git repository"**: Run commands from within a Git repository
- **Remote sync not working**: Use standard git commands for notes and branches

### Development

```bash
# Run tests
pytest

# Code formatting
black src/ tests/
isort src/ tests/

# Type checking
mypy src/
```

## Requirements

- Git 2.0+
- Python 3.8+
- Unix-like system (Linux, macOS) or WSL on Windows

## License

MIT

---

**Track your AI contributions and collaborate seamlessly with your team!** 🤖✨