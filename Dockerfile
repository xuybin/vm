FROM centos:7

RUN yum install -y openssh openssh-server openssh-clients \
 && ssh-keygen -A \
 && ssh-keygen -t rsa -f /root/.ssh/id_rsa -P '' \
 && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
 && { \
		 echo 'Host *'; \
		 echo '  UserKnownHostsFile /dev/null'; \
		 echo '  StrictHostKeyChecking no'; \
		 echo '  LogLevel quiet'; \
	  } > /root/.ssh/config \
 && echo 'root:root' | chpasswd \
 && sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && echo -e '#!/bin/sh\n'\
'echo "root:${ROOT_PASSWORD}" | chpasswd\n'\
'exec /usr/sbin/sshd -D '\
'\n'\
>/usr/local/bin/entrypoint.sh \
 && chmod -v +x /usr/local/bin/entrypoint.sh
 

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]