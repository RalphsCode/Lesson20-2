-- write your queries here

-- Part 1 -- 
-- Query 1 --

SELECT * FROM owners FULL JOIN vehicles
ON owners.id = vehicles.owner_id
ORDER BY first_name;

-- Query 2 --
SELECT first_name, last_name, COUNT(*) AS number_of_cars
FROM owners JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY owners.id
ORDER BY first_name;

-- Query 3 --
SELECT first_name, last_name, 
	ROUND(
	(SUM(price)/COUNT(*))
	) AS ave_price, 
	COUNT(*) AS number_of_cars
FROM owners o JOIN vehicles v
ON o.id = v.owner_id
GROUP BY o.id
HAVING SUM(price)/COUNT(*) > 10000 AND COUNT(*) > 1
ORDER BY first_name desc;
