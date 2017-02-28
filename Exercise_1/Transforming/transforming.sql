
drop table filtered_hospitals;
create table filtered_hospitals	as 
select ID, hosp_name, city, state, hosp_overall_rating,	mortality_nat_compare, 
safety_care_nat_compare, readmit_nat_compare, patient_exp_nat_compare, effectiveness_of_care_nat_comp,
timeliness_of_care_nat_comp, efficient_use_med_imaging_nat_comp from hospitals;

alter table filtered_hospitals change column mortality_nat_compare mortality string;
alter table filtered_hospitals change column safety_care_nat_compare safety string;
alter table filtered_hospitals change column readmit_nat_compare readmit string;
alter table filtered_hospitals change column patient_exp_nat_compare patient_exp string;
alter table filtered_hospitals change column effectiveness_of_care_nat_comp effectiveness string;
alter table filtered_hospitals change column timeliness_of_care_nat_comp timeliness string;
alter table filtered_hospitals change column efficient_use_med_imaging_nat_comp med_imaging string;

drop table states;
create table states as
select ID, hosp_name, city, state, hosp_overall_rating from hospitals where state != 'PR' and state != 'VI' and state != 'AS'   
and state != 'GU' and state != 'MP';

drop table procedures;
create table procedures as 
select id, hosp_name, state, measure_id, measure_name, cast(score as decimal) as score from effective_care
where score != 'Not Available';
select count(*) from procedures;

drop table no_null_procedures;
create table no_null_procedures as
select id, hosp_name, state, measure_id, measure_name, cast(score as decimal) as score from procedures
where score is not null;
select count(*) from no_null_procedures;

drop table filtered_procedures;
create table filtered_procedures as
select * from no_null_procedures
where state != 'PR' and state != 'VI' and state != 'AS' and state != 'GU' and state != 'MP';
select count(*) from filtered_procedures;

drop table final_procedures;
create table final_procedures as 
select * from filtered_procedures 
where measure_id = 'ED_1b' or measure_id = 'ED_2b' or measure_id = 'OP_1' or
measure_id = 'OP_3b' or measure_id = 'OP_5' or measure_id = 'OP_18b' or 
measure_id = 'OP_20' or measure_id = 'OP_21';
select count(*) from final_procedures;
