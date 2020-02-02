FROM centos:8

# setup EPEL, Update yum with security updates and make cache fast
RUN yum -y install epel-release
RUN yum -y update
RUN yum makecache
RUN yum clean all

# Install base OS packages
RUN yum install -y \
  bash openssh openssh-server gcc gcc-c++ glibc.i686 \
  wget curl sudo sysstat htop iotop which \
  git-core make autoconf automake bison collectd \
  telnet bind-utils lsof
RUN yum clean all 
RUN rm -rf /var/cache/yum 

# generate ssh keys.
RUN /usr/bin/ssh-keygen -A

# Set the shell to login shell
SHELL ["/bin/bash", "-l", "-c"]