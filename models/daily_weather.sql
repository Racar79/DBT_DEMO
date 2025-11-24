WITH dayli_weather AS (

    SELECT
    date(time) as dayli_weather,
    weather,
    temp,
    pressure,
    humidity,
    clours
    FROM {{ source('demo', 'weather') }}

),

dayli_weather_agg as (

     SELECT 
        dayli_weather,
        weather,
        avg(temp),
        avg(pressure),
        avg(humidity),
        avg(clours)
    FROM dayli_weather
    GROUP BY 1,2
    qualify ROW_NUMBER() OVER ( PARTITION BY dayli_weather ORDER BY COUNT(weather) DESC) = 1
)



SELECT 
*
FROM dayli_weather_agg