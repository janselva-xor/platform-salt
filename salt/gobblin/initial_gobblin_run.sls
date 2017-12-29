{% if grains['os'] == 'Ubuntu' %}
gobblin-systemctl_ubuntu_start:
  cmd.run:
    - name: /sbin/start gobblin
{%- endif %}

