CREATE OR REPLACE MODEL `train-1.red.kmeans_model`
OPTIONS(model_type='kmeans', num_clusters=3, kmeans_init_method = 'KMEANS++') AS
  SELECT * EXCEPT (id)
  FROM `train-1.red.blood_glucose_per_minute`;
