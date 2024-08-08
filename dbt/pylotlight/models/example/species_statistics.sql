WITH species_stats AS (
    SELECT
        species,
        AVG(sepal_length) AS avg_sepal_length,
        AVG(sepal_width) AS avg_sepal_width,
        AVG(petal_length) AS avg_petal_length,
        AVG(petal_width) AS avg_petal_width,
        COUNT(*) AS sample_size
    FROM {{ ref('base_data') }}
    GROUP BY species
)
SELECT 
    *,
    avg_petal_length / avg_petal_width AS petal_ratio,
    avg_sepal_length / avg_sepal_width AS sepal_ratio
FROM species_stats