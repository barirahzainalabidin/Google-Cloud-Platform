CREATE OR REPLACE TABLE `machine-learning-1-438523.housenew.total_sales_price` AS
SELECT 
    YrSold AS year_sold,
    SUM(SalePrice) AS total_sale_price
FROM
    `machine-learning-1-438523.housenew.imputed_price`
WHERE
    YrSold IS NOT NULL
GROUP BY
    year_sold
ORDER BY
    year_sold;

