--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE universe; Type: COMMENT; Schema: -; Owner: freecodecamp
--

COMMENT ON DATABASE universe IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    iau_code text NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type_id integer,
    distance numeric,
    approximate_diameter integer NOT NULL,
    estimated_mass numeric NOT NULL,
    constellation_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text DEFAULT 'Not Provided'::text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    diameter numeric NOT NULL,
    orbital_distance integer NOT NULL,
    orbital_period numeric NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance numeric NOT NULL,
    mass numeric NOT NULL,
    moons integer,
    orbital_period numeric NOT NULL,
    surface_temp integer NOT NULL,
    exoplanet boolean NOT NULL,
    has_life boolean DEFAULT false,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_system_id integer,
    constellation_id integer,
    distance numeric NOT NULL,
    mass numeric NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_system (
    star_system_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.star_system OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_system_star_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_system_star_system_id_seq OWNER TO freecodecamp;

--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_system_star_system_id_seq OWNED BY public.star_system.star_system_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_system star_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system ALTER COLUMN star_system_id SET DEFAULT nextval('public.star_system_star_system_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'And');
INSERT INTO public.constellation VALUES (2, 'Antlia', 'Ant');
INSERT INTO public.constellation VALUES (3, 'Apus', 'Aps');
INSERT INTO public.constellation VALUES (4, 'Aquarius', 'Aqr');
INSERT INTO public.constellation VALUES (5, 'Aquila', 'Aql');
INSERT INTO public.constellation VALUES (6, 'Ara', 'Ara');
INSERT INTO public.constellation VALUES (7, 'Aries', 'Ari');
INSERT INTO public.constellation VALUES (8, 'Auriga', 'Aur');
INSERT INTO public.constellation VALUES (9, 'Boötes', 'Boo');
INSERT INTO public.constellation VALUES (10, 'Caelum', 'Cae');
INSERT INTO public.constellation VALUES (11, 'Camelopardalis', 'Cam');
INSERT INTO public.constellation VALUES (12, 'Cancer', 'Cnc');
INSERT INTO public.constellation VALUES (13, 'Canes Venatici', 'CVn');
INSERT INTO public.constellation VALUES (14, 'Canis Major', 'CMa');
INSERT INTO public.constellation VALUES (15, 'Canis Minor', 'CMi');
INSERT INTO public.constellation VALUES (16, 'Capricornus', 'Cap');
INSERT INTO public.constellation VALUES (17, 'Carina', 'Car');
INSERT INTO public.constellation VALUES (18, 'Cassiopeia', 'Cas');
INSERT INTO public.constellation VALUES (19, 'Centaurus', 'Cen');
INSERT INTO public.constellation VALUES (20, 'Cepheus', 'Cep');
INSERT INTO public.constellation VALUES (21, 'Cetus', 'Cet');
INSERT INTO public.constellation VALUES (22, 'Chamaeleon', 'Cha');
INSERT INTO public.constellation VALUES (23, 'Circinus', 'Cir');
INSERT INTO public.constellation VALUES (24, 'Columba', 'Col');
INSERT INTO public.constellation VALUES (25, 'Coma Berenices', 'Com');
INSERT INTO public.constellation VALUES (26, 'Corona Australis', 'CrA');
INSERT INTO public.constellation VALUES (27, 'Corona Borealis', 'CrB');
INSERT INTO public.constellation VALUES (28, 'Corvus', 'Crv');
INSERT INTO public.constellation VALUES (29, 'Crater', 'Crt');
INSERT INTO public.constellation VALUES (30, 'Crux', 'Cru');
INSERT INTO public.constellation VALUES (31, 'Cygnus', 'Cyg');
INSERT INTO public.constellation VALUES (32, 'Delphinus', 'Del');
INSERT INTO public.constellation VALUES (33, 'Dorado', 'Dor');
INSERT INTO public.constellation VALUES (34, 'Draco', 'Dra');
INSERT INTO public.constellation VALUES (35, 'Equuleus', 'Equ');
INSERT INTO public.constellation VALUES (36, 'Eridanus', 'Eri');
INSERT INTO public.constellation VALUES (37, 'Fornax', 'For');
INSERT INTO public.constellation VALUES (38, 'Gemini', 'Gem');
INSERT INTO public.constellation VALUES (39, 'Grus', 'Gru');
INSERT INTO public.constellation VALUES (40, 'Hercules', 'Her');
INSERT INTO public.constellation VALUES (41, 'Horologium', 'Hor');
INSERT INTO public.constellation VALUES (42, 'Hydra', 'Hya');
INSERT INTO public.constellation VALUES (43, 'Hydrus', 'Hyi');
INSERT INTO public.constellation VALUES (44, 'Indus', 'Ind');
INSERT INTO public.constellation VALUES (45, 'Lacerta', 'Lac');
INSERT INTO public.constellation VALUES (46, 'Leo', 'Leo');
INSERT INTO public.constellation VALUES (47, 'Leo Minor', 'LMi');
INSERT INTO public.constellation VALUES (48, 'Lepus', 'Lep');
INSERT INTO public.constellation VALUES (49, 'Libra', 'Lib');
INSERT INTO public.constellation VALUES (50, 'Lupus', 'Lup');
INSERT INTO public.constellation VALUES (51, 'Lynx', 'Lyn');
INSERT INTO public.constellation VALUES (52, 'Lyra', 'Lyr');
INSERT INTO public.constellation VALUES (53, 'Mensa', 'Men');
INSERT INTO public.constellation VALUES (54, 'Microscopium', 'Mic');
INSERT INTO public.constellation VALUES (55, 'Monoceros', 'Mon');
INSERT INTO public.constellation VALUES (56, 'Musca', 'Mus');
INSERT INTO public.constellation VALUES (57, 'Norma', 'Nor');
INSERT INTO public.constellation VALUES (58, 'Octans', 'Oct');
INSERT INTO public.constellation VALUES (59, 'Ophiuchus', 'Oph');
INSERT INTO public.constellation VALUES (60, 'Orion', 'Ori');
INSERT INTO public.constellation VALUES (61, 'Pavo', 'Pav');
INSERT INTO public.constellation VALUES (62, 'Pegasus', 'Peg');
INSERT INTO public.constellation VALUES (63, 'Perseus', 'Per');
INSERT INTO public.constellation VALUES (64, 'Phoenix', 'Phe');
INSERT INTO public.constellation VALUES (65, 'Pictor', 'Pic');
INSERT INTO public.constellation VALUES (66, 'Pisces', 'Psc');
INSERT INTO public.constellation VALUES (67, 'Piscis Austrinus', 'PsA');
INSERT INTO public.constellation VALUES (68, 'Puppis', 'Pup');
INSERT INTO public.constellation VALUES (69, 'Pyxis', 'Pyx');
INSERT INTO public.constellation VALUES (70, 'Reticulum', 'Ret');
INSERT INTO public.constellation VALUES (71, 'Sagitta', 'Sge');
INSERT INTO public.constellation VALUES (72, 'Sagittarius', 'Sgr');
INSERT INTO public.constellation VALUES (73, 'Scorpius', 'Sco');
INSERT INTO public.constellation VALUES (74, 'Sculptor', 'Scl');
INSERT INTO public.constellation VALUES (75, 'Scutum', 'Sct');
INSERT INTO public.constellation VALUES (76, 'Serpens', 'Ser');
INSERT INTO public.constellation VALUES (77, 'Sextans', 'Sex');
INSERT INTO public.constellation VALUES (78, 'Taurus', 'Tau');
INSERT INTO public.constellation VALUES (79, 'Telescopium', 'Tel');
INSERT INTO public.constellation VALUES (80, 'Triangulum', 'Tri');
INSERT INTO public.constellation VALUES (81, 'Triangulum Australe', 'TrA');
INSERT INTO public.constellation VALUES (82, 'Tucana', 'Tuc');
INSERT INTO public.constellation VALUES (83, 'Ursa Major', 'UMa');
INSERT INTO public.constellation VALUES (84, 'Ursa Minor', 'UMi');
INSERT INTO public.constellation VALUES (85, 'Vela', 'Vel');
INSERT INTO public.constellation VALUES (86, 'Virgo', 'Vir');
INSERT INTO public.constellation VALUES (87, 'Volans', 'Vol');
INSERT INTO public.constellation VALUES (88, 'Vulpecula', 'Vul');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda (M31)', 4, 2.50, 220000, 2000000000000, 1);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 1, NULL, 120000, 1500000000000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum (M33)', 4, 2.88, 60000, 50000000000, 80);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud (LMC)', 3, 0.163, 14000, 100000000000, 33);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud (SMC)', 3, 0.204, 7000, 10000000000, 82);
INSERT INTO public.galaxy VALUES (6, 'IC 1613', 3, 2.38, 7000, 1000000000, 21);
INSERT INTO public.galaxy VALUES (7, 'NGC 6822 (Barnard’s Galaxy)', 3, 1.63, 7000, 10000000000, 72);
INSERT INTO public.galaxy VALUES (8, 'Wolf–Lundmark–Melotte (WLM)', 3, 3.226, 8000, 1000000000, 21);
INSERT INTO public.galaxy VALUES (9, 'Sagittarius Dwarf Spheroidal', 2, 0.08038, 10000, 1000000000, 72);
INSERT INTO public.galaxy VALUES (10, 'Fornax Dwarf', 2, 0.466, 3000, 100000000, 37);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Barred Spiral', 'Not Provided');
INSERT INTO public.galaxy_type VALUES (2, 'Dwarf Spheroidal', 'Not Provided');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular Dwarf', 'Not Provided');
INSERT INTO public.galaxy_type VALUES (4, 'Spiral', 'Not Provided');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3475, 384400, 27.322);
INSERT INTO public.moon VALUES (2, 'Deimos', 4, 12.4, 23460, 1.2624);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, 22.5, 9270, 0.3189);
INSERT INTO public.moon VALUES (4, 'Callisto', 5, 4800, 1883000, 16.689);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3126, 670900, 3.551);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5276, 1070000, 7.155);
INSERT INTO public.moon VALUES (7, 'Io', 5, 3629, 421600, 1.769);
INSERT INTO public.moon VALUES (8, 'Thebe', 5, 100, 221900, 0.675);
INSERT INTO public.moon VALUES (9, 'Atlas', 6, 29.8, 137640, 0.602);
INSERT INTO public.moon VALUES (10, 'Dione', 6, 1120, 377400, 2.737);
INSERT INTO public.moon VALUES (11, 'Helene', 6, 35.2, 377400, 2.737);
INSERT INTO public.moon VALUES (12, 'Phoebe', 6, 220, 12952000, 550.48);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 1528, 527040, 4518);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 1160, 191240, 2.52);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 472, 129780, 1.414);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1526, 582600, 13.463);
INSERT INTO public.moon VALUES (17, 'Puck', 7, 154, 86010, 0.762);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 340, 5513400, 360.16);
INSERT INTO public.moon VALUES (19, 'Proteus', 8, 420, 117600, 1.12);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2705, 354800, 5.877);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.38709893, 0.055, 0, 87.9691, 440, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.72333199, 0.815, 0, 224.7, 730, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00000011, 1, 1, 365.256, 287, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1.52366231, 0.107, 2, 686.980, 227, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5.20336301, 318, 115, 4332.59, 152, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.53707032, 95, 292, 10759.0, 134, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 19.19126393, 14.5, 29, 30687, 76, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 30.06896348, 17, 16, 60195, 73, false, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri d', 0.02881, 0.26, NULL, 5.1, 360, true, false, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 0.04848, 1.055, NULL, 11.2, 234, true, false, 2);
INSERT INTO public.planet VALUES (11, 'Barnard d', 0.0188, 0.263, NULL, 2.3, 483, true, false, 5);
INSERT INTO public.planet VALUES (12, 'Barnard b', 0.0229, 0.299, NULL, 3.2, 438, true, false, 5);
INSERT INTO public.planet VALUES (13, 'Barnard c', 0.0274, 0.335, NULL, 4.1, 400, true, false, 5);
INSERT INTO public.planet VALUES (14, 'Barnard e', 0.0381, 0.193, NULL, 6.7, 340, true, false, 5);
INSERT INTO public.planet VALUES (15, 'GJ 411 b', 0.07879, 2.69, NULL, 12.9, 355, true, false, 5);
INSERT INTO public.planet VALUES (16, 'HD 95735 c', 2.94, 13.6, NULL, 8.1, 3550, true, false, NULL);
INSERT INTO public.planet VALUES (17, 'Epsilon Eridani b', 3.53, 318, NULL, 7.3, 150, true, false, NULL);
INSERT INTO public.planet VALUES (18, 'GJ 887 e', 0.0417, 1.46, NULL, 4.4, 350, true, false, NULL);
INSERT INTO public.planet VALUES (19, 'GJ 887 b', 0.0683, 3.9, NULL, 9.3, 430, true, false, NULL);
INSERT INTO public.planet VALUES (20, 'GJ 887 c', 0.121, 6.5, NULL, 21.8, 352, true, false, NULL);
INSERT INTO public.planet VALUES (21, 'GJ 887 d', 0.212, 6.1, NULL, 50.8, 241, true, false, NULL);
INSERT INTO public.planet VALUES (22, 'Ross 128 b', 0.0496, 1.4, NULL, 9.9, 280, true, false, NULL);
INSERT INTO public.planet VALUES (23, 'Gl 725 A b', 0.068, 2.78, NULL, 11.2, 344, true, false, NULL);
INSERT INTO public.planet VALUES (24, 'GJ 15 A b', 0.072, 3.03, NULL, 11.4407, 549, true, false, NULL);
INSERT INTO public.planet VALUES (25, 'GJ 15 A c', 5.4, 36, NULL, 7600, 40, true, false, NULL);
INSERT INTO public.planet VALUES (26, 'Epsilon Indi A b', 28.4, 2005, NULL, 16498, 275, true, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, 4, NULL, 0.0000158, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 1, 19, 4.2465, 0.122);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 2, 1, 19, 4.3441, 1.079);
INSERT INTO public.star VALUES (4, 'Toliman', 2, 1, 19, 4.3441, 0.909);
INSERT INTO public.star VALUES (5, 'Barnard''s Star', 2, NULL, 59, 5.9629, 0.144);
INSERT INTO public.star VALUES (6, 'Luhman 16 A', 2, 2, 85, 6.5029, 0.032);
INSERT INTO public.star VALUES (7, 'Luhman 16 B', 2, 2, 85, 6.5029, 0.027);
INSERT INTO public.star VALUES (8, 'WISE 0855−0714', 2, NULL, 42, 7.430, 0.010);
INSERT INTO public.star VALUES (9, 'Wolf 359', 2, NULL, 46, 7.8558, 0.090);
INSERT INTO public.star VALUES (10, 'Lalande 21185', 2, NULL, 83, 8.3044, 0.390);
INSERT INTO public.star VALUES (11, 'Sirius A', 2, 3, 14, 8.7094, 2.063);
INSERT INTO public.star VALUES (12, 'Sirius B', 2, 3, 14, 8.7094, 1.018);
INSERT INTO public.star VALUES (13, 'AE Andromedae', 1, NULL, 1, 2500000, 120);
INSERT INTO public.star VALUES (14, 'M31 RV', 1, NULL, 1, 2500000, 8);


--
-- Data for Name: star_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_system VALUES (1, 'Alpha Centauri');
INSERT INTO public.star_system VALUES (2, 'Luhman 16');
INSERT INTO public.star_system VALUES (3, 'Sirius');
INSERT INTO public.star_system VALUES (4, 'Solar System');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 88, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 26, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: star_system_star_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_system_star_system_id_seq', 4, true);


--
-- Name: constellation constellation_iau_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_iau_code_key UNIQUE (iau_code);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_system star_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_name_key UNIQUE (name);


--
-- Name: star_system star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_system
    ADD CONSTRAINT star_system_pkey PRIMARY KEY (star_system_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_system_id_fkey FOREIGN KEY (star_system_id) REFERENCES public.star_system(star_system_id);


--
-- PostgreSQL database dump complete
--

