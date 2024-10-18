CREATE OR REPLACE MODEL `train-1.housenew.linear_regression_model`
OPTIONS
  (model_type='linear_reg') AS
SELECT
  lot_area,
  overall_qual,
  overall_cond,
  gr_liv_area,
  garage_area,
  garage_cars,
  full_bath,
  bedroom_abvgr,
  kitchen_abvgr,
  CASE WHEN year_sold IN (2009, 2010) THEN TRUE ELSE FALSE END AS is_recent_year,
  total_sale_price AS label
FROM
  `train-1.housenew.training_table`;

