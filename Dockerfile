FROM ubuntu:14.04

RUN apt-get update

# Install Ansible
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:ansible/ansible && apt-get update
RUN apt-get install -y ansible
RUN apt-get install -y python-apt

# Tests
ADD . /root
WORKDIR /root
RUN ansible-playbook -i inventory tests.yml --syntax-check
RUN ansible-playbook -i inventory tests.yml --connection=local -v

EXPOSE 6881
EXPOSE 8080

VOLUME ["/data"]

ENTRYPOINT ["/opt/utorrent-server/utserver"]
CMD ["-settingspath", "/opt/utorrent-server/"]
