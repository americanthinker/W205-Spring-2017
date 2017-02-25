#!/bin/bash

# create necessary directories
mkdir ~/staging/exercise_1
mkdir ~/staging/exercise_1/loading_and_modeling
cd ~/staging/exercise_1

# download and unzip exercise data from medicare.gov website
URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget -O medicare_data.zip "$URL"

# unzip medicare data
unzip medicare_data.zip

# remove headers and rename files to simple title

tail -n +2 "Hospital General Information.csv" > loading_and_modeling/hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv" > loading_and_modeling/effective_care.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv" > loading_and_modeling/readmissions.csv
tail -n +2 "Measure Dates.csv" > loading_and_modeling/measures.csv
tail -n +2 "hvbp_hcahps_11_10_2016.csv" > loading_and_modeling/survey_responses.csv

# create hdfs data lake directory
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses

# load files into Data Lake
hdfs dfs -put loading_and_modeling/hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put loading_and_modeling/effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put loading_and_modeling/readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put loading_and_modeling/measures.csv /user/w205/hospital_compare/measures
hdfs dfs -put loading_and_modeling/survey_responses.csv /user/w205/hospital_compare/survey_responses
