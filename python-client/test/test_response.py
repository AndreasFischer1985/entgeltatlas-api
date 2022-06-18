"""
    Arbeitsagentur Entgeltatlas API

    Eine Datenbank zu Entgelten für Berufstätigkeiten in Deutschland durchsuchen.   Die Authentifizierung funktioniert per OAuth 2 Client Credentials mit JWTs. Folgende Client-Credentials können dafür verwendet werden:  **ClientID:** a59294b2-8825-47d6-a6c0-1486f02cedb4  **ClientSecret:** a3c97fc5-6644-4ec5-8234-66098fc71cc4   **Achtung**: Der generierte Token muss bei folgenden GET-requests an rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/entgelte/[KldB-Schlüssel] im header als 'OAuthAccessToken' inkludiert werden. KldB meint in diesem Fall die Klassifikation der Berufe 2010 (vgl. rest.arbeitsagentur.de/infosysbub/dkz-rest/pc/v1/kldb2010). Beispielsweise repräsentiert der KldB-Schlüssel 84304 \"Berufe in der Hochschullehre und -forschung - hoch komplexe Tätigkeiten\"    # noqa: E501

    The version of the OpenAPI document: 1.0.0
    Contact: andreasfischer1985@web.de
    Generated by: https://openapi-generator.tech
"""


import sys
import unittest

from deutschland.entgeltatlas.model.response_inner import ResponseInner

from deutschland import entgeltatlas

globals()["ResponseInner"] = ResponseInner
from deutschland.entgeltatlas.model.response import Response


class TestResponse(unittest.TestCase):
    """Response unit test stubs"""

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def testResponse(self):
        """Test Response"""
        # FIXME: construct object with mandatory attributes with example values
        # model = Response()  # noqa: E501
        pass


if __name__ == "__main__":
    unittest.main()
