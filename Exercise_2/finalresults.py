'''This script will print the total number of times a user-provided word appears in the Twitter stream.  The script pulls the data from 
the locally installed Postgres database, and print the total count of the word.  Script can be run concurrently with a running Twitter stream.'''

import sys
import psycopg2

#Create connection to locally installed Postgres DB

connex = psycopg2.connect("dbname=testcount user=postgres")
cur = connex.cursor()

try:	
	word = sys.argv[1].lower()
	cur.execute('select counts from testwordcount where words = %s', (word,))
	try:
		number = cur.fetchall()[0][0]
		print "\n"
		print "Total number of occurences of \"{}\": {}".format(word, number)
		print "\n"
	#If the user-provided word (argument) is not found, an exception is raised notifying the user.
	except IndexError:
		print "\n"
        	print "\"{}\" was not found in the word stream.".format(word)
		print "\n"
#If no argument is provided by the user, script will return the first 100 words in the stream in alphabetical order
except IndexError:
	cur.execute('select * from testwordcount order by words limit 100;')
	print cur.fetchall()
cur.close()
connex.close()
