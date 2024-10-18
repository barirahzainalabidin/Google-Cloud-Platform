
CREATE OR REPLACE MODEL `train-1.housenew.house_price_forecasting`
OPTIONS
  (model_type = 'ARIMA',
   time_series_timestamp_col = 'year_sold',
   time_series_data_col = 'total_sale_price',
   auto_arima = TRUE,
   data_frequency = 'YEARLY'
  ) AS
WITH validated_data AS (
  SELECT
    PARSE_DATE('%Y', CAST(year_sold AS STRING)) AS year_sold,
    total_sale_price
  FROM
    `train-1.housenew.total_sales_price`
  WHERE
    year_sold IS NOT NULL AND total_sale_price IS NOT NULL
)
SELECT
  year_sold,
  IFNULL(total_sale_price, AVG(total_sale_price) OVER ()) AS total_sale_price
FROM
  validated_data
WHERE
  year_sold IS NOT NULL
ORDER BY
  year_sold;
