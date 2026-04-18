#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define a function for colored output
function print_color() {
  COLOR=$1
  MESSAGE=$2
  case "$COLOR" in
    "green") echo -e "\033[0;32m$MESSAGE\033[0m" ;;
    "red") echo -e "\033[0;31m$MESSAGE\033[0m" ;;
    "yellow") echo -e "\033[0;33m$MESSAGE\033[0m" ;;
    *) echo "$MESSAGE" ;;
  esac
}

# --- Step 1: Ensure Git is initialized and a remote is set ---
if [ ! -d ".git" ]; then
  print_color "red" "Error: Git repository not found. Please run 'git init' first."
  exit 1
fi

if ! git remote -v | grep -q 'origin'; then
  print_color "red" "Error: No remote 'origin' found. Please add a remote URL."
  exit 1
fi

# --- Step 2: Ensure .gitignore is present ---
if [ ! -f ".gitignore" ]; then
  print_color "yellow" "Warning: .gitignore not found. Creating a standard one for Terraform projects."
  cat > .gitignore << EOL
# Terraform-related files to ignore
.terraform/
*.tfstate
*.tfstate.*
.terraform.lock.hcl
crash.log
*.tfvars
override.tf
override.tf.json
EOL
  print_color "green" ".gitignore created."
fi

# --- Step 3: Git commands to add, commit, and push ---
print_color "yellow" "Adding all changes to staging area..."
git add .

# Check if there are any changes to commit
if ! git diff-index --quiet HEAD; then
  # Prompt for a commit message
  read -p "Enter a commit message: " commit_message

  # Check if the commit message is empty
  if [ -z "$commit_message" ]; then
    print_color "yellow" "Commit message cannot be empty. Using default message."
    commit_message="Automated commit"
  fi

  print_color "yellow" "Committing changes with message: '$commit_message'..."
  git commit -m "$commit_message"

  # Get the current branch name
  current_branch=$(git rev-parse --abbrev-ref HEAD)

  print_color "yellow" "Pushing to remote repository on branch: '$current_branch'..."
  git push origin "$current_branch"

  print_color "green" "Successfully pushed all changes to GitHub."
else
  print_color "green" "No changes to commit. Working tree is clean."
fi
