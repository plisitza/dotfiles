ls -d .* | grep -v phil > .gitignore
ls | grep -v phil | grep -v README >> .gitignore
echo "# dotfiles" >> README.md
git init
git add README.md
git add .phil*
git config --global user.email "phil.lisitza@twopoint.com"
git config --global user.name "phil lisitza"
git commit -m "Auto-Commmit from (`uname -n`) on (`date`)"
git remote add origin git@github.com:plisitza/dotfiles.git
git push -u origin master
