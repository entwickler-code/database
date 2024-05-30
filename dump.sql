--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: pgagent; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pgagent;


ALTER SCHEMA pgagent OWNER TO postgres;

--
-- Name: SCHEMA pgagent; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA pgagent IS 'pgAgent system tables';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- Name: pgagent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgagent WITH SCHEMA pgagent;


--
-- Name: EXTENSION pgagent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgagent IS 'A PostgreSQL job scheduler';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: COMPANY; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."COMPANY" (
    "ID" integer NOT NULL,
    "COMPANY_NAME" text NOT NULL,
    "ADDRESS" text NOT NULL,
    "CREDIT_LINE" double precision NOT NULL,
    "ACCOUNT_BALANCE" double precision NOT NULL
);


ALTER TABLE public."COMPANY" OWNER TO postgres;

--
-- Name: CUSTOMER; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CUSTOMER" (
    "ID" integer NOT NULL,
    "ID_COMPANY" integer NOT NULL,
    "FIRST_NAME" text NOT NULL,
    "LAST_NAME" text NOT NULL,
    "EMAIL_ADDRESS" text NOT NULL,
    "PHONE_NUMBER" integer NOT NULL
);


ALTER TABLE public."CUSTOMER" OWNER TO postgres;

--
-- Name: ORDER; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ORDER" (
    "ID" integer NOT NULL,
    "ID_COMPANY" integer NOT NULL,
    "DATE" date NOT NULL,
    "TRACKING_NUMBER" integer NOT NULL
);


ALTER TABLE public."ORDER" OWNER TO postgres;

--
-- Name: ORDER_PRODUCT; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ORDER_PRODUCT" (
    "ID_ORDER" integer NOT NULL,
    "ID_PRODUCT" integer NOT NULL
);


ALTER TABLE public."ORDER_PRODUCT" OWNER TO postgres;

--
-- Name: PRODUCT; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PRODUCT" (
    "ID" integer NOT NULL,
    "NAME" text NOT NULL,
    "DESCRIPTION " text NOT NULL,
    "PRICE" double precision NOT NULL
);


ALTER TABLE public."PRODUCT" OWNER TO postgres;

--
-- Name: ORDER ORDER_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ORDER"
    ADD CONSTRAINT "ORDER_pkey" PRIMARY KEY ("ID");


--
-- Name: COMPANY PK_ID_COMPANY; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."COMPANY"
    ADD CONSTRAINT "PK_ID_COMPANY" PRIMARY KEY ("ID");


--
-- Name: CUSTOMER PK_ID_CUSTOMER; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CUSTOMER"
    ADD CONSTRAINT "PK_ID_CUSTOMER" PRIMARY KEY ("ID");


--
-- Name: PRODUCT PRODUCT_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PRODUCT"
    ADD CONSTRAINT "PRODUCT_pkey" PRIMARY KEY ("ID");


--
-- Name: COMPANY FK_COMPANY_ORDER; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."COMPANY"
    ADD CONSTRAINT "FK_COMPANY_ORDER" FOREIGN KEY ("ID") REFERENCES public."ORDER"("ID") NOT VALID;


--
-- Name: CUSTOMER FK_CUSTOMER_COMPANY; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CUSTOMER"
    ADD CONSTRAINT "FK_CUSTOMER_COMPANY" FOREIGN KEY ("ID_COMPANY") REFERENCES public."COMPANY"("ID") NOT VALID;


--
-- Name: ORDER_PRODUCT ID_ORDER; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ORDER_PRODUCT"
    ADD CONSTRAINT "ID_ORDER" FOREIGN KEY ("ID_ORDER") REFERENCES public."ORDER"("ID");


--
-- Name: ORDER_PRODUCT ID_PRODUCT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ORDER_PRODUCT"
    ADD CONSTRAINT "ID_PRODUCT" FOREIGN KEY ("ID_PRODUCT") REFERENCES public."PRODUCT"("ID");


--
-- PostgreSQL database dump complete
--
