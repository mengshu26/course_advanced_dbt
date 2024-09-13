WITH

date_spine AS (

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2019-01-01' as date)",
    end_date="cast('2030-01-01' as date)"
   )
}}
),

final AS (
    SELECT
        date_day AS calendar_date,
        {{ date_truncate(time_period='week', column_name='date_day') }} AS date_week,
        {{ date_truncate(column_name='date_day', time_period='month') }} AS date_month,
        {{ date_truncate(column_name='date_day', time_period='quarter') }} AS date_quarter,
        {{ date_truncate(column_name='date_day', time_period='year') }} AS date_year,
        DAY(date_day) AS day_of_month,
        YEAR(date_day) AS year_num,
        QUARTER(date_day) AS quarter_num,
        MONTH(date_day) AS month_num
    FROM
        date_spine
)

SELECT * FROM final
