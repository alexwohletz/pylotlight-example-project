-- models/example/iris_anomalies.sql
WITH stats AS (
    SELECT
        species,
        AVG(sepal_length) AS avg_sepal_length,
        STDDEV(sepal_length) AS stddev_sepal_length,
        AVG(sepal_width) AS avg_sepal_width,
        STDDEV(sepal_width) AS stddev_sepal_width,
        AVG(petal_length) AS avg_petal_length,
        STDDEV(petal_length) AS stddev_petal_length,
        AVG(petal_width) AS avg_petal_width,
        STDDEV(petal_width) AS stddev_petal_width
    FROM {{ ref('base_data') }}
    GROUP BY species
),
anomalies AS (
    SELECT
        b.*,
        ABS(b.sepal_length - s.avg_sepal_length) / s.stddev_sepal_length AS sepal_length_zscore,
        ABS(b.sepal_width - s.avg_sepal_width) / s.stddev_sepal_width AS sepal_width_zscore,
        ABS(b.petal_length - s.avg_petal_length) / s.stddev_petal_length AS petal_length_zscore,
        ABS(b.petal_width - s.avg_petal_width) / s.stddev_petal_width AS petal_width_zscore
    FROM {{ ref('base_data') }} b
    JOIN stats s ON b.species = s.species
)
SELECT 
    *,
    CASE
        WHEN sepal_length_zscore > 3 OR sepal_width_zscore > 3 OR
             petal_length_zscore > 3 OR petal_width_zscore > 3
        THEN 1
        ELSE 0
    END AS is_anomaly
FROM anomalies