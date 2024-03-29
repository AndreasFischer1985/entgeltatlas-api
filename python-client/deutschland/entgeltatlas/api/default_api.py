"""
    Arbeitsagentur Entgeltatlas API

    Eine Datenbank zu Entgelten für Berufstätigkeiten in Deutschland durchsuchen.   Die Authentifizierung funktioniert per OAuth 2 Client Credentials mit JWTs. Folgende Client-Credentials können dafür verwendet werden:  **ClientID:** c4f0d292-9d0f-4763-87dd-d3f9e78fb006  **ClientSecret:** 566c4dd6-942f-4cda-aad6-8d611c577107   **Achtung**: Der generierte Token muss bei folgenden GET-requests an rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/entgelte/[KldB-Schlüssel] im header als 'OAuthAccessToken' inkludiert werden. KldB meint in diesem Fall die Klassifikation der Berufe 2010 (vgl. rest.arbeitsagentur.de/infosysbub/dkz-rest/pc/v1/kldb2010). Akzeptiert werden KldB-Schlüssel mit 3 bis 5 Ziffern. Beispielsweise repräsentiert der KldB-Schlüssel 84304 \"Berufe in der Hochschullehre und -forschung - hoch komplexe Tätigkeiten\"    # noqa: E501

    The version of the OpenAPI document: 1.0.0
    Contact: andreasfischer1985@web.de
    Generated by: https://openapi-generator.tech
"""


import re  # noqa: F401
import sys  # noqa: F401

from deutschland.entgeltatlas.api_client import ApiClient
from deutschland.entgeltatlas.api_client import Endpoint as _Endpoint
from deutschland.entgeltatlas.model.response import Response
from deutschland.entgeltatlas.model_utils import (  # noqa: F401
    check_allowed_values,
    check_validations,
    date,
    datetime,
    file_type,
    none_type,
    validate_and_convert_types,
)


class DefaultApi(object):
    """NOTE: This class is auto generated by OpenAPI Generator
    Ref: https://openapi-generator.tech

    Do not edit the class manually.
    """

    def __init__(self, api_client=None):
        if api_client is None:
            api_client = ApiClient()
        self.api_client = api_client
        self.entgeltatlas_endpoint = _Endpoint(
            settings={
                "response_type": (Response,),
                "auth": ["clientCredAuth"],
                "endpoint_path": "/pc/v1/entgelte/[KldB-Schlüssel]",
                "operation_id": "entgeltatlas",
                "http_method": "GET",
                "servers": None,
            },
            params_map={
                "all": [
                    "l",
                    "r",
                    "g",
                    "a",
                    "b",
                ],
                "required": [],
                "nullable": [],
                "enum": [],
                "validation": [],
            },
            root_map={
                "validations": {},
                "allowed_values": {},
                "openapi_types": {
                    "l": (int,),
                    "r": (int,),
                    "g": (int,),
                    "a": (int,),
                    "b": (int,),
                },
                "attribute_map": {
                    "l": "l",
                    "r": "r",
                    "g": "g",
                    "a": "a",
                    "b": "b",
                },
                "location_map": {
                    "l": "query",
                    "r": "query",
                    "g": "query",
                    "a": "query",
                    "b": "query",
                },
                "collection_format_map": {},
            },
            headers_map={
                "accept": ["application/json"],
                "content_type": [],
            },
            api_client=api_client,
        )

    def entgeltatlas(self, **kwargs):
        """Entgeltatlas  # noqa: E501

        Der Entgeltatlas ermöglicht, Entgelte für unterschiedliche Berufstätigkeiten in Deutschland anhand von KldB-Nummern mit verschiedenen GET-Parametern zu filtern.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True

        >>> thread = api.entgeltatlas(async_req=True)
        >>> result = thread.get()


        Keyword Args:
            l (int): Performance-level - 1=Helfer; 2=Fachkraft; 3=Spezialist 4=Experte.. [optional]
            r (int): Region - 1=Deutschland; 2=Ostdeutschland; 3=Westdeutschland; 11=BaWü; 12=Bayern; 14=Berlin; 15=Brandenburg; 7=Bremen; 5=Hamburg; 9=Hessen; 16=Mecklenburg-Vorpommern; 6=Niedersachsen; 8=Nordrhein-Westfalen; 10=Rheinland-Pfalz; 13=Saarland; 17=Sachsen; 18=Sachsen-Anhalt; 4=Schleswig-Holstein; 19=Thüringen; 22=Dortmund; 20=Dresden; 21=Düsseldorf; 23=Essen; 24=Frankfurt am Main; 26=Hannover; 27=Köln; 28=Leipzig; 29=München; 25=Nürnberg; 30=Stuttgart (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/regionen).. [optional]
            g (int): Geschlecht - 1=Gesamt, 2=Männer, 3=Frauen (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/geschlechter).. [optional]
            a (int): Alter - 1=Gesamt; 2=unter 25; 3=25 bis unter 55; 4=ab 55 (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/alter).. [optional]
            b (int): Branche - 1=Gesamt; 2=Land- und Forstwirtschaft, Fischerei; 3=produzierendes Gewerbe ohne Bau; 4=Baugewerbe; 5=Handel, Verkehr, Lagerei und Gastgewerbe; 6=Information und Kommunikation; 7=Finanz- und Verischerungsgewerbe; 8=Grundstücks- und Wohnungswesen; 9=Erbringung wirtschaftl. Dienstleistungen; 10=Öffentliche Verwaltung, schul-, Gesundheits-, Sozialwesen; 11=sonstige Dienstleistungen (vgl. rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/branchen).. [optional]
            _return_http_data_only (bool): response data without head status
                code and headers. Default is True.
            _preload_content (bool): if False, the urllib3.HTTPResponse object
                will be returned without reading/decoding response data.
                Default is True.
            _request_timeout (int/float/tuple): timeout setting for this request. If
                one number provided, it will be total request timeout. It can also
                be a pair (tuple) of (connection, read) timeouts.
                Default is None.
            _check_input_type (bool): specifies if type checking
                should be done one the data sent to the server.
                Default is True.
            _check_return_type (bool): specifies if type checking
                should be done one the data received from the server.
                Default is True.
            _spec_property_naming (bool): True if the variable names in the input data
                are serialized names, as specified in the OpenAPI document.
                False if the variable names in the input data
                are pythonic names, e.g. snake case (default)
            _content_type (str/None): force body content-type.
                Default is None and content-type will be predicted by allowed
                content-types and body.
            _host_index (int/None): specifies the index of the server
                that we want to use.
                Default is read from the configuration.
            _request_auths (list): set to override the auth_settings for an a single
                request; this effectively ignores the authentication
                in the spec for a single request.
                Default is None
            async_req (bool): execute request asynchronously

        Returns:
            Response
                If the method is called asynchronously, returns the request
                thread.
        """
        kwargs["async_req"] = kwargs.get("async_req", False)
        kwargs["_return_http_data_only"] = kwargs.get("_return_http_data_only", True)
        kwargs["_preload_content"] = kwargs.get("_preload_content", True)
        kwargs["_request_timeout"] = kwargs.get("_request_timeout", None)
        kwargs["_check_input_type"] = kwargs.get("_check_input_type", True)
        kwargs["_check_return_type"] = kwargs.get("_check_return_type", True)
        kwargs["_spec_property_naming"] = kwargs.get("_spec_property_naming", False)
        kwargs["_content_type"] = kwargs.get("_content_type")
        kwargs["_host_index"] = kwargs.get("_host_index")
        kwargs["_request_auths"] = kwargs.get("_request_auths", None)
        return self.entgeltatlas_endpoint.call_with_http_info(**kwargs)
