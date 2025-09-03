-- temperary table to store data
CREATE TABLE TEMP_Census_table (
    Country_Name   TEXT,
    Country_Code   TEXT,
    Indicator_Name TEXT,
	  Indicator_Code TEXT,
    `1960`         REAL,
    `1961`         REAL,
    `1962`         REAL,
    `1963`         REAL,
    `1964`         REAL,
    `1965`         REAL,
    `1966`         REAL,
    `1967`         REAL,
    `1968`         REAL,
    `1969`         REAL,
    `1970`         REAL,
    `1971`         REAL,
    `1972`         REAL,
    `1973`         REAL,
    `1974`         REAL,
    `1975`         REAL,
    `1976`         REAL,
    `1977`         REAL,
    `1978`         REAL,
    `1979`         REAL,
    `1980`         REAL,
    `1981`         REAL,
    `1982`         REAL,
    `1983`         REAL,
    `1984`         REAL,
    `1985`         REAL,
    `1986`         REAL,
    `1987`         REAL,
    `1988`         REAL,
    `1989`         REAL,
    `1990`         REAL,
    `1991`         REAL,
    `1992`         REAL,
    `1993`         REAL,
    `1994`         REAL,
    `1995`         REAL,
    `1996`         REAL,
    `1997`         REAL,
    `1998`         REAL,
    `1999`         REAL,
    `2000`         REAL,
    `2001`         REAL,
    `2002`         REAL,
    `2003`         REAL,
    `2004`         REAL,
    `2005`         REAL,
    `2006`         REAL,
    `2007`         REAL,
    `2008`         REAL,
    `2009`         REAL,
    `2010`         REAL,
    `2011`         REAL,
    `2012`         REAL,
    `2013`         REAL,
    `2014`         REAL,
    `2015`         REAL,
    `2016`         REAL,
    `2017`         REAL,
    `2018`         REAL,
    `2019`         REAL,
    `2020`         REAL,
    `2021`         REAL,
    `2022`         REAL,
    `2023`         REAL,
    `2024`         REAL
);

-- check to delete all the other values
DELETE FROM TEMP_Census_table
WHERE Country_Code NOT IN (
    'AFG', 'ALB', 'DZA', 'AND', 'AGO', 'ATG', 'ARG', 'ARM', 'AUS', 'AUT',
    'AZE', 'BHS', 'BHR', 'BGD', 'BRB', 'BLR', 'BEL', 'BLZ', 'BEN', 'BTN',
    'BOL', 'BIH', 'BWA', 'BRA', 'BRN', 'BGR', 'BFA', 'BDI', 'CPV', 'KHM',
    'CMR', 'CAN', 'CAF', 'TCD', 'CHL', 'CHN', 'COL', 'COM', 'COG', 'COD',
    'CRI', 'CIV', 'HRV', 'CUB', 'CYP', 'CZE', 'DNK', 'DJI', 'DMA', 'DOM',
    'ECU', 'EGY', 'SLV', 'GNQ', 'ERI', 'EST', 'SWZ', 'ETH', 'FJI', 'FIN',
    'FRA', 'GAB', 'GMB', 'GEO', 'DEU', 'GHA', 'GRC', 'GRD', 'GTM', 'GIN',
    'GNB', 'GUY', 'HTI', 'HND', 'HUN', 'ISL', 'IND', 'IDN', 'IRN', 'IRQ',
    'IRL', 'ITA', 'JAM', 'JPN', 'JOR', 'KAZ', 'KEN', 'KIR', 'PRK', 'KOR',
    'KWT', 'KGZ', 'LAO', 'LVA', 'LBN', 'LSO', 'LBR', 'LBY', 'LIE', 'LTU',
    'LUX', 'MDG', 'MWI', 'MYS', 'MDV', 'MLI', 'MLT', 'MHL', 'MRT', 'MUS',
    'MEX', 'FSM', 'MDA', 'MCO', 'MNG', 'MNE', 'MAR', 'MOZ', 'MMR', 'NAM',
    'NRU', 'NPL', 'NLD', 'NZL', 'NIC', 'NER', 'NGA', 'NOR', 'OMN', 'PAK',
    'PLW', 'PAN', 'PNG', 'PRY', 'PER', 'PHL', 'POL', 'PRT', 'QAT', 'ROU',
    'RUS', 'RWA', 'KNA', 'LCA', 'VCT', 'WSM', 'SMR', 'STP', 'SAU', 'SEN',
    'SRB', 'SYC', 'SLE', 'SGP', 'SVK', 'SVN', 'SLB', 'SOM', 'ZAF', 'SSD',
    'ESP', 'LKA', 'SDN', 'SUR', 'SWE', 'CHE', 'SYR', 'TJK', 'TZA', 'THA',
    'TLS', 'TGO', 'TON', 'TTO', 'TUN', 'TUR', 'TKM', 'TUV', 'UGA', 'UKR',
    'ARE', 'GBR', 'USA', 'URY', 'UZB', 'VUT', 'VAT', 'VEN', 'VNM', 'YEM',
    'ZMB', 'ZWE', 'PSE'
);

-- normalizing the scehma
-- a table to store countries data
CREATE TABLE countries_data (
    Country_Code VARCHAR(10) PRIMARY KEY,
    Country_Name TEXT NOT NULL
);

-- a table to store Post_colonial_era (this was done so i could divide the era for better handling)
CREATE TABLE Post_colonial_era (
    Country_Name TEXT,
    Country_Code VARCHAR(10),
    `1960`       REAL,
    `1961`       REAL,
    `1962`       REAL,
    `1963`       REAL,
    `1964`       REAL,
    `1965`       REAL,
    `1966`       REAL,
    `1967`       REAL,
    `1968`       REAL,
    `1969`       REAL,
    `1970`       REAL,
    `1971`       REAL,
    `1972`       REAL,
    `1973`       REAL,
    `1974`       REAL,
    `1975`       REAL,
    `1976`       REAL,
    `1977`       REAL,
    `1978`       REAL,
    `1979`       REAL
);

-- a table to store Globalization_Era (this was done so i could divide the era for better handling)
CREATE TABLE Globalization_Era (
    Country_Name TEXT,
    Country_Code VARCHAR(10),
    `1980`       REAL,
    `1981`       REAL,
    `1982`       REAL,
    `1983`       REAL,
    `1984`       REAL,
    `1985`       REAL,
    `1986`       REAL,
    `1987`       REAL,
    `1988`       REAL,
    `1989`       REAL,
    `1990`       REAL,
    `1991`       REAL,
    `1992`       REAL,
    `1993`       REAL,
    `1994`       REAL,
    `1995`       REAL,
    `1996`       REAL,
    `1997`       REAL,
    `1998`       REAL,
    `1999`       REAL
);

-- a table to store Millennium_and_Financial_Crisis (this was done so i could divide the era for better handling)
CREATE TABLE Millennium_and_Financial_Crisis (
    Country_Name TEXT,
    Country_Code VARCHAR(10),
    `2000`       REAL,
    `2001`       REAL,
    `2002`       REAL,
    `2003`       REAL,
    `2004`       REAL,
    `2005`       REAL,
    `2006`       REAL,
    `2007`       REAL,
    `2008`       REAL,
    `2009`       REAL
);

-- a table to store SDG_and_Digital_Transformation_Era (this was done so i could divide the era for better handling)
CREATE TABLE SDG_and_Digital_Transformation_Era (
    Country_Name TEXT,
    Country_Code VARCHAR(10),
    `2010`       REAL,
    `2011`       REAL,
    `2012`       REAL,
    `2013`       REAL,
    `2014`       REAL,
    `2015`       REAL,
    `2016`       REAL,
    `2017`       REAL,
    `2018`       REAL,
    `2019`       REAL
);

-- a table to store COVID_and_Recovery_Era (this was done so i could divide the era for better handling)
CREATE TABLE COVID_and_Recovery_Era (
    Country_Name TEXT,
    Country_Code VARCHAR(10),
    `2020`       REAL,
    `2021`       REAL,
    `2022`       REAL,
    `2023`       REAL,
    `2024`       REAL
);

INSERT INTO countries_data (Country_Code, Country_Name)
SELECT DISTINCT Country_Code, Country_Name
FROM TEMP_Census_table;

-- 1960–1979
INSERT INTO Post_colonial_era (
    Country_Name, Country_Code,
    `1960`,`1961`,`1962`,`1963`,`1964`,`1965`,`1966`,`1967`,
    `1968`,`1969`,`1970`,`1971`,`1972`,`1973`,`1974`,`1975`,
    `1976`,`1977`,`1978`,`1979`
)
SELECT
    c.Country_Name, c.Country_Code,
    tmp.`1960`, tmp.`1961`, tmp.`1962`, tmp.`1963`, tmp.`1964`, tmp.`1965`, tmp.`1966`, tmp.`1967`,
    tmp.`1968`, tmp.`1969`, tmp.`1970`, tmp.`1971`, tmp.`1972`, tmp.`1973`, tmp.`1974`, tmp.`1975`,
    tmp.`1976`, tmp.`1977`, tmp.`1978`, tmp.`1979`
FROM TEMP_Census_table tmp
JOIN countries_data c ON tmp.Country_Code = c.Country_Code;

-- 1980–1999
INSERT INTO Globalization_Era (
    Country_Name, Country_Code,
    `1980`,`1981`,`1982`,`1983`,`1984`,`1985`,`1986`,`1987`,
    `1988`,`1989`,`1990`,`1991`,`1992`,`1993`,`1994`,`1995`,
    `1996`,`1997`,`1998`,`1999`
)
SELECT
    c.Country_Name, c.Country_Code,
    tmp.`1980`, tmp.`1981`, tmp.`1982`, tmp.`1983`, tmp.`1984`, tmp.`1985`, tmp.`1986`, tmp.`1987`,
    tmp.`1988`, tmp.`1989`, tmp.`1990`, tmp.`1991`, tmp.`1992`, tmp.`1993`, tmp.`1994`, tmp.`1995`,
    tmp.`1996`, tmp.`1997`, tmp.`1998`, tmp.`1999`
FROM TEMP_Census_table tmp
JOIN countries_data c ON tmp.Country_Code = c.Country_Code;

-- 2000–2009
INSERT INTO Millennium_and_Financial_Crisis (
    Country_Name, Country_Code,
    `2000`,`2001`,`2002`,`2003`,`2004`,
    `2005`,`2006`,`2007`,`2008`,`2009`
)
SELECT
    c.Country_Name, c.Country_Code,
    tmp.`2000`, tmp.`2001`, tmp.`2002`, tmp.`2003`, tmp.`2004`,
    tmp.`2005`, tmp.`2006`, tmp.`2007`, tmp.`2008`, tmp.`2009`
FROM TEMP_Census_table tmp
JOIN countries_data c ON tmp.Country_Code = c.Country_Code;

-- 2010–2019
INSERT INTO SDG_and_Digital_Transformation_Era (
    Country_Name, Country_Code,
    `2010`,`2011`,`2012`,`2013`,`2014`,
    `2015`,`2016`,`2017`,`2018`,`2019`
)
SELECT
    c.Country_Name, c.Country_Code,
    tmp.`2010`, tmp.`2011`, tmp.`2012`, tmp.`2013`, tmp.`2014`,
    tmp.`2015`, tmp.`2016`, tmp.`2017`, tmp.`2018`, tmp.`2019`
FROM TEMP_Census_table tmp
JOIN countries_data c ON tmp.Country_Code = c.Country_Code;

-- 2020–2024
INSERT INTO COVID_and_Recovery_Era (
    Country_Name, Country_Code,
    `2020`,`2021`,`2022`,`2023`,`2024`
)
SELECT
    c.Country_Name, c.Country_Code,
    tmp.`2020`, tmp.`2021`, tmp.`2022`, tmp.`2023`, tmp.`2024`
FROM TEMP_Census_table tmp
JOIN countries_data c ON tmp.Country_Code = c.Country_Code;

CREATE VIEW Long_Format_Population_Data AS
SELECT
    c.country_name,
    pc.country_code,
    1960 AS year,
    pc.`1960` AS population
FROM Post_colonial_era pc
JOIN countries_data c ON pc.country_code = c.country_code
WHERE pc.`1960` IS NOT NULL

UNION ALL SELECT c.country_name, pc.country_code, 1961, pc.`1961` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1961` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1962, pc.`1962` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1962` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1963, pc.`1963` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1963` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1964, pc.`1964` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1964` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1965, pc.`1965` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1965` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1966, pc.`1966` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1966` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1967, pc.`1967` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1967` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1968, pc.`1968` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1968` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1969, pc.`1969` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1969` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1970, pc.`1970` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1970` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1971, pc.`1971` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1971` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1972, pc.`1972` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1972` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1973, pc.`1973` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1973` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1974, pc.`1974` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1974` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1975, pc.`1975` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1975` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1976, pc.`1976` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1976` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1977, pc.`1977` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1977` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1978, pc.`1978` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1978` IS NOT NULL
UNION ALL SELECT c.country_name, pc.country_code, 1979, pc.`1979` FROM Post_colonial_era pc JOIN countries_data c ON pc.country_code = c.country_code WHERE pc.`1979` IS NOT NULL

UNION ALL SELECT c.country_name, ge.country_code, 1980, ge.`1980` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1980` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1981, ge.`1981` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1981` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1982, ge.`1982` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1982` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1983, ge.`1983` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1983` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1984, ge.`1984` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1984` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1985, ge.`1985` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1985` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1986, ge.`1986` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1986` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1987, ge.`1987` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1987` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1988, ge.`1988` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1988` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1989, ge.`1989` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1989` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1990, ge.`1990` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1990` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1991, ge.`1991` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1991` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1992, ge.`1992` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1992` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1993, ge.`1993` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1993` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1994, ge.`1994` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1994` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1995, ge.`1995` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1995` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1996, ge.`1996` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1996` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1997, ge.`1997` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1997` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1998, ge.`1998` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1998` IS NOT NULL
UNION ALL SELECT c.country_name, ge.country_code, 1999, ge.`1999` FROM Globalization_Era ge JOIN countries_data c ON ge.country_code = c.country_code WHERE ge.`1999` IS NOT NULL

UNION ALL SELECT c.country_name, mf.country_code, 2000, mf.`2000` FROM Millennium_and_Financial_Crisis mf JOIN countries_data c ON mf.country_code = c.country_code WHERE mf.`2000` IS NOT NULL
UNION ALL SELECT c.country_name, mf.country_code, 2001, mf.`2001` FROM Millennium_and_Financial_Crisis mf JOIN countries_data c ON mf.country_code = c.country_code WHERE mf.`2001` IS NOT NULL
UNION ALL SELECT c.country_name, mf.country_code, 2002, mf.`2002` FROM Millennium_and_Financial_Crisis mf JOIN countries_data c ON mf.country_code = c.country_code WHERE mf.`2002` IS NOT NULL
UNION ALL SELECT c.country_name, mf.country_code, 2003, mf.`2003` FROM Millennium_and_Financial_Crisis mf JOIN countries_data c ON mf.country_code = c.country_code WHERE mf.`2003` IS NOT NULL
UNION ALL SELECT c.country_name, mf.country_code, 2004, mf.`2004` FROM Millennium_and_Financial_Crisis mf JOIN countries_data c ON mf.country_code = c.country_code WHERE mf.`2004` IS NOT NULL
UNION ALL SELECT c.country_name, mf.country_code, 2005, mf.`2005` FROM Millennium_and_Financial_Crisis mf JOIN countries_data c ON mf.country_code = c.country_code WHERE mf.`2005` IS NOT NULL
UNION ALL SELECT c.country_name, mf.country_code, 2006, mf.`2006` FROM Millennium_and_Financial_Crisis mf JOIN countries_data c ON mf.country_code = c.country_code WHERE mf.`2006` IS NOT NULL
UNION ALL SELECT c.country_name, mf.country_code, 2007, mf.`2007` FROM Millennium_and_Financial_Crisis mf JOIN countries_data c ON mf.country_code = c.country_code WHERE mf.`2007` IS NOT NULL
UNION ALL SELECT c.country_name, mf.country_code, 2008, mf.`2008` FROM Millennium_and_Financial_Crisis mf JOIN countries_data c ON mf.country_code = c.country_code WHERE mf.`2008` IS NOT NULL
UNION ALL SELECT c.country_name, mf.country_code, 2009, mf.`2009` FROM Millennium_and_Financial_Crisis mf JOIN countries_data c ON mf.country_code = c.country_code WHERE mf.`2009` IS NOT NULL

UNION ALL SELECT c.country_name, sdg.country_code, 2010, sdg.`2010` FROM SDG_and_Digital_Transformation_Era sdg JOIN countries_data c ON sdg.country_code = c.country_code WHERE sdg.`2010` IS NOT NULL
UNION ALL SELECT c.country_name, sdg.country_code, 2011, sdg.`2011` FROM SDG_and_Digital_Transformation_Era sdg JOIN countries_data c ON sdg.country_code = c.country_code WHERE sdg.`2011` IS NOT NULL
UNION ALL SELECT c.country_name, sdg.country_code, 2012, sdg.`2012` FROM SDG_and_Digital_Transformation_Era sdg JOIN countries_data c ON sdg.country_code = c.country_code WHERE sdg.`2012` IS NOT NULL
UNION ALL SELECT c.country_name, sdg.country_code, 2013, sdg.`2013` FROM SDG_and_Digital_Transformation_Era sdg JOIN countries_data c ON sdg.country_code = c.country_code WHERE sdg.`2013` IS NOT NULL
UNION ALL SELECT c.country_name, sdg.country_code, 2014, sdg.`2014` FROM SDG_and_Digital_Transformation_Era sdg JOIN countries_data c ON sdg.country_code = c.country_code WHERE sdg.`2014` IS NOT NULL
UNION ALL SELECT c.country_name, sdg.country_code, 2015, sdg.`2015` FROM SDG_and_Digital_Transformation_Era sdg JOIN countries_data c ON sdg.country_code = c.country_code WHERE sdg.`2015` IS NOT NULL
UNION ALL SELECT c.country_name, sdg.country_code, 2016, sdg.`2016` FROM SDG_and_Digital_Transformation_Era sdg JOIN countries_data c ON sdg.country_code = c.country_code WHERE sdg.`2016` IS NOT NULL
UNION ALL SELECT c.country_name, sdg.country_code, 2017, sdg.`2017` FROM SDG_and_Digital_Transformation_Era sdg JOIN countries_data c ON sdg.country_code = c.country_code WHERE sdg.`2017` IS NOT NULL
UNION ALL SELECT c.country_name, sdg.country_code, 2018, sdg.`2018` FROM SDG_and_Digital_Transformation_Era sdg JOIN countries_data c ON sdg.country_code = c.country_code WHERE sdg.`2018` IS NOT NULL
UNION ALL SELECT c.country_name, sdg.country_code, 2019, sdg.`2019` FROM SDG_and_Digital_Transformation_Era sdg JOIN countries_data c ON sdg.country_code = c.country_code WHERE sdg.`2019` IS NOT NULL

UNION ALL SELECT c.country_name, cov.country_code, 2020, cov.`2020` FROM COVID_and_Recovery_Era cov JOIN countries_data c ON cov.country_code = c.country_code WHERE cov.`2020` IS NOT NULL
UNION ALL SELECT c.country_name, cov.country_code, 2021, cov.`2021` FROM COVID_and_Recovery_Era cov JOIN countries_data c ON cov.country_code = c.country_code WHERE cov.`2021` IS NOT NULL
UNION ALL SELECT c.country_name, cov.country_code, 2022, cov.`2022` FROM COVID_and_Recovery_Era cov JOIN countries_data c ON cov.country_code = c.country_code WHERE cov.`2022` IS NOT NULL
UNION ALL SELECT c.country_name, cov.country_code, 2023, cov.`2023` FROM COVID_and_Recovery_Era cov JOIN countries_data c ON cov.country_code = c.country_code WHERE cov.`2023` IS NOT NULL
UNION ALL SELECT c.country_name, cov.country_code, 2024, cov.`2024` FROM COVID_and_Recovery_Era cov JOIN countries_data c ON cov.country_code = c.country_code WHERE cov.`2024` IS NOT NULL;

-- 2. **Global Population Growth**
CREATE VIEW Global_Population_Growth AS
SELECT
    year,
    SUM(population) AS total_population
FROM Long_Format_Population_Data
GROUP BY year
ORDER BY year;

CREATE VIEW Era_Analysis AS
SELECT
  c.country_name,
  c.country_code,
  'Post-Colonial' AS era,
  SUM(vp.population) AS total_population
FROM Long_Format_Population_Data vp
JOIN countries_data c ON c.country_code = vp.country_code
WHERE vp.year BETWEEN 1960 AND 1979
GROUP BY c.country_name, c.country_code
UNION ALL
SELECT
  c.country_name,
  c.country_code,
  'Globalization' AS era,
  SUM(vp.population) AS total_population
FROM Long_Format_Population_Data vp
JOIN countries_data c ON c.country_code = vp.country_code
WHERE vp.year BETWEEN 1980 AND 1999
GROUP BY c.country_name, c.country_code
UNION ALL
SELECT
  c.country_name,
  c.country_code,
  'Millennium_and_Financial_Crisis' AS era,
  SUM(vp.population) AS total_population
FROM Long_Format_Population_Data vp
JOIN countries_data c ON c.country_code = vp.country_code
WHERE vp.year BETWEEN 2000 AND 2009
GROUP BY c.country_name, c.country_code
UNION ALL
SELECT
  c.country_name,
  c.country_code,
  'SDG_and_digital_transformation_Era' AS era,
  SUM(vp.population) AS total_population
FROM Long_Format_Population_Data vp
JOIN countries_data c ON c.country_code = vp.country_code
WHERE vp.year BETWEEN 2010 AND 2019
GROUP BY c.country_name, c.country_code
UNION ALL
SELECT
  c.country_name,
  c.country_code,
  'COVID_and_Recovery_Era' AS era,
  SUM(vp.population) AS total_population
FROM Long_Format_Population_Data vp
JOIN countries_data c ON c.country_code = vp.country_code
WHERE vp.year BETWEEN 2020 AND 2024
GROUP BY c.country_name, c.country_code;

-- 4. **Cross-Era Country Comparison**
CREATE VIEW Cross_Era_Comparison AS
SELECT
    c.country_name,
    c.country_code,
    PC.`1960` AS post_colonial_1960,
    GE.`1980` AS globalization_1980,
    MF.`2000` AS millennium_2000,
    SDG.`2010` AS sdg_2010,
    cov.`2020` AS covid_2020
FROM Post_colonial_era PC
JOIN Globalization_Era GE ON GE.country_code = PC.country_code
JOIN Millennium_and_Financial_Crisis MF ON MF.country_code = PC.country_code
JOIN SDG_and_Digital_Transformation_Era SDG ON SDG.country_code = PC.country_code
JOIN COVID_and_Recovery_Era cov ON cov.country_code = PC.country_code
JOIN countries_data c ON c.country_code = PC.country_code;
