DROP TABLE IF EXISTS Fact_Booking CASCADE;
DROP TABLE IF EXISTS Dim_Hotel CASCADE;
DROP TABLE IF EXISTS Dim_Country CASCADE;
DROP TABLE IF EXISTS Dim_MarketSegment CASCADE;
DROP TABLE IF EXISTS Dim_Date CASCADE;

CREATE TABLE Dim_Hotel (
    hotel_key SERIAL PRIMARY KEY,
    hotel_name VARCHAR(50) UNIQUE
);

CREATE TABLE Dim_Country (
    country_key SERIAL PRIMARY KEY,
    country_code VARCHAR(10) UNIQUE
);

CREATE TABLE Dim_MarketSegment (
    market_key SERIAL PRIMARY KEY,
    segment_name VARCHAR(50) UNIQUE
);

CREATE TABLE Dim_Date (
    date_key SERIAL PRIMARY KEY,
    arrival_year INT,
    arrival_month VARCHAR(20),
    arrival_week INT,
    arrival_day INT
);

CREATE TABLE Fact_Booking (
    booking_id SERIAL PRIMARY KEY,
    hotel_key INT REFERENCES Dim_Hotel(hotel_key),
    country_key INT REFERENCES Dim_Country(country_key),
    market_key INT REFERENCES Dim_MarketSegment(market_key),
    date_key INT REFERENCES Dim_Date(date_key),
    lead_time INT,
    adr FLOAT,
    guests_total FLOAT,
    is_canceled INT
);