CREATE OR REPLACE TABLE train-1.new_loan.prepare_data AS
SELECT *
FROM train-1.new_loan.loan
WHERE MOD(ABS(FARM_FINGERPRINT(CAST(id AS STRING))), 10) < 8;

CREATE OR REPLACE TABLE machine-learning-1-438523.new_loan.loan AS
SELECT *
FROM train-1.new_loan.loan
WHERE MOD(ABS(FARM_FINGERPRINT(CAST(id AS STRING))), 10) >= 8;
