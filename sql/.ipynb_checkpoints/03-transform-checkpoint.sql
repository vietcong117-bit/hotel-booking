INSERT INTO Dim_Hotel (hotel_name)
SELECT DISTINCT hotel FROM staging_hotel_bookings WHERE hotel IS NOT NULL
ON CONFLICT (hotel_name) DO NOTHING;

INSERT INTO Dim_Country (country_code)
SELECT DISTINCT country FROM staging_hotel_bookings WHERE country IS NOT NULL
ON CONFLICT (country_code) DO NOTHING;

INSERT INTO Dim_MarketSegment (segment_name)
SELECT DISTINCT market_segment FROM staging_hotel_bookings WHERE market_segment IS NOT NULL
ON CONFLICT (segment_name) DO NOTHING;

INSERT INTO Dim_Date (arrival_year, arrival_month, arrival_week, arrival_day)
SELECT DISTINCT arrival_date_year, arrival_date_month, arrival_date_week_number, arrival_date_day_of_month 
FROM staging_hotel_bookings;

INSERT INTO Fact_Booking (hotel_key, country_key, market_key, date_key, lead_time, adr, guests_total, is_canceled)
SELECT 
    dh.hotel_key,
    dc.country_key,
    dm.market_key,
    dd.date_key,
    s.lead_time,
    s.adr,
    (s.adults + s.children) AS guests_total,
    s.is_canceled
FROM staging_hotel_bookings s
JOIN Dim_Hotel dh ON s.hotel = dh.hotel_name
JOIN Dim_Country dc ON s.country = dc.country_code
JOIN Dim_MarketSegment dm ON s.market_segment = dm.segment_name
JOIN Dim_Date dd ON s.arrival_date_year = dd.arrival_year 
                 AND s.arrival_date_month = dd.arrival_month 
                 AND s.arrival_date_day_of_month = dd.arrival_day;