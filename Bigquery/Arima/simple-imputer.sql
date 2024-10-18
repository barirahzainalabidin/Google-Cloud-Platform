CREATE OR REPLACE TABLE `train-1.housenew.imputed_price` AS
SELECT
  *,
  IFNULL(SalePrice, AVG(SalePrice) OVER ()) AS imputed_sale_price
FROM 
  `train-1.housenew.price`;
