WITH

events AS (
    SELECT
        user_id,
        DATE(created_at) AS created_date,
        COUNT(DISTINCT event_id) AS login_count
    FROM
        {{ ref('stg_bingeflix__events')}}
    WHERE
        event_name = 'User Logged In'
    GROUP BY user_id, DATE(created_at)
),

date_spine AS (
    SELECT
        calendar_date,
        date_week
    FROM
        {{ ref('int_dates')}}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['date_week', 'user_id']) }} AS surrogate_key,
        date_week,
        user_id,
        login_count,
        {{ rolling_aggregate_time_periods('login_count', 'user_id', 'sum', 'date_week', 4)}}
    FROM
        date_spine
        LEFT JOIN events ON date_spine.calendar_date = events.created_date

)

SELECT * FROM final
GROUP BY ALL
