# entgeltatlas.DefaultApi

All URIs are relative to *https://rest.arbeitsagentur.de/infosysbub/entgeltatlas*

Method | HTTP request | Description
------------- | ------------- | -------------
[**entgeltatlas**](DefaultApi.md#entgeltatlas) | **GET** /pc/v1/entgelte/[KldB-Schlüssel] | Entgeltatlas


# **entgeltatlas**
> Response entgeltatlas()

Entgeltatlas

Der Entgeltatlas ermöglicht, Entgelte für unterschiedliche Berufstätigkeiten in Deutschland anhand von KldB-Nummern mit verschiedenen GET-Parametern zu filtern.

### Example

* OAuth Authentication (clientCredAuth):

```python
import time
from deutschland import entgeltatlas
from deutschland.entgeltatlas.api import default_api
from deutschland.entgeltatlas.model.response import Response
from pprint import pprint
# Defining the host is optional and defaults to https://rest.arbeitsagentur.de/infosysbub/entgeltatlas
# See configuration.py for a list of all supported configuration parameters.
configuration = entgeltatlas.Configuration(
    host = "https://rest.arbeitsagentur.de/infosysbub/entgeltatlas"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure OAuth2 access token for authorization: clientCredAuth
configuration = entgeltatlas.Configuration(
    host = "https://rest.arbeitsagentur.de/infosysbub/entgeltatlas"
)
configuration.access_token = 'YOUR_ACCESS_TOKEN'

# Enter a context with an instance of the API client
with entgeltatlas.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = default_api.DefaultApi(api_client)
    l = 4 # int | Performance-level - 1=Helfer; 2=Fachkraft; 3=Spezialist 4=Experte. (optional)
    r = 1 # int | Region - 1=Deutschland; 2=Ostdeutschland; 3=Westdeutschland; 11=BaWü; 12=Bayern; 14=Berlin; 15=Brandenburg; 7=Bremen; 5=Hamburg; 9=Hessen; 16=Mecklenburg-Vorpommern; 6=Niedersachsen; 8=Nordrhein-Westfalen; 10=Rheinland-Pfalz; 13=Saarland; 17=Sachsen; 18=Sachsen-Anhalt; 4=Schleswig-Holstein; 19=Thüringen; 22=Dortmund; 20=Dresden; 21=Düsseldorf; 23=Essen; 24=Frankfurt am Main; 26=Hannover; 27=Köln; 28=Leipzig; 29=München; 25=Nürnberg; 30=Stuttgart (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/regionen). (optional)
    g = 1 # int | Geschlecht - 1=Gesamt, 2=Männer, 3=Frauen (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/geschlechter). (optional)
    a = 1 # int | Alter - 1=Gesamt; 2=unter 25; 3=25 bis unter 55; 4=ab 55 (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/alter). (optional)
    b = 1 # int | Branche - 1=Gesamt; 2=Land- und Forstwirtschaft, Fischerei; 3=produzierendes Gewerbe ohne Bau; 4=Baugewerbe; 5=Handel, Verkehr, Lagerei und Gastgewerbe; 6=Information und Kommunikation; 7=Finanz- und Verischerungsgewerbe; 8=Grundstücks- und Wohnungswesen; 9=Erbringung wirtschaftl. Dienstleistungen; 10=Öffentliche Verwaltung, schul-, Gesundheits-, Sozialwesen; 11=sonstige Dienstleistungen (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/branchen). (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Entgeltatlas
        api_response = api_instance.entgeltatlas(l=l, r=r, g=g, a=a, b=b)
        pprint(api_response)
    except entgeltatlas.ApiException as e:
        print("Exception when calling DefaultApi->entgeltatlas: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **l** | **int**| Performance-level - 1&#x3D;Helfer; 2&#x3D;Fachkraft; 3&#x3D;Spezialist 4&#x3D;Experte. | [optional]
 **r** | **int**| Region - 1&#x3D;Deutschland; 2&#x3D;Ostdeutschland; 3&#x3D;Westdeutschland; 11&#x3D;BaWü; 12&#x3D;Bayern; 14&#x3D;Berlin; 15&#x3D;Brandenburg; 7&#x3D;Bremen; 5&#x3D;Hamburg; 9&#x3D;Hessen; 16&#x3D;Mecklenburg-Vorpommern; 6&#x3D;Niedersachsen; 8&#x3D;Nordrhein-Westfalen; 10&#x3D;Rheinland-Pfalz; 13&#x3D;Saarland; 17&#x3D;Sachsen; 18&#x3D;Sachsen-Anhalt; 4&#x3D;Schleswig-Holstein; 19&#x3D;Thüringen; 22&#x3D;Dortmund; 20&#x3D;Dresden; 21&#x3D;Düsseldorf; 23&#x3D;Essen; 24&#x3D;Frankfurt am Main; 26&#x3D;Hannover; 27&#x3D;Köln; 28&#x3D;Leipzig; 29&#x3D;München; 25&#x3D;Nürnberg; 30&#x3D;Stuttgart (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/regionen). | [optional]
 **g** | **int**| Geschlecht - 1&#x3D;Gesamt, 2&#x3D;Männer, 3&#x3D;Frauen (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/geschlechter). | [optional]
 **a** | **int**| Alter - 1&#x3D;Gesamt; 2&#x3D;unter 25; 3&#x3D;25 bis unter 55; 4&#x3D;ab 55 (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/alter). | [optional]
 **b** | **int**| Branche - 1&#x3D;Gesamt; 2&#x3D;Land- und Forstwirtschaft, Fischerei; 3&#x3D;produzierendes Gewerbe ohne Bau; 4&#x3D;Baugewerbe; 5&#x3D;Handel, Verkehr, Lagerei und Gastgewerbe; 6&#x3D;Information und Kommunikation; 7&#x3D;Finanz- und Verischerungsgewerbe; 8&#x3D;Grundstücks- und Wohnungswesen; 9&#x3D;Erbringung wirtschaftl. Dienstleistungen; 10&#x3D;Öffentliche Verwaltung, schul-, Gesundheits-, Sozialwesen; 11&#x3D;sonstige Dienstleistungen (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/branchen). | [optional]

### Return type

[**Response**](Response.md)

### Authorization

[clientCredAuth](../README.md#clientCredAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

