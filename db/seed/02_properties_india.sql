INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Builder Floor near Connaught Place',
    'Well-lit 3BHK builder floor close to metro and central business district.',
    22000000,
    'residential',
    'Delhi',
    'New Delhi',
    'Connaught Place',
    1650,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Karol Bagh',
    'Compact 2BHK suitable for small families with nearby markets.',
    14500000,
    'residential',
    'Delhi',
    'New Delhi',
    'Karol Bagh',
    980,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Office Space near Barakhamba Road',
    'Commercial office space ideal for startups and consultancies.',
    30000000,
    'commercial',
    'Delhi',
    'New Delhi',
    'Barakhamba Road',
    2100,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental Apartment in Lajpat Nagar',
    'Fully furnished 2BHK rental with balcony and parking.',
    42000,
    'rental',
    'Delhi',
    'New Delhi',
    'Lajpat Nagar',
    1050,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Apartment in Dwarka Sector 10',
    'Spacious society apartment with clubhouse and security.',
    13500000,
    'residential',
    'Delhi',
    'Dwarka',
    'Sector 10',
    1500,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Dwarka Sector 7',
    'Affordable 2BHK near schools and metro station.',
    9800000,
    'residential',
    'Delhi',
    'Dwarka',
    'Sector 7',
    1100,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Retail Shop in Dwarka Sector 12',
    'Ground floor commercial shop suitable for retail business.',
    18000000,
    'commercial',
    'Delhi',
    'Dwarka',
    'Sector 12',
    900,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '1BHK Rental in Dwarka Sector 9',
    'Semi-furnished 1BHK rental for working professionals.',
    22000,
    'rental',
    'Delhi',
    'Dwarka',
    'Sector 9',
    650,
    1,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '4BHK Independent House in Rohini Sector 15',
    'Independent house with terrace and parking in a quiet locality.',
    25000000,
    'residential',
    'Delhi',
    'Rohini',
    'Sector 15',
    2400,
    4,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '3BHK Apartment in Rohini Sector 11',
    'Family-friendly apartment close to parks and schools.',
    12500000,
    'residential',
    'Delhi',
    'Rohini',
    'Sector 11',
    1400,
    3,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Warehouse Space in Rohini Industrial Area',
    'Commercial warehouse suitable for storage and logistics.',
    20000000,
    'commercial',
    'Delhi',
    'Rohini',
    'Industrial Area',
    3200,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental Apartment in Rohini Sector 16',
    'Well-maintained 2BHK rental with lift and security.',
    26000,
    'rental',
    'Delhi',
    'Rohini',
    'Sector 16',
    1000,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);


INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Apartment in Noida Sector 62',
    'Modern 3BHK apartment near IT parks and expressway.',
    12500000,
    'residential',
    'Uttar Pradesh',
    'Noida',
    'Sector 62',
    1450,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Noida Sector 75',
    'Well-planned 2BHK in gated society with amenities.',
    9200000,
    'residential',
    'Uttar Pradesh',
    'Noida',
    'Sector 75',
    1050,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'IT Office Space in Noida Sector 63',
    'Commercial office space suitable for IT and startups.',
    28000000,
    'commercial',
    'Uttar Pradesh',
    'Noida',
    'Sector 63',
    2300,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental Apartment in Noida Sector 50',
    'Semi-furnished 2BHK rental near metro station.',
    28000,
    'rental',
    'Uttar Pradesh',
    'Noida',
    'Sector 50',
    1100,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Apartment in Indirapuram',
    'Spacious 3BHK apartment with good road connectivity.',
    9800000,
    'residential',
    'Uttar Pradesh',
    'Ghaziabad',
    'Indirapuram',
    1500,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Vaishali',
    'Affordable 2BHK suitable for first-time buyers.',
    7800000,
    'residential',
    'Uttar Pradesh',
    'Ghaziabad',
    'Vaishali',
    1000,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Retail Shop in Kaushambi',
    'Commercial retail shop on main road with high footfall.',
    16500000,
    'commercial',
    'Uttar Pradesh',
    'Ghaziabad',
    'Kaushambi',
    850,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '1BHK Rental in Raj Nagar Extension',
    'Compact 1BHK rental ideal for working professionals.',
    16000,
    'rental',
    'Uttar Pradesh',
    'Ghaziabad',
    'Raj Nagar Extension',
    600,
    1,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '4BHK Independent House in Gomti Nagar',
    'Independent house with lawn in premium residential area.',
    18500000,
    'residential',
    'Uttar Pradesh',
    'Lucknow',
    'Gomti Nagar',
    2600,
    4,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '3BHK Apartment in Alambagh',
    'Family-friendly apartment close to schools and markets.',
    9200000,
    'residential',
    'Uttar Pradesh',
    'Lucknow',
    'Alambagh',
    1350,
    3,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Office Space in Hazratganj',
    'Commercial office space in central business district.',
    24000000,
    'commercial',
    'Uttar Pradesh',
    'Lucknow',
    'Hazratganj',
    2000,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental Apartment in Indira Nagar',
    'Well-maintained 2BHK rental with parking facility.',
    24000,
    'rental',
    'Uttar Pradesh',
    'Lucknow',
    'Indira Nagar',
    1050,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);


INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Apartment in Sector 22',
    'Well-planned 3BHK apartment in a prime residential sector.',
    11500000,
    'residential',
    'Punjab',
    'Chandigarh',
    'Sector 22',
    1400,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Sector 35',
    'Comfortable 2BHK close to markets and public transport.',
    9200000,
    'residential',
    'Punjab',
    'Chandigarh',
    'Sector 35',
    1050,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Office Space in Sector 17',
    'Commercial office space in the main business district.',
    26000000,
    'commercial',
    'Punjab',
    'Chandigarh',
    'Sector 17',
    1900,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental Apartment in Sector 44',
    'Fully furnished 2BHK rental suitable for families.',
    30000,
    'rental',
    'Punjab',
    'Chandigarh',
    'Sector 44',
    1100,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '4BHK Independent House in Sarabha Nagar',
    'Spacious independent house in a premium locality.',
    18500000,
    'residential',
    'Punjab',
    'Ludhiana',
    'Sarabha Nagar',
    2600,
    4,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '3BHK Apartment in Model Town',
    'Well-maintained 3BHK apartment near schools and parks.',
    9800000,
    'residential',
    'Punjab',
    'Ludhiana',
    'Model Town',
    1450,
    3,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Textile Showroom on Ferozepur Road',
    'Commercial showroom suitable for retail textile business.',
    22000000,
    'commercial',
    'Punjab',
    'Ludhiana',
    'Ferozepur Road',
    1800,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '1BHK Rental in Dugri',
    'Affordable 1BHK rental for working professionals.',
    14000,
    'rental',
    'Punjab',
    'Ludhiana',
    'Dugri',
    650,
    1,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Independent House near Ranjit Avenue',
    'Independent 3BHK house in a well-connected locality.',
    12500000,
    'residential',
    'Punjab',
    'Amritsar',
    'Ranjit Avenue',
    1750,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Mall Road Area',
    '2BHK apartment close to commercial hubs and schools.',
    8200000,
    'residential',
    'Punjab',
    'Amritsar',
    'Mall Road',
    1000,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Hotel Property near Golden Temple',
    'Commercial property suitable for boutique hotel or guest house.',
    35000000,
    'commercial',
    'Punjab',
    'Amritsar',
    'Golden Temple Road',
    3000,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental Apartment in Batala Road',
    'Well-ventilated 2BHK rental with easy city access.',
    22000,
    'rental',
    'Punjab',
    'Amritsar',
    'Batala Road',
    1050,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Apartment in DLF Phase 3',
    'Modern 3BHK apartment close to Cyber City and metro.',
    16500000,
    'residential',
    'Haryana',
    'Gurugram',
    'DLF Phase 3',
    1550,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Sector 57',
    'Well-ventilated 2BHK in a gated society.',
    9800000,
    'residential',
    'Haryana',
    'Gurugram',
    'Sector 57',
    1100,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'IT Office Space on Golf Course Road',
    'Premium commercial office space in a prime business corridor.',
    42000000,
    'commercial',
    'Haryana',
    'Gurugram',
    'Golf Course Road',
    2800,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental in Sector 46',
    'Semi-furnished 2BHK rental for working professionals.',
    38000,
    'rental',
    'Haryana',
    'Gurugram',
    'Sector 46',
    1150,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Builder Floor in Sector 15',
    'Spacious builder floor in a well-established sector.',
    11200000,
    'residential',
    'Haryana',
    'Faridabad',
    'Sector 15',
    1600,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Sector 21',
    'Affordable 2BHK apartment with good connectivity.',
    7200000,
    'residential',
    'Haryana',
    'Faridabad',
    'Sector 21',
    980,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Warehouse Space near Mathura Road',
    'Commercial warehouse suitable for logistics and storage.',
    25000000,
    'commercial',
    'Haryana',
    'Faridabad',
    'Mathura Road',
    3200,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '1BHK Rental in NIT Area',
    'Budget-friendly 1BHK rental near industrial zones.',
    12000,
    'rental',
    'Haryana',
    'Faridabad',
    'NIT',
    600,
    1,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '4BHK Independent House in Model Town',
    'Large independent house in a premium residential area.',
    13500000,
    'residential',
    'Haryana',
    'Panipat',
    'Model Town',
    2400,
    4,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '3BHK Apartment in Sector 18',
    'Family-friendly 3BHK apartment with ample parking.',
    8900000,
    'residential',
    'Haryana',
    'Panipat',
    'Sector 18',
    1450,
    3,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Textile Manufacturing Unit',
    'Commercial property suitable for textile manufacturing.',
    30000000,
    'commercial',
    'Haryana',
    'Panipat',
    'Industrial Area',
    3500,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental near GT Road',
    'Well-connected 2BHK rental close to highway access.',
    18000,
    'rental',
    'Haryana',
    'Panipat',
    'GT Road',
    1050,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);


INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Sea View Apartment in Worli',
    'Premium 3BHK apartment with partial sea view and modern amenities.',
    38500000,
    'residential',
    'Maharashtra',
    'Mumbai',
    'Worli',
    1650,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Andheri East',
    'Well-connected 2BHK apartment near metro and business hubs.',
    16500000,
    'residential',
    'Maharashtra',
    'Mumbai',
    'Andheri East',
    980,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Commercial Office in BKC',
    'Grade-A commercial office space in Bandra Kurla Complex.',
    72000000,
    'commercial',
    'Maharashtra',
    'Mumbai',
    'BKC',
    3200,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '1BHK Rental in Goregaon West',
    'Compact 1BHK rental ideal for working professionals.',
    32000,
    'rental',
    'Maharashtra',
    'Mumbai',
    'Goregaon West',
    550,
    1,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Apartment in Baner',
    'Spacious 3BHK in a fast-growing IT corridor.',
    14200000,
    'residential',
    'Maharashtra',
    'Pune',
    'Baner',
    1500,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Wakad',
    'Modern 2BHK apartment in a gated society.',
    9800000,
    'residential',
    'Maharashtra',
    'Pune',
    'Wakad',
    1050,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'IT Office Space in Hinjewadi',
    'Commercial office space suitable for startups and IT firms.',
    28500000,
    'commercial',
    'Maharashtra',
    'Pune',
    'Hinjewadi',
    2600,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental in Kothrud',
    'Well-maintained 2BHK rental near educational institutions.',
    26000,
    'rental',
    'Maharashtra',
    'Pune',
    'Kothrud',
    1100,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Independent House in Vishrambag',
    'Independent residential house in a peaceful neighborhood.',
    8200000,
    'residential',
    'Maharashtra',
    'Sangli',
    'Vishrambag',
    1850,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Kupwad Road',
    'Affordable 2BHK apartment with good connectivity.',
    5200000,
    'residential',
    'Maharashtra',
    'Sangli',
    'Kupwad Road',
    980,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Retail Shop in Market Yard',
    'Commercial retail space suitable for grocery or wholesale trade.',
    9500000,
    'commercial',
    'Maharashtra',
    'Sangli',
    'Market Yard',
    1200,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '1BHK Rental near ST Stand',
    'Budget-friendly 1BHK rental near transport facilities.',
    9000,
    'rental',
    'Maharashtra',
    'Sangli',
    'ST Stand Area',
    520,
    1,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '4BHK Independent Bungalow in Tarabai Park',
    'Premium independent bungalow in a prime residential locality.',
    14800000,
    'residential',
    'Maharashtra',
    'Kolhapur',
    'Tarabai Park',
    2600,
    4,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '3BHK Apartment in Shahupuri',
    'Spacious 3BHK apartment close to schools and hospitals.',
    8800000,
    'residential',
    'Maharashtra',
    'Kolhapur',
    'Shahupuri',
    1450,
    3,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Commercial Complex on Rankala Road',
    'Multi-use commercial property near tourist areas.',
    22500000,
    'commercial',
    'Maharashtra',
    'Kolhapur',
    'Rankala Road',
    2400,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental in Ujalaiwadi',
    'Comfortable 2BHK rental suitable for families.',
    15000,
    'rental',
    'Maharashtra',
    'Kolhapur',
    'Ujalaiwadi',
    1000,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Apartment in Whitefield',
    'Spacious 3BHK apartment close to IT parks and metro.',
    14800000,
    'residential',
    'Karnataka',
    'Bengaluru',
    'Whitefield',
    1550,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Yelahanka',
    'Well-planned 2BHK in a gated residential community.',
    9200000,
    'residential',
    'Karnataka',
    'Bengaluru',
    'Yelahanka',
    1100,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Tech Office Space in Electronic City',
    'Commercial office space suitable for IT and SaaS companies.',
    36000000,
    'commercial',
    'Karnataka',
    'Bengaluru',
    'Electronic City',
    3000,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '1BHK Rental in BTM Layout',
    'Affordable 1BHK rental near major tech corridors.',
    18000,
    'rental',
    'Karnataka',
    'Bengaluru',
    'BTM Layout',
    600,
    1,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '4BHK Independent House in Vijayanagar',
    'Large independent home in a peaceful residential locality.',
    12500000,
    'residential',
    'Karnataka',
    'Mysuru',
    'Vijayanagar',
    2400,
    4,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '3BHK Apartment near Hebbal',
    'Family-friendly 3BHK apartment with good road access.',
    7800000,
    'residential',
    'Karnataka',
    'Mysuru',
    'Hebbal',
    1450,
    3,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Retail Showroom on Kalidasa Road',
    'Commercial retail space in a high-footfall area.',
    16000000,
    'commercial',
    'Karnataka',
    'Mysuru',
    'Kalidasa Road',
    1800,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '2BHK Rental in Jayalakshmipuram',
    'Comfortable 2BHK rental close to schools and markets.',
    14000,
    'rental',
    'Karnataka',
    'Mysuru',
    'Jayalakshmipuram',
    1000,
    2,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title, description, price, property_type, state, city, locality, area_sqft, bhk, owner_id
) VALUES
(
    '3BHK Sea-Facing Apartment in Kadri',
    'Premium apartment with partial sea view and coastal breeze.',
    11800000,
    'residential',
    'Karnataka',
    'Mangaluru',
    'Kadri',
    1500,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Kankanady',
    'Well-maintained 2BHK apartment in a central locality.',
    7200000,
    'residential',
    'Karnataka',
    'Mangaluru',
    'Kankanady',
    1050,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Commercial Building near Hampankatta',
    'Commercial property ideal for offices or retail businesses.',
    21000000,
    'commercial',
    'Karnataka',
    'Mangaluru',
    'Hampankatta',
    2200,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '1BHK Rental near Surathkal',
    'Affordable 1BHK rental suitable for students and professionals.',
    9000,
    'rental',
    'Karnataka',
    'Mangaluru',
    'Surathkal',
    520,
    1,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);

INSERT INTO properties (
    title,
    description,
    price,
    property_type,
    state,
    city,
    locality,
    area_sqft,
    bhk,
    owner_id
) VALUES
(
    '3BHK Apartment in Indiranagar',
    'Premium 3BHK apartment in one of Bangalore’s prime residential areas.',
    16500000,
    'residential',
    'Karnataka',
    'Bangalore',
    'Indiranagar',
    1600,
    3,
    (SELECT id FROM users WHERE email = 'rohit.verma@gmail.com')
),
(
    '2BHK Apartment in Rajajinagar',
    'Well-ventilated 2BHK apartment with excellent road connectivity.',
    10200000,
    'residential',
    'Karnataka',
    'Bangalore',
    'Rajajinagar',
    1150,
    2,
    (SELECT id FROM users WHERE email = 'suresh.iyer@gmail.com')
),
(
    'Commercial Office Space in MG Road',
    'High-value commercial office space in Bangalore CBD.',
    42000000,
    'commercial',
    'Karnataka',
    'Bangalore',
    'MG Road',
    2800,
    0,
    (SELECT id FROM users WHERE email = 'anjali.deshpande@gmail.com')
),
(
    '1BHK Rental in Jayanagar',
    'Compact 1BHK rental ideal for professionals and small families.',
    20000,
    'rental',
    'Karnataka',
    'Bangalore',
    'Jayanagar',
    650,
    1,
    (SELECT id FROM users WHERE email = 'kunal.patel@gmail.com')
);