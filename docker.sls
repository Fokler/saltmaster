docker:
  pkg.installed:
    - sources:
      - docker-ce: https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_18.$
      - containerd: https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/containerd.i$
      - docker-ce-cli: https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce$

  service.running:
    - name:
      - docker-ce

  cmd.run:
      - name: |
         sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname$
         sudo chmod +x /usr/local/bin/docker-compose
         sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
         sudo docker-compose --version
         sudo docker --version
         sudo sysctl -w vm.max_map_count=452144
         sudo docker pull sebp/elk



kopieer docker:
  file.managed:
    - name: /srv/salt/elk/docker-compose.yml
    - source: salt://docker/docker-compose.yml
    - makedirs: True

start elk:
  cmd.run:
    - name:
       sudo docker-compose up -d
    - cwd: /srv/salt/elk

# Docker wordt hier samen met docker-compose gestart, met een container waar elk in draait.



