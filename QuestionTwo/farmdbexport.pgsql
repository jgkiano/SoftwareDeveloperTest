--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

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
-- Name: harvestdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE harvestdata (
    id integer NOT NULL,
    farmername character varying(200),
    farmmanagement character varying(50),
    crop character varying(50),
    variety character varying(50),
    cropsystem character varying(50),
    plotsize character varying(50),
    spacing character varying(50),
    harvestdate date,
    samplingdate date,
    standcountatharvest integer,
    noofplants integer,
    totalbiomassfwt numeric,
    totalgrainfwt numeric,
    totalstemsshelledpodsfwt numeric,
    stemsshelledpodssamplefwt integer,
    stemsshelledpodssampleovendwt integer,
    feildgrainsamplefwt integer,
    feildgrainsampleovendwt integer,
    totalstemsshelledpodsovendwt numeric,
    totalgrainovendwt numeric,
    totalbiomass numeric
);


ALTER TABLE harvestdata OWNER TO postgres;

--
-- Name: avgharvest; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW avgharvest AS
 SELECT avg(harvestdata.noofplants) AS avg
   FROM harvestdata;


ALTER TABLE avgharvest OWNER TO postgres;

--
-- Name: harvestdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE harvestdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE harvestdata_id_seq OWNER TO postgres;

--
-- Name: harvestdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE harvestdata_id_seq OWNED BY harvestdata.id;


--
-- Name: highestbiomass; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW highestbiomass AS
 SELECT harvestdata.farmername
   FROM harvestdata
  WHERE (harvestdata.totalbiomass = ( SELECT max(harvestdata_1.totalbiomass) AS max
           FROM harvestdata harvestdata_1));


ALTER TABLE highestbiomass OWNER TO postgres;

--
-- Name: lowestbiomass; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW lowestbiomass AS
 SELECT harvestdata.farmername
   FROM harvestdata
  WHERE (harvestdata.totalbiomass = ( SELECT min(harvestdata_1.totalbiomass) AS min
           FROM harvestdata harvestdata_1));


ALTER TABLE lowestbiomass OWNER TO postgres;

--
-- Name: sorted_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW sorted_view AS
 SELECT harvestdata.id,
    harvestdata.farmername,
    harvestdata.farmmanagement,
    harvestdata.crop,
    harvestdata.variety,
    harvestdata.cropsystem,
    harvestdata.plotsize,
    harvestdata.spacing,
    harvestdata.harvestdate,
    harvestdata.samplingdate,
    harvestdata.standcountatharvest,
    harvestdata.noofplants,
    harvestdata.totalbiomassfwt,
    harvestdata.totalgrainfwt,
    harvestdata.totalstemsshelledpodsfwt,
    harvestdata.stemsshelledpodssamplefwt,
    harvestdata.stemsshelledpodssampleovendwt,
    harvestdata.feildgrainsamplefwt,
    harvestdata.feildgrainsampleovendwt,
    harvestdata.totalstemsshelledpodsovendwt,
    harvestdata.totalgrainovendwt,
    harvestdata.totalbiomass
   FROM harvestdata
  ORDER BY harvestdata.harvestdate;


ALTER TABLE sorted_view OWNER TO postgres;

--
-- Name: harvestdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY harvestdata ALTER COLUMN id SET DEFAULT nextval('harvestdata_id_seq'::regclass);


--
-- Data for Name: harvestdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY harvestdata (id, farmername, farmmanagement, crop, variety, cropsystem, plotsize, spacing, harvestdate, samplingdate, standcountatharvest, noofplants, totalbiomassfwt, totalgrainfwt, totalstemsshelledpodsfwt, stemsshelledpodssamplefwt, stemsshelledpodssampleovendwt, feildgrainsamplefwt, feildgrainsampleovendwt, totalstemsshelledpodsovendwt, totalgrainovendwt, totalbiomass) FROM stdin;
3	Jane Nyambura	Low	Beans	Wairimu	Sole	6x4 m2	45Ã—10 cm	2015-08-12	2015-10-22	367	367	6	3.3	2.7	124	108	1234	1089	2.35	2.91	5.26
4	Christopher Macharia	Low	Maize	Kifam	Sole	6x4 m2	60Ã—5 cm	2015-09-21	2015-10-23	222	222	1.1	0	1.1	338	217	0	0	0.71	0	0.71
5	Mary Mbatia	Medium	Beans	Kifam	Sole	6x4 m2	65Ã—35 cm	2015-08-12	2015-10-22	127	127	8.5	4.6	3.9	291	257	1046	953	3.44	4.19	7.64
6	Mary Mbatia	Medium	Beans	KAT B2	Sole	6x4 m2	60Ã—30 cm	2015-07-27	2015-10-23	148	148	5	2.6	2.4	266	235	1001	906	2.12	2.35	4.47
7	Josphat Kangethe	Medium	Maize	Gituru Kanini	Sole	6x4 m2	50Ã—20cm	2015-07-10	2015-10-23	387	387	8.4	4	4.4	113	96	644	579	3.74	3.6	7.33
8	Joseph Kiarie	Medium	Beans	Kifam	Sole	6x4 m2	45Ã—20 cm	2015-08-13	2015-10-23	280	280	4.6	1.3	3.3	163	143	565	506	2.9	1.16	4.06
9	Francis Karanja	Medium	Beans	Gituru Kanini	Sole	6x4 m2	40Ã—30cm	2015-08-25	2015-10-24	223	223	9.9	4.9	5	332	284	1444	1383	4.28	4.69	8.97
10	Francis Karanja	Medium	Maize	Rose Coco	Sole	6x4 m2	40Ã—20cm	2015-08-15	2015-10-24	252	252	7	2.5	4.5	388	336	1009	912	3.9	2.26	6.16
11	Patrick Mbirwe	High	Maize	Kifam	Sole	6x4 m2	40Ã—15cm	2015-08-13	2015-10-24	264	264	7.1	3.6	3.5	234	202	1387	1262	3.02	3.28	6.3
12	Wairimu Kanyiri	High	Beans	Kifam	Sole	6x4 m2	40Ã—20 cm	2015-08-13	2015-10-23	247	247	5	2.7	2.3	172	152	1574	1419	2.03	2.43	4.47
13	George Kahuho	Medium	Maize	Kifam	intercrop	6x4 m2	60Ã—30cm	2015-08-12	2015-10-24	129	129	2	1	1	146	128	270	240	0.88	0.89	1.77
14	Josphat Kangethe	Medium	Beans	Kifam	intercrop	6x4 m2	75Ã—50cm	2015-08-13	2015-10-22	189	189	2.3	0.8	1.5	107	93	314	278	1.3	0.71	2.01
\.


--
-- Name: harvestdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('harvestdata_id_seq', 14, true);


--
-- Name: harvestdata harvestdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY harvestdata
    ADD CONSTRAINT harvestdata_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

