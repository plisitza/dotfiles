## set up yum to use redhat repo as well
sudo yum localinstall --nogpgcheck http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm

## update all existing packages
sudo yum update

## install docker
sudo yum install docker

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
if ! grep .phil_profile .bash_profile
then
 echo . ~/.phil_profile >> .bash_profile
fi

## put stuff in .phil_profile that needs to be there
if ! grep LANG=en_US.utf8 .phil_profile
then
 echo grep LANG=en_US.utf8 >> .phil_profile
fi
if ! grep "PATH=$PATH:~/bin"
then
 echo "PATH=$PATH:~/bin" >> .phil_profile
fi

## re-execute and import results from .bash_profile so changes above stick in current session
. ~/.bash_profile

