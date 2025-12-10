#!/bin/bash

# OurSpace Portfolio - Direct Deploy to Main Branch
# This script will commit and push changes directly to the main branch

echo "🚀 OurSpace Portfolio - Deploy to Main Branch"
echo "=============================================="
echo ""

# Navigate to the OurSpace directory
cd "$(dirname "$0")"

echo "📍 Current directory: $(pwd)"
echo ""

# Check if this is a git repository
if [ ! -d ".git" ]; then
    echo "⚠️  Initializing Git repository..."
    git init
    git remote add origin https://github.com/JonFranko/OurSpace.git
    echo "✅ Git repository initialized and remote added"
    echo ""
fi

# Verify remote is correct
REMOTE_URL=$(git remote get-url origin 2>/dev/null)
if [ "$REMOTE_URL" != "https://github.com/JonFranko/OurSpace.git" ]; then
    echo "⚠️  Updating remote URL..."
    git remote remove origin 2>/dev/null
    git remote add origin https://github.com/JonFranko/OurSpace.git
    echo "✅ Remote URL updated"
    echo ""
fi

# Move the preview card image to the Images folder if needed
if [ -f "Poster - JONATHAN FRANKO.jpg" ] && [ ! -f "Images/Poster - JONATHAN FRANKO.jpg" ]; then
    echo "📦 Moving preview card to Images folder..."
    mv "Poster - JONATHAN FRANKO.jpg" "Images/Poster - JONATHAN FRANKO.jpg"
    echo "✅ Preview card moved"
    echo ""
fi

# Fetch latest from remote to check branches
echo "🔄 Fetching from remote..."
git fetch origin 2>/dev/null || true
echo ""

# Check if main branch exists locally
if git show-ref --verify --quiet refs/heads/main; then
    echo "📌 Switching to existing main branch..."
    git checkout main
else
    # Check if main exists on remote
    if git ls-remote --heads origin main | grep -q main; then
        echo "📥 Checking out main branch from remote..."
        git checkout -b main origin/main
    else
        echo "🆕 Creating new main branch..."
        git checkout -b main
    fi
fi
echo ""

# Stage all changes
echo "➕ Staging all changes..."
git add .
echo ""

# Show what will be committed
echo "📝 Files to be committed:"
git status --short
echo ""

# Check if there are changes to commit
if git diff-index --quiet HEAD --; then
    echo "ℹ️  No changes to commit"
    echo ""
else
    # Commit with descriptive message
    COMMIT_MSG="Add SEO optimization, Open Graph preview card, and supporting files

- Complete meta tags and Open Graph data for social media
- Twitter Card metadata for better Twitter sharing
- JSON-LD structured data for search engines
- Semantic HTML5 structure with proper accessibility
- robots.txt and sitemap.xml for search engine crawling
- Open Graph preview card (1200x630px JPG)
- README and deployment documentation
- Backup of original index.html

This update significantly improves SEO, social media sharing, and search engine visibility."

    git commit -m "$COMMIT_MSG"
    echo ""
    echo "✅ Changes committed to main branch"
    echo ""
fi

# Push to GitHub main branch
echo "📤 Pushing to GitHub main branch..."
echo ""

read -p "Ready to push to https://github.com/JonFranko/OurSpace main branch? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git push -u origin main
    echo ""
    echo "✅ Successfully pushed to GitHub main branch!"
    echo ""
    echo "🎉 Deployment Complete!"
    echo ""
    echo "📋 Next Steps:"
    echo "   1. Visit: https://github.com/JonFranko/OurSpace"
    echo "   2. Verify all files are updated on main branch"
    echo "   3. Cloudflare Pages will auto-deploy from main"
    echo "   4. Test preview card at: https://www.opengraph.xyz/"
    echo "   5. Enter URL: https://jonsjobspace.jonsjobblog.com"
    echo ""
    echo "⏱️  Note: Cloudflare deployment may take 2-5 minutes"
else
    echo "❌ Push cancelled"
fi
