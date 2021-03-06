ansible-utorrent-server
=======================

Install uTorrent Server.

By default, this will install to `/opt/utorrent-server/`.

[![CircleCI](https://circleci.com/gh/konomae/ansible-utorrent-server.svg?style=svg)](https://circleci.com/gh/konomae/ansible-utorrent-server)


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
    
    # ignore if empty string
    utserver_webui_url: ""


Example Playbook
----------------

Install from remote files:

    - hosts: servers
      roles:
         - { role: konomae.utserver }


Or, install from local files:

    - hosts: servers
      roles:
        - role: konomae.utserver
          utserver_download_url: "utserver.tar.gz"
          utserver_webui_url: "webui.zip"


Tests
-----

```bash
$ docker build -t utserver .
$ docker run -d -p 8080:8080 utserver
$ curl --user admin: http://localhost:8080/gui/
```

Version History
---------------

### v1.0.3

* Update test script


### v1.0.2

* Allow to copy utserver.tar.zip from local machine
* Allow to copy webui.zip from local machine


### v1.0.1

* Allow to change webui
* ansible>=1.6


### v1.0.0

* First release


License
-------

MIT
