--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: lists; Type: TABLE; Schema: public; Owner: Kevin_Babcock
--

CREATE TABLE lists (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE lists OWNER TO "Kevin_Babcock";

--
-- Name: lists_id_seq; Type: SEQUENCE; Schema: public; Owner: Kevin_Babcock
--

CREATE SEQUENCE lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lists_id_seq OWNER TO "Kevin_Babcock";

--
-- Name: lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Kevin_Babcock
--

ALTER SEQUENCE lists_id_seq OWNED BY lists.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: Kevin_Babcock
--

CREATE TABLE tasks (
    id integer NOT NULL,
    description character varying,
    list_id integer
);


ALTER TABLE tasks OWNER TO "Kevin_Babcock";

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: Kevin_Babcock
--

CREATE SEQUENCE tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_id_seq OWNER TO "Kevin_Babcock";

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Kevin_Babcock
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: lists id; Type: DEFAULT; Schema: public; Owner: Kevin_Babcock
--

ALTER TABLE ONLY lists ALTER COLUMN id SET DEFAULT nextval('lists_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: Kevin_Babcock
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: Kevin_Babcock
--

COPY lists (id, name) FROM stdin;
1	test
2	test_list
3	test
4	test3
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: Kevin_Babcock
--

COPY tasks (id, description, list_id) FROM stdin;
1	test description	0
\.


--
-- Name: lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Kevin_Babcock
--

SELECT pg_catalog.setval('lists_id_seq', 4, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Kevin_Babcock
--

SELECT pg_catalog.setval('tasks_id_seq', 1, true);


--
-- Name: lists lists_pkey; Type: CONSTRAINT; Schema: public; Owner: Kevin_Babcock
--

ALTER TABLE ONLY lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: Kevin_Babcock
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

