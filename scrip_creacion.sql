--
-- PostgreSQL database dump
--

-- Dumped from database version 13.12 (Ubuntu 13.12-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.12 (Ubuntu 13.12-1.pgdg20.04+1)

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
-- Name: dimcompeticion; Type: TABLE; Schema: public; Owner: alumnogreibd
--

CREATE TABLE public.dimcompeticion (
    id integer NOT NULL,
    nombre character varying,
    pais character varying
);


ALTER TABLE public.dimcompeticion OWNER TO alumnogreibd;

--
-- Name: dimcompeticion_id_seq; Type: SEQUENCE; Schema: public; Owner: alumnogreibd
--

CREATE SEQUENCE public.dimcompeticion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dimcompeticion_id_seq OWNER TO alumnogreibd;

--
-- Name: dimcompeticion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alumnogreibd
--

ALTER SEQUENCE public.dimcompeticion_id_seq OWNED BY public.dimcompeticion.id;


--
-- Name: dimequipo; Type: TABLE; Schema: public; Owner: alumnogreibd
--

CREATE TABLE public.dimequipo (
    id integer NOT NULL,
    nombre character varying,
    ciudad character varying,
    entrenador character varying,
    presupuesto integer
);


ALTER TABLE public.dimequipo OWNER TO alumnogreibd;

--
-- Name: dimequipo_id_seq; Type: SEQUENCE; Schema: public; Owner: alumnogreibd
--

CREATE SEQUENCE public.dimequipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dimequipo_id_seq OWNER TO alumnogreibd;

--
-- Name: dimequipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alumnogreibd
--

ALTER SEQUENCE public.dimequipo_id_seq OWNED BY public.dimequipo.id;


--
-- Name: dimlugar; Type: TABLE; Schema: public; Owner: alumnogreibd
--

CREATE TABLE public.dimlugar (
    id integer NOT NULL,
    estadio character varying,
    capacidad integer,
    ciudad character varying,
    afluenciamedia integer
);


ALTER TABLE public.dimlugar OWNER TO alumnogreibd;

--
-- Name: dimlugar_id_seq; Type: SEQUENCE; Schema: public; Owner: alumnogreibd
--

CREATE SEQUENCE public.dimlugar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dimlugar_id_seq OWNER TO alumnogreibd;

--
-- Name: dimlugar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alumnogreibd
--

ALTER SEQUENCE public.dimlugar_id_seq OWNED BY public.dimlugar.id;


--
-- Name: dimtiempo; Type: TABLE; Schema: public; Owner: alumnogreibd
--

CREATE TABLE public.dimtiempo (
    id integer NOT NULL,
    dia integer,
    mes integer,
    ano integer,
    texto_mes character varying
);


ALTER TABLE public.dimtiempo OWNER TO alumnogreibd;

--
-- Name: dimtiempo_id_seq; Type: SEQUENCE; Schema: public; Owner: alumnogreibd
--

CREATE SEQUENCE public.dimtiempo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dimtiempo_id_seq OWNER TO alumnogreibd;

--
-- Name: dimtiempo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alumnogreibd
--

ALTER SEQUENCE public.dimtiempo_id_seq OWNED BY public.dimtiempo.id;


--
-- Name: factpartido; Type: TABLE; Schema: public; Owner: alumnogreibd
--

CREATE TABLE public.factpartido (
    goles_local integer,
    goles_visitante integer,
    tiempo integer NOT NULL,
    equipo_visitante integer NOT NULL,
    equipo_local integer NOT NULL,
    competicion integer NOT NULL,
    lugar integer NOT NULL,
    victoria integer,
    empate integer,
    derrota integer
);


ALTER TABLE public.factpartido OWNER TO alumnogreibd;

--
-- Name: dimcompeticion id; Type: DEFAULT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.dimcompeticion ALTER COLUMN id SET DEFAULT nextval('public.dimcompeticion_id_seq'::regclass);


--
-- Name: dimequipo id; Type: DEFAULT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.dimequipo ALTER COLUMN id SET DEFAULT nextval('public.dimequipo_id_seq'::regclass);


--
-- Name: dimlugar id; Type: DEFAULT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.dimlugar ALTER COLUMN id SET DEFAULT nextval('public.dimlugar_id_seq'::regclass);


--
-- Name: dimtiempo id; Type: DEFAULT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.dimtiempo ALTER COLUMN id SET DEFAULT nextval('public.dimtiempo_id_seq'::regclass);


--
-- Name: dimcompeticion dimcompeticion_pk; Type: CONSTRAINT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.dimcompeticion
    ADD CONSTRAINT dimcompeticion_pk PRIMARY KEY (id);


--
-- Name: dimequipo dimequipo_pk; Type: CONSTRAINT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.dimequipo
    ADD CONSTRAINT dimequipo_pk PRIMARY KEY (id);


--
-- Name: dimlugar dimlugar_pk; Type: CONSTRAINT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.dimlugar
    ADD CONSTRAINT dimlugar_pk PRIMARY KEY (id);


--
-- Name: dimtiempo dimtiempo_pk; Type: CONSTRAINT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.dimtiempo
    ADD CONSTRAINT dimtiempo_pk PRIMARY KEY (id);


--
-- Name: factpartido factpartido_pk; Type: CONSTRAINT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.factpartido
    ADD CONSTRAINT factpartido_pk PRIMARY KEY (tiempo, equipo_visitante, equipo_local, competicion, lugar);


--
-- Name: factpartido factpartido_fk; Type: FK CONSTRAINT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.factpartido
    ADD CONSTRAINT factpartido_fk FOREIGN KEY (lugar) REFERENCES public.dimlugar(id);


--
-- Name: factpartido factpartido_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.factpartido
    ADD CONSTRAINT factpartido_fk_1 FOREIGN KEY (competicion) REFERENCES public.dimcompeticion(id);


--
-- Name: factpartido factpartido_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.factpartido
    ADD CONSTRAINT factpartido_fk_2 FOREIGN KEY (tiempo) REFERENCES public.dimtiempo(id);


--
-- Name: factpartido factpartido_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.factpartido
    ADD CONSTRAINT factpartido_fk_3 FOREIGN KEY (equipo_local) REFERENCES public.dimequipo(id);


--
-- Name: factpartido factpartido_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: alumnogreibd
--

ALTER TABLE ONLY public.factpartido
    ADD CONSTRAINT factpartido_fk_4 FOREIGN KEY (equipo_visitante) REFERENCES public.dimequipo(id);


--
-- PostgreSQL database dump complete
--

