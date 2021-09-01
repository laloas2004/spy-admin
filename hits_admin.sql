--
-- PostgreSQL database dump
--

-- Dumped from database version 10.17
-- Dumped by pg_dump version 10.17

-- Started on 2021-09-01 13:41:38

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
-- TOC entry 2924 (class 0 OID 26831)
-- Dependencies: 199
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user (id, password, last_login, email, is_active, staff, admin, username, is_boss) FROM stdin;
12	pbkdf2_sha256$260000$0MBn50HxISrTFVSbB0VNP3$vC38NvHaZQb/2TMXXjsDPBJsWvVewdxyPdN9QlCptCI=	\N	man2@hits.com	t	f	f		f
13	pbkdf2_sha256$260000$3VHS3y388ajIZvYjNmuKcH$Aqz6GPqDy4/KOhPSNMZQAl9SkNJT3tF4NkyiGA27epY=	\N	man3@hits.com	t	f	f		f
4	pbkdf2_sha256$260000$craog68M78ZcEEks07P8lE$gFOiNOfJfYqtKPNU/DARaparUk9okW4Y2sfvNgl+gGA=	\N	ase3@hits.com	t	f	f		f
5	pbkdf2_sha256$260000$VpkmDAu4gwLdYRC5JagNlv$j1KxWFFjk6XJk/H773uxqkENMlqH9TrAEKhFgDMy+Lw=	\N	ase4@hits.com	t	f	f		f
6	pbkdf2_sha256$260000$XTjI34shaerGnZQACFHkOg$3cL59tQvpX+Wgvv97DxSCO0NAeZ+ZOF+KTkCc2rwbVM=	\N	ase5@hits.com	t	f	f		f
7	pbkdf2_sha256$260000$gmaeFP3VHTPUsorrfFskGb$PwJsDDRsVAAvhSXSp5k+u9CSCCkiP/Ha1h91HTeNGPA=	\N	ase6@hits.com	t	f	f		f
8	pbkdf2_sha256$260000$uxIJ7f49ZGMJuRzLBCOD2Z$Q9uJ4YkE805BfVc7sX5MBh0qaAMfWgIet1LnUml7zQw=	\N	ase7@hits.com	t	f	f		f
9	pbkdf2_sha256$260000$3UidSK0HT4alOKdT0ip377$+Oj8ksRPBUuVlcIt0w7fEB2id/OG0ZAjTmr6T0T6Gpk=	\N	ase8@hits.com	t	f	f		f
10	pbkdf2_sha256$260000$GzTRAZLwHPtXw6LlflMB4h$PfNLErwqgH/VaeBmauNttipgY4a+aYng4dDHjKSm/oU=	\N	ase9@hits.com	t	f	f		f
11	pbkdf2_sha256$260000$Qi16rw6xKia3A86f5xSbNp$Ft1MPFClcddvXXkbcq8iGUpzV1PbUzl6MwLgtmV5jNw=	\N	man1@hits.com	t	f	f		f
2	pbkdf2_sha256$260000$QiRgsd5hO8wCTVC8x8Bb7a$T4rm0nnL5UUBhyATaIYshGy1LIO0Pai62LhzMCOaf00=	\N	ase1@hits.com	t	f	f		f
3	pbkdf2_sha256$260000$1sHQwVEtA9Ume4x90s5hSV$HekQfE3zhW6y1RclgcIaKQaQyGyXAv4D//fbIbKpszE=	\N	ase2@hits.com	t	f	f		f
1	pbkdf2_sha256$260000$bWfkU59R4ri4ZTTlEPElk8$ujI7X9XpJxaJSeuFjboKuEgoWkJ3Fp2tGREmT1RRTG0=	2021-08-31 05:13:38.306341-05	admin@hits.com	t	t	t		f
\.


--
-- TOC entry 2936 (class 0 OID 26938)
-- Dependencies: 211
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 26948)
-- Dependencies: 213
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 26930)
-- Dependencies: 209
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add token	7	add_tokenproxy
26	Can change token	7	change_tokenproxy
27	Can delete token	7	delete_tokenproxy
28	Can view token	7	view_tokenproxy
29	Can add Hitman	8	add_hitman
30	Can change Hitman	8	change_hitman
31	Can delete Hitman	8	delete_hitman
32	Can view Hitman	8	view_hitman
33	Can add Hits	9	add_hits
34	Can change Hits	9	change_hits
35	Can delete Hits	9	delete_hits
36	Can view Hits	9	view_hits
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
\.


--
-- TOC entry 2939 (class 0 OID 26980)
-- Dependencies: 214
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
236940630b0d897ef5c00ab57c2b03e0d4f693ea	2021-08-31 04:23:40.741401-05	1
66eec6604879ff30afc5e814e311de55c8238c45	2021-08-31 10:12:18.906143-05	2
1b3a459ead32424e9599f24f4809e91de2048b7f	2021-08-31 13:16:52.87326-05	11
7b14b8f6aabcc34fcb7cf080e1186c5cffa0b078	2021-09-01 01:10:03.03736-05	4
\.


--
-- TOC entry 2928 (class 0 OID 26852)
-- Dependencies: 203
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-08-31 00:41:51.57796-05	2	ase1@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 1"}}]	10	1
2	2021-08-31 01:51:06.251456-05	3	ase2@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 2"}}]	10	1
3	2021-08-31 01:51:26.864815-05	4	ase3@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 3"}}]	10	1
4	2021-08-31 01:51:52.427807-05	5	ase4@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 4"}}]	10	1
5	2021-08-31 01:52:24.086541-05	6	ase5@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 5"}}]	10	1
6	2021-08-31 01:52:52.671295-05	7	ase6@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 6"}}]	10	1
7	2021-08-31 01:53:19.154699-05	8	ase7@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 7"}}]	10	1
8	2021-08-31 01:53:43.930999-05	9	ase8@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 8"}}]	10	1
9	2021-08-31 01:54:16.705175-05	10	ase9@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Asesino 9"}}]	10	1
10	2021-08-31 01:54:48.090902-05	11	man1@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Manager 1"}}]	10	1
11	2021-08-31 01:55:27.280533-05	12	man2@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Manager 2"}}]	10	1
12	2021-08-31 01:56:00.326453-05	13	man3@hits.com	1	[{"added": {}}, {"added": {"name": "Hitman", "object": "Manager3"}}]	10	1
13	2021-08-31 01:56:14.924645-05	2	ase1@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 1", "fields": ["Manager"]}}]	10	1
14	2021-08-31 02:12:39.074954-05	3	ase2@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 2", "fields": ["Manager"]}}]	10	1
15	2021-08-31 02:12:59.237962-05	4	ase3@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 3", "fields": ["Manager"]}}]	10	1
16	2021-08-31 02:13:29.185053-05	5	ase4@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 4", "fields": ["Manager"]}}]	10	1
17	2021-08-31 03:02:52.250883-05	6	ase5@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 5", "fields": ["manager"]}}]	10	1
18	2021-08-31 03:03:17.565793-05	7	ase6@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 6", "fields": ["manager"]}}]	10	1
19	2021-08-31 03:03:28.143329-05	8	ase7@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 7", "fields": ["manager"]}}]	10	1
20	2021-08-31 03:03:46.845713-05	9	ase8@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 8", "fields": ["manager"]}}]	10	1
21	2021-08-31 03:03:58.296217-05	10	ase9@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 9", "fields": ["manager"]}}]	10	1
22	2021-08-31 03:04:28.477802-05	10	ase9@hits.com	2	[]	10	1
23	2021-08-31 03:14:06.189161-05	1	admin@hits.com	2	[{"added": {"name": "Hitman", "object": "Administrator"}}]	10	1
24	2021-08-31 04:19:25.62087-05	4	4	1	[{"added": {}}]	9	1
25	2021-08-31 04:19:40.422383-05	4	4	2	[{"changed": {"fields": ["Status"]}}]	9	1
26	2021-08-31 09:47:02.337107-05	4	4	2	[{"changed": {"fields": ["Assignee"]}}]	9	1
27	2021-08-31 09:48:50.234183-05	2	ase1@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 1", "fields": ["Hits"]}}]	10	1
28	2021-08-31 09:50:06.640586-05	1	admin@hits.com	2	[{"changed": {"name": "Hitman", "object": "Administrator", "fields": ["manager", "Hits"]}}]	10	1
29	2021-08-31 09:51:06.692944-05	2	ase1@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 1", "fields": ["Hits"]}}]	10	1
30	2021-08-31 10:08:29.9811-05	4	4	2	[{"changed": {"fields": ["Hitman"]}}]	9	1
31	2021-08-31 10:11:44.970192-05	5	5	1	[{"added": {}}]	9	1
32	2021-08-31 13:37:29.671937-05	11	man1@hits.com	2	[{"changed": {"name": "Hitman", "object": "Manager 1", "fields": ["manager"]}}]	10	1
33	2021-08-31 14:16:24.853024-05	4	4	2	[{"changed": {"fields": ["Status"]}}]	9	1
34	2021-08-31 14:17:19.206583-05	4	4	2	[{"changed": {"fields": ["Hitman"]}}]	9	1
35	2021-08-31 14:17:33.473821-05	3	ase2@hits.com	2	[]	10	1
36	2021-08-31 14:18:55.163998-05	4	4	2	[{"changed": {"fields": ["Hitman"]}}]	9	1
37	2021-08-31 14:20:11.062485-05	6	6	1	[{"added": {}}]	9	1
38	2021-08-31 22:58:40.517488-05	7	7	1	[{"added": {}}]	9	1
39	2021-09-01 01:08:31.937509-05	2	ase1@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 1", "fields": ["Status"]}}]	10	1
40	2021-09-01 01:08:57.998506-05	3	ase2@hits.com	2	[{"changed": {"name": "Hitman", "object": "Asesino 2", "fields": ["Status"]}}]	10	1
41	2021-09-01 12:41:21.680845-05	1	admin@hits.com	2	[{"changed": {"name": "Hitman", "object": "Administrator", "fields": ["Status"]}}]	10	1
42	2021-09-01 12:42:01.931489-05	15	15	3		9	1
43	2021-09-01 12:42:01.936491-05	14	14	3		9	1
44	2021-09-01 12:42:01.93949-05	13	13	3		9	1
45	2021-09-01 12:42:01.94049-05	12	12	3		9	1
46	2021-09-01 12:42:01.94349-05	11	11	3		9	1
47	2021-09-01 12:42:16.101424-05	10	10	3		9	1
48	2021-09-01 12:42:16.107425-05	9	9	3		9	1
\.


--
-- TOC entry 2926 (class 0 OID 26842)
-- Dependencies: 201
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	authtoken	tokenproxy
8	api	hitman
9	api	hits
10	accounts	user
\.


--
-- TOC entry 2922 (class 0 OID 26820)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	accounts	0001_initial	2021-08-31 00:20:53.93896-05
2	contenttypes	0001_initial	2021-08-31 00:20:53.957963-05
3	admin	0001_initial	2021-08-31 00:20:53.998966-05
4	admin	0002_logentry_remove_auto_add	2021-08-31 00:20:54.005965-05
5	admin	0003_logentry_add_action_flag_choices	2021-08-31 00:20:54.014964-05
6	api	0001_initial	2021-08-31 00:20:54.074969-05
7	contenttypes	0002_remove_content_type_name	2021-08-31 00:20:54.094972-05
8	auth	0001_initial	2021-08-31 00:20:54.170979-05
9	auth	0002_alter_permission_name_max_length	2021-08-31 00:20:54.184979-05
10	auth	0003_alter_user_email_max_length	2021-08-31 00:20:54.193979-05
11	auth	0004_alter_user_username_opts	2021-08-31 00:20:54.20298-05
12	auth	0005_alter_user_last_login_null	2021-08-31 00:20:54.21098-05
13	auth	0006_require_contenttypes_0002	2021-08-31 00:20:54.213981-05
14	auth	0007_alter_validators_add_error_messages	2021-08-31 00:20:54.224982-05
15	auth	0008_alter_user_username_max_length	2021-08-31 00:20:54.233982-05
16	auth	0009_alter_user_last_name_max_length	2021-08-31 00:20:54.243982-05
17	auth	0010_alter_group_name_max_length	2021-08-31 00:20:54.261986-05
18	auth	0011_update_proxy_permissions	2021-08-31 00:20:54.274987-05
19	auth	0012_alter_user_first_name_max_length	2021-08-31 00:20:54.283986-05
20	authtoken	0001_initial	2021-08-31 00:20:54.311988-05
21	authtoken	0002_auto_20160226_1747	2021-08-31 00:20:54.340991-05
22	authtoken	0003_tokenproxy	2021-08-31 00:20:54.34499-05
23	sessions	0001_initial	2021-08-31 00:20:54.368992-05
24	accounts	0002_remove_user_rol	2021-08-31 00:57:30.502118-05
25	api	0002_auto_20210831_0057	2021-08-31 00:57:30.631128-05
26	api	0003_auto_20210831_0418	2021-08-31 04:18:33.079361-05
27	api	0004_auto_20210831_1006	2021-08-31 10:06:51.54552-05
28	api	0005_remove_hits_assignee	2021-09-01 10:31:16.881633-05
\.


--
-- TOC entry 2940 (class 0 OID 26993)
-- Dependencies: 215
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
k2ipq4u6fnw7j241x7ezyna0o4m10q51	.eJxVjEEOwiAQRe_C2hAGKDAu3XsGMjAgVdMmpV0Z765NutDtf-_9l4i0rS1uvSxxZHEWIE6_W6L8KNMO-E7TbZZ5ntZlTHJX5EG7vM5cnpfD_Tto1Nu3dl5DgRrAKLTWa2tcqC6hMoEdc0VMmQwQDjYpm3xwAFw86goIA2nx_gCyJzbA:1mL0lu:SDm7RUoH5Vek-NMvBbtK0Rmugrwkml0porZQkvmDQUk	2021-09-14 05:13:38.314342-05
\.


--
-- TOC entry 2930 (class 0 OID 26876)
-- Dependencies: 205
-- Data for Name: hitman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hitman (id, name, description, status, manager_id, user_id, rol) FROM stdin;
11	Manager 2	Manager 2	1	\N	12	2
12	Manager3	Manager 3	1	\N	13	2
4	Asesino 4	Mortal	1	11	5	1
5	Asesino 5	Mortal	1	11	6	1
6	Asesino 6	Mortal	1	11	7	1
8	Asesino 8	Mortal	1	12	9	1
9	Asesino 9	Mortal	1	12	10	1
1	Asesino 1	Mortal	3	10	2	1
2	Asesino 2	Mortal	2	10	3	1
3	Asesino 3	Mortal	1	10	4	1
10	Manager 1	Manager 1	3	10	11	2
13	Administrator	Mortal	1	10	1	1
7	Asesino 7	Mortal	2	12	8	1
\.


--
-- TOC entry 2932 (class 0 OID 26889)
-- Dependencies: 207
-- Data for Name: hits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hits (id, target, description, status, date, created_by_id, hitman_id) FROM stdin;
5	Objetivo 2	Seguir y eliminar	2	2021-08-31	\N	1
6	Objetivo 3	Seguir y eliminar	2	2021-08-31	\N	3
7	Objetivo Inter	Seguir y eliminar	2	2021-09-01	1	4
4	Objetivo 1	Seguir y eliminar	3	2021-08-31	\N	7
8	Presidente	\N	1	2021-09-01	11	\N
\.


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 198
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 13, true);


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 48, true);


--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 204
-- Name: hitman_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hitman_id_seq', 13, true);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 206
-- Name: hits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hits_id_seq', 15, true);


-- Completed on 2021-09-01 13:41:38

--
-- PostgreSQL database dump complete
--

