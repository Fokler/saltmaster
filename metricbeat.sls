
metricbeat install:
  cmd.run:
    - name: curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.0.1-amd64.deb
   # - cwd:

  pkg.installed:
    - sources:
      - metricbeat: /tmp/metricbeat-7.0.1-amd64.deb

copy metricbeat.yml:
  file.managed:
    - name: /etc/metricbeat/metricbeat.yml
    - source: salt:///metricbeat-conf/metricbeat.yml

  cmd.run:
    - name: |
        sudo metricbeat modules enable docker
        sudo metricbeat modules enable mysql
        sudo metricbeat modules enable nginx
        sudo metricbeat setup
        sudo service metricbeat start





