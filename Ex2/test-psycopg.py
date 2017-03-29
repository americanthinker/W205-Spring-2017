#Sample code snippets for working with psycopg
#!/usr/bin/python

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

# Connect to the database
conn = psycopg2.connect(database="tcount", user="postgres")


#Running sample SQL statements
#Inserting/Selecting/Updating

#Rather than executing a whole query at once, it is better to set up a cursor that encapsulates the query, 
#and then read the query result a few rows at a time. One reason for doing this is
#to avoid memory overrun when the result contains a large number of rows. 

cur = conn.cursor()

#Insert
cur.execute("UPDATE tweetwordcount set count = count + 1 where word = 'SEAL'; INSERT INTO tweetwordcount (word,count) \
     	     SELECT 'SEAL', 1 WHERE NOT EXISTS (SELECT 1 FROM tweetwordcount WHERE word = 'SEAL');")
conn.commit()

conn.close()
