## set up yum to use redhat repo as well
sudo yum localinstall --nogpgcheck http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm

## use the ms visual studio code repo too
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

## update all existing packages
sudo yum update

## install visual studio code
sudo yum install code

## uninstall docker
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine


## install docker
sudo yum install docker
sudo service docker start
sudo docker run hello-world

## install node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash ## this looks like a bad idea, what's the better way?
. ~/.nvm/nvm.sh
nvm install 4.4.5
node -e "console.log('Running Node.js ' + process.version)"

## install golang
sudo yum install golang

## install zsh and oh my zsh
sudo yum install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## fix locale
sudo localedef -c -i en_US -f UTF-8 en_US.UTF-8

## set up yum to use redhat repo as well
sudo yum localinstall --nogpgcheck http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm

## install htop
sudo yum install htop

## install apache
sudo yum install httpd mod_ssl

## install mysql
sudo yum install mysql

## make a local bin dir
mkdir ~/bin 2> /dev/null
chmod 770 ~/bin

## make .phil_profile called from .bash_profile at then end so we don't have to care what .bash_profile does or overwrite
## the default stuff entirely
touch .phil_profile
if ! grep --quiet .phil_profile .bash_profile
then
 echo . ~/.phil_profile >> .bash_profile
fi

## put stuff in .phil_profile that needs to be there
if ! grep --quiet "LANG=en_US.utf8" .phil_profile
then
 echo "LANG=en_US.utf8" >> .phil_profile
fi
if ! grep --quiet 'PATH=$PATH:~/bin' .phil_profile
then
 echo 'PATH=$PATH:~/bin' >> .phil_profile
fi

## deal with ssh/keys

if ! [ -e ~/.ssh/id_dsa.pub ]
then
  ssh-keygen -t dsa
fi
if ! [ -e ~/.ssh/id_rsa.pub ]
then
  ssh-keygen -o
fi
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo Please add the ssh key to github now
echo Here it is:
cat ~/.ssh/id_rsa.pub
echo Hit a key when done
read

## re-execute and import results from .bash_profile so changes above stick in current session
. ~/.bash_profile

echo done!
