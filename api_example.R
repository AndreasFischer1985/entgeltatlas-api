install.packages(c("devtools","rjson","httr"))
devtools::install_github("AndreasFischer1985/qqBaseX")

#------------------------------------------------------------------
# Get clientID & clientSecret from hhttps://web.arbeitsagentur.de/entgeltatlas/
#------------------------------------------------------------------
# GET /entgeltatlas/ HTTP/1.1
# Host: web.arbeitsagentur.de
# User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0
# Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
# Accept-Language: de,en-US;q=0.7,en;q=0.3
# Accept-Encoding: gzip, deflate, br
# DNT: 1
# Connection: keep-alive
# Upgrade-Insecure-Requests: 1
# Sec-Fetch-Dest: document
# Sec-Fetch-Mode: navigate
# Sec-Fetch-Site: none
# Sec-Fetch-User: ?1
# Pragma: no-cache
# Cache-Control: no-cache
#------------------------------------------------------------------

getCredentials=function(
    url="https://web.arbeitsagentur.de/entgeltatlas/",
    verbose=T
    ){ 
    if(verbose) print("\nTrying to get credentials...\n")
    get_request=httr::GET(
        url=url,
        config=httr::config(connecttimeout=60)
        )
    x=as.character(httr::content(get_request)) 
    clientId=print(gsub("(.* '|',)","",qqBaseX::matchAll(x,"clientId: (.*?),")))
    clientSecret=print(gsub("(.* '|',)","",qqBaseX::matchAll(x,"clientSecret: (.*?),")))
    if(verbose){
        print(paste("URL: ", url))
        print(paste("Credentials unchanged?", clientId=="38053956-6618-4953-b670-b4ae7a2360b1" & clientSecret=="c385073c-3b97-42a9-b916-08fd8a5d1795"))
    }
    return(list(
        clientId=gsub("(.* '|',)","",qqBaseX::matchAll(x,"clientId: (.*?),")),
        clientSecret=gsub("(.* '|',)","",qqBaseX::matchAll(x,"clientSecret: (.*?),")),
        clientCookies=get_request$cookies$value,
        data=get_request
    ))
}


#------------------------------------------------------------------
# Get token from https://rest.arbeitsagentur.de/oauth/gettoken_cc
#------------------------------------------------------------------
# POST /oauth/gettoken_cc HTTP/1.1
# Host: rest.arbeitsagentur.de
# User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0
# Accept: application/json, text/plain, */*
# Accept-Language: de,en-US;q=0.7,en;q=0.3
# Accept-Encoding: gzip, deflate, br
# Content-Type: application/x-www-form-urlencoded
# Content-Length: 127
# Origin: https://web.arbeitsagentur.de
# DNT: 1
# Connection: keep-alive
# Pragma: no-cache
# Cache-Control: no-cache
#------------------------------------------------------------------

getToken=function(
    url="https://rest.arbeitsagentur.de/oauth/gettoken_cc",
    clientId="38053956-6618-4953-b670-b4ae7a2360b1",
    clientSecret="c385073c-3b97-42a9-b916-08fd8a5d1795",
    clientCookies=NULL,
    verbose=T
    ){
    if(verbose) print("\nTrying to get token...\n")
    postHeaders=c(
        "Host"="rest.arbeitsagentur.de",
        "User-Agent"="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0",
        "Accept"="application/json, text/plain, */*",
        "Accept-Language"="de,en-US;q=0.7,en;q=0.3",
        "Accept-Encoding"="gzip, deflate, br",
        "Content-Type"="application/x-www-form-urlencoded",
        "Content-Length"="127",
        "Origin"="https://web.arbeitsagentur.de",
        "DNT"="1",   
        "Connection"="keep-alive",
        "Pragma"="no-cache",
        "Cache-Control"="no-cache"
    )
    if(!is.null(clientCookies)) postHeaders=c(postHeaders,"Cookie"=clientCookies)
    postData=list( 
        "grant_type"="client_credentials",
        "client_id"=clientId,
        "client_secret"=clientSecret
    ) 
    token_request=httr::POST(
        url=url,
        body=postData,encode="form",
        httr::add_headers(.headers = c(postHeaders)),
        config=httr::config(connecttimeout=60) #config=httr::timeout(60)
    )
    token_body <- httr::content(token_request, as='parsed')
    if(verbose){
        print(paste("URL:", url))
        print(paste("Token:", token_body$access_token))
        print(paste("x-Correlation-Id:", token_request$headers$"x-correlationid"))
        print(paste("Cookies:", token_request$cookies$value))
    }
    return(list(
        access_token=token_body$access_token,
        correlationId=token_request$headers$"x-correlationid",
        clientCookies=token_request$cookies$value,
        data=token_request))
}


#------------------------------------------------------------------
# Get Data from rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/entgelte/84304?l=4&g=1&a=1&b=1
#------------------------------------------------------------------
# GET /infosysbub/entgeltatlas/pc/v1/entgelte/84304?l=4&g=1&a=1&b=1 HTTP/1.1
# Host: rest.arbeitsagentur.de
# User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0
# Accept: application/json, text/plain, */*
# Accept-Language: de,en-US;q=0.7,en;q=0.3
# Accept-Encoding: gzip, deflate, br
# OAuthAccessToken: eyJhbGciOiJIUzUxMiJ9...
# Correlation-ID: 3eCfCJvrcnjT
# Origin: https://web.arbeitsagentur.de
# DNT: 1
# Connection: keep-alive
# Sec-Fetch-Dest: empty
# Sec-Fetch-Mode: cors
# Sec-Fetch-Site: same-site
# Pragma: no-cache
# Cache-Control: no-cache
#------------------------------------------------------------------

getData=function(url="https://rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/entgelte/84304?l=4&g=1&a=1&b=1",      
        accessToken="eyJhbGciOiJIUzUxMiJ9.eyAic3ViIjogIlI0amhFWGdOWW1yL21Cd1lFTi9oR0N...",
        correlationId=NULL,
        clientCookies=NULL,
        verbose=T){
    if(verbose) print("\nTrying to get data...\n")
    getHeaders=c(
        "Host"="rest.arbeitsagentur.de",
        "User-Agent"="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0",
        "Accept"="application/json, text/plain, */*",
        "Accept-Language"="de,en-US;q=0.7,en;q=0.3",
        "Accept-Encoding"="gzip, deflate, br",        
        "Origin"="https://web.arbeitsagentur.de",
        "DNT"="1",
        "Connection"="keep-alive",
        "Pragma"="no-cache",
        "Cache-Control"="no-cache"
    )
    if(!is.null(accessToken)) getHeaders=c(getHeaders,"OAuthAccessToken"=accessToken)
    if(!is.null(correlationId)) getHeaders=c(getHeaders,"Correlation-ID"=correlationId)
    if(!is.null(clientCookies)) getHeaders=c(getHeaders,"Cookie"=clientCookies)
    data_request=httr::GET(
        url=url, 
        httr::add_headers(.headers=getHeaders),
        config=httr::config(connecttimeout=60)
    )
    if(verbose){
        print(paste("URL:", url))
        print(nchar(httr::content(data_request)))
        print(substr(httr::content(data_request),1,100))

    }
    return(
        data_request
    )
}


#------------------------------------------------------------------
# Demo: get one page
#------------------------------------------------------------------

dataList=list()
if(T){ 
    url=paste0("https://web.arbeitsagentur.de/entgeltatlas/")
    credentials=getCredentials(url)
    token=getToken(
        url="https://rest.arbeitsagentur.de/oauth/gettoken_cc",
        clientId=credentials[[1]],
        clientSecret=credentials[[2]])
    data=getData(
        url=paste0("https://rest.arbeitsagentur.de/infosysbub/entgeltatlas/pc/v1/entgelte/84304?l=4&g=1&a=1&b=1"),        
        accessToken=token[[1]])
    dataList[["page 0"]]=data

    writeLines(decodedData,paste0(Sys.Date(),"_eaData_",0,".txt"))
    save.image(paste0(Sys.Date(),"_ea_successfulRequest.RData"))
}


