# GitHub Deployment Guide

## 🚀 Quick Deploy (Recommended)

### Using the Deploy Script:

1. **Open Terminal** and navigate to your OurSpace folder:
   ```bash
   cd ~/Documents/Claude/JonsJobBlog/OurSpace
   ```

2. **Make the script executable**:
   ```bash
   chmod +x deploy.sh
   ```

3. **Run the deployment script**:
   ```bash
   ./deploy.sh
   ```

4. **Follow the prompts** - the script will:
   - Check if it's a git repository
   - Move your preview card to the Images folder
   - Stage all changes
   - Commit with a message
   - Push to GitHub

---

## 📝 Manual Deployment (Alternative)

If you prefer to do it manually or the script doesn't work:

### Step 1: Move Preview Card
```bash
mv "Poster - JONATHAN FRANKO.jpg" "Images/Poster - JONATHAN FRANKO.jpg"
```

### Step 2: Check Git Status
```bash
git status
```

### Step 3: Stage All Changes
```bash
git add .
```

### Step 4: Commit Changes
```bash
git commit -m "Add SEO optimization, Open Graph preview card, and supporting files

- Complete meta tags and Open Graph data
- Twitter Card metadata
- JSON-LD structured data
- Semantic HTML5 structure
- robots.txt and sitemap.xml
- Preview card for social media sharing
- README documentation"
```

### Step 5: Push to GitHub
```bash
git push origin main
```

(Replace `main` with your branch name if different - could be `master`)

---

## 🔧 If This Is Your First Git Commit:

### Initialize Git (if needed):
```bash
git init
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
```

### Set up your Git identity (if needed):
```bash
git config --global user.email "jon@doubletreeindustries.com"
git config --global user.name "Jonathan Franko"
```

---

## ✅ After Pushing to GitHub:

1. **Verify on GitHub**:
   - Visit your repository on GitHub
   - Confirm all files are there

2. **Cloudflare Pages Auto-Deploy**:
   - If connected, Cloudflare will automatically deploy
   - Check your Cloudflare Pages dashboard

3. **Test Your Preview Card**:
   - Visit: https://www.opengraph.xyz/
   - Enter: https://jonsjobspace.jonsjobblog.com
   - See how it looks on LinkedIn, Facebook, Twitter

4. **Test Social Sharing**:
   - Create a LinkedIn post with your URL
   - Check if the preview card appears correctly

---

## 🐛 Troubleshooting:

### "Permission denied" error:
```bash
chmod +x deploy.sh
```

### "Not a git repository":
```bash
git init
git remote add origin YOUR-GITHUB-URL
```

### Preview card not showing:
- Wait 5-10 minutes for caches to clear
- Use LinkedIn's Post Inspector to refresh cache
- Verify the image is in the Images folder

### Cloudflare not deploying:
- Check your Cloudflare Pages dashboard
- Verify the GitHub connection
- Check build logs for errors

---

## 📞 Need Help?

If you encounter any issues:
1. Check the error message carefully
2. Verify you're in the correct directory
3. Ensure all files are present in the OurSpace folder
4. Check that GitHub repository is set up correctly

---

**Quick Status Check:**
```bash
# Are you in the right folder?
pwd

# Is this a git repo?
git status

# What's your remote?
git remote -v

# What branch are you on?
git branch
```
