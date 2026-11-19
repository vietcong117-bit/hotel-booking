DROP TABLE IF EXISTS staging_hotel_bookings;

CREATE TABLE staging_hotel_bookings (
    hotel VARCHAR(50),
    is_canceled INT,
    lead_time INT,
    arrival_date_year INT,
    arrival_date_month VARCHAR(20),
    arrival_date_week_number INT,
    arrival_date_day_of_month INT,
    adults INT,
    children FLOAT,
    country VARCHAR(10),
    market_segment VARCHAR(50),
    adr FLOAT
);