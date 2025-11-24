WITH CTE as (
    SELECT 
    t.*,
    w.*
    FROM {{ ref('trip_fact') }} t
    LEFT JOIN {{ ref('daily_weather') }} w
    ON t.TRIP_DATE = w.dayli_weather
)

SELECT * FROM CTE