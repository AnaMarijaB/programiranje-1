import csv
import os
import requests
import re

###############################################################################
# Najprej definirajmo nekaj pomožnih orodij za pridobivanje podatkov s spleta.
###############################################################################

# definiratje URL glavne strani bolhe za oglase z mačkami
cats_frontpage_url = 'http://www.bolha.com/zivali/male-zivali/macke/'

# mapa, v katero bomo shranili podatke
cat_directory = 'macke-podatki'

# ime datoteke v katero bomo shranili glavno stran
frontpage_filename = 'bolha-frontpage.html'

# ime CSV datoteke v katero bomo shranili podatke
csv_filename = 'macke-podatki.csv'

def download_url_to_string(url):
    """Funkcija kot argument sprejme niz in puskuša vrniti vsebino te spletne
    strani kot niz. V primeru, da med izvajanje pride do napake vrne None.
    """
    try:
        # del kode, ki morda sproži napako
        r = requests.get(url)
        page_content = r.text
    except ConnectionError:
        # koda, ki se izvede pri napaki
        # dovolj je če izpišemo opozorilo in prekinemo izvajanje funkcije
        print('Neuspesen dostop do {}.'.format(url))
        return None
    # nadaljujemo s kodo če ni prišlo do napake
    return page_content

#content = download_url_to_string(cats_frontpage_url)

def save_string_to_file(text, directory, filename):
    """Funkcija zapiše vrednost parametra "text" v novo ustvarjeno datoteko
    locirano v "directory"/"filename", ali povozi obstoječo. V primeru, da je
    niz "directory" prazen datoteko ustvari v trenutni mapi.
    """
    os.makedirs(directory, exist_ok=True)
    path = os.path.join(directory, filename)
    #path je sedaj polno ime datoteke
    with open(path, 'w', encoding='utf-8') as file_out:
        file_out.write(text)
    return None

#save_string_to_file(content, cat_directory, frontpage_filename)

# Definirajte funkcijo, ki prenese glavno stran in jo shrani v datoteko.
def save_frontpage(url, directory, filename):
    """Funkcija shrani vsebino spletne strani na naslovu "url" v datoteko
    "directory"/"filename"."""
    content = download_url_to_string(url)
    save_string_to_file(content, directory, filename)

content = save_frontpage(cats_frontpage_url, cat_directory, frontpage_filename)

###############################################################################
# Po pridobitvi podatkov jih želimo obdelati.
###############################################################################

def read_file_to_string(directory, filename):
    """Funkcija vrne celotno vsebino datoteke "directory"/"filename" kot niz"""
    path = os.path.join(directory, filename)
    #path je sedaj polno ime datoteke
    with open(path, 'r', encoding='utf-8') as file_in:
        content = file_in.read()
    return content

page_text = read_file_to_string(cat_directory,frontpage_filename)

# Definirajte funkcijo, ki sprejme niz, ki predstavlja vsebino spletne strani,
# in ga razdeli na dele, kjer vsak del predstavlja en oglas. To storite s
# pomočjo regularnih izrazov, ki označujejo začetek in konec posameznega
# oglasa. Funkcija naj vrne seznam nizov.
def page_to_ads(page_content):
    """Funkcija poišče posamezne ogllase, ki se nahajajo v spletni strani in
    vrne njih seznam"""
    pattern = re.compile(r'<article.*?>(.*?)</article>', re.DOTALL)

    oglasi = [m.group(1).strip() for m in re.finditer(pattern, page_content)]
    return oglasi

vsi_oglasi = page_to_ads(page_text)

# Definirajte funkcijo, ki sprejme niz, ki predstavlja oglas, in izlušči
# podatke o imenu, ceni in opisu v oglasu.
def get_dict_from_ad_block(block):
    """Funkcija iz niza za posamezen oglasni blok izlušči podatke o imenu, ceni
    in opisu ter vrne slovar, ki vsebuje ustrezne podatke
    """
    pattern = re.compile(r'<h3.*>(?P<ime>.*)</a></h3>'
                        r'.*?Objavljen:.*?pubdate">(?P<datum>.*?)</time>', re.DOTALL)

    match = re.search(pattern, block)

    return match.group(0)

test_vzorca = get_dict_from_ad_block(vsi_oglasi[0])




