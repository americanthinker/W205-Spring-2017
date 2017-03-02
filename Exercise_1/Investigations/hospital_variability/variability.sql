select measure_id, round(stddev(score)) as variance from time_procedures group by measure_id order by variance desc;

select measure_id, round(stddev(score)) as variance from percent_procedures group by measure_id order by variance desc;

