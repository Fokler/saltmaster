wordpress contained:
  file.managed:
    - name: /srv/salt/wordpress/docker-compose.yml
    - source: salt://wordpress/docker-compose.yml
    - makedirs: True

wordpress compose:
  cmd.run:
    - name: sudo docker-compose up -d
    - cwd: /srv/salt/wordpress

# er worden een wordpress en mysql installatie gedaan met docker compose







