import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

con = psycopg2.connect(database = 'postgres', user = 'postgres')
con.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
cur = con.cursor()
cur.execute('drop database if exists testcount')
cur.execute('create database testcount;') 
cur.close()
con.close()

con = psycopg2.connect(database='testcount', user='postgres')
con.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
cur = con.cursor()
cur.execute('drop table if exists testwordcount')
cur.execute('create table testwordcount (words TEXT NOT NULL, counts INTEGER NOT NULL);')
cur.close()
con.close()

