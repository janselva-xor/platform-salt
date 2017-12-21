{% if grains['os'] == 'Ubuntu' %}
gobblin-systemctl_ubuntu_start:
  cmd.run:
    - name: /sbin/start gobblin
{% elif grains['os'] == 'RedHat' %}
gobblin-systemctl_redhat_start:
  cmd.run:
    - name: /bin/systemctl start gobblin
{%- endif %}

