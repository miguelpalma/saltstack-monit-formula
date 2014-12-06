{% from "monit/map.jinja" import monit with context %}

include:
  - monit

monit_openssh:
  file.managed:
    - name: {{ monit.confd_dir }}/openssh
    - source: salt://monit/files/conf.d/openssh
    - template: jinja
    - context:
      path_pid: {{ monit.openssh.path.pid }}
      cmd_start: {{ monit.openssh.cmd.start }}
      cmd_stop: {{ monit.openssh.cmd.stop }}
      port: {{ salt['pillar.get']('sshd_config:Port') }}
      path_sshd: {{ monit.openssh.path.sshd }}
      path_sftpserver: {{ monit.openssh.path.sftpserver }}
      path_sshd_config: {{ monit.openssh.path.sshd_config }}
