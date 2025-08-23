{{ 
    config(materialized='table') 
}}


WITH daily_metric_cte AS(
SELECT
    event_date,
    country,
    platform,
    COUNT(DISTINCT user_id) AS DAU,
    SUM(Iap_revenue) AS total_iap_revenue,
    SUM(ad_revenue) AS total_ad_revenue,
    SUM(match_start_count) AS matches_started,
    SUM(victory_count) AS sum_victory_count,
    SUM(defeat_count) AS sum_defeat_count,
    SUM(match_end_count) AS sum_match_end_count,
    SUM(server_connection_error) AS sum_server_connection_error

    

FROM
    {{ ref('raw_merged') }}
GROUP BY
    1, 2, 3
ORDER BY
    event_date,
    country,
    platform
)

SELECT
    event_date,
    country,
    platform,
    DAU,
    total_iap_revenue,
    total_ad_revenue,
    (total_iap_revenue + total_ad_revenue) / DAU AS arpdau,
    matches_started,
    matches_started / NULLIF(DAU, 0) AS match_per_dau,
    sum_victory_count / NULLIF(sum_match_end_count, 0) AS win_ratio,
    sum_defeat_count / NULLIF(sum_match_end_count, 0) AS defeat_ratio,
    sum_server_connection_error / NULLIF(DAU, 0) AS server_error_per_dau
    

FROM
    daily_metric_cte

ORDER BY
    event_date,
    country,
    platform



