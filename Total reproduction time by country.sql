-- ====================================================================
-- PROJECT: International User Engagement Analysis
-- PURPOSE: Calculate total reproduction time by country, excluding USA.
-- ====================================================================

-- Selects the aggregated metrics and group criteria
SELECT  SUM (r.duration_minutes) AS minutos_totales, u.country
-- Specifies the primary table containing reproduction metrics
FROM reproductions AS r
-- Combines reproduction data with user profiles based on a common user ID
LEFT JOIN users AS u ON  r.id_user = u.id_user
-- Filters out users not located in the United States before aggregation
WHERE u.country <> 'USA'
-- Groups the calculated metrics by each individual country
GROUP BY u.country
-- Filters aggregated results to only include countries with more than 100 total minutes
HAVING SUM(r.duration_minutes) > 100
-- Sorts the final output from the highest to the lowest total minutes
ORDER BY minutos_totales DESC;