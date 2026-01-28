-- 3A.4: Localities seeded strictly from properties_seed (approx lat/lng, deterministic)

INSERT INTO localities (name, city, state, latitude, longitude) VALUES
-- Delhi / NCR
('Connaught Place','New Delhi','Delhi',28.6315,77.2167),
('Karol Bagh','New Delhi','Delhi',28.6517,77.1900),
('Barakhamba Road','New Delhi','Delhi',28.6297,77.2245),
('Lajpat Nagar','New Delhi','Delhi',28.5677,77.2436),

('Sector 10','Dwarka','Delhi',28.5780,77.0564),
('Sector 7','Dwarka','Delhi',28.5847,77.0714),
('Sector 12','Dwarka','Delhi',28.5921,77.0460),
('Sector 9','Dwarka','Delhi',28.5743,77.0649),

('Sector 15','Rohini','Delhi',28.7215,77.1201),
('Sector 11','Rohini','Delhi',28.7320,77.1153),
('Industrial Area','Rohini','Delhi',28.7395,77.1027),
('Sector 16','Rohini','Delhi',28.7167,77.1246),

-- Uttar Pradesh
('Sector 62','Noida','Uttar Pradesh',28.6280,77.3649),
('Sector 75','Noida','Uttar Pradesh',28.5700,77.3850),
('Sector 63','Noida','Uttar Pradesh',28.6239,77.3894),
('Sector 50','Noida','Uttar Pradesh',28.5660,77.3725),

('Indirapuram','Ghaziabad','Uttar Pradesh',28.6469,77.3690),
('Vaishali','Ghaziabad','Uttar Pradesh',28.6496,77.3397),
('Kaushambi','Ghaziabad','Uttar Pradesh',28.6465,77.3210),
('Raj Nagar Extension','Ghaziabad','Uttar Pradesh',28.7010,77.4323),

('Gomti Nagar','Lucknow','Uttar Pradesh',26.8500,81.0080),
('Alambagh','Lucknow','Uttar Pradesh',26.8043,80.9166),
('Hazratganj','Lucknow','Uttar Pradesh',26.8506,80.9415),
('Indira Nagar','Lucknow','Uttar Pradesh',26.8800,80.9985),

-- Punjab
('Sector 22','Chandigarh','Punjab',30.7333,76.7794),
('Sector 35','Chandigarh','Punjab',30.7205,76.7620),
('Sector 17','Chandigarh','Punjab',30.7415,76.7821),
('Sector 44','Chandigarh','Punjab',30.7025,76.7560),

('Sarabha Nagar','Ludhiana','Punjab',30.8915,75.8342),
('Model Town','Ludhiana','Punjab',30.9120,75.8420),
('Ferozepur Road','Ludhiana','Punjab',30.8810,75.8250),
('Dugri','Ludhiana','Punjab',30.8700,75.8200),

('Ranjit Avenue','Amritsar','Punjab',31.6340,74.8723),
('Mall Road','Amritsar','Punjab',31.6300,74.8720),
('Golden Temple Road','Amritsar','Punjab',31.6200,74.8765),
('Batala Road','Amritsar','Punjab',31.6460,74.8650),

-- Haryana
('DLF Phase 3','Gurugram','Haryana',28.4975,77.0910),
('Sector 57','Gurugram','Haryana',28.4257,77.0770),
('Golf Course Road','Gurugram','Haryana',28.4595,77.0965),
('Sector 46','Gurugram','Haryana',28.4410,77.0670),

('Sector 15','Faridabad','Haryana',28.4089,77.3178),
('Sector 21','Faridabad','Haryana',28.4300,77.3040),
('Mathura Road','Faridabad','Haryana',28.4200,77.3050),
('NIT','Faridabad','Haryana',28.3940,77.3060),

('Model Town','Panipat','Haryana',29.3900,76.9630),
('Sector 18','Panipat','Haryana',29.3780,76.9770),
('Industrial Area','Panipat','Haryana',29.3950,76.9580),
('GT Road','Panipat','Haryana',29.3870,76.9690),

-- Maharashtra
('Worli','Mumbai','Maharashtra',19.0176,72.8162),
('Andheri East','Mumbai','Maharashtra',19.1197,72.8464),
('BKC','Mumbai','Maharashtra',19.0596,72.8697),
('Goregaon West','Mumbai','Maharashtra',19.1650,72.8490),

('Baner','Pune','Maharashtra',18.5590,73.7868),
('Wakad','Pune','Maharashtra',18.5993,73.7640),
('Hinjewadi','Pune','Maharashtra',18.5913,73.7389),
('Kothrud','Pune','Maharashtra',18.5074,73.8077),

('Vishrambag','Sangli','Maharashtra',16.8520,74.5810),
('Kupwad Road','Sangli','Maharashtra',16.8360,74.5950),
('Market Yard','Sangli','Maharashtra',16.8525,74.5740),
('ST Stand Area','Sangli','Maharashtra',16.8490,74.5780),

('Tarabai Park','Kolhapur','Maharashtra',16.7050,74.2430),
('Shahupuri','Kolhapur','Maharashtra',16.7020,74.2300),
('Rankala Road','Kolhapur','Maharashtra',16.6950,74.2380),
('Ujalaiwadi','Kolhapur','Maharashtra',16.6640,74.2690),

-- Karnataka
('Whitefield','Bengaluru','Karnataka',12.9698,77.7500),
('Yelahanka','Bengaluru','Karnataka',13.1007,77.5963),
('Electronic City','Bengaluru','Karnataka',12.8390,77.6770),
('BTM Layout','Bengaluru','Karnataka',12.9166,77.6101),

('Vijayanagar','Mysuru','Karnataka',12.3090,76.6380),
('Hebbal','Mysuru','Karnataka',12.3400,76.6100),
('Kalidasa Road','Mysuru','Karnataka',12.3000,76.6500),
('Jayalakshmipuram','Mysuru','Karnataka',12.3200,76.6400),

('Kadri','Mangaluru','Karnataka',12.8820,74.8450),
('Kankanady','Mangaluru','Karnataka',12.8700,74.8600),
('Hampankatta','Mangaluru','Karnataka',12.8710,74.8420),
('Surathkal','Mangaluru','Karnataka',13.0050,74.7940),

('Indiranagar','Bangalore','Karnataka',12.9719,77.6412),
('Rajajinagar','Bangalore','Karnataka',12.9850,77.5530),
('MG Road','Bangalore','Karnataka',12.9758,77.6055),
('Jayanagar','Bangalore','Karnataka',12.9304,77.5838);


UPDATE localities
SET lqi = CASE name

-- 🔴 DELHI / NCR
WHEN 'Connaught Place' THEN 88
WHEN 'Barakhamba Road' THEN 85
WHEN 'Karol Bagh' THEN 72
WHEN 'Lajpat Nagar' THEN 78

WHEN 'Sector 10' THEN 70
WHEN 'Sector 7' THEN 72
WHEN 'Sector 12' THEN 68
WHEN 'Sector 9' THEN 66

WHEN 'Sector 15' THEN 69
WHEN 'Sector 11' THEN 67
WHEN 'Industrial Area' THEN 58
WHEN 'Sector 16' THEN 65

-- 🟠 NOIDA / GHAZIABAD
WHEN 'Sector 62' THEN 75
WHEN 'Sector 63' THEN 72
WHEN 'Sector 75' THEN 70
WHEN 'Sector 50' THEN 73

WHEN 'Indirapuram' THEN 74
WHEN 'Vaishali' THEN 71
WHEN 'Kaushambi' THEN 68
WHEN 'Raj Nagar Extension' THEN 65

-- 🟡 LUCKNOW
WHEN 'Hazratganj' THEN 82
WHEN 'Gomti Nagar' THEN 78
WHEN 'Indira Nagar' THEN 74
WHEN 'Alambagh' THEN 66

-- 🟢 CHANDIGARH
WHEN 'Sector 17' THEN 85
WHEN 'Sector 22' THEN 80
WHEN 'Sector 35' THEN 78
WHEN 'Sector 44' THEN 72

-- 🟡 LUDHIANA
WHEN 'Sarabha Nagar' THEN 76
WHEN 'Model Town' THEN 74
WHEN 'Ferozepur Road' THEN 70
WHEN 'Dugri' THEN 66

-- 🟡 AMRITSAR
WHEN 'Ranjit Avenue' THEN 74
WHEN 'Mall Road' THEN 76
WHEN 'Golden Temple Road' THEN 72
WHEN 'Batala Road' THEN 64

-- 🟢 GURUGRAM
WHEN 'Golf Course Road' THEN 88
WHEN 'DLF Phase 3' THEN 84
WHEN 'Sector 57' THEN 76
WHEN 'Sector 46' THEN 72

-- 🟡 FARIDABAD
WHEN 'Sector 15' THEN 70
WHEN 'Sector 21' THEN 68
WHEN 'Mathura Road' THEN 65
WHEN 'NIT' THEN 62

-- 🟡 PANIPAT
WHEN 'Model Town' THEN 66
WHEN 'Sector 18' THEN 64
WHEN 'GT Road' THEN 68
WHEN 'Industrial Area' THEN 58

-- 🔵 MUMBAI
WHEN 'BKC' THEN 90
WHEN 'Worli' THEN 88
WHEN 'Andheri East' THEN 80
WHEN 'Goregaon West' THEN 78

-- 🟢 PUNE
WHEN 'Baner' THEN 82
WHEN 'Hinjewadi' THEN 80
WHEN 'Wakad' THEN 76
WHEN 'Kothrud' THEN 78

-- 🟡 SANGLI
WHEN 'Vishrambag' THEN 68
WHEN 'Market Yard' THEN 65
WHEN 'ST Stand Area' THEN 62
WHEN 'Kupwad Road' THEN 60

-- 🟡 KOLHAPUR
WHEN 'Tarabai Park' THEN 72
WHEN 'Shahupuri' THEN 74
WHEN 'Rankala Road' THEN 70
WHEN 'Ujalaiwadi' THEN 62

-- 🔵 BENGALURU
WHEN 'MG Road' THEN 90
WHEN 'Indiranagar' THEN 88
WHEN 'Whitefield' THEN 82
WHEN 'Electronic City' THEN 78
WHEN 'BTM Layout' THEN 76
WHEN 'Rajajinagar' THEN 80
WHEN 'Jayanagar' THEN 84
WHEN 'Yelahanka' THEN 72

-- 🟡 MYSURU
WHEN 'Jayalakshmipuram' THEN 78
WHEN 'Vijayanagar' THEN 74
WHEN 'Hebbal' THEN 72
WHEN 'Kalidasa Road' THEN 76

-- 🟡 MANGALURU
WHEN 'Hampankatta' THEN 80
WHEN 'Kadri' THEN 76
WHEN 'Kankanady' THEN 74
WHEN 'Surathkal' THEN 68

ELSE 60
END;
