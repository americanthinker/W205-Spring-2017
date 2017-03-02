select corr(cast(hosp_overall_rating as decimal), cast(patient_survey_star_rating as decimal)) from filtered_star_rating;
