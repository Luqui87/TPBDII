CREATE TABLE City (
    city_id INT NOT NULL PRIMARY KEY,
    city_name varchar(50),
    city_country varchar(50)
);

CREATE TABLE Band(
    band_id INT NOT NULL PRIMARY KEY,
    band_name varchar(50) NOT NULL,
    band_FormationDate DATE,
    band_MonthlyListeners INT
);

CREATE TABLE Musician(
    musician_dni INT NOT NULL PRIMARY KEY,
    band_id INT FOREIGN KEY REFERENCES Band(band_id),
    city_id INT FOREIGN KEY REFERENCES City(city_id),
    musician_name varchar(50) NOT NULL,
    musician_lastName varchar(50) NOT NULL,
    musician_instrument varchar(50) NOT NULL
);

CREATE TABLE Venue(
    venue_id INT NOT NULL PRIMARY KEY,
    venue_name varchar(50) NOT NULL,
    city_id INT FOREIGN KEY REFERENCES City(city_id),
    venue_address varchar(50),
    venue_capacity INT NOT NULL,
    venue_email varchar(50)
);

CREATE TABLE Show(
    venue_id INT FOREIGN KEY REFERENCES Venue(venue_id),
    show_date DATE NOT NULL,
    band_id INT FOREIGN KEY REFERENCES Band(band_id),
    show_price INT NOT NULL,
    CONSTRAINT PK_Show PRIMARY KEY (venue_id, show_date)
)