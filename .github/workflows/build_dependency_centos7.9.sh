### Configure YUM source
sed -e "s|^mirrorlist=|#mirrorlist=|g" \
    -e "s|^#baseurl=http://mirror.centos.org/centos/\$releasever|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-vault/7.9.2009|g" \
    -e "s|^#baseurl=http://mirror.centos.org/\$contentdir/\$releasever|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-vault/7.9.2009|g" \
    -i.bak \
    /etc/yum.repos.d/CentOS-*.repo

yum install -y epel-release
yum install -y centos-release-scl centos-release-scl-rh

sed -i.bak 's|^mirrorlist=|#mirrorlist=|g; s|^# baseurl=http://mirror.centos.org/centos/7/sclo/$basearch/sclo/|baseurl=https://mirrors.aliyun.com/centos-vault/7.9.2009/sclo/x86_64/sclo/|g' /etc/yum.repos.d/CentOS-SCLo-scl.repo
sed -i.bak 's|^mirrorlist=|#mirrorlist=|g; s|^#baseurl=http://mirror.centos.org/centos/7/sclo/$basearch/rh/|baseurl=https://mirrors.aliyun.com/centos-vault/7.9.2009/sclo/x86_64/rh/|g' /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo


### Foundational deps
yum install -y devtoolset-11-toolchain
yum install -y cmake3  swig3 bison flex openssl openssl-devel readline-devel  eigen3-devel tcl-devel tk-devel gtk3-devel xorg-x11-server-devel tbb-devel  libffi-devel graphviz curl-devel openssl-devel flex-devel eigen3-devel

yum install -y graphviz
yum install -y graphviz-devel

ln -s /usr/bin/cmake3 /usr/bin/cmake
scl enable devtoolset-11 bash


### Compile required Git version from source codes
wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.31.1.tar.gz
tar -zxvf git-2.31.1.tar.gz -C /usr/local/src/
cd /usr/local/src/git-2.31.1/
./configure --prefix=/usr/local/git --with-curl --with-openssl
make -j8 &&make install&& cd
export PATH=$PATH:/usr/local/git/bin
git --version
