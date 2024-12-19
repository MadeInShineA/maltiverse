-- Which festivals take place in a specific city?
SELECT festivals.name AS festival
FROM festivals
JOIN cities ON festivals.city_id = cities.id
WHERE cities.name = 'Berlin';

-- Which visitor has written the most reviews about beers?
SELECT visitors.name, visitors.surname, COUNT(visitor_beer_reviews.id) AS review_count
FROM visitors
JOIN visitor_beer_reviews ON visitors.id = visitor_beer_reviews.visitor_id
GROUP BY visitors.id, visitors.name, visitors.surname
ORDER BY review_count DESC
FETCH FIRST 1 ROWS WITH TIES;

-- Which types of beers have an average alcohol content higher than 5%?
SELECT beer_types.name AS beer_type, beers.alcool_percentage AS average_alcool
FROM beers
JOIN beer_types ON beers.type_id = beer_types.id
WHERE beers.alcool_percentage > 5.0;

-- Which bars have an average rating higher than 4?
SELECT bars.name AS bar, ROUND(AVG(visitor_bar_reviews.rating),2) AS average_rating
FROM bars
JOIN visitor_bar_reviews ON bars.id = visitor_bar_reviews.bar_id
GROUP BY bars.name
HAVING AVG(visitor_bar_reviews.rating) > 4.0;

-- Which beer has the best review?
SELECT beers.name AS beer, MAX(visitor_beer_reviews.rating) AS best_rating
FROM beers
JOIN visitor_beer_reviews ON beers.id = visitor_beer_reviews.beer_id
GROUP BY beers.name
ORDER BY best_rating DESC
FETCH FIRST 1 ROWS WITH TIES;

-- Retrieve all festivals and their cities
SELECT festivals.name AS festival, cities.name AS city
FROM festivals
JOIN cities ON festivals.city_id = cities.id;

-- Get all visitors and their birthdates
SELECT name, surname, birth_date
FROM visitors;

-- List all beer brands and their beers
SELECT beer_brands.name AS brand, beers.name AS beer
FROM beers
JOIN beer_brands ON beers.brand_id = beer_brands.id;

-- Find the average rating of beers
SELECT ROUND(AVG(rating),2) AS average_rating
FROM visitor_beer_reviews;

-- Count the number of bars participating in each festival
SELECT festivals.name AS festival, COUNT(relation_bar_festival.bar_id) AS bar_count
FROM festivals
JOIN relation_bar_festival ON festivals.id = relation_bar_festival.festival_id
GROUP BY festivals.name;

-- Find the highest-rated beer
SELECT beers.name AS beer, ROUND(AVG(visitor_beer_reviews.rating),2) AS average_rating
FROM beers
JOIN visitor_beer_reviews ON beers.id = visitor_beer_reviews.beer_id
GROUP BY beers.name
ORDER BY average_rating DESC
LIMIT 1;

-- Find visitors born before 1990
SELECT name, surname, birth_date
FROM visitors
WHERE birth_date < '1990-01-01';

-- Get reviews for a specific bar
SELECT content, rating
FROM visitor_bar_reviews
WHERE bar_id = 1;

-- List all beers available in bars along with their prices
SELECT beers.name AS beer, bars.name AS bar, relation_beer_bar.price
FROM relation_beer_bar
JOIN beers ON relation_beer_bar.beer_id = beers.id
JOIN bars ON relation_beer_bar.bar_id = bars.id;

-- Get all reviews of festivals by visitors
SELECT visitors.name AS visitor, festivals.name AS festival, visitor_festival_reviews.content, visitor_festival_reviews.rating
FROM visitor_festival_reviews
JOIN visitors ON visitor_festival_reviews.visitor_id = visitors.id
JOIN festivals ON visitor_festival_reviews.festival_id = festivals.id;

-- Find all bars in Berlin that participated in Oktoberfest
SELECT bars.name AS bar
FROM bars
JOIN festivals ON bars.festival_id = festivals.id
JOIN cities ON festivals.city_id = cities.id
WHERE cities.name = 'Berlin' AND festivals.name = 'Oktoberfest';

-- Find the top 3 highest-rated beers with their average ratings
SELECT beers.name AS beer, ROUND(AVG(visitor_beer_reviews.rating), 2) AS average_rating
FROM beers
JOIN visitor_beer_reviews ON beers.id = visitor_beer_reviews.beer_id
GROUP BY beers.name
ORDER BY average_rating DESC
LIMIT 3;

-- List festivals with bars offering beers cheaper than $6.00
SELECT DISTINCT festivals.name AS festival
FROM festivals
JOIN relation_bar_festival ON festivals.id = relation_bar_festival.festival_id
JOIN relation_beer_bar ON relation_bar_festival.bar_id = relation_beer_bar.bar_id
WHERE relation_beer_bar.price < 6.00;

-- Find visitors who reviewed both bars and festivals
SELECT DISTINCT visitors.name, visitors.surname
FROM visitors
JOIN visitor_bar_reviews ON visitors.id = visitor_bar_reviews.visitor_id
JOIN visitor_festival_reviews ON visitors.id = visitor_festival_reviews.visitor_id;