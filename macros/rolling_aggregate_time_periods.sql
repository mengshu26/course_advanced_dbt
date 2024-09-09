{% macro rolling_aggregate_time_periods(column_name, partition_by, aggregate_type='avg', order_by='created_at', time_period=7) %}
    {{ aggregate_type }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ time_period - 1 }} PRECEDING AND CURRENT ROW
            ) AS {{ aggregate_type }}_{{ time_period }}_periods_{{ column_name }}
{% endmacro %}
