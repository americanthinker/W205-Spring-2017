select measure_id, stddev(score) as variance from final_procedures group by measure_id order by variance desc;

