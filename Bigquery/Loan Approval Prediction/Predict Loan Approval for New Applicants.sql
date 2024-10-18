SELECT 
    *,
    predicted_loan_status_probs,
    predicted_loan_status
FROM 
    ML.PREDICT(
        MODEL `machine-learning-1-438523.new_loan.train_model`,
        (
            SELECT * FROM `machine-learning-1-438523.loantest.data`
        )
    );