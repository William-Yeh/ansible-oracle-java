# Dockerfile for building image that contains software stack provisioned by Ansible.
#
# Version  1.1
#


# pull base image
FROM williamyeh/ansible:ubuntu14.04-onbuild

MAINTAINER William Yeh <william.pjyeh@gmail.com>


#
# build phase
#

RUN echo "===> Patching defaults/main.yml to enable java_install_jce..."  && \
    sed -i -e 's/^java_install_jce:.*/java_install_jce: true/g' defaults/main.yml

ENV PLAYBOOK test.yml
RUN ansible-playbook-wrapper



#
# test phase
#

CMD ["java", "-version"]
