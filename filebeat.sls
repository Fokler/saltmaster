fb install:
  cmd.run:
    - name: |
       #sudo docker pull docker.elastic.co/beats/filebeat:7.1.1
       sudo curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.0.1-amd64.deb
       sudo dpkg -i filebeat-7.0.1-amd64.deb

fb run:
  file.managed:
    - name: /etc/beats/filebeat.yml
    - source: salt://docker/filebeat.yml
    - makedirs: True

  cmd.run:
    - name: |
       sudo filebeat modules enable logstash
       sudo filebeat setup
       sudo service filebeat start





