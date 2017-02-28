select measure_id, stddev(score) as variance from no_null_procedures group by measure_id order by variance desc;

