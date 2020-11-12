import re

with open('BestBooksEver.html') as f:
    vsebina = f.read()

vzorec = 'Messages'

for zadetek in re.findall(vzorec, vsebina):
    print(zadetek)