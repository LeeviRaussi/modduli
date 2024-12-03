ufw:
  pkg.installed
/etc/ufw/user.rules:
  file.managed:
    - source: salt://modduli/user.rules
/etc/ufw/user6.rules:
  file.managed:
    - source: salt://modduli/user6.rules
/etc/ufw/ufw.conf:
  file.managed:
    - source: salt://modduli/ufw.conf
ufw.service:
  service.running:
    - enable: True
    - watch:
      - file: /etc/ufw/ufw.conf
      - file: /etc/ufw/user.rules
      - file: /etc/ufw/user6.rules
ufw enable:
  cmd.run:
    - unless: "ufw status | grep 'Status: active'"
curl:
  pkg.installed
micro:
  pkg.installed
apache2:
  pkg.installed
apache2.service:
  service.running:
    - watch:
      - file: /etc/apache2/*
/var/www/html/index.html:
  file.managed:
    - contents: Oletussivu
weppimasteri:
  user.present:
    - fullname: Weppimasteri
    - groups:
      - users
      - sudo
    - password: $y$j9T$HkJuB8aDPPY9b1qZAbeiO/$iHwi1gdjkAVe1t07ma0J/HsYAut6YFJkqK3WhdkQUa/
/etc/apache2/sites-available/perusta2.conf:
  file.managed:
    - source: salt://modduli/perusta2.conf
/home/weppimasteri/public_html/perusta/static/index.html:
  file.managed:
    - source: salt://modduli/index.html
    - user: weppimasteri
    - group: weppimasteri
    - mode: 755
    - makedirs: True
a2dissite 000-default.conf:
  cmd.run:
    - unless: test -L /etc/apache2/sites-enabled/perusta2.conf
a2ensite perusta2.conf:
  cmd.run:
    - unless: test -L /etc/apache2/sites-enabled/perusta2.conf
virtualenv:
  pkg.installed
virtualenv -p python3 --system-site-packages /home/weppimasteri/env:
  cmd.run:
    - creates: /home/weppimasteri/env/
/home/weppimasteri/requirements.txt:
  file.managed:
    - source: salt://modduli/requirements.txt
    - user: weppimasteri
    - group: weppimasteri
/etc/apache2/sites-available/perusta.conf:
  file.managed:
    - source: salt://modduli/perusta.conf
/home/weppimasteri/todo.md:
  file.managed:
    - source: salt://modduli/todo.md
/home/weppimasteri/settings.py:
  file.managed:
    - source: salt://modduli/settings.py
