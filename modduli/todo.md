# Miten saada Django toimimaan

Näiden ohjeiden avulla modduli-moduulin tavoitteena ollut Djangon asennus saatetaan manuaalisesti päätökseen (toivottavasti). Ohjeet pohjautuvat Tero Karvisen artikkeliin aiheesta (ks. https://terokarvinen.com/2022/deploy-django/), jota kannattaa käyttää tarvittaessa apuna. Oletushakemistona (~) on /home/weppimasteri. Koodien perässä olevat kommentit on merkitty #-merkillä. Ohjeet ovat hyvin suoraviivaiset ilman suurempaa testailua vaiheiden onnistumisesta, joten oman mielen mukaan voi käyttää esim. `curl`-komentoa testailuun.

~$ source env/bin/activate		# Aktivoidaan env-virtuaaliympäristö
~$ pip install -r requirements.txt		# Asennetaan Django
~$ django-admin --version		# Varmistetaan Django-asennuksen onnistuminen
~$ cd public_html/perusta/		# Siirrytään Djangoprojektin aloituspaikkaan
~/public_html/perusta/$ django-admin startproject modduli	# Luo hakemistot Djangoprojektille
~/public_html/perusta/$ mv /home/weppimasteri/public_html/perusta/static/ /home/weppimasteri/public_html/perusta/modduli/	# Siirretään staattinen-sivu oikeaan paikkaan tulevaa varten
~/public_html/perusta/$ deactivate		# Poistutaan väliaikaisesti env-ympäristöstä
~/public_html/perusta/$ sudo apt-get -y install libapache2-mod-wsgi-py3		# Asennetaan WSGI-lisäosa
~/public_html/perusta/$ sudo a2dissite perusta2.conf		# Otetaan väliaikaisen nettisivun konfiguraatio alas
~/public_html/perusta/$ sudo a2ensite perusta.conf			# Laitetaan oikean nettisivun konfiguraatio päälle
~/public_html/perusta/$ sudo systemctl restart apache2		# Käynnistetään Apache uudelleen
~/public_html/perusta/$ mv /home/weppimasteri/settings.py /home/weppimasteri/public_html/perusta/modduli/modduli	# Korvataan WSGI:n asetustiedosto oikealla
~/public_html/perusta/$ touch wsgi.py
~/public_html/perusta/$ sudo systemctl restart apache2		# Apachen uudelleenkäynnistys asetusten ottamiseksi käyttöön
~/public_html/perusta/$ cd modduli		# Siirrytään seuraavaan kansioon
~/public_html/perusta/modduli/$ source /home/weppimasteri/env/bin/activate		# Otetaan env-ympäristö jälleen käyttöön
~/public_html/perusta/modduli/$ ./manage.py collectstatic	# Tyyliasetusten käyttöönotto
~/public_html/perusta/modduli/$ deactivate		$ Poistuminen env-ympäristöstä

Tämän myötä asennus pitäisi tulla päätökseen. Sivujen toimimista voi kokeilla curlilla esim. `curl -s localhost|grep title` ("Not Found" tulos oikea) tai `curl localhost/static/` ("Staattinen"). Nettiselaimella http://localhost/admin pitäisi myös toimia.
