#AT&T Proprietary Information

install.packages("twitteR")
library(twitteR)
library(dplyr)
library(httr)

oauth_endpoints("twitter")
api_key <- "gMab3P6sAmf12ruzge6Knb9e5"
api_secret <- "RFEOo1ZarVihgOScPQsNbQiqiaiMDwr2XvDiBbthG22G77lp67"
access_token <- "148033026-ZIINalzvEpV1KqFpk9DpgbDQTvOTHa2shEsD9X4p"
access_token_secret <- "M04hostemjpIiMAo9gkKKhf1f38w62pT27P85N6eJmZaF"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

# Extracting tweets for AT&T U-verse - Dallas area
tweets_geolocated3_dallas <- searchTwitter('@Uverse', n=500, lang="en", geocode ='32.7667961121,-96.7836151123,50mi')
Uverse_dallas <- twListToDF(tweets_geolocated3_dallas)
write.csv(Uverse_dallas,file = "C:/Users/Owner/Documents/AT&T/Uverse_Dallas.csv")
# Getting user geolocation
Uverse_userInfo <- lookupUsers(Uverse_dallas$screenName) 
Uverse_userFrame <- twListToDF(Uverse_userInfo)
Uverse_locatedUsers <- !is.na(Uverse_userFrame$location)
Uverse_locations <- geocode(Uverse_userFrame$location[Uverse_locatedUsers])

# Extracting tweets for AT&T DIRECTV - Dallas area
tweets_geolocated4_dallas <- searchTwitter('@DIRECTV', n=500, lang="en", geocode ='32.7667961121,-96.7836151123,50mi')
DIRECTV_dallas <- twListToDF(tweets_geolocated4_dallas)
write.csv(DIRECTV_dallas,file = "C:/Users/Owner/Documents/AT&T/DIRECTV_Dallas.csv")
# Getting user geolocation
DIRECTV_userInfo <- lookupUsers(DIRECTV_dallas$screenName) 
DIRECTV_userFrame <- twListToDF(DIRECTV_userInfo)
DIRECTV_locatedUsers <- !is.na(DIRECTV_userFrame$location)
DIRECTV_locations <- geocode(DIRECTV_userFrame$location[DIRECTV_locatedUsers])

# Extracting tweets for AT&T - Dallas area
tweets_geolocated5_dallas <- searchTwitter('@ATT', n=1000, lang="en", geocode ='32.7667961121,-96.7836151123,50mi')
ATT_dallas <- twListToDF(tweets_geolocated5_dallas)
write.csv(ATT_dallas,file = "C:/Users/Owner/Documents/AT&T/ATT_Dallas.csv")
# Getting user geolocation
ATT_userInfo <- lookupUsers(ATT_dallas$screenName) 
ATT_userFrame <- twListToDF(ATT_userInfo)
ATT_locatedUsers <- !is.na(ATT_userFrame$location)
ATT_locations <- geocode(ATT_userFrame$location[ATT_locatedUsers])

