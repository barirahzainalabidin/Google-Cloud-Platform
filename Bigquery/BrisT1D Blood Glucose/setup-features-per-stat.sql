CREATE OR REPLACE TABLE `train-1.red.blood_glucose_stats` AS
SELECT *
FROM (
    SELECT 
        id,
        AVG(`bg+1:00`) AS avg_bg_per_minute,
        SUM(`bg+1:00`) AS tot_bg_sum
    FROM 
        `train-1.red.blood`
    WHERE 
        `bg+1:00` IS NOT NULL
    GROUP BY 
        id
)
WHERE 
    avg_bg_per_minute BETWEEN 0 AND 50
    AND tot_bg_sum BETWEEN 0 AND 150000;
