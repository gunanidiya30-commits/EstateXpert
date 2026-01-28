-- 3E.2: Locality price trends seed (last 3 years)

INSERT INTO locality_price_trends (locality_id, year, avg_price)
SELECT id, 2022, ROUND(RAND() * 3000000 + 7000000) FROM localities;

INSERT INTO locality_price_trends (locality_id, year, avg_price)
SELECT id, 2023, ROUND(RAND() * 3000000 + 8000000) FROM localities;

INSERT INTO locality_price_trends (locality_id, year, avg_price)
SELECT id, 2024, ROUND(RAND() * 3000000 + 9000000) FROM localities;
