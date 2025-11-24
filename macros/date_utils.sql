{% macro station(month) %}

case
    WHEN MONTH(TO_TIMESTAMP({{month}})) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{month}})) IN (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{month}})) IN (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
END 

{% endmacro %}