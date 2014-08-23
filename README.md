ansible-utorrent-server
=======================

Install uTorrent Server.

By default, this will install to `/opt/utorrent-server/`.

[![Circle CI](https://circleci.com/gh/konomae/ansible-utorrent-server.png?style=badge)](https://circleci.com/gh/konomae/ansible-utorrent-server)


How To Install
--------------

```bash
$ ansible-galaxy install konomae.utserver
```


Role Variables
--------------

    utserver_apt_update: no
    utserver_download_url: http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-ubuntu-13-04/track/beta/
    utserver_download_dest: /opt/utserver.tar.gz
    utserver_install_dest: /opt
    utserver_link_src: /opt/utorrent-server-alpha-v3_3
    utserver_link_dest: /opt/utorrent-server


Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: konomae.utserver }

Tests
-----

```bash
$ docker build -t utserver .
$ docker run -d -p 8080:8080 utserver
$ curl --user admin: http://localhost:8080/gui/
```


License
-------

MIT
