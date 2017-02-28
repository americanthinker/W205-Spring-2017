drop table better_hospitals;
create table better_hospitals
as select * from filtered_hospitals
where hosp_overall_rating > 4;

drop table best_hospitals;
create table best_hospitals
as select * from better_hospitals
where mortality = 'Above the National average' and
safety = 'Above the National average' and
readmit = 'Above the National average' and 
patient_exp = 'Above the National average';

drop table final_list;
create table final_list
as select * from best_hospitals
where effectiveness != 'Not Available' and
timeliness != 'Not Available' and 
med_imaging != 'Not Avaialble';

select hosp_name, effectiveness, timeliness, med_imaging from final_list
order by effectiveness, timeliness, med_imaging;

select hosp_name, effectiveness, timeliness, med_imaging from final_list
where hosp_name != 'MEMORIAL HERMANN HOSPITAL SYSTEM' and hosp_name != 'CENTEGRA HEALTH SYSTEM - MC HENRY HOSPITAL'
order by effectiveness, timeliness, med_imaging;

select hosp_name from final_list
where hosp_name != 'MEMORIAL HERMANN HOSPITAL SYSTEM' and hosp_name != 'CENTEGRA HEALTH SYSTEM - MC HENRY HOSPITAL'
order by effectiveness, timeliness, med_imaging;
