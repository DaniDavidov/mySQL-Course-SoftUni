SELECT 
    `country_name`, `iso_code`
FROM
    `countries`
WHERE
    upper(`country_name`) LIKE '%A%A%A%'
ORDER BY `iso_code`;

-----------------------------------------

SELECT 
    p.peak_name,
    r.river_name,
    concat(lower(left(p.peak_name, char_length(p.peak_name) - 1)), lower(r.river_name)) AS 'mix'
FROM
    `peaks` AS p,
    `rivers` AS r
WHERE
	lower(right(p.peak_name, 1)) = lower(left(r.river_name, 1))
ORDER BY `mix`;