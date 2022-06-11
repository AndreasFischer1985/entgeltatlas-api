#----------------
# Simple Example
#----------------
install.packages(c("devtools","rjson","httr"))
devtools::install_github("AndreasFischer1985/qqBaseX")
clientId="a59294b2-8825-47d6-a6c0-1486f02cedb4"
clientSecret="a3c97fc5-6644-4ec5-8234-66098fc71cc4"
postData=list( "grant_type"="client_credentials","client_id"=clientId,"client_secret"=clientSecret) 
token_request=httr::POST(
        url="https://rest.arbeitsagentur.de/oauth/gettoken_cc",
        body=postData,encode="form",
        config=httr::config(connecttimeout=60))
token=httr::content(token_request, as='parsed')$access_token
url="https://rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/entgelte/84304?l=4&g=1&a=1&b=1"
data_request=httr::GET(url=url, httr::add_headers(.headers=c("OAuthAccessToken"=token)),
        config=httr::config(connecttimeout=60))
data_request
data=rawToChar(httr::content(data_request))

