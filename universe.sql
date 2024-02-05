--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(80) NOT NULL,
    numberofplanets integer,
    farfromearth numeric(100,54),
    description text,
    reachable boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(80),
    distancefromplanet integer,
    planet_id integer NOT NULL,
    description text
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
    name character varying(80),
    farfromearth numeric(100,54),
    description text,
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(80),
    galaxy_id integer NOT NULL,
    shineoncount integer NOT NULL,
    distancefromearth numeric(100,54) NOT NULL
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
-- Name: weather; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.weather (
    weather_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    type character varying(40),
    intensity numeric(4,2)
);


ALTER TABLE public.weather OWNER TO freecodecamp;

--
-- Name: weather_weather_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.weather_weather_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weather_weather_id_seq OWNER TO freecodecamp;

--
-- Name: weather_weather_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.weather_weather_id_seq OWNED BY public.weather.weather_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Name: weather weather_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.weather ALTER COLUMN weather_id SET DEFAULT nextval('public.weather_weather_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy1', 5, 100.123456789012345678000000000000000000000000000000000000, 'Description1', true);
INSERT INTO public.galaxy VALUES (2, 'Galaxy2', 8, 200.987654321098765432000000000000000000000000000000000000, 'Description2', false);
INSERT INTO public.galaxy VALUES (3, 'Galaxy3', 3, 300.123456789012345678000000000000000000000000000000000000, 'Description3', true);
INSERT INTO public.galaxy VALUES (4, 'Galaxy4', 6, 400.123456789012345678000000000000000000000000000000000000, 'Description4', false);
INSERT INTO public.galaxy VALUES (5, 'Galaxy5', 4, 500.123456789012345678000000000000000000000000000000000000, 'Description5', true);
INSERT INTO public.galaxy VALUES (6, 'Galaxy6', 7, 600.987654321098765432000000000000000000000000000000000000, 'Description6', false);
INSERT INTO public.galaxy VALUES (7, 'Galaxy7', 2, 700.987654321098765432000000000000000000000000000000000000, 'Description7', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon1', 100, 1, 'Description1');
INSERT INTO public.moon VALUES (2, 'Moon2', 150, 2, 'Description2');
INSERT INTO public.moon VALUES (3, 'Moon3', 200, 1, 'Description3');
INSERT INTO public.moon VALUES (4, 'Moon4', 250, 3, 'Description4');
INSERT INTO public.moon VALUES (5, 'Moon5', 300, 2, 'Description5');
INSERT INTO public.moon VALUES (6, 'Moon6', 350, 1, 'Description6');
INSERT INTO public.moon VALUES (7, 'Moon7', 400, 3, 'Description7');
INSERT INTO public.moon VALUES (8, 'Moon8', 450, 2, 'Description8');
INSERT INTO public.moon VALUES (9, 'Moon9', 500, 1, 'Description9');
INSERT INTO public.moon VALUES (10, 'Moon10', 550, 3, 'Description10');
INSERT INTO public.moon VALUES (11, 'Moon11', 600, 2, 'Description11');
INSERT INTO public.moon VALUES (12, 'Moon12', 650, 1, 'Description12');
INSERT INTO public.moon VALUES (13, 'Moon13', 700, 4, 'Description13');
INSERT INTO public.moon VALUES (14, 'Moon14', 750, 5, 'Description14');
INSERT INTO public.moon VALUES (15, 'Moon15', 800, 4, 'Description15');
INSERT INTO public.moon VALUES (16, 'Moon16', 850, 6, 'Description16');
INSERT INTO public.moon VALUES (17, 'Moon17', 900, 5, 'Description17');
INSERT INTO public.moon VALUES (18, 'Moon18', 950, 4, 'Description18');
INSERT INTO public.moon VALUES (19, 'Moon19', 1000, 6, 'Description19');
INSERT INTO public.moon VALUES (20, 'Moon20', 1050, 5, 'Description20');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet1', 150.123456789012345678000000000000000000000000000000000000, 'Description1', true, 1);
INSERT INTO public.planet VALUES (2, 'Planet2', 200.987654321098765432000000000000000000000000000000000000, 'Description2', false, 2);
INSERT INTO public.planet VALUES (3, 'Planet3', 300.123456789012345678000000000000000000000000000000000000, 'Description3', true, 1);
INSERT INTO public.planet VALUES (4, 'Planet4', 400.123456789012345678000000000000000000000000000000000000, 'Description4', false, 4);
INSERT INTO public.planet VALUES (5, 'Planet5', 500.123456789012345678000000000000000000000000000000000000, 'Description5', true, 2);
INSERT INTO public.planet VALUES (6, 'Planet6', 600.987654321098765432000000000000000000000000000000000000, 'Description6', false, 1);
INSERT INTO public.planet VALUES (7, 'Planet7', 700.123456789012345678000000000000000000000000000000000000, 'Description7', true, 3);
INSERT INTO public.planet VALUES (8, 'Planet8', 800.123456789012345678000000000000000000000000000000000000, 'Description8', false, 2);
INSERT INTO public.planet VALUES (9, 'Planet9', 900.123456789012345678000000000000000000000000000000000000, 'Description9', true, 1);
INSERT INTO public.planet VALUES (10, 'Planet10', 1000.123456789012345678000000000000000000000000000000000000, 'Description10', false, 3);
INSERT INTO public.planet VALUES (11, 'Planet11', 1100.987654321098765432000000000000000000000000000000000000, 'Description11', true, 2);
INSERT INTO public.planet VALUES (12, 'Planet12', 1200.987654321098765432000000000000000000000000000000000000, 'Description12', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star1', 1, 10, 50.123456789012345678000000000000000000000000000000000000);
INSERT INTO public.star VALUES (2, 'Star2', 2, 15, 60.987654321098765432000000000000000000000000000000000000);
INSERT INTO public.star VALUES (3, 'Star3', 1, 8, 70.123456789012345678000000000000000000000000000000000000);
INSERT INTO public.star VALUES (4, 'Star4', 3, 12, 80.123456789012345678000000000000000000000000000000000000);
INSERT INTO public.star VALUES (5, 'Star5', 2, 20, 90.123456789012345678000000000000000000000000000000000000);
INSERT INTO public.star VALUES (6, 'Star6', 1, 25, 100.987654321098765432000000000000000000000000000000000000);
INSERT INTO public.star VALUES (7, 'Star7', 3, 18, 110.123456789012345678000000000000000000000000000000000000);
INSERT INTO public.star VALUES (8, 'Star8', 2, 22, 120.123456789012345678000000000000000000000000000000000000);
INSERT INTO public.star VALUES (9, 'Star9', 1, 30, 130.123456789012345678000000000000000000000000000000000000);
INSERT INTO public.star VALUES (10, 'Star10', 3, 28, 140.123456789012345678000000000000000000000000000000000000);
INSERT INTO public.star VALUES (11, 'Star11', 2, 35, 150.987654321098765432000000000000000000000000000000000000);
INSERT INTO public.star VALUES (12, 'Star12', 1, 40, 160.987654321098765432000000000000000000000000000000000000);


--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.weather VALUES (1, 'Clear Sky', 1, 'Sunny', 0.80);
INSERT INTO public.weather VALUES (2, 'Stormy Weather', 2, 'Rainy', 0.60);
INSERT INTO public.weather VALUES (3, 'Windy Day', 3, 'Windy', 0.50);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: weather_weather_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.weather_weather_id_seq', 3, true);


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
-- Name: weather weather_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.weather
    ADD CONSTRAINT weather_name_key UNIQUE (name);


--
-- Name: weather weather_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.weather
    ADD CONSTRAINT weather_name_key1 UNIQUE (name);


--
-- Name: weather weather_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.weather
    ADD CONSTRAINT weather_pkey PRIMARY KEY (weather_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: weather weather_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.weather
    ADD CONSTRAINT weather_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

