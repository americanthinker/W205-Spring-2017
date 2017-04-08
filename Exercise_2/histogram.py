import sys
import psycopg2

connex = psycopg2.connect("dbname=tcount user=postgres")
cur = connex.cursor()

try:
	first = sys.argv[1]
	second = sys.argv[2]
	cur.execute('select * from tweetwordcount where counts >= %s and counts <= %s order by counts desc', (first,second))
	answers = cur.fetchall()
	for answer in answers:
		print answer[0] + ': ' + str(answer[1])
except IndexError:
	print 'Ensure you have input two integers and only two integers.'

cur.close()
connex.close()
