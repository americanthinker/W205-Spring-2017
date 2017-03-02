#!/bin/bash

cd /data/staging/

# download and unzip exercise data from medicare.gov website
URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget -O medicare_data.zip "$URL"

# unzip medicare data
unzip medicare_data.zip

# remove headers and rename files to simple title
tail -n +2 "Hospital General Information.csv" > hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n +2 "Measure Dates.csv" > measures.csv
tail -n +2 "hvbp_hcahps_11_10_2016.csv" > survey_responses.csv
tail -n +2 "HCAHPS - Hospital.csv" > hcahps.csv

# create hdfs data lake directory
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses
hdfs dfs -mkdir /user/w205/hospital_compare/hcahps

# load files into Data Lake
hdfs dfs -put /data/staging/hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put /data/staging/effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put /data/staging/readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put /data/staging/measures.csv /user/w205/hospital_compare/measures
hdfs dfs -put /data/staging/survey_responses.csv /user/w205/hospital_compare/survey_responses
hdfs dfs -put /data/staging/hcahps.csv /user/w205/hospital_compare/hcahps

# push all csv files into extras directory
mv *.csv extras/
