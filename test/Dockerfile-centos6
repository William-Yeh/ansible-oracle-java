# Dockerfile for building image that contains software stack provisioned by Ansible.
#
# Version  1.1
#


# pull base image
FROM williamyeh/ansible:centos6-onbuild

MAINTAINER William Yeh <william.pjyeh@gmail.com>


#
# build phase
#

RUN echo "===> Installing the missing "tar" utility for Docker image..."  && \
    yum -y install tar

RUN echo "===> Patching defaults/main.yml to enable java_install_jce..."  && \
    sed -i -e 's/^java_install_jce:.*/java_install_jce: true/g' defaults/main.yml

ENV PLAYBOOK test.yml
RUN ansible-playbook-wrapper -vvv



#
# test phase
#

CMD ["java", "-version"]
