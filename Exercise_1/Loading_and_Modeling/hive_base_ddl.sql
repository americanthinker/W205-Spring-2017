drop table hospitals;
create external table hospitals(
ID string,
hosp_name string,
address string,
city string, 
state string,
zip string,
county string,
phone_number string,
hosp_type string,
hosp_ownership string,
emerg_services string,
meaningful_use_of_EHRs string,
hosp_overall_rating string,
overall_rating_foot string,
mortality_nat_compare string,
mort_nat_comp_foot string,
safety_care_nat_compare string,
safety_care_nat_comp_foot string,
readmit_nat_compare string,
readmit_nat_comp_foot string,
patient_exp_nat_compare string,
patient_exp_nat_comp_foot string,
effectiveness_of_care_nat_comp string,
effectiveness_of_care_nat_comp_foot string,
timeliness_of_care_nat_comp string,
timeliness_of_care_nat_comp_foot string,
efficient_use_med_imaging_nat_comp string,
efficient_use_med_imaging_nat_comp_foot string
)
row format serde'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties(
"separatorChar"=",",
"quoteChar"='"',
"escapeChar"='\\'
)
stored as textfile
location '/user/w205/hospital_compare/hospitals';

drop table effective_care;
create external table effective_care(
ID string,
hosp_name string,
address string,
city string,
state string,
zip string,
county string, 
phone string,
condition string, 
measure_id string,
measure_name string,
score string,
sample string,
footnote string,
measure_start_date string,
measure_end_date string
)
row format serde'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties(
"separatorChar"=",",
"quoteChar"='"',
"escapeChar"='\\'
)
stored as textfile
location '/user/w205/hospital_compare/effective_care';

drop table measures;
create external table measures(
measure_name string,
measure_id string,
measure_start_quarter string,
measure_start_date string,
measure_end_quarter string,
measure_end_date string
)
row format serde'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties(
"separatorChar"=",",
"quoteChar"='"',
"escapeChar"='\\'
)
stored as textfile
location '/user/w205/hospital_compare/measures';

drop table readmissions;
create external table readmissions(
ID string,
hosp_name string,
address string,
city string, 
state string,
zip string,
county string,
phone string,
measure_name string,
measure_id string,
compared_to_national string,
denominator string,
score string,
lower_est string,
higher_est string,
footnote string,
measure_start_date string,
measure_end_date string
)
row format serde'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties(
"separatorChar"=",",
"quoteChar"='"',
"escapeChar"='\\'
)
stored as textfile
location '/user/w205/hospital_compare/readmissions';

drop table survey_responses;
create external table survey_responses(
ID string,
hosp_name string,
address string,
city string,
state string,
zip string,
county string, 
comm_with_nurses_floor string,
comm_with_nurses_achievement_threshold string,
comm_with_nurses_benchmark string,
comm_with_nurses_baseline_rate string,
comm_with_nurses_performance_rate string,
comm_with_nurses_achievement_points string,
comm_with_nurses_improvement_points string,
comm_with_nurses_dimension_score string,
comm_with_doctors_floor string,
comm_with_doctors_achievement_threshold string,
comm_with_doctors_benchmark string,
comm_with_doctors_baseline_rate string,
comm_with_doctors_performance_rate string,
comm_with_doctors_achievement_points string,
comm_with_doctors_improvement_points string,
comm_with_doctors_dimension_score string,
responsiveness_hospital_staff_floor string,
responsiveness_hospital_staf_achievement_threshold string,
responsiveness_hospital_staff_benchmark string,
responsiveness_hospital_staff_baseline_rate string,
responsiveness_hospital_staff_performance_rate string,
responsiveness_hospital_staff_achievement_points string,
responsiveness_hospital_staff_improvement_points string,
responsiveness_hospital_staff_dimension_score string,
pain_management_floor string,
pain_management_achievement_threshold string,
pain_management_benchmark string,
pain_management_baseline_rate string,
pain_management_performance_rate string,
pain_management_achievement_points string,
pain_management_improvement_points string,
pain_management_dimension_score string,
comm_about_medicines_floor string,
comm_about_medicines_achievement_threshold string,
comm_about_medicines_benchmark string,
comm_about_medicines_baseline_rate string,
comm_about_medicines_performance_rate string,
comm_about_medicines_achievement_points string,
comm_about_medicines_improvement_points string,
comm_about_medicines_dimension_score string,
cleanliness_and_quietness_of_hospital_environment_floor string,
cleanliness_and_quietness_of_hospital_environment_achievement_threshold string,
cleanliness_and_quietness_of_hospital_environment_benchmark string,
cleanliness_and_quietness_of_hospital_environment_baseline_rate string,
cleanliness_and_quietness_of_hospital_environment_performance_rate string,
cleanliness_and_quietness_of_hospital_environment_achievement_points string,
cleanliness_and_quietness_of_hospital_environment_improvement_points string,
cleanliness_and_quietness_of_hospital_environment_dimension_score string,
discharge_information_floor string,
discharge_information_achievement_threshold string,
discharge_information_benchmark string,
discharge_information_baseline_rate string,
discharge_information_performance_rate string,
discharge_information_achievement_points string,
discharge_information_improvement_points string,
discharge_information_dimension_score string,
overall_rating_of_hospital_floor string,
overall_rating_of_hospital_achievement_threshold string,
overall_rating_of_hospital_benchmark string,
overall_rating_of_hospital_baseline_rate string,
overall_rating_of_hospital_performance_rate string,
overall_rating_of_hospital_achievement_points string,
overall_rating_of_hospital_improvement_points string,
overall_rating_of_hospital_dimension_score string,
HCAHPS_base_score string,
HCAHPS_consistency_score string
)
row format serde'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties(
"separatorChar"=",",
"quoteChar"='"',
"escapeChar"='\\'
)
stored as textfile
location '/user/w205/hospital_compare/survey_responses';

drop table hcahps;
create external table hcahps(
ID string,
hosp_name string,
address string,
city string,
state string,
zip string,
county string,
phone_number string,
hcahps_measure_id string,
hcahps_question string,
answer_description string,
patient_survey_star_rating string,
patient_survey_footnote string,
hcahps_answer_percent string,
answer_percent_footnote string,
hcahps_linear_mean_value string,
number_of_completed_surveys string,
completed_surveys_footnote string,
survey_response_rate_percent string,
survey_response_rate_footnote string,
measure_start_date string,
measure_end_date string
)
row format serde'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with serdeproperties(
"separatorChar"=",",
"quoteChar"='"',
"escapeChar"='\\'
)
stored as textfile
location '/user/w205/hospital_compare/hcahps';

