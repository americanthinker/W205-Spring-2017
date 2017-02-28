select state, avg(hosp_overall_rating) as rating from states group by state order by rating desc;
select state, count(*) as count from states group by state order by count desc;
select state, count(*) as count, avg(hosp_overall_rating) as rating from states group by state having count > 70 order by rating desc;

