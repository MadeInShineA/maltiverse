CREATE TABLE `festivals` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `start_date` timestamp,
  `end_date` timestamp,
  `city_id` integer
);

CREATE TABLE `visitors` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `surname` varchar(255),
  `sex` boolean,
  `birth_date` date
);

CREATE TABLE `bars` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `address` varchar(255),
);

CREATE TABLE `beers` (
  `id` integer,
  `name` varchar(255),
  `type_id` integer,
  `brand_id` integer,
  `alcool_percentage` float
);

CREATE TABLE `beer_types` (
  `id` integer,
  `name` varchar(255)
);

CREATE TABLE `beer_brands` (
  `id` integer,
  `name` varchar(255)
);

CREATE TABLE `visitor_beer_reviews` (
  `id` integer,
  `created_at` timestamp,
  `content` varchar(255),
  `rating` integer,
  `beer_id` integer,
  `visitor_id` integer
);

CREATE TABLE `visitor_bar_reviews` (
  `id` integer,
  `created_at` timestamp,
  `content` varchar(255),
  `rating` integer,
  `bar_id` integer,
  `visitor_id` integer
);

CREATE TABLE `visitor_festival_reviews` (
  `id` integer,
  `created_at` timestamp,
  `content` varchar(255),
  `rating` integer,
  `festival_id` integer,
  `visitor_id` integer
);

CREATE TABLE `relation_bar_festival` (
  `bar_id` integer,
  `festival_id` integer
);

CREATE TABLE `relation_beer_bar` (
  `bar_id` integer,
  `beer_id` integer,
  `price` float,
  `quantity` integer
);

CREATE TABLE `cities` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `country_id` integer
);

CREATE TABLE `countries` (
  `id` integer PRIMARY KEY,
  `name` varchar(255)
);

ALTER TABLE `relation_bar_festival` ADD FOREIGN KEY (`bar_id`) REFERENCES `bars` (`id`);

ALTER TABLE `relation_bar_festival` ADD FOREIGN KEY (`festival_id`) REFERENCES `festivals` (`id`);

ALTER TABLE `beer` ADD FOREIGN KEY (`brand_id`) REFERENCES `beer_brands` (`id`);

ALTER TABLE `visitor_bar_reviews` ADD FOREIGN KEY (`bar_id`) REFERENCES `bars` (`id`);

ALTER TABLE `visitor_bar_reviews` ADD FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`id`);

ALTER TABLE `relation_beer_bar` ADD FOREIGN KEY (`bar_id`) REFERENCES `bars` (`id`);

ALTER TABLE `relation_beer_bar` ADD FOREIGN KEY (`beer_id`) REFERENCES `beers` (`id`);

ALTER TABLE `beers` ADD FOREIGN KEY (`type_id`) REFERENCES `beer_types` (`id`);

ALTER TABLE `visitor_festival_reviews` ADD FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`id`);

ALTER TABLE `visitor_festival_reviews` ADD FOREIGN KEY (`festival_id`) REFERENCES `festivals` (`id`);

ALTER TABLE `visitor_beer_reviews` ADD FOREIGN KEY (`beer_id`) REFERENCES `beers` (`id`);

ALTER TABLE `visitor_beer_reviews` ADD FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`id`);

ALTER TABLE `cities` ADD FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

ALTER TABLE `festivals` ADD FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);
