{% macro date_truncate(column_name, time_period) %}
    CAST(DATE_TRUNC({{ time_period }}, {{ column_name }}) as DATE)
{% endmacro %}
