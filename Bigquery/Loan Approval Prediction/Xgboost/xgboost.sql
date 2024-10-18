CREATE OR REPLACE MODEL `train-1.new_loan.xgboost-model`
OPTIONS(
    model_type='boosted_tree_classifier',
    input_label_cols=['loan_status'],
    max_iterations=1000,
    early_stop=True
) AS
SELECT
    person_age,
    person_income,
    person_home_ownership,
    person_emp_length,
    loan_intent,
    loan_grade,
    loan_amnt,
    loan_int_rate,
    loan_percent_income,
    cb_person_default_on_file,
    cb_person_cred_hist_length,
    loan_status
FROM
    `train-1.new_loan.prepare_data`;
