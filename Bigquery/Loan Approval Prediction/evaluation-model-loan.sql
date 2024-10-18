SELECT 
    roc_auc
FROM 
    ML.EVALUATE(
        MODEL train-1.new_loan.train_model,
        (SELECT * FROM train-1.new_loan.prepare_data)
    );
