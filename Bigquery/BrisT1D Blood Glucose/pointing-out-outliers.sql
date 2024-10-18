SELECT 
    MAX(bg_level) AS max_bg_level,
    MAX(bg_income) AS max_bg_income
FROM (
    SELECT 
        id,
        AVG(`bg+1:00`) AS bg_level,
        SUM(`bg+1:00`) AS bg_income
    FROM 
        `train-1.red.blood`
    WHERE 
        `bg+1:00` IS NOT NULL
    GROUP BY 
        id
);
