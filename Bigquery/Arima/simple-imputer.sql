CREATE OR REPLACE TABLE `machine-learning-1-438523.housenew.imputed_price` AS
SELECT
  *,
  IFNULL(SalePrice, AVG(SalePrice) OVER ()) AS imputed_sale_price
FROM 
  `machine-learning-1-438523.housenew.price`;