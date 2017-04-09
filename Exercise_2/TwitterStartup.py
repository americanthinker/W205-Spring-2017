import os
import subprocess
from time import sleep

subprocess.call(['mount', '-t', 'ext4', '/dev/xvdf', '/data'])
os.chdir('/data')
subprocess.call(['./start_postgres.sh'])
sleep(3)

#2. Establish connection to postgres DB through psycopg2 module
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
conn = psycopg2.connect('dbname=postgres user=postgres')
conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
cur = conn.cursor()

#3. Delete old Tcount database (if it exists) and create new database
cur.execute('drop database if exists tcount;')
cur.execute('create database tcount;')
cur.close()
conn.close()

#4. Create new connection with Tcount and create the tweetwordcount table
conn2 = psycopg2.connect('dbname=tcount user=postgres')
conn2.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
cur = conn2.cursor()
cur.execute('create table tweetwordcount(words TEXT NOT NULL, counts INT NOT NULL);')
cur.close()
conn2.close()
