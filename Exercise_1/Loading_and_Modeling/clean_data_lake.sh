#!/bin/bash

cd ~/staging/
rm exercise_1/loading_and_modeling/*.*
rmdir exercise_1/loading_and_modeling
rm exercise_1/*.*
rmdir exercise_1

# destroy files in hdfs
hdfs dfs -rm /user/w205/hospital_compare/hospitals/*.csv
hdfs dfs -rm /user/w205/hospital_compare/effective_care/*.csv
hdfs dfs -rm /user/w205/hospital_compare/readmissions/*.csv
hdfs dfs -rm /user/w205/hospital_compare/measures/*.csv
hdfs dfs -rm /user/w205/hospital_compare/survey_responses/*.csv

# remove directories in hdfs
hdfs dfs -rmdir /user/w205/hospital_compare/hospitals
hdfs dfs -rmdir /user/w205/hospital_compare/effective_care
hdfs dfs -rmdir /user/w205/hospital_compare/readmissions
hdfs dfs -rmdir /user/w205/hospital_compare/measures
hdfs dfs -rmdir /user/w205/hospital_compare/survey_responses
hdfs dfs -rmdir /user/w205/hospital_compare

