CREATE OR REPLACE TABLE `train-1.housenew.total_sales_price` AS
SELECT 
    YrSold AS year_sold,
    SUM(SalePrice) AS total_sale_price
FROM
    `train-1.housenew.imputed_price`
WHERE
    YrSold IS NOT NULL
GROUP BY
    year_sold
ORDER BY
    year_sold;

