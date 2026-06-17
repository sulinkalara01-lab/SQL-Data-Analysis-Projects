SELECT u.id_user, r.name, u.country,
COUNT (CASE WHEN r.duration_minutes > 45 THEN r.duration_minutes END) AS long_podcasts,
COUNT (CASE WHEN r.duration_minutes < 45 THEN r.duration_minutes END) AS short_podcasts
FROM reproductions AS r
LEFT JOIN users AS u ON u.id_user = r.id_user
WHERE u.country <> 'Dominican Republic'
GROUP BY u.id_user, r.name, u.country
HAVING u.id_user > 2
ORDER BY long_podcasts DESC;