drop table star_rating;
create table star_rating as
select hospitals.hosp_name, hospitals.hosp_overall_rating, hcahps.hcahps_measure_id, hcahps.patient_survey_star_rating
from hospitals, hcahps where hospitals.id = hcahps.id;

drop table filtered_star_rating;
create table filtered_star_rating as
select * from star_rating
where hcahps_measure_id = 'H_STAR_RATING' and patient_survey_star_rating != 'Not Available';

select count(*) from filtered_star_rating;

