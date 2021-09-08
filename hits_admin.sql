--
-- PostgreSQL database dump
--

-- Dumped from database version 10.17
-- Dumped by pg_dump version 10.17

-- Started on 2021-09-08 13:31:55

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

DROP DATABASE justo_hits;
--
-- TOC entry 2946 (class 1262 OID 26817)
-- Name: justo_hits; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE justo_hits WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';


ALTER DATABASE justo_hits OWNER TO postgres;

\connect justo_hits

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 26831)
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    staff boolean NOT NULL,
    admin boolean NOT NULL,
    username character varying(100) NOT NULL,
    is_boss boolean NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 26829)
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO postgres;

--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 198
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;


--
-- TOC entry 211 (class 1259 OID 26938)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 26936)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 213 (class 1259 OID 26948)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 26946)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 209 (class 1259 OID 26930)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 26928)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 214 (class 1259 OID 26980)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 26852)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 26850)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 201 (class 1259 OID 26842)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 26840)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 26820)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 26818)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 215 (class 1259 OID 26993)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 26876)
-- Name: hitman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hitman (
    id bigint NOT NULL,
    name character varying(100),
    description character varying(500),
    status character varying(2) NOT NULL,
    manager_id bigint,
    user_id bigint,
    rol character varying(2) NOT NULL
);


ALTER TABLE public.hitman OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 26874)
-- Name: hitman_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hitman_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hitman_id_seq OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 204
-- Name: hitman_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hitman_id_seq OWNED BY public.hitman.id;


--
-- TOC entry 207 (class 1259 OID 26889)
-- Name: hits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hits (
    id bigint NOT NULL,
    target character varying(100),
    description character varying(500),
    status character varying(2) NOT NULL,
    date date NOT NULL,
    created_by_id bigint,
    hitman_id bigint
);


ALTER TABLE public.hits OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 26887)
-- Name: hits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hits_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 206
-- Name: hits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hits_id_seq OWNED BY public.hits.id;


--
-- TOC entry 2732 (class 2604 OID 26834)
-- Name: accounts_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);


--
-- TOC entry 2739 (class 2604 OID 26941)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2740 (class 2604 OID 26951)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2738 (class 2604 OID 26933)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2734 (class 2604 OID 26855)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2733 (class 2604 OID 26845)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2731 (class 2604 OID 26823)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 26879)
-- Name: hitman id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitman ALTER COLUMN id SET DEFAULT nextval('public.hitman_id_seq'::regclass);


--
-- TOC entry 2737 (class 2604 OID 26892)
-- Name: hits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hits ALTER COLUMN id SET DEFAULT nextval('public.hits_id_seq'::regclass);


--
-- TOC entry 2924 (class 0 OID 26831)
-- Dependencies: 199
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (12, 'pbkdf2_sha256$260000$0MBn50HxISrTFVSbB0VNP3$vC38NvHaZQb/2TMXXjsDPBJsWvVewdxyPdN9QlCptCI=', NULL, 'man2@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (13, 'pbkdf2_sha256$260000$3VHS3y388ajIZvYjNmuKcH$Aqz6GPqDy4/KOhPSNMZQAl9SkNJT3tF4NkyiGA27epY=', NULL, 'man3@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (4, 'pbkdf2_sha256$260000$craog68M78ZcEEks07P8lE$gFOiNOfJfYqtKPNU/DARaparUk9okW4Y2sfvNgl+gGA=', NULL, 'ase3@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (5, 'pbkdf2_sha256$260000$VpkmDAu4gwLdYRC5JagNlv$j1KxWFFjk6XJk/H773uxqkENMlqH9TrAEKhFgDMy+Lw=', NULL, 'ase4@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (6, 'pbkdf2_sha256$260000$XTjI34shaerGnZQACFHkOg$3cL59tQvpX+Wgvv97DxSCO0NAeZ+ZOF+KTkCc2rwbVM=', NULL, 'ase5@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (7, 'pbkdf2_sha256$260000$gmaeFP3VHTPUsorrfFskGb$PwJsDDRsVAAvhSXSp5k+u9CSCCkiP/Ha1h91HTeNGPA=', NULL, 'ase6@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (8, 'pbkdf2_sha256$260000$uxIJ7f49ZGMJuRzLBCOD2Z$Q9uJ4YkE805BfVc7sX5MBh0qaAMfWgIet1LnUml7zQw=', NULL, 'ase7@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (9, 'pbkdf2_sha256$260000$3UidSK0HT4alOKdT0ip377$+Oj8ksRPBUuVlcIt0w7fEB2id/OG0ZAjTmr6T0T6Gpk=', NULL, 'ase8@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (10, 'pbkdf2_sha256$260000$GzTRAZLwHPtXw6LlflMB4h$PfNLErwqgH/VaeBmauNttipgY4a+aYng4dDHjKSm/oU=', NULL, 'ase9@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (11, 'pbkdf2_sha256$260000$Qi16rw6xKia3A86f5xSbNp$Ft1MPFClcddvXXkbcq8iGUpzV1PbUzl6MwLgtmV5jNw=', NULL, 'man1@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (2, 'pbkdf2_sha256$260000$QiRgsd5hO8wCTVC8x8Bb7a$T4rm0nnL5UUBhyATaIYshGy1LIO0Pai62LhzMCOaf00=', NULL, 'ase1@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (3, 'pbkdf2_sha256$260000$1sHQwVEtA9Ume4x90s5hSV$HekQfE3zhW6y1RclgcIaKQaQyGyXAv4D//fbIbKpszE=', NULL, 'ase2@hits.com', true, false, false, '', false);
INSERT INTO public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) VALUES (1, 'pbkdf2_sha256$260000$bWfkU59R4ri4ZTTlEPElk8$ujI7X9XpJxaJSeuFjboKuEgoWkJ3Fp2tGREmT1RRTG0=', '2021-08-31 05:13:38.306341-05', 'admin@hits.com', true, true, true, '', false);


--
-- TOC entry 2936 (class 0 OID 26938)
-- Dependencies: 211
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2938 (class 0 OID 26948)
-- Dependencies: 213
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2934 (class 0 OID 26930)
-- Dependencies: 209
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add Token', 6, 'add_token');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change Token', 6, 'change_token');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete Token', 6, 'delete_token');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view Token', 6, 'view_token');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add token', 7, 'add_tokenproxy');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change token', 7, 'change_tokenproxy');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete token', 7, 'delete_tokenproxy');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view token', 7, 'view_tokenproxy');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add Hitman', 8, 'add_hitman');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change Hitman', 8, 'change_hitman');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete Hitman', 8, 'delete_hitman');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view Hitman', 8, 'view_hitman');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add Hits', 9, 'add_hits');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change Hits', 9, 'change_hits');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete Hits', 9, 'delete_hits');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view Hits', 9, 'view_hits');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add user', 10, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change user', 10, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete user', 10, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view user', 10, 'view_user');


--
-- TOC entry 2939 (class 0 OID 26980)
-- Dependencies: 214
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.authtoken_token (key, created, user_id) VALUES ('236940630b0d897ef5c00ab57c2b03e0d4f693ea', '2021-08-31 04:23:40.741401-05', 1);
INSERT INTO public.authtoken_token (key, created, user_id) VALUES ('66eec6604879ff30afc5e814e311de55c8238c45', '2021-08-31 10:12:18.906143-05', 2);
INSERT INTO public.authtoken_token (key, created, user_id) VALUES ('1b3a459ead32424e9599f24f4809e91de2048b7f', '2021-08-31 13:16:52.87326-05', 11);
INSERT INTO public.authtoken_token (key, created, user_id) VALUES ('7b14b8f6aabcc34fcb7cf080e1186c5cffa0b078', '2021-09-01 01:10:03.03736-05', 4);


--
-- TOC entry 2928 (class 0 OID 26852)
-- Dependencies: 203
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2021-08-31 00:41:51.57796-05', '2', 'ase1@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 1"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2021-08-31 01:51:06.251456-05', '3', 'ase2@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 2"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2021-08-31 01:51:26.864815-05', '4', 'ase3@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 3"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2021-08-31 01:51:52.427807-05', '5', 'ase4@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 4"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2021-08-31 01:52:24.086541-05', '6', 'ase5@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 5"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2021-08-31 01:52:52.671295-05', '7', 'ase6@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 6"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2021-08-31 01:53:19.154699-05', '8', 'ase7@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 7"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2021-08-31 01:53:43.930999-05', '9', 'ase8@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 8"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2021-08-31 01:54:16.705175-05', '10', 'ase9@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 9"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2021-08-31 01:54:48.090902-05', '11', 'man1@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Manager 1"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2021-08-31 01:55:27.280533-05', '12', 'man2@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Manager 2"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2021-08-31 01:56:00.326453-05', '13', 'man3@hits.com', 1, '[{"added": {}}, {"added": {"name": "Hitman", "object": "Manager3"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2021-08-31 01:56:14.924645-05', '2', 'ase1@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 1", "fields": ["Manager"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2021-08-31 02:12:39.074954-05', '3', 'ase2@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 2", "fields": ["Manager"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2021-08-31 02:12:59.237962-05', '4', 'ase3@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 3", "fields": ["Manager"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (16, '2021-08-31 02:13:29.185053-05', '5', 'ase4@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 4", "fields": ["Manager"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (17, '2021-08-31 03:02:52.250883-05', '6', 'ase5@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 5", "fields": ["manager"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (18, '2021-08-31 03:03:17.565793-05', '7', 'ase6@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 6", "fields": ["manager"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (19, '2021-08-31 03:03:28.143329-05', '8', 'ase7@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 7", "fields": ["manager"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (20, '2021-08-31 03:03:46.845713-05', '9', 'ase8@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 8", "fields": ["manager"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (21, '2021-08-31 03:03:58.296217-05', '10', 'ase9@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 9", "fields": ["manager"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (22, '2021-08-31 03:04:28.477802-05', '10', 'ase9@hits.com', 2, '[]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (23, '2021-08-31 03:14:06.189161-05', '1', 'admin@hits.com', 2, '[{"added": {"name": "Hitman", "object": "Administrator"}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (24, '2021-08-31 04:19:25.62087-05', '4', '4', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (25, '2021-08-31 04:19:40.422383-05', '4', '4', 2, '[{"changed": {"fields": ["Status"]}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (26, '2021-08-31 09:47:02.337107-05', '4', '4', 2, '[{"changed": {"fields": ["Assignee"]}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (27, '2021-08-31 09:48:50.234183-05', '2', 'ase1@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 1", "fields": ["Hits"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (28, '2021-08-31 09:50:06.640586-05', '1', 'admin@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Administrator", "fields": ["manager", "Hits"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (29, '2021-08-31 09:51:06.692944-05', '2', 'ase1@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 1", "fields": ["Hits"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (30, '2021-08-31 10:08:29.9811-05', '4', '4', 2, '[{"changed": {"fields": ["Hitman"]}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (31, '2021-08-31 10:11:44.970192-05', '5', '5', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (32, '2021-08-31 13:37:29.671937-05', '11', 'man1@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Manager 1", "fields": ["manager"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (33, '2021-08-31 14:16:24.853024-05', '4', '4', 2, '[{"changed": {"fields": ["Status"]}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (34, '2021-08-31 14:17:19.206583-05', '4', '4', 2, '[{"changed": {"fields": ["Hitman"]}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (35, '2021-08-31 14:17:33.473821-05', '3', 'ase2@hits.com', 2, '[]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (36, '2021-08-31 14:18:55.163998-05', '4', '4', 2, '[{"changed": {"fields": ["Hitman"]}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (37, '2021-08-31 14:20:11.062485-05', '6', '6', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (38, '2021-08-31 22:58:40.517488-05', '7', '7', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (39, '2021-09-01 01:08:31.937509-05', '2', 'ase1@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 1", "fields": ["Status"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (40, '2021-09-01 01:08:57.998506-05', '3', 'ase2@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Asesino 2", "fields": ["Status"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (41, '2021-09-01 12:41:21.680845-05', '1', 'admin@hits.com', 2, '[{"changed": {"name": "Hitman", "object": "Administrator", "fields": ["Status"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (42, '2021-09-01 12:42:01.931489-05', '15', '15', 3, '', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (43, '2021-09-01 12:42:01.936491-05', '14', '14', 3, '', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (44, '2021-09-01 12:42:01.93949-05', '13', '13', 3, '', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (45, '2021-09-01 12:42:01.94049-05', '12', '12', 3, '', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (46, '2021-09-01 12:42:01.94349-05', '11', '11', 3, '', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (47, '2021-09-01 12:42:16.101424-05', '10', '10', 3, '', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (48, '2021-09-01 12:42:16.107425-05', '9', '9', 3, '', 9, 1);


--
-- TOC entry 2926 (class 0 OID 26842)
-- Dependencies: 201
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'authtoken', 'token');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'authtoken', 'tokenproxy');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'api', 'hitman');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'api', 'hits');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'accounts', 'user');


--
-- TOC entry 2922 (class 0 OID 26820)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'accounts', '0001_initial', '2021-08-31 00:20:53.93896-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0001_initial', '2021-08-31 00:20:53.957963-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2021-08-31 00:20:53.998966-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-08-31 00:20:54.005965-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-08-31 00:20:54.014964-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'api', '0001_initial', '2021-08-31 00:20:54.074969-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2021-08-31 00:20:54.094972-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0001_initial', '2021-08-31 00:20:54.170979-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0002_alter_permission_name_max_length', '2021-08-31 00:20:54.184979-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0003_alter_user_email_max_length', '2021-08-31 00:20:54.193979-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0004_alter_user_username_opts', '2021-08-31 00:20:54.20298-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0005_alter_user_last_login_null', '2021-08-31 00:20:54.21098-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0006_require_contenttypes_0002', '2021-08-31 00:20:54.213981-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0007_alter_validators_add_error_messages', '2021-08-31 00:20:54.224982-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0008_alter_user_username_max_length', '2021-08-31 00:20:54.233982-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0009_alter_user_last_name_max_length', '2021-08-31 00:20:54.243982-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'auth', '0010_alter_group_name_max_length', '2021-08-31 00:20:54.261986-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'auth', '0011_update_proxy_permissions', '2021-08-31 00:20:54.274987-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'auth', '0012_alter_user_first_name_max_length', '2021-08-31 00:20:54.283986-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'authtoken', '0001_initial', '2021-08-31 00:20:54.311988-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'authtoken', '0002_auto_20160226_1747', '2021-08-31 00:20:54.340991-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'authtoken', '0003_tokenproxy', '2021-08-31 00:20:54.34499-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'sessions', '0001_initial', '2021-08-31 00:20:54.368992-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'accounts', '0002_remove_user_rol', '2021-08-31 00:57:30.502118-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (25, 'api', '0002_auto_20210831_0057', '2021-08-31 00:57:30.631128-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (26, 'api', '0003_auto_20210831_0418', '2021-08-31 04:18:33.079361-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (27, 'api', '0004_auto_20210831_1006', '2021-08-31 10:06:51.54552-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (28, 'api', '0005_remove_hits_assignee', '2021-09-01 10:31:16.881633-05');


--
-- TOC entry 2940 (class 0 OID 26993)
-- Dependencies: 215
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('k2ipq4u6fnw7j241x7ezyna0o4m10q51', '.eJxVjEEOwiAQRe_C2hAGKDAu3XsGMjAgVdMmpV0Z765NutDtf-_9l4i0rS1uvSxxZHEWIE6_W6L8KNMO-E7TbZZ5ntZlTHJX5EG7vM5cnpfD_Tto1Nu3dl5DgRrAKLTWa2tcqC6hMoEdc0VMmQwQDjYpm3xwAFw86goIA2nx_gCyJzbA:1mL0lu:SDm7RUoH5Vek-NMvBbtK0Rmugrwkml0porZQkvmDQUk', '2021-09-14 05:13:38.314342-05');


--
-- TOC entry 2930 (class 0 OID 26876)
-- Dependencies: 205
-- Data for Name: hitman; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (11, 'Manager 2', 'Manager 2', '1', NULL, 12, '2');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (12, 'Manager3', 'Manager 3', '1', NULL, 13, '2');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (4, 'Asesino 4', 'Mortal', '1', 11, 5, '1');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (5, 'Asesino 5', 'Mortal', '1', 11, 6, '1');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (6, 'Asesino 6', 'Mortal', '1', 11, 7, '1');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (8, 'Asesino 8', 'Mortal', '1', 12, 9, '1');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (9, 'Asesino 9', 'Mortal', '1', 12, 10, '1');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (1, 'Asesino 1', 'Mortal', '3', 10, 2, '1');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (2, 'Asesino 2', 'Mortal', '2', 10, 3, '1');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (3, 'Asesino 3', 'Mortal', '1', 10, 4, '1');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (10, 'Manager 1', 'Manager 1', '3', 10, 11, '2');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (13, 'Administrator', 'Mortal', '1', 10, 1, '1');
INSERT INTO public.hitman (id, name, description, status, manager_id, user_id, rol) VALUES (7, 'Asesino 7', 'Mortal', '2', 12, 8, '1');


--
-- TOC entry 2932 (class 0 OID 26889)
-- Dependencies: 207
-- Data for Name: hits; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hits (id, target, description, status, date, created_by_id, hitman_id) VALUES (5, 'Objetivo 2', 'Seguir y eliminar', '2', '2021-08-31', NULL, 1);
INSERT INTO public.hits (id, target, description, status, date, created_by_id, hitman_id) VALUES (6, 'Objetivo 3', 'Seguir y eliminar', '2', '2021-08-31', NULL, 3);
INSERT INTO public.hits (id, target, description, status, date, created_by_id, hitman_id) VALUES (7, 'Objetivo Inter', 'Seguir y eliminar', '2', '2021-09-01', 1, 4);
INSERT INTO public.hits (id, target, description, status, date, created_by_id, hitman_id) VALUES (4, 'Objetivo 1', 'Seguir y eliminar', '3', '2021-08-31', NULL, 7);
INSERT INTO public.hits (id, target, description, status, date, created_by_id, hitman_id) VALUES (8, 'Presidente', NULL, '1', '2021-09-01', 11, NULL);


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 198
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 13, true);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 48, true);


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 204
-- Name: hitman_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hitman_id_seq', 13, true);


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 206
-- Name: hits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hits_id_seq', 15, true);


--
-- TOC entry 2745 (class 2606 OID 26838)
-- Name: accounts_user accounts_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_email_key UNIQUE (email);


--
-- TOC entry 2747 (class 2606 OID 26836)
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 26978)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2777 (class 2606 OID 26964)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2780 (class 2606 OID 26953)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 26943)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 26955)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2769 (class 2606 OID 26935)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 26984)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 2785 (class 2606 OID 26986)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 2754 (class 2606 OID 26861)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 26849)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2751 (class 2606 OID 26847)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 26828)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 27000)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2758 (class 2606 OID 26884)
-- Name: hitman hitman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitman
    ADD CONSTRAINT hitman_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 26886)
-- Name: hitman hitman_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitman
    ADD CONSTRAINT hitman_user_id_key UNIQUE (user_id);


--
-- TOC entry 2764 (class 2606 OID 26897)
-- Name: hits hits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hits
    ADD CONSTRAINT hits_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 1259 OID 26839)
-- Name: accounts_user_email_b2644a56_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_email_b2644a56_like ON public.accounts_user USING btree (email varchar_pattern_ops);


--
-- TOC entry 2770 (class 1259 OID 26979)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2775 (class 1259 OID 26975)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2778 (class 1259 OID 26976)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2765 (class 1259 OID 26961)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2781 (class 1259 OID 26992)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 2752 (class 1259 OID 26872)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2755 (class 1259 OID 26873)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2786 (class 1259 OID 27002)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2789 (class 1259 OID 27001)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2756 (class 1259 OID 26910)
-- Name: hitman_manager_id_91df0db5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hitman_manager_id_91df0db5 ON public.hitman USING btree (manager_id);


--
-- TOC entry 2761 (class 1259 OID 26927)
-- Name: hits_created_by_id_d283c24b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hits_created_by_id_d283c24b ON public.hits USING btree (created_by_id);


--
-- TOC entry 2762 (class 1259 OID 27035)
-- Name: hits_hitman_id_243ff1d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hits_hitman_id_243ff1d6 ON public.hits USING btree (hitman_id);


--
-- TOC entry 2798 (class 2606 OID 26970)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2797 (class 2606 OID 26965)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2796 (class 2606 OID 26956)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2799 (class 2606 OID 26987)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2790 (class 2606 OID 26862)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2791 (class 2606 OID 26867)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2792 (class 2606 OID 26900)
-- Name: hitman hitman_manager_id_91df0db5_fk_hitman_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitman
    ADD CONSTRAINT hitman_manager_id_91df0db5_fk_hitman_id FOREIGN KEY (manager_id) REFERENCES public.hitman(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2793 (class 2606 OID 26905)
-- Name: hitman hitman_user_id_a749301f_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hitman
    ADD CONSTRAINT hitman_user_id_a749301f_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2794 (class 2606 OID 27025)
-- Name: hits hits_created_by_id_d283c24b_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hits
    ADD CONSTRAINT hits_created_by_id_d283c24b_fk_accounts_user_id FOREIGN KEY (created_by_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2795 (class 2606 OID 27030)
-- Name: hits hits_hitman_id_243ff1d6_fk_hitman_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hits
    ADD CONSTRAINT hits_hitman_id_243ff1d6_fk_hitman_id FOREIGN KEY (hitman_id) REFERENCES public.hitman(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2021-09-08 13:31:55

--
-- PostgreSQL database dump complete
--

