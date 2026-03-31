--
-- PostgreSQL database dump
--

\restrict XVkoDI3izznwKJP4JPT5pVba2I74dfq9SMeCPSS1KOra2zgstInk6OdKRhCU3f5

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

-- Started on 2026-03-28 21:14:28 UTC

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

DROP DATABASE IF EXISTS heliumdb;
--
-- TOC entry 3478 (class 1262 OID 16384)
-- Name: heliumdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE heliumdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE heliumdb OWNER TO postgres;

\unrestrict XVkoDI3izznwKJP4JPT5pVba2I74dfq9SMeCPSS1KOra2zgstInk6OdKRhCU3f5
\connect heliumdb
\restrict XVkoDI3izznwKJP4JPT5pVba2I74dfq9SMeCPSS1KOra2zgstInk6OdKRhCU3f5

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
-- TOC entry 224 (class 1259 OID 16435)
-- Name: deposit_returns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposit_returns (
    return_id integer NOT NULL,
    project_id integer NOT NULL,
    return_date date,
    payment_type character varying(20) DEFAULT 'cash'::character varying,
    check_number character varying(100),
    amount numeric(15,2) NOT NULL,
    recipient_name character varying(255),
    return_type character varying(20) DEFAULT 'personal'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.deposit_returns OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16434)
-- Name: deposit_returns_return_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deposit_returns_return_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deposit_returns_return_id_seq OWNER TO postgres;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 223
-- Name: deposit_returns_return_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deposit_returns_return_id_seq OWNED BY public.deposit_returns.return_id;


--
-- TOC entry 220 (class 1259 OID 16409)
-- Name: deposits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposits (
    deposit_id integer NOT NULL,
    project_id integer NOT NULL,
    payment_type character varying(20) DEFAULT 'cash'::character varying,
    check_number character varying(100),
    check_date date,
    invoice_number character varying(100),
    invoice_date date,
    deposit_20_percent numeric(15,2),
    survey_committee_fee numeric(15,2),
    valuation_committee_fee numeric(15,2),
    alternative_rent_committee_fee numeric(15,2),
    auction_committee_fee numeric(15,2),
    surplus_rent_committee_fee numeric(15,2),
    service_fee_2_percent numeric(15,2),
    payer_name character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.deposits OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16408)
-- Name: deposits_deposit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deposits_deposit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deposits_deposit_id_seq OWNER TO postgres;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 219
-- Name: deposits_deposit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deposits_deposit_id_seq OWNED BY public.deposits.deposit_id;


--
-- TOC entry 216 (class 1259 OID 16386)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    file_number character varying(100),
    project_name character varying(255) NOT NULL,
    owner_name character varying(255) NOT NULL,
    owner_phone character varying(50),
    location character varying(500),
    sector character varying(255),
    land_number character varying(100),
    plot_number character varying(100),
    district character varying(100),
    next_payment_date date,
    last_payment_date date,
    last_invoice_number character varying(100),
    alternative_names json,
    alternative_phones json,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16385)
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_project_id_seq OWNER TO postgres;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 215
-- Name: projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_project_id_seq OWNED BY public.projects.project_id;


--
-- TOC entry 218 (class 1259 OID 16397)
-- Name: revenues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revenues (
    revenue_id integer NOT NULL,
    project_id integer NOT NULL,
    payment_type character varying(20) DEFAULT 'cash'::character varying,
    check_number character varying(100),
    check_date date,
    invoice_number character varying(100),
    invoice_date date,
    base_rent numeric(15,2),
    alternative_rent numeric(15,2),
    contract_difference numeric(15,2),
    late_penalty numeric(15,2),
    financial_category character varying(255),
    auction_entry_fee numeric(15,2),
    payer_name character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.revenues OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16396)
-- Name: revenues_revenue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.revenues_revenue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.revenues_revenue_id_seq OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 217
-- Name: revenues_revenue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.revenues_revenue_id_seq OWNED BY public.revenues.revenue_id;


--
-- TOC entry 222 (class 1259 OID 16421)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(100) NOT NULL,
    password_hash character varying(255) NOT NULL,
    display_name character varying(255),
    role character varying(50) DEFAULT 'user'::character varying,
    permissions json,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16420)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3300 (class 2604 OID 16438)
-- Name: deposit_returns return_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_returns ALTER COLUMN return_id SET DEFAULT nextval('public.deposit_returns_return_id_seq'::regclass);


--
-- TOC entry 3292 (class 2604 OID 16412)
-- Name: deposits deposit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposits ALTER COLUMN deposit_id SET DEFAULT nextval('public.deposits_deposit_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 16389)
-- Name: projects project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN project_id SET DEFAULT nextval('public.projects_project_id_seq'::regclass);


--
-- TOC entry 3288 (class 2604 OID 16400)
-- Name: revenues revenue_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenues ALTER COLUMN revenue_id SET DEFAULT nextval('public.revenues_revenue_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 16424)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3472 (class 0 OID 16435)
-- Dependencies: 224
-- Data for Name: deposit_returns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deposit_returns (return_id, project_id, return_date, payment_type, check_number, amount, recipient_name, return_type, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3468 (class 0 OID 16409)
-- Dependencies: 220
-- Data for Name: deposits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deposits (deposit_id, project_id, payment_type, check_number, check_date, invoice_number, invoice_date, deposit_20_percent, survey_committee_fee, valuation_committee_fee, alternative_rent_committee_fee, auction_committee_fee, surplus_rent_committee_fee, service_fee_2_percent, payer_name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3464 (class 0 OID 16386)
-- Dependencies: 216
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, file_number, project_name, owner_name, owner_phone, location, sector, land_number, plot_number, district, next_payment_date, last_payment_date, last_invoice_number, alternative_names, alternative_phones, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3466 (class 0 OID 16397)
-- Dependencies: 218
-- Data for Name: revenues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.revenues (revenue_id, project_id, payment_type, check_number, check_date, invoice_number, invoice_date, base_rent, alternative_rent, contract_difference, late_penalty, financial_category, auction_entry_fee, payer_name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3470 (class 0 OID 16421)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password_hash, display_name, role, permissions, created_at, updated_at) FROM stdin;
1	admin	d3fc50c8f714cebd16d6c827826df01205bf519529f9d34775293cf9b70a420e	Admin	admin	\N	2026-03-28 21:12:19.815052	2026-03-28 21:12:19.815052
\.


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 223
-- Name: deposit_returns_return_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deposit_returns_return_id_seq', 1, false);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 219
-- Name: deposits_deposit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deposits_deposit_id_seq', 1, false);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 215
-- Name: projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_project_id_seq', 1, false);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 217
-- Name: revenues_revenue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.revenues_revenue_id_seq', 1, false);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- TOC entry 3316 (class 2606 OID 16444)
-- Name: deposit_returns deposit_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_returns
    ADD CONSTRAINT deposit_returns_pkey PRIMARY KEY (return_id);


--
-- TOC entry 3310 (class 2606 OID 16419)
-- Name: deposits deposits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_pkey PRIMARY KEY (deposit_id);


--
-- TOC entry 3306 (class 2606 OID 16395)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- TOC entry 3308 (class 2606 OID 16407)
-- Name: revenues revenues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenues
    ADD CONSTRAINT revenues_pkey PRIMARY KEY (revenue_id);


--
-- TOC entry 3312 (class 2606 OID 16431)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3314 (class 2606 OID 16433)
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- TOC entry 3319 (class 2606 OID 16455)
-- Name: deposit_returns deposit_returns_project_id_projects_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit_returns
    ADD CONSTRAINT deposit_returns_project_id_projects_project_id_fk FOREIGN KEY (project_id) REFERENCES public.projects(project_id) ON DELETE CASCADE;


--
-- TOC entry 3318 (class 2606 OID 16450)
-- Name: deposits deposits_project_id_projects_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_project_id_projects_project_id_fk FOREIGN KEY (project_id) REFERENCES public.projects(project_id) ON DELETE CASCADE;


--
-- TOC entry 3317 (class 2606 OID 16445)
-- Name: revenues revenues_project_id_projects_project_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenues
    ADD CONSTRAINT revenues_project_id_projects_project_id_fk FOREIGN KEY (project_id) REFERENCES public.projects(project_id) ON DELETE CASCADE;


-- Completed on 2026-03-28 21:14:28 UTC

--
-- PostgreSQL database dump complete
--

\unrestrict XVkoDI3izznwKJP4JPT5pVba2I74dfq9SMeCPSS1KOra2zgstInk6OdKRhCU3f5

