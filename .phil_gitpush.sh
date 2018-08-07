echo remember to push the id_rsa.pub to github first
echo here it is:
cat ~/.ssh/id_rsa.pub

echo hit enter when done
read


ls -d .* | grep -v phil > .gitignore
ls | grep -v phil | grep -v README >> .gitignore
if ! [ -e README.md ]
then
 echo "# dotfiles" >> README.md
fi
git init
git add README.md
git add .phil*
git config --global user.email "phil.lisitza@twopoint.com"
git config --global user.name "phil lisitza"
git commit -m "Auto-Commmit from (`uname -n`) on (`date`)"
git remote add origin git@github.com:plisitza/dotfiles.git
git push -u origin master
