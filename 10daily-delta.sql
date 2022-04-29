--- Clause to compute delta from previous day:
---
--- Use LAG to access data from previous day. PARTITION BY country to get the same country.
--- The sorting is by the (ascending) date.
--- The clause is embedded into a simple SELECT statement to show the context. The delta for deaths
--- is computed in a similar way.

SELECT
   confirmed_cases - LAG(confirmed_cases,1) OVER (PARTITION BY country_id ORDER BY dt) AS confirmed_cases_delta,
   confirmed_cases,
   country_id,
   dt
FROM statistics