#!/bin/bash

# OurSpace Portfolio - Git Deployment Script
# This script will commit and push all changes to GitHub

echo "🚀 OurSpace Portfolio Deployment Script"
echo "========================================"
echo ""

# Navigate to the OurSpace directory
cd "$(dirname "$0")"

echo "📍 Current directory: $(pwd)"
echo ""

# Check if this is a git repository
if [ ! -d ".git" ]; then
    echo "⚠️  This is not a Git repository yet!"
    echo ""
    read -p "Would you like to initialize a new Git repository? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git init
        echo "✅ Git repository initialized"
        echo ""
        read -p "Enter your GitHub repository URL (e.g., https://github.com/username/repo.git): " REPO_URL
        git remote add origin "$REPO_URL"
        echo "✅ Remote origin added"
    else
        echo "❌ Deployment cancelled"
        exit 1
    fi
fi

# Show current status
echo "📋 Current Git Status:"
git status
echo ""

# Move the preview card image to the Images folder if needed
if [ -f "Poster - JONATHAN FRANKO.jpg" ] && [ ! -f "Images/Poster - JONATHAN FRANKO.jpg" ]; then
    echo "📦 Moving preview card to Images folder..."
    mv "Poster - JONATHAN FRANKO.jpg" "Images/Poster - JONATHAN FRANKO.jpg"
    echo "✅ Preview card moved"
    echo ""
fi

# Stage all changes
echo "➕ Staging all changes..."
git add .
echo ""

# Show what will be committed
echo "📝 Files to be committed:"
git status --short
echo ""

# Commit with descriptive message
read -p "Enter commit message (or press Enter for default): " COMMIT_MSG
if [ -z "$COMMIT_MSG" ]; then
    COMMIT_MSG="Add SEO optimization, Open Graph preview card, and supporting files"
fi

git commit -m "$COMMIT_MSG"
echo ""

# Get current branch name
BRANCH=$(git branch --show-current)
echo "📤 Pushing to branch: $BRANCH"
echo ""

# Push to GitHub
read -p "Ready to push to GitHub? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git push -u origin "$BRANCH"
    echo ""
    echo "✅ Successfully pushed to GitHub!"
    echo ""
    echo "🎉 Deployment Complete!"
    echo ""
    echo "📋 Next Steps:"
    echo "   1. Check your GitHub repository to confirm changes"
    echo "   2. Cloudflare Pages will auto-deploy (if configured)"
    echo "   3. Test your preview card at: https://www.opengraph.xyz/"
    echo "   4. Enter your URL: https://jonsjobspace.jonsjobblog.com"
else
    echo "❌ Push cancelled"
fi
