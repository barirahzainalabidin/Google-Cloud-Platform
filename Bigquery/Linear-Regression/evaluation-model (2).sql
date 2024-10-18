CREATE OR REPLACE TABLE `machine-learning-1-438523.housenew.evaluation_model` AS
SELECT
    YrSold AS year_sold,
    SalePrice AS total_sale_price,
    LotArea AS lot_area,
    OverallQual AS overall_qual,
    OverallCond AS overall_cond,
    GrLivArea AS gr_liv_area,
    FullBath AS full_bath,
    HalfBath AS half_bath,
    BedroomAbvGr AS bedroom_abvgr,
    KitchenAbvGr AS kitchen_abvgr,
    GarageArea AS garage_area,
    GarageCars AS garage_cars,
    Fireplaces AS fireplaces
FROM
    `machine-learning-1-438523.housenew.imputed_price`
WHERE
    (YrSold = 2006 AND (OverallQual >= 5 OR OverallCond >= 5))
    AND SalePrice >= 100000
    AND SalePrice <= 1000000
    AND LotArea IS NOT NULL
    AND GrLivArea IS NOT NULL;
