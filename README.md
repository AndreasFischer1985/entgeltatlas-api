# Arbeitsagentur Entgeltaltas API 
Die Bundesagentur für Arbeit verfügt über eine Datenbank zu Entgelten für unterschiedliche Berufstätigkeiten in Deutschland. Obwohl sie vollständig staatlich ist und es sich dabei um einen sehr spannenden Basisdatensatz handelt, mit dem viele Analysen möglich wären, bietet die Bundesagentur für Arbeit dafür bis heute keine offizielle API an.

## Authentifizierung
Die Authentifizierung funktioniert per OAuth 2 Client Credentials mit JWTs.
Client Credentials sind, wie sich z.B: einem GET-request an https://web.arbeitsagentur.de/entgeltatlas/ entnehmen lässt, folgende:

**ClientID:** a59294b2-8825-47d6-a6c0-1486f02cedb4

**ClientSecret:** a3c97fc5-6644-4ec5-8234-66098fc71cc4

```bash
curl \
-H 'Host: rest.arbeitsagentur.de' \
-H 'Accept: */*' \
-H 'Content-Type: application/x-www-form-urlencoded; charset=utf-8' \
-H 'Accept-Language: de,en-US;q=0.7,en;q=0.3' \
-H 'User-Agent:  Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0' \
--data-binary "client_id=a59294b2-8825-47d6-a6c0-1486f02cedb4&client_secret=a3c97fc5-6644-4ec5-8234-66098fc71cc4&grant_type=client_credentials" \
--compressed 'https://rest.arbeitsagentur.de/oauth/gettoken_cc'
```

Der generierte Token muss bei folgenden GET-requests an rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/entgelte/[KldB-Schlüssel] im header als 'OAuthAccessToken' inkludiert werden. KldB meint in diesem Fall die Klassifikation der Berufe 2010. Beispielsweise repräsentiert der KldB-Schlüssel 84304 "Berufe in der Hochschullehre und -forschung - hoch komplexe Tätigkeiten" (wie man z.B. hier nachschlagen kann: https://www.klassifikationsserver.de/klassService/jsp/common/url.jsf?item=8430&variant=kldb2010&detail=true - verifizieren lässt sich die Bedeutung der KldB-Nummer auch über eine Anfrage mit Token an https://rest.arbeitsagentur.de/infosysbub/dkz-rest/pc/v1//kldb2010?codenr=B%2084304 ).


## Entgeltatlas

**URL:** rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/entgelte/[KldB-Schlüssel]


Der Entgeltatlas ermöglicht, das Entgelt für verschiedene Berufstätigkeiten mit verschiedenen GET-Parametern zu filtern:


### Filter


**Parameter:** *l* (Optional)
- 4

**Parameter:** *r* (Optional)
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
- 15
- 16
- 17
- 18
- 19
- 20
- 21
- 22
- 23
- 24
- 25
- 26
- 27
- 28
- 29
- 30

region: 1=Deutschland; 2=Ostdeutschland; 3=Westdeutschland; 11=BaWü; 12=Bayern; 14=Berlin; 15=Brandenburg; 7=Bremen; 5=Hamburg; 9=Hessen; 16=Mecklenburg-Vorpommern; 6=Niedersachsen; 8=Nordrhein-Westfalen; 10=Rheinland-Pfalz; 13=Saarland; 17=Sachsen; 18=Sachsen-Anhalt; 4=Schleswig-Holstein; 19=Thüringen;
22=Dortmund; 20=Dresden; 21=Düsseldorf; 23=Essen; 24=Frankfurt am Main; 26=Hannover; 27=Köln; 28=Leipzig; 29=München; 25=Nürnberg; 30=Stuttgart
(vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/regionen).


**Parameter:** *g* (Optional)
- 1
- 2
- 3

Geschlecht: 1=Gesamt, 2=Männer, 3=Frauen (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/geschlechter).


**Parameter:** *a* (Optional)
- 1
- 2
- 3
- 4

Alter: 1=Gesamt; 2=unter 25; 3=25 bis unter 55; 4=ab 55 (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/alter).


**Parameter:** *b* (Optional)
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11

Branche: 1=Gesamt; 2=Land- und Forstwirtschaft, Fischerei; 3=produzierendes Gewerbe ohne Bau; 4=Baugewerbe; 5=Handel, Verkehr, Lagerei und Gastgewerbe; 6=Information und Kommunikation; 7=Finanz- und Verischerungsgewerbe; 8=Grundstücks- und Wohnungswesen; 9=Erbringung wirtschaftl. Dienstleistungen; 10=Öffentliche Verwaltung, schul-, Gesundheits-, Sozialwesen; 11=sonstige Dienstleistungen (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/branchen).

### Beispiel:

```bash
wb=$(curl -m 60 -H "Host: rest.arbeitsagentur.de" \
-H "User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0" \
-H "Accept: application/json, text/plain, */*" \
-H "Accept-Language: de,en-US;q=0.7,en;q=0.3" \
-H "Accept-Encoding: gzip, deflate, br" \
-H "Origin: https://web.arbeitsagentur.de" \
-H "DNT: 1" \
-H "Connection: keep-alive" \
-H "Pragma: no-cache" \
-H "Cache-Control: no-cache" \
-H "OAuthAccessToken: $token" \
'rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/entgelte/84304?l=4&r=25&b=1')
```

## Weitere Endpunkte 

- https://rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/mediandaten
- https://rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/regionen
