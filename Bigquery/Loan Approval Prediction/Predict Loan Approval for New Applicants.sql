SELECT 
    *,
    predicted_loan_status_probs,
    predicted_loan_status
FROM 
    ML.PREDICT(
        MODEL `train-1.new_loan.train_model`,
        (
            SELECT * FROM `train-1.loantest.data`
        )
    );
