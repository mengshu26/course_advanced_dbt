## Task 1 & 2

- Installed pre-commit and pre-commit hooks for sqlfluff and dbt_checkpoint
- Used `sqlfluff fix` to fix linting errors, and added yml descriptions for dbt_checkpoint

## Task 3

- Generalized `rolling_average_7_periods.sql` macro, and created `rolling_aggregate_time_periods.sql`
- Added a column in `fct_active_users.sql` that counts active users over a rolling 4 week period.

## Task 4

- Added new macro `date_truncate.sql`
- Applied the new macro to `fct_mrr.sql` and `int_dates.sql`
