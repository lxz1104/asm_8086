#!/bin/bash
echo 'Begin installing...'

# 安装软件
Install_DosBox()
{   
    echo  '=> dosbox: '`which dosbox`
    if [ $? -eq 0 ];then
      echo '=> DosBox has been installed'
      return
    fi

    # Check OS
    if grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        DISTRO='RHEL'
        PM='yum'
    elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
        DISTRO='Aliyun'
        PM='yum'
    elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        DISTRO='Fedora'
        PM='yum'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
        DISTRO='Raspbian'
        PM='apt'
    elif grep -Eqi "Manjaro" /etc/issue || grep -Eq "Manjaro" /etc/*-release; then
        DISTRO='Manjaro'
        PM='pacman'
    elif grep -Eqi "Arch" /etc/issue || grep -Eq "Arch" /etc/*-release; then
        DISTRO='Arch'
        PM='pacman'
    else
        DISTRO='Unknow'
    fi
    echo 'OS:' $DISTRO;
    
    if [ $DISTRO == 'Unknow' ];
    then
      echo '=> [Warning]: Please install DosBox by yourself!'
    fi

    echo '<= Installing DosBox ...'
    if [ $PM == 'pacman'  ];
    then
      sudo $PM -Sy dosbox
    else
      sudo $PM update
      sudo $PM install dosbox -y
    fi
}

# install config
Config_Dependent(){
  conf_name='dosbox-0.74.conf'
  mkdir -p ~/ms-dos
  
  echo '=> The default config: '
  conf_name=$(ls ~/.dosbox)
  echo $conf_name

  cp -rf ./ASM ~/ms-dos/
  cp -rf ./FILE ~/ms-dos/ 
  cp -rf ./MASM ~/ms-dos/ 
  cp -rf ./VIM ~/ms-dos/ 

  cp -f ~/.dosbox/dosbox-*.conf ./config/dosbox.conf.bak
  cp -f ./config/dosbox.conf ~/.dosbox/$conf_name
}

Install_DosBox
Config_Dependent

echo '=> Install Success!'
