elasticsearch:
    pkg:
	- installed
	- pkgs:
	    - elasticsearch
    
    file.managed:
	- name: /etc/elasticsearch/elasticsearch.yml
	- source: salt://elasticonf/elasticsearch.yml
    
    service.running:
	- name: elasticsearch
	- enable: True
