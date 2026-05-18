/*
	This is an SQL script to create the Celestial Bodies database
	submitted as a Certification Project towards completion of
	freeCodeCamp's Relational Databases Certification. 
	
	Steve Faning - 15/05/2026
*/

/* 
	First empty database of any tables to be created by script.
*/

DROP TABLE IF EXISTS galaxy, moon, planet, star;				/* required tables */
DROP TABLE IF EXISTS galaxy_type, constellation, star_system; 	/* auxiliary information */

/* Create tables */

CREATE TABLE galaxy_type (
	galaxy_type_id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE,
	description TEXT DEFAULT 'Not Provided'
);

CREATE TABLE constellation(
	/*
		People think of constellations as a group of stars. Often, it's a group of stars that looks like a particular shape in the sky and has been given a name. Today, there are 88 officially recognized constellations.
		
		Each constellation has:
			- A latin name (the English name or description is not used here).
			- Each constellation has an official three-letter abbreviation assigned by the International Astromomical Union (IAU), based on the genitive form of the constellation name.
	*/
	constellation_id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE,
	IAU_code TEXT NOT NULL UNIQUE
);
	
CREATE TABLE galaxy(
	galaxy_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE,
	galaxy_type_id INTEGER REFERENCES galaxy_type(galaxy_type_id),
	distance NUMERIC, 								/* in Mly */
	approximate_diameter INTEGER NOT NULL, 			/* in ly */
	estimated_mass NUMERIC NOT NULL,				/* in solar masses */
	constellation_id INTEGER REFERENCES constellation(constellation_id)	
);

CREATE TABLE star_system(
	star_system_id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE star(
	star_id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	galaxy_id INTEGER REFERENCES galaxy(galaxy_id),
	star_system_id INTEGER REFERENCES star_system(star_system_id),
	constellation_id INTEGER REFERENCES constellation(constellation_id),
	distance NUMERIC NOT NULL,			/* ly */
	mass NUMERIC NOT NULL				/* solar masses */
);

CREATE TABLE planet(
	planet_id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	distance NUMERIC NOT NULL,				/* From local star, in AU */
	mass NUMERIC NOT NULL,					/* Relative to Earth */
	moons INTEGER,							/* Number of known moons (not valid for exoplanets) */
	orbital_period NUMERIC NOT NULL,   		/* Earth days */
	surface_temp INTEGER NOT NULL,          /* Degrees K */
	exoplanet BOOLEAN NOT NULL,
	has_life BOOLEAN NOT NULL DEFAULT FALSE,
	star_id INTEGER REFERENCES star(star_id)
);

CREATE TABLE moon(
	moon_id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	planet_id INTEGER REFERENCES planet(planet_id),
	diameter NUMERIC NOT NULL,					/* km */
	orbital_distance INTEGER NOT NULL,			/* From planet, in km */
	orbital_period NUMERIC NOT NULL				/* days */
);


/*
	Populate the tables.
*/

INSERT INTO galaxy_type (name)
VALUES
	('Barred Spiral'),
	('Dwarf Spheroidal'),
	('Irregular Dwarf'),
	('Spiral');

INSERT INTO constellation (name, IAU_code)
VALUES
	('Andromeda', 'And'),
	('Antlia', 'Ant'),
	('Apus', 'Aps'),
	('Aquarius', 'Aqr'),
	('Aquila', 'Aql'),
	('Ara', 'Ara'),
	('Aries', 'Ari'),
	('Auriga', 'Aur'),
	('Boötes', 'Boo'),
	('Caelum', 'Cae'),
	('Camelopardalis', 'Cam'),
	('Cancer', 'Cnc'),
	('Canes Venatici', 'CVn'),
	('Canis Major', 'CMa'),
	('Canis Minor', 'CMi'),
	('Capricornus', 'Cap'),
	('Carina', 'Car'),
	('Cassiopeia', 'Cas'),
	('Centaurus', 'Cen'),
	('Cepheus', 'Cep'),
	('Cetus', 'Cet'),
	('Chamaeleon', 'Cha'),
	('Circinus', 'Cir'),
	('Columba', 'Col'),
	('Coma Berenices', 'Com'),
	('Corona Australis', 'CrA'),
	('Corona Borealis', 'CrB'),
	('Corvus', 'Crv'),
	('Crater', 'Crt'),
	('Crux', 'Cru'),
	('Cygnus', 'Cyg'),
	('Delphinus', 'Del'),
	('Dorado', 'Dor'),
	('Draco', 'Dra'),
	('Equuleus', 'Equ'),
	('Eridanus', 'Eri'),
	('Fornax', 'For'),
	('Gemini', 'Gem'),
	('Grus', 'Gru'),
	('Hercules', 'Her'),
	('Horologium', 'Hor'),
	('Hydra', 'Hya'),
	('Hydrus', 'Hyi'),
	('Indus', 'Ind'),
	('Lacerta', 'Lac'),
	('Leo', 'Leo'),
	('Leo Minor', 'LMi'),
	('Lepus', 'Lep'),
	('Libra', 'Lib'),
	('Lupus', 'Lup'),
	('Lynx', 'Lyn'),
	('Lyra', 'Lyr'),
	('Mensa', 'Men'),
	('Microscopium', 'Mic'),
	('Monoceros', 'Mon'),
	('Musca', 'Mus'),
	('Norma', 'Nor'),
	('Octans', 'Oct'),
	('Ophiuchus', 'Oph'),
	('Orion', 'Ori'),
	('Pavo', 'Pav'),
	('Pegasus', 'Peg'),
	('Perseus', 'Per'),
	('Phoenix', 'Phe'),
	('Pictor', 'Pic'),
	('Pisces', 'Psc'),
	('Piscis Austrinus', 'PsA'),
	('Puppis', 'Pup'),
	('Pyxis', 'Pyx'),
	('Reticulum', 'Ret'),
	('Sagitta', 'Sge'),
	('Sagittarius', 'Sgr'),
	('Scorpius', 'Sco'),
	('Sculptor', 'Scl'),
	('Scutum', 'Sct'),
	('Serpens', 'Ser'),
	('Sextans', 'Sex'),
	('Taurus', 'Tau'),
	('Telescopium', 'Tel'),
	('Triangulum', 'Tri'),
	('Triangulum Australe', 'TrA'),
	('Tucana', 'Tuc'),
	('Ursa Major', 'UMa'),
	('Ursa Minor', 'UMi'),
	('Vela', 'Vel'),
	('Virgo', 'Vir'),
	('Volans', 'Vol'),
	('Vulpecula', 'Vul')
;
	
INSERT INTO galaxy (name, galaxy_type_id, distance, approximate_diameter, estimated_mass, constellation_id)
VALUES
	('Andromeda (M31)', 4, 2.50, 220000, 2 * power(10, 12), 1),
	('Milky Way', 1, NULL, 120000, 1.5 * power(10, 12), NULL),
	('Triangulum (M33)', 4, 2.88, 60000, 5 * power(10, 10),	80),
	('Large Magellanic Cloud (LMC)', 3, 0.163, 14000, power(10,11),	33),
	('Small Magellanic Cloud (SMC)', 3,	0.204, 7000, power(10,10), 82),
	('IC 1613', 3, 2.38, 7000, power(10, 9), 21),
	('NGC 6822 (Barnard’s Galaxy)', 3, 1.63, 7000, power(10, 10), 72),
	('Wolf–Lundmark–Melotte (WLM)', 3, 3.226, 8000, power(10,9), 21),
	('Sagittarius Dwarf Spheroidal', 2, 0.08038, 10000, power(10,9), 72),
	('Fornax Dwarf', 2, 0.466, 3000, power(10,8), 37);

/*
	A star system (or stellar system) is a small, gravitationally bound group of stars. Broadly, it can refer to a single star and everything that orbits it (like planets, asteroids, and comets), or multiple stars orbiting one another.
*/

INSERT INTO star_system(name) 
VALUES
	('Alpha Centauri'),
	('Luhman 16'),
	('Sirius'),
	('Solar System');	

INSERT INTO star(name, galaxy_id, star_system_id, constellation_id, distance, mass)
VALUES
	('Sun', 2, 4, NULL, 0.0000158, 1),
	('Proxima Centauri', 2, 1, 19, 4.2465, 0.122),
	('Rigil Kentaurus', 2, 1, 19, 4.3441, 1.079),
	('Toliman', 2, 1, 19, 4.3441, 0.909),
	('Barnard''s Star', 2, NULL, 59, 5.9629, 0.144),
	('Luhman 16 A', 2, 2, 85, 6.5029, 0.032),
	('Luhman 16 B', 2, 2, 85, 6.5029, 0.027),
	('WISE 0855−0714', 2, NULL, 42, 7.430, 0.010),
	('Wolf 359', 2, NULL, 46, 7.8558, 0.090),
	('Lalande 21185', 2, NULL, 83, 8.3044, 0.390),
	('Sirius A', 2, 3, 14, 8.7094, 2.063),
	('Sirius B', 2, 3, 14, 8.7094, 1.018),
	('AE Andromedae', 1, NULL, 1, 2.500000, 120),
	('M31 RV', 1, NULL, 1, 2.500000, 8);

INSERT INTO planet(name, distance, mass, moons, orbital_period, surface_temp, exoplanet, star_id)
VALUES
	('Mercury', 0.38709893, 0.055, 0, 87.9691, 440, False, 1),
	('Venus', 0.72333199, 0.815, 0, 224.7, 730, False, 1),
	('Earth', 1.00000011, 1, 1, 365.256, 287, False, 1),
	('Mars', 1.52366231, 0.107, 2, 686.980, 227, False, 1),
	('Jupiter', 5.20336301, 318, 115, 4332.59, 152, False, 1),
	('Saturn', 9.53707032, 95, 292, 10759.0,134, False, 1),
	('Uranus', 19.19126393, 14.5, 29, 30687, 76, False, 1),
	('Neptune', 30.06896348, 17, 16, 60195, 73, False, 1),
	('Proxima Centauri d', 0.02881,	0.26, NULL, 5.1, 360, True, 2),
	('Proxima Centauri b', 0.04848, 1.055, NULL, 11.2, 234, True, 2),
	('Barnard d', 0.0188, 0.263, NULL, 2.3, 483, True, 5),
	('Barnard b', 0.0229, 0.299, NULL, 3.2, 438, True, 5),
	('Barnard c', 0.0274, 0.335, NULL, 4.1,	400, True, 5),
	('Barnard e', 0.0381, 0.193, NULL, 6.7, 340, True, 5),
	('GJ 411 b', 0.07879, 2.69, NULL, 12.9, 355, True, NULL),
	('HD 95735 c', 2.94, 13.6, NULL, 8.1, 3550, True, NULL),
	('Epsilon Eridani b', 3.53, 318, NULL, 7.3,	150, True, NULL),
	('GJ 887 e', 0.0417, 1.46, NULL, 4.4, 350, True, NULL),
	('GJ 887 b', 0.0683, 3.9, NULL, 9.3, 430, True, NULL),
	('GJ 887 c', 0.121, 6.5, NULL, 21.8, 352, True, NULL),
	('GJ 887 d', 0.212, 6.1, NULL, 50.8, 241, True, NULL),
	('Ross 128 b', 0.0496, 1.4, NULL, 9.9, 280, True, NULL),
	('Gl 725 A b', 0.068, 2.78, NULL, 11.2, 344, True, NULL),
	('GJ 15 A b', 0.072, 3.03, NULL, 11.4407, 549, True, NULL),
	('GJ 15 A c', 5.4, 36, NULL, 7600, 40, True, NULL),
	('Epsilon Indi A b', 28.4, 2005, NULL, 16498, 275, True, NULL);
UPDATE planet SET has_life = TRUE WHERE name = 'Earth';

INSERT INTO moon(name, planet_id, diameter, orbital_distance, orbital_period)
VALUES
	('Moon', 3, 3475, 384400, 27.322),
	('Deimos', 4, 12.4, 23460, 1.2624),
	('Phobos', 4, 22.5, 9270, 0.3189),
	('Callisto', 5, 4800, 1883000, 16.689),
	('Europa', 5, 3126, 670900, 3.551),
	('Ganymede', 5, 5276, 1070000, 7.155),
	('Io', 5, 3629, 421600, 1.769),
	('Thebe', 5, 100, 221900, 0.675),
	('Atlas', 6, 29.8, 137640, 0.602),
	('Dione', 6, 1120, 377400, 2.737),
	('Helene', 6, 35.2, 377400, 2.737),
	('Phoebe', 6, 220, 12952000, 550.48),
	('Rhea', 6, 1528, 527040, 4518),
	('Ariel', 7, 1160, 191240, 2.52),
	('Miranda',	7, 472, 129780, 1.414),
	('Oberon', 7, 1526, 582600, 13.463),
	('Puck', 7, 154, 86010, 0.762),
	('Nereid', 8, 340, 5513400, 360.16),
	('Proteus', 8, 420, 117600, 1.12),
	('Triton', 8, 2705, 354800, 5.877);


