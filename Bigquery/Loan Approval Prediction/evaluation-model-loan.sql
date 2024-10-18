SELECT 
    roc_auc
FROM 
    ML.EVALUATE(
        MODEL machine-learning-1-438523.new_loan.train_model,
        (SELECT * FROM machine-learning-1-438523.new_loan.prepare_data)
    );
