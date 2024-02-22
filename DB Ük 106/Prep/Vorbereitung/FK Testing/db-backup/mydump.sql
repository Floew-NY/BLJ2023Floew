--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)

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
-- Name: tag3_2; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA tag3_2;


ALTER SCHEMA tag3_2 OWNER TO pg_database_owner;

--
-- Name: SCHEMA tag3_2; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA tag3_2 IS 'standard tag3_2 schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ort; Type: TABLE; Schema: tag3_2; Owner: postgres
--

CREATE TABLE tag3_2.ort (
    plz character varying(4) NOT NULL,
    name character varying(50)
);


ALTER TABLE tag3_2.ort OWNER TO postgres;

--
-- Name: person; Type: TABLE; Schema: tag3_2; Owner: postgres
--

CREATE TABLE tag3_2.person (
    person_id integer NOT NULL,
    name character varying(20),
    id_ort character varying(4)
);


ALTER TABLE tag3_2.person OWNER TO postgres;

--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: tag3_2; Owner: postgres
--

CREATE SEQUENCE tag3_2.person_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tag3_2.person_person_id_seq OWNER TO postgres;

--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: tag3_2; Owner: postgres
--

ALTER SEQUENCE tag3_2.person_person_id_seq OWNED BY tag3_2.person.person_id;


--
-- Name: person person_id; Type: DEFAULT; Schema: tag3_2; Owner: postgres
--

ALTER TABLE ONLY tag3_2.person ALTER COLUMN person_id SET DEFAULT nextval('tag3_2.person_person_id_seq'::regclass);


--
-- Data for Name: ort; Type: TABLE DATA; Schema: tag3_2; Owner: postgres
--

COPY tag3_2.ort (plz, name) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: tag3_2; Owner: postgres
--

COPY tag3_2.person (person_id, name, id_ort) FROM stdin;
\.


--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: tag3_2; Owner: postgres
--

SELECT pg_catalog.setval('tag3_2.person_person_id_seq', 12, true);


--
-- Name: ort ort_pkey; Type: CONSTRAINT; Schema: tag3_2; Owner: postgres
--

ALTER TABLE ONLY tag3_2.ort
    ADD CONSTRAINT ort_pkey PRIMARY KEY (plz);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: tag3_2; Owner: postgres
--

ALTER TABLE ONLY tag3_2.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);


--
-- Name: person fk_id_ort_ort; Type: FK CONSTRAINT; Schema: tag3_2; Owner: postgres
--

ALTER TABLE ONLY tag3_2.person
    ADD CONSTRAINT fk_id_ort_ort FOREIGN KEY (id_ort) REFERENCES tag3_2.ort(plz);


--
-- PostgreSQL database dump complete
--

