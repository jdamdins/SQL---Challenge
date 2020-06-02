-- Drop table if exists
DROP TABLE firepower;

-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	rank INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT
);

-- Import data from firepower.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM firepower;

-- Find the rows that have a ReservePersonnel of 0 and remove these rows from dataset.

DELETE FROM firepower WHERE reservepersonnel =0;

-- Let's add one to each nation that has none.  
UPDATE firepower SET fighteraircraft =1 WHERE fighteraircraft =0;

-- Check if there is any none left
SELECT * FROM firepower WHERE fighteraircraft =0;

-- find the Averages and rename the columns 
SELECT ROUND(AVG(totalmilitarypersonnel), 0) AS averagemilitarypersonnel FROM firepower;
SELECT ROUND(AVG(totalaircraftstrength), 0) AS averageaircraftstrength FROM firepower;
SELECT ROUND(AVG(totalhelicopterstrength), 0) AS averagehelicopterstrength FROM firepower;
SELECT ROUND(AVG(totalpopulation), 0) AS averagepopulation FROM firepower;
