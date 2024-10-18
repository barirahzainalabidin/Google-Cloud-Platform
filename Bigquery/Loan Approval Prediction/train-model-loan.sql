CREATE OR REPLACE MODEL `machine-learning-1-438523.new_loan.train_model`
OPTIONS(
    model_type='logistic_reg',
    input_label_cols=['loan_status']
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
FROM `machine-learning-1-438523.new_loan.prepare_data`;
