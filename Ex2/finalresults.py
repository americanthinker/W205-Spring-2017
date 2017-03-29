import sys
import psycopg2

connex = psycopg2.connect("dbname=testcount user=postgres")
cur = connex.cursor()

try:
	word = sys.argv[1].lower()
	cur.execute('select counts from testwordcount where words = %s', (word,))
	try:
		number = cur.fetchall()[0][0]
		print "Total number of occurences of \"{}\": {}".format(word, number)
	except IndexError:
        	print "\"{}\" was not found in the word stream.".format(word)

except IndexError:
	cur.execute('select * from testwordcount order by words limit 100;')
	print cur.fetchall()
cur.close()
connex.close()
