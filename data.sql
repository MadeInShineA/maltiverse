-- Countries
INSERT INTO countries ("id", "name") VALUES
(1, 'France'),
(2, 'Germany'),
(3, 'United States');

-- Cities
INSERT INTO cities ("id", "name", "country_id") VALUES
(1, 'Paris', 1),
(2, 'Berlin', 2),
(3, 'New York', 3);

-- Festivals
INSERT INTO festivals ("id", "name", "start_date", "end_date", "city_id") VALUES
(1, 'Oktoberfest', '2024-09-21 12:00:00', '2024-10-06 23:59:59', 2),
(2, 'BrewFest NYC', '2024-06-15 10:00:00', '2024-06-16 22:00:00', 3),
(3, 'Paris Beer Festival', '2024-05-01 11:00:00', '2024-05-05 21:00:00', 1);

-- Visitors
INSERT INTO visitors ("id", "name", "surname", "sex", "birth_date") VALUES
(1, 'Alice', 'Smith', TRUE, '1990-03-15'),
(2, 'Bob', 'Johnson', FALSE, '1985-07-22'),
(3, 'Charlie', 'Brown', TRUE, '1993-12-05');

-- Bars
INSERT INTO bars ("id", "name", "address", "festival_id") VALUES
(1, 'Berlin Bar', '123 Fest Road', 1),
(2, 'Brewmasters NYC', '456 Ale Street', 2),
(3, 'Parisian Pub', '789 Beer Blvd', 3);

-- Beer Types
INSERT INTO beer_types ("id", "name") VALUES
(1, 'Lager'),
(2, 'IPA'),
(3, 'Stout'),
(4, 'Pilsner');

-- Beer Brands
INSERT INTO beer_brands ("id", "name") VALUES
(1, 'Heineken'),
(2, 'Guinness'),
(3, 'Budweiser');

-- Beers
INSERT INTO beers ("id", "name", "type_id", "brand_id", "alcool_percentage") VALUES
(1, 'Heineken Lager', 1, 1, 5.0),
(2, 'Guinness Stout', 3, 2, 6.0),
(3, 'Budweiser Pilsner', 4, 3, 4.5);

-- Visitor Beer Reviews
INSERT INTO visitor_beer_reviews ("id", "content", "rating", "beer_id", "visitor_id") VALUES
(1, 'Great taste and smooth!', 5, 1, 1),
(2, 'Too bitter for my liking.', 3, 2, 2),
(3, 'Perfect for summer evenings.', 4, 3, 3);

-- Visitor Bar Reviews
INSERT INTO visitor_bar_reviews ("id", "content", "rating", "bar_id", "visitor_id") VALUES
(1, 'Great atmosphere and service.', 5, 1, 1),
(2, 'Crowded but fun.', 4, 2, 2),
(3, 'Friendly staff and good beer selection.', 5, 3, 3);

-- Visitor Festival Reviews
INSERT INTO visitor_festival_reviews ("id", "content", "rating", "festival_id", "visitor_id") VALUES
(1, 'Amazing experience!', 5, 1, 1),
(2, 'Well organized and lots of beer!', 5, 2, 2),
(3, 'Had a great time with friends.', 4, 3, 3);

-- Relation Bar Festival
INSERT INTO relation_bar_festival ("bar_id", "festival_id") VALUES
(1, 1),
(2, 2),
(3, 3);

-- Relation Beer Bar
INSERT INTO relation_beer_bar ("bar_id", "beer_id", "price", "quantity") VALUES
(1, 1, 6.5, 100),
(2, 2, 7.0, 50),
(3, 3, 5.5, 75);
