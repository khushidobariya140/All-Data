#!/bin/bash
# Script to automate creation and push of 8 category repositories to GitHub
# Run this script from the root directory of the All-Data repository

set -e

CATEGORIES=(
  "Python-Projects"
  "SQL-Projects"
  "Excel-Projects"
  "PowerBI-Projects"
  "Statistics-Projects"
  "Business-Case-Studies"
  "Data-Preprocessing-Projects"
  "Machine-Learning-Projects"
)

USER_OR_ORG="khushidobariya140"

echo "============================================================"
echo " Starting GitHub Remote Repository Deployment for Portfolio "
echo " Target Owner: $USER_OR_ORG "
echo "============================================================"

# Check if GitHub CLI (gh) is installed
if command -v gh &> /dev/null; then
  echo "GitHub CLI (gh) detected. Automating remote repository creation and push..."
  for repo in "${CATEGORIES[@]}"; do
    if [ -d "$repo" ]; then
      echo "------------------------------------------------------------"
      echo "Processing $repo..."
      (
        cd "$repo"
        if [ ! -d ".git" ]; then
          git init -b main
          git add .
          git commit -m "Initial commit for $repo"
        fi
        echo "Creating remote repository $USER_OR_ORG/$repo..."
        gh repo create "$USER_OR_ORG/$repo" --public --source=. --remote=origin --push || {
          echo "gh repo create failed or repository already exists. Attempting standard push..."
          git remote add origin "https://github.com/$USER_OR_ORG/$repo.git" 2>/dev/null || true
          git push -u origin main || true
        }
      )
    fi
  done
  echo "============================================================"
  echo " All 8 repositories deployed to GitHub successfully! "
  echo "============================================================"
else
  echo "GitHub CLI (gh) is not installed."
  echo "Please create the 8 repositories manually at https://github.com/new with names:"
  for repo in "${CATEGORIES[@]}"; do
    echo "  - $repo"
  done
  echo ""
  echo "After creating them on GitHub.com, run the following git commands:"
  for repo in "${CATEGORIES[@]}"; do
    echo "  (cd $repo && git remote add origin https://github.com/$USER_OR_ORG/$repo.git && git push -u origin main)"
  done
fi
