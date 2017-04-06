from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
        word = tup.values[0]
        conn = psycopg2.connect(database = "tcount", user = "postgres")
	conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
	cur = conn.cursor()
	cur.execute("UPDATE tweetwordcount set counts = counts + 1 where words = %s", (word,))
	cur.execute("INSERT INTO tweetwordcount (words, counts) \
		     SELECT %s, 1 WHERE NOT EXISTS (SELECT * FROM tweetwordcount WHERE words = %s)", (word, word))
	
        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
