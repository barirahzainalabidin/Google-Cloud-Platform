-- Forecasting predict each house prices using a trained model
SELECT
  *
FROM
  ML.FORECAST(MODEL `machine-learning-1-438523.housenew.house_price_forecasting`,
              STRUCT(30 AS horizon, 0.8 AS confidence_level));

-- Creating a table to store historical and forecasted house prices
CREATE OR REPLACE TABLE `machine-learning-1-438523.housenew.house_price_forecast` AS
SELECT
  CAST(CONCAT(CAST(YrSold AS STRING), '-01-01') AS DATE) AS date,
  CAST(Imputed_sale_price AS STRING) AS history_value,
  'None' AS forecast_value,
  'None' AS prediction_interval_lower_bound,
  'None' AS prediction_interval_upper_bound
FROM
  `machine-learning-1-438523.housenew.imputed_price`
WHERE
  YrSold BETWEEN 2009 AND 2010

UNION ALL

SELECT
  CAST(forecast_timestamp AS DATE) AS date,
  'None' AS history_value,
  CAST(IFNULL(forecast_value, 0) AS STRING) AS forecast_value,
  CAST(IFNULL(prediction_interval_lower_bound, 0) AS STRING) AS prediction_interval_lower_bound,
  CAST(IFNULL(prediction_interval_upper_bound, 0) AS STRING) AS prediction_interval_upper_bound
FROM
  ML.FORECAST(MODEL `machine-learning-1-438523.housenew.house_price_forecasting`,
              STRUCT(30 AS horizon, 0.8 AS confidence_level));
