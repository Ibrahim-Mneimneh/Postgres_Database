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

DROP DATABASE games_played;
--
-- Name: games_played; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE games_played WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE games_played OWNER TO freecodecamp;

\connect games_played

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
-- Name: player; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player (
    username character varying(22) NOT NULL,
    best_game integer,
    games_played integer
);


ALTER TABLE public.player OWNER TO freecodecamp;

--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player VALUES ('k4', 999, 0);
INSERT INTO public.player VALUES ('user_1667980951359', 499, 2);
INSERT INTO public.player VALUES ('ib', 1, 3);
INSERT INTO public.player VALUES ('user_1667980951360', 393, 5);
INSERT INTO public.player VALUES ('user_1667944892473', 134, 2);
INSERT INTO public.player VALUES ('user_1668003751557', 476, 2);
INSERT INTO public.player VALUES ('user_1668001294445', 549, 2);
INSERT INTO public.player VALUES ('user_1667944892474', 19, 5);
INSERT INTO public.player VALUES ('k', 999, 0);
INSERT INTO public.player VALUES ('user_1668001294446', 247, 5);
INSERT INTO public.player VALUES ('user_1668003751558', 25, 5);
INSERT INTO public.player VALUES ('user_1667975561864', 275, 2);
INSERT INTO public.player VALUES ('user_1667975561865', 152, 5);
INSERT INTO public.player VALUES ('user_1668002001293', 633, 2);
INSERT INTO public.player VALUES ('user_1667975669146', 76, 2);
INSERT INTO public.player VALUES ('user_1668002001294', 430, 5);
INSERT INTO public.player VALUES ('user_1667975669147', 166, 5);
INSERT INTO public.player VALUES ('k1', 1, 2);
INSERT INTO public.player VALUES ('user_1668005922962', 619, 2);
INSERT INTO public.player VALUES ('user_1667980430848', 118, 2);
INSERT INTO public.player VALUES ('user_1668005922963', 14, 5);
INSERT INTO public.player VALUES ('9j', 999, 0);
INSERT INTO public.player VALUES ('user_1667980430849', 65, 5);
INSERT INTO public.player VALUES ('user_1668002257416', 50, 2);
INSERT INTO public.player VALUES ('kk', 2, 8);
INSERT INTO public.player VALUES ('user_1668002257417', 136, 5);
INSERT INTO public.player VALUES ('user_1667980631753', 34, 2);
INSERT INTO public.player VALUES ('user_1667980631754', 178, 5);
INSERT INTO public.player VALUES ('user_1668002755148', 541, 2);
INSERT INTO public.player VALUES ('user_1668006496774', 354, 2);
INSERT INTO public.player VALUES ('user_1667980702262', 53, 2);
INSERT INTO public.player VALUES ('user_1668002755149', 98, 5);
INSERT INTO public.player VALUES ('user_1667980702263', 236, 5);
INSERT INTO public.player VALUES ('ib1', 1, 1);
INSERT INTO public.player VALUES ('user_1668006496775', 96, 5);
INSERT INTO public.player VALUES ('user_1668007149878', 769, 2);
INSERT INTO public.player VALUES ('user_1668007149879', 189, 5);
INSERT INTO public.player VALUES ('user_1668007378674', 684, 2);
INSERT INTO public.player VALUES ('user_1668007378675', 8, 5);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--
