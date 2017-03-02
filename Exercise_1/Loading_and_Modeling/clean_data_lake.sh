#!/bin/bash

rm /data/staging/W205-Spring-2017/Exercise_1/Loading_and_Modeling/*.csv

# destroy files in hdfs
hdfs dfs -rm /user/w205/hospital_compare/hospitals/*.csv
hdfs dfs -rm /user/w205/hospital_compare/effective_care/*.csv
hdfs dfs -rm /user/w205/hospital_compare/readmissions/*.csv
hdfs dfs -rm /user/w205/hospital_compare/measures/*.csv
hdfs dfs -rm /user/w205/hospital_compare/survey_responses/*.csv
hdfs dfs -rm /user/w205/hospital_compare/hcahps/*.csv

# remove directories in hdfs
hdfs dfs -rmdir /user/w205/hospital_compare/hospitals
hdfs dfs -rmdir /user/w205/hospital_compare/effective_care
hdfs dfs -rmdir /user/w205/hospital_compare/readmissions
hdfs dfs -rmdir /user/w205/hospital_compare/measures
hdfs dfs -rmdir /user/w205/hospital_compare/survey_responses
hdfs dfs -rmdir /user/w205/hospital_compare/hcahps
hdfs dfs -rmdir /user/w205/hospital_compare

