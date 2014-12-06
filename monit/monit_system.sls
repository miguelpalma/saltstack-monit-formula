{% from "monit/map.jinja" import monit with context %}

include:
  - monit

monit_system:
  file.managed:
    - name: {{ monit.confd_dir }}/system
    - source: salt://monit/files/conf.d/system
    - template: jinja
