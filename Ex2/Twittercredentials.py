import tweepy

consumer_key = "9AgE4wWA6W7c2cubVeudk5vw0";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "6TTM1a7gOFohzsDQabCrL01lytm46xoDiqrHgfzB4tHh6BCALA";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "842028477192658944-8ZR2O9LCUVuQSWBlmp03zxa4C6YjG16";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "C5cQdSZc9ZynpWaxXl2Vlc1YlYVKQBkeY2Vnq29jTQVTu";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



