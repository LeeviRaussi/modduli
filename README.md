# modduli

## Tarkoitus

"modduli" on Salt-ohjelman moduli, joka asentaa koneelle ufw-palomuurin sopivine asetuksineen, sekä luo pohjan Apachea hyödyntävälle verkkosivulle, johon on tarkoitus asentaa Django.

![105 what it does](https://github.com/user-attachments/assets/79c584f8-b6a6-4f81-97d4-8f682e5c259d)

## Tekijätiedot

Tekijä: Leevi Raussi

## Asennus ja käyttöönotto

Modulin käyttö olettaa, että koneelle on asennettu Salt-master. Asennus onnistuu joko hyödyntämällä osoitetta https://github.com/LeeviRaussi/modduli.git tai manuaalisesti lataamalla sivulta ZIP-paketin. Pakettikokonaisuuden sisältä löytyvä modduli-kansio tulee liittää sisältöineen Saltin modulien hakemistoon (hakemisto `/srv/salt/` Linux Debian 12 Bookwormillä, joko toiminut kehityskäyttöjärjestelmänä), minkä jälkeen modulin ajaminen onnistuu normaalilla salt-komennolla `sudo salt '*' state.apply modduli`. Asennuksen yhteydessä luotavan käyttäjän "weppimasteri" salasana on "V41hd4S4l4s4n4".

## Lisenssi

GNU General Public License v3.0 (https://github.com/LeeviRaussi/modduli/blob/main/LICENSE).
