#!/bin/bash

# Git-AI Demo Script
#
# This script demonstrates the complete git-ai workflow including:
# 1. Basic AI tracking and commits
# 2. Experimental branch workflows for failed AI ideas
# 3. True git branching topology with merges
# 4. Remote synchronization
# 5. Statistics and visualization

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_step() {
    echo -e "${BLUE}=== $1 ===${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ  $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_section() {
    echo -e "${CYAN}>>> $1 <<<${NC}"
}

# Cleanup function
cleanup() {
    print_info "Cleaning up test repositories..."
    cd /tmp
    rm -rf git-ai-demo git-ai-remote-demo
    print_success "Cleanup completed"
}

# Trap to ensure cleanup on exit
trap cleanup EXIT

print_section "GIT-AI DEMO"
echo "This demo showcases the complete git-ai workflow:"
echo "• Basic AI tracking and subcommits"
echo "• Experimental branches for failed AI ideas"
echo "• True git branching topology"
echo "• Remote synchronization"
echo "• Statistics and visualization"
echo ""

print_step "Setting up test environment"

# Create test directories
cd /tmp
rm -rf git-ai-demo git-ai-remote-demo

# Create remote repository (simulating GitHub)
mkdir git-ai-remote-demo
cd git-ai-remote-demo
git init --bare
print_success "Created bare remote repository"

# Clone the repository (simulating git clone)
cd /tmp
git clone git-ai-remote-demo git-ai-demo
cd git-ai-demo

print_step "Initial repository setup"

# Configure git user (required for commits)
git config user.name "Demo User"
git config user.email "demo@example.com"

# Create initial project files
echo "# Demo Project" > README.md
echo "print('Hello World')" > main.py
echo "# This is a utility module" > utils.py
git add .
git commit -m "Initial commit"
git push origin main

print_success "Initial repository created and pushed"

print_step "Installing and initializing git-ai"

# Install git-ai from source
python -m pip install /home/jgalego/git/git.ai > /dev/null 2>&1

# Initialize git-ai tracking
git ai init
print_success "git-ai initialized"

# Start tracking an AI system
git ai track "GitHub Copilot"
print_success "Started tracking GitHub Copilot"

print_section "PART 1: BASIC AI WORKFLOW"

print_step "Human makes changes and uses 'git ai commit'"

# Human makes some changes
echo "# Added documentation section" >> README.md
echo "def greet(name):" >> main.py
echo "    return f'Hello {name}'" >> main.py

# Create first AI subcommit (human changes tracked in AI system)
git ai commit -m "Human changes: added docs and greet function"
print_success "Created first subcommit (human changes)"

# Show current status
print_info "Current AI status:"
git ai status

print_step "AI companion rewrites something"

# Simulate AI making improvements
echo "" >> main.py
echo "# AI improved this function" >> main.py
echo "def greet_formal(name):" >> main.py
echo "    return f'Good day, {name}!'" >> main.py

# Commit AI changes with metadata
git ai commit -m "AI rewrite: improved greet function" --ai-prompt "Make the greeting more formal" --ai-model "GPT-4"
print_success "Created AI rewrite subcommit with metadata"

print_step "Second AI change"

# More AI changes
echo "" >> utils.py
echo "def calculate_age(birth_year, current_year=2024):" >> utils.py
echo "    return current_year - birth_year" >> utils.py

git ai commit -m "AI addition: age calculation function" --ai-prompt "Add a function to calculate age"
print_success "Created second AI subcommit"

print_step "Visualizing the basic AI workflow"

print_info "AI commit tree:"
git ai tree

print_section "PART 2: EXPERIMENTAL BRANCHES FOR FAILED IDEAS"

print_step "AI suggests complex statistics feature - create experiment"

print_info "AI suggests adding complex statistical analysis..."
print_info "This might be overkill - let's experiment with it..."

# Create an experimental branch for the stats feature
git ai experiment "stats-feature"
print_success "Created experimental branch for stats feature"

print_info "Current AI status:"
git ai status

print_step "Develop the experimental stats feature"

echo "" >> utils.py
echo "import statistics" >> utils.py
echo "def calculate_mean(numbers): return statistics.mean(numbers)" >> utils.py
echo "def calculate_median(numbers): return statistics.median(numbers)" >> utils.py
git ai commit -m "AI experiment: Add statistics functions" --ai-prompt "Add statistical analysis functions"

echo "def calculate_stdev(numbers): return statistics.stdev(numbers)" >> utils.py
echo "def advanced_stats(numbers):" >> utils.py
echo "    return {'mean': statistics.mean(numbers), 'stdev': statistics.stdev(numbers)}" >> utils.py
git ai commit -m "AI experiment: Advanced statistical analysis" --ai-prompt "Add statistical functions"

print_success "Developed experimental stats feature"

print_step "Realize the stats idea is too complex"

print_info "After reflection, the stats feature is overkill for this simple project..."
print_info "Let's abandon this approach and try something simpler"

# Go back to main AI branch (abandoning the experiment)
git checkout ai/github-copilot/main
print_success "Abandoned stats experiment - but it's preserved on the experimental branch!"

print_info "Current file state (no complex stats):"
cat utils.py

print_step "Try different AI approach - simple utilities"

git ai experiment "simple-utils"
print_success "Created new experimental branch for simpler approach"

echo "" >> utils.py
echo "def format_name(first, last):" >> utils.py
echo "    return f'{first.title()} {last.title()}'" >> utils.py
echo "def count_words(text):" >> utils.py
echo "    return len(text.split())" >> utils.py
git ai commit -m "AI different approach: Simple utility functions" --ai-prompt "Add simple, useful utility functions"

print_success "Implemented simpler, better approach"

print_step "Show experimental branch structure"

print_info "All branches (including experimental ones):"
git branch -a

print_info "The failed 'stats-feature' experiment is preserved at:"
print_info "  ai/github-copilot/main_experiment_stats-feature"

print_section "PART 3: TRUE GIT BRANCHING TOPOLOGY"

print_step "Merge successful experiment and create branching topology"

# Go to main and show current git graph
git checkout main
print_info "Current git topology:"
git log --graph --oneline --all -n 10

# Merge the successful simple-utils experiment
git ai merge ai/github-copilot/main_experiment_simple-utils
print_success "Merged simple-utils experiment with proper merge commit"

print_step "Create multiple parallel AI experiments"

# Create first parallel experiment
git ai experiment "feature-validation"
echo "" >> main.py
echo "def validate_input(data):" >> main.py
echo "    return data is not None and len(str(data)) > 0" >> main.py
git ai commit -m "AI: Add input validation" --ai-prompt "Add input validation functions"

# Go back and create second parallel experiment
git checkout ai/github-copilot/main
git ai experiment "feature-logging"
echo "" >> utils.py
echo "import datetime" >> utils.py
echo "def log_message(msg):" >> utils.py
echo "    timestamp = datetime.datetime.now().isoformat()" >> utils.py
echo "    return f'[{timestamp}] {msg}'" >> utils.py
git ai commit -m "AI: Add logging utilities" --ai-prompt "Add logging functionality"

print_step "Show true branching topology"

print_info "Current branch structure with parallel development:"
git branch

print_info "Git log showing TRUE branching topology:"
git log --graph --oneline --all --decorate

print_info "AI tree view:"
git ai tree

print_step "Merge parallel experiments"

git checkout main
git ai merge ai/github-copilot/main_experiment_feature-validation
print_success "Merged validation experiment"

git ai merge ai/github-copilot/main_experiment_feature-logging
print_success "Merged logging experiment"

print_step "Final branching topology demonstration"

print_info "Complete git graph with multiple branches and merges:"
git log --graph --oneline --all --decorate

print_info "AI tree view of complete development:"
git ai tree

print_section "PART 4: MANUAL EDITS AND HUMAN INTEGRATION"

print_step "Human makes manual edits"

# Human makes manual changes
echo "" >> main.py
echo "# Manual addition by human" >> main.py
echo "if __name__ == '__main__':" >> main.py
echo "    print(greet('World'))" >> main.py
echo "    print(validate_input('test data'))" >> main.py

git ai commit -m "Human manual edits: added main execution block"
print_success "Created human manual edits subcommit"

print_step "Create final human commit"

# Go back to main branch
git checkout main

# Get the current AI branch name
AI_BRANCH="ai/github-copilot/main"
if git branch | grep -q "$AI_BRANCH"; then
    # Merge AI changes back to main
    git ai merge "$AI_BRANCH"
    print_success "Merged all AI changes back to main"
else
    print_error "Could not find AI branch: $AI_BRANCH"
    print_info "Available branches:"
    git branch -a
fi

# Make a final commit as human
echo "# Final version with AI integration" >> README.md
echo "This project now includes AI-generated utilities and validation." >> README.md
git add .
git commit -m "Final version with integrated AI improvements"
print_success "Created final human commit"

print_section "PART 5: REMOTE SYNCHRONIZATION"

print_step "Setup and test remote synchronization"

# Setup remote AI synchronization
git ai setup origin
print_success "Configured remote AI synchronization"

# Push AI data
git ai push origin
print_success "Pushed AI data to remote"

# Also push main branch
git push origin main
print_success "Pushed main branch to remote"

# Show remote status
print_info "Remote synchronization status:"
git ai remote-status origin

print_section "PART 6: STATISTICS AND FINAL VISUALIZATION"

print_step "Display statistics"

# Show AI statistics
print_info "AI contribution statistics:"
git ai stats

print_step "Show complete development history"

# Show the final AI tree after all merges
print_info "Complete AI tree structure:"
git ai tree

# Show final git log with proper topology
print_info "Final git log with branching topology:"
git log --graph --oneline --all --decorate

print_step "Show all preserved experimental branches"

print_info "All branches (including failed experiments):"
git branch -a

print_info "Content of final integrated files:"
echo "--- main.py ---"
cat main.py
echo ""
echo "--- utils.py ---"
cat utils.py

print_section "DEMO COMPLETED SUCCESSFULLY!"

print_success "Complete git-ai workflow demonstrated!"
echo ""
print_info "What this demo showed:"
echo "  1. ✓ Basic AI tracking and subcommits"
echo "  2. ✓ AI rewrites with metadata (prompt, model)"
echo "  3. ✓ Multiple AI iterations and improvements"
echo "  4. ✓ Experimental branches for testing ideas"
echo "  5. ✓ Preserving failed experiments for future reference"
echo "  6. ✓ Successful experiment integration"
echo "  7. ✓ True git branching topology with / and \\ characters"
echo "  8. ✓ Parallel AI development on multiple branches"
echo "  9. ✓ Proper merge commits for clean topology"
echo "  10. ✓ Manual human edits within AI workflow"
echo "  11. ✓ Final human commit integrating all AI work"
echo "  12. ✓ Remote synchronization of AI metadata"
echo "  13. ✓ Statistics and visualization"
echo ""

print_info "Key experimental branches preserved:"
echo "  • ai/github-copilot/main_experiment_stats-feature (failed complex stats)"
echo "  • ai/github-copilot/main_experiment_simple-utils (successful simple approach)"
echo "  • ai/github-copilot/main_experiment_feature-validation (parallel development)"
echo "  • ai/github-copilot/main_experiment_feature-logging (parallel development)"
echo ""

print_info "You can return to any experimental branch anytime to continue development."