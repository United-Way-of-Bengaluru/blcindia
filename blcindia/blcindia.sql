--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

SET statement_timeout = 0;
SET lock_timeout = 0;
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


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO dinesh;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO dinesh;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO dinesh;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO dinesh;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO dinesh;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO dinesh;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO dinesh;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO dinesh;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO dinesh;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO dinesh;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO dinesh;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO dinesh;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO dinesh;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO dinesh;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO dinesh;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO dinesh;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO dinesh;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO dinesh;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO dinesh;

--
-- Name: schools_academicyear; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE schools_academicyear (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    to_year integer,
    from_year integer
);


ALTER TABLE schools_academicyear OWNER TO dinesh;

--
-- Name: schools_address; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE schools_address (
    id integer NOT NULL,
    address character varying(1000) NOT NULL,
    area character varying(1000) NOT NULL,
    pincode character varying(20) NOT NULL,
    landmark character varying(1000) NOT NULL,
    location geometry(Point,4326),
    instidentification character varying(1000) NOT NULL,
    boundary_id_id integer
);


ALTER TABLE schools_address OWNER TO dinesh;

--
-- Name: schools_address_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE schools_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schools_address_id_seq OWNER TO dinesh;

--
-- Name: schools_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE schools_address_id_seq OWNED BY schools_address.id;


--
-- Name: schools_boundary; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE schools_boundary (
    id integer NOT NULL,
    block character varying(100) NOT NULL,
    district_id integer NOT NULL
);


ALTER TABLE schools_boundary OWNER TO dinesh;

--
-- Name: schools_boundary_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE schools_boundary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schools_boundary_id_seq OWNER TO dinesh;

--
-- Name: schools_boundary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE schools_boundary_id_seq OWNED BY schools_boundary.id;


--
-- Name: schools_district; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE schools_district (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    dise_slug character varying(100),
    type character varying(100),
    school_type character varying(100),
    status integer NOT NULL
);


ALTER TABLE schools_district OWNER TO dinesh;

--
-- Name: schools_district_id_seq; Type: SEQUENCE; Schema: public; Owner: dinesh
--

CREATE SEQUENCE schools_district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schools_district_id_seq OWNER TO dinesh;

--
-- Name: schools_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dinesh
--

ALTER SEQUENCE schools_district_id_seq OWNED BY schools_district.id;


--
-- Name: schools_school; Type: TABLE; Schema: public; Owner: dinesh
--

CREATE TABLE schools_school (
    name character varying(200) NOT NULL,
    school_code bigint NOT NULL,
    rural_urban integer,
    building_status integer,
    worker_name character varying(50) NOT NULL,
    worker_number character varying(50),
    helper_name character varying(50) NOT NULL,
    helper_number character varying(50),
    supervisor_name character varying(50) NOT NULL,
    supervisor_number character varying(50),
    cdpo_name character varying(50) NOT NULL,
    cdpo_number integer,
    male_teachers integer,
    female_teachers integer,
    total_boys integer,
    total_girls integer,
    household_covering_the_catchment_area integer,
    total_population_under_center integer,
    pregnant_mothers_in_population integer,
    lactating_mothers_in_population integer,
    total_childrens_in_population integer,
    shelves_in_kitchen integer,
    shelves_required_in_kitchen integer,
    shelves_in_store_room integer,
    shelves_required_in_store_room integer,
    shelves_in_playing_area integer,
    shelves_required_in_playing_area integer,
    building_paint character varying(50) NOT NULL,
    need_painting_in_building integer,
    need_flooring_in_building integer,
    flooring_requirement_description character varying(200) NOT NULL,
    need_ceiling_repair integer,
    ceiling_requirement_description character varying(200) NOT NULL,
    need_walls_repair integer,
    walls_repair_requirement_description character varying(200) NOT NULL,
    electricity_available integer,
    electric_bulbs integer,
    electric_bulbs_required integer,
    electric_fans_available integer,
    electric_fans_required integer,
    window_condition integer,
    need_window_repair integer,
    window_repair_description character varying(200) NOT NULL,
    door_condition integer,
    need_door_repair integer,
    door_repair_description character varying(200) NOT NULL,
    no_of_cooking_vessels integer,
    no_of_cooking_vessels_required integer,
    cooking_vessels_to_be_repaired integer,
    no_of_serving_vessels integer,
    no_of_serving_vessels_required integer,
    mats_available integer,
    no_of_mats integer,
    no_of_mats_required integer,
    mops_available integer,
    no_of_mops integer,
    no_of_mops_required integer,
    broom_available integer,
    no_of_broom integer,
    no_of_broom_required integer,
    dustbin_available integer,
    no_of_dustbin integer,
    no_of_dustbin_required integer,
    plant_pots_available integer,
    plant_pots integer,
    plant_pots_required integer,
    green_cover integer,
    green_cover_required integer,
    cleanliness integer,
    cleanliness_description character varying(200) NOT NULL,
    pest_control_done_in_last_one_year integer,
    pest_control_required integer,
    drinking_water integer,
    drinking_water_filter integer,
    no_of_drinking_water_filter integer,
    drinking_water_filter_required integer,
    water_taps_in_kitchen integer,
    no_of_water_taps_in_kitchen integer,
    water_taps_in_kitchen_required integer,
    water_taps_in_toilets integer,
    no_of_water_taps_in_toilets integer,
    water_taps_in_kitchen_toilets integer,
    water_storage_containers_in_kitchen integer,
    no_of_water_storage_containers_in_kitchen integer,
    water_storage_containers_in_kitchen_required integer,
    water_storage_containers_in_toilets integer,
    no_of_water_storage_containers_in_toilets integer,
    water_storage_containers_in_toilets_required integer,
    toilet_available integer,
    toilet_functioning integer,
    toilet_boys integer,
    toilet_girls integer,
    toilet_doors_condition integer,
    mural_art_available integer,
    mural_art_required integer,
    learning_and_playing_materials_available integer,
    learning_and_playing_materials_required integer,
    charts_available integer,
    charts_required integer,
    story_books_available integer,
    story_books_required integer,
    drawing_and_art_materials_available integer,
    drawing_and_art_materials_required integer,
    library_kits_available integer,
    library_kits_required integer,
    sports_material_available integer,
    sports_material_required integer,
    others_requirements character varying(100) NOT NULL,
    mothers_committee_formed integer,
    no_of_meetings_conducted_in_last_three_months integer,
    meetings_documented_in_register integer,
    mothers_committee_feedback character varying(200) NOT NULL,
    bal_vikas_samiti_formed integer,
    bal_vikas_samiti_feedback character varying(200) NOT NULL,
    meetings_documented integer,
    arrangements_for_the_children_with_specialneeds_feedback character varying(200) NOT NULL,
    arrangements_for_the_children_with_specialneeds_requirements character varying(200) NOT NULL,
    address_id_id integer,
    shelter_in_toilets integer
);


ALTER TABLE schools_school OWNER TO dinesh;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_address ALTER COLUMN id SET DEFAULT nextval('schools_address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_boundary ALTER COLUMN id SET DEFAULT nextval('schools_boundary_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_district ALTER COLUMN id SET DEFAULT nextval('schools_district_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add address	7	add_address
20	Can change address	7	change_address
21	Can delete address	7	delete_address
22	Can add district	8	add_district
23	Can change district	8	change_district
24	Can delete district	8	delete_district
25	Can add boundary	9	add_boundary
26	Can change boundary	9	change_boundary
27	Can delete boundary	9	delete_boundary
28	Can add school	10	add_school
29	Can change school	10	change_school
30	Can delete school	10	delete_school
31	Can add academic year	11	add_academicyear
32	Can change academic year	11	change_academicyear
33	Can delete academic year	11	delete_academicyear
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('auth_permission_id_seq', 33, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$01VJrCOLBpWA$NCeybbyvtB+oikw9eGDfuGqsONxf6MEJkCwhkP/8ffE=	2017-09-17 16:46:43.298191+05:30	t	admin				t	t	2017-09-17 16:46:26.265663+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-09-17 16:50:00.728688+05:30	1	District object	1	[{"added": {}}]	8	1
2	2017-09-17 16:50:23.396965+05:30	2	District object	1	[{"added": {}}]	8	1
3	2017-09-17 16:50:40.008089+05:30	3	District object	1	[{"added": {}}]	8	1
4	2017-09-17 16:50:57.364422+05:30	4	District object	1	[{"added": {}}]	8	1
5	2017-09-17 16:51:42.078599+05:30	2	District object	2	[{"changed": {"fields": ["name"]}}]	8	1
6	2017-09-17 16:51:47.299471+05:30	3	District object	2	[{"changed": {"fields": ["name"]}}]	8	1
7	2017-09-17 16:51:51.497661+05:30	4	District object	2	[{"changed": {"fields": ["name"]}}]	8	1
8	2017-09-17 16:52:04.61102+05:30	1	District object	2	[{"changed": {"fields": ["type"]}}]	8	1
9	2017-09-17 16:55:08.713689+05:30	1	Boundary object	1	[{"added": {}}]	9	1
10	2017-09-17 16:56:03.890951+05:30	1	4th Main Road, Rajamill Huts, Vallivarpuram, Malleshwaram, Bangalore, Malleshwaram, 560003	1	[{"added": {}}]	7	1
11	2017-09-17 17:02:36.499172+05:30	1234	school object	1	[{"added": {}}]	10	1
12	2017-09-19 13:01:46.904748+05:30	2	District object	2	[{"changed": {"fields": ["name", "type"]}}]	8	1
13	2017-09-19 13:04:29.745209+05:30	3	District object	2	[{"changed": {"fields": ["status"]}}]	8	1
14	2017-09-19 13:04:45.001081+05:30	1	District object	2	[{"changed": {"fields": ["type"]}}]	8	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 14, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	schools	address
8	schools	district
9	schools	boundary
10	schools	school
11	schools	academicyear
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('django_content_type_id_seq', 11, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-09-17 16:44:41.951743+05:30
2	auth	0001_initial	2017-09-17 16:44:43.103107+05:30
3	admin	0001_initial	2017-09-17 16:44:43.377987+05:30
4	admin	0002_logentry_remove_auto_add	2017-09-17 16:44:43.420373+05:30
5	contenttypes	0002_remove_content_type_name	2017-09-17 16:44:43.496809+05:30
6	auth	0002_alter_permission_name_max_length	2017-09-17 16:44:43.529935+05:30
7	auth	0003_alter_user_email_max_length	2017-09-17 16:44:43.574815+05:30
8	auth	0004_alter_user_username_opts	2017-09-17 16:44:43.6056+05:30
9	auth	0005_alter_user_last_login_null	2017-09-17 16:44:43.639793+05:30
10	auth	0006_require_contenttypes_0002	2017-09-17 16:44:43.651013+05:30
11	auth	0007_alter_validators_add_error_messages	2017-09-17 16:44:43.684339+05:30
12	auth	0008_alter_user_username_max_length	2017-09-17 16:44:43.79429+05:30
13	schools	0001_initial	2017-09-17 16:44:44.479137+05:30
14	sessions	0001_initial	2017-09-17 16:44:44.731867+05:30
15	schools	0002_school_shelter_in_toilets	2017-09-19 14:40:46.483397+05:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
if6xnsyck1678c2mdmc864nzf0i8kuni	NGJhNDFjZjFjODMxMzBkMmUxN2ZlMGE0ZWVjYzQyNDgwNTA0MmFjMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZkODU3MDliMTdkMTBjNmVjZTg1ZWRkMmNjODc1NTQ3NmNjYmU1ZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-10-01 16:46:43.309994+05:30
\.


--
-- Data for Name: schools_academicyear; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY schools_academicyear (id, name, to_year, from_year) FROM stdin;
\.


--
-- Data for Name: schools_address; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY schools_address (id, address, area, pincode, landmark, location, instidentification, boundary_id_id) FROM stdin;
1	4th Main Road, Rajamill Huts, Vallivarpuram, Malleshwaram	Bangalore, Malleshwaram	560003	Near K.C.General Hospital	0101000020E6100000FBFFFFFFFFEF8EBFA8DCCFFBFF6B8B3F	Light Orange Colour Building, Yellow Colour Door	1
\.


--
-- Name: schools_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('schools_address_id_seq', 1, true);


--
-- Data for Name: schools_boundary; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY schools_boundary (id, block, district_id) FROM stdin;
1	A	1
\.


--
-- Name: schools_boundary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('schools_boundary_id_seq', 1, true);


--
-- Data for Name: schools_district; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY schools_district (id, name, dise_slug, type, school_type, status) FROM stdin;
4	Bangalore4	\N	district	preschool	1
2	palace guttalli	\N	district	preschool	2
3	Bangalore3	\N	\N	preschool	1
1	bangalore	\N	district	preschool	2
\.


--
-- Name: schools_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dinesh
--

SELECT pg_catalog.setval('schools_district_id_seq', 4, true);


--
-- Data for Name: schools_school; Type: TABLE DATA; Schema: public; Owner: dinesh
--

COPY schools_school (name, school_code, rural_urban, building_status, worker_name, worker_number, helper_name, helper_number, supervisor_name, supervisor_number, cdpo_name, cdpo_number, male_teachers, female_teachers, total_boys, total_girls, household_covering_the_catchment_area, total_population_under_center, pregnant_mothers_in_population, lactating_mothers_in_population, total_childrens_in_population, shelves_in_kitchen, shelves_required_in_kitchen, shelves_in_store_room, shelves_required_in_store_room, shelves_in_playing_area, shelves_required_in_playing_area, building_paint, need_painting_in_building, need_flooring_in_building, flooring_requirement_description, need_ceiling_repair, ceiling_requirement_description, need_walls_repair, walls_repair_requirement_description, electricity_available, electric_bulbs, electric_bulbs_required, electric_fans_available, electric_fans_required, window_condition, need_window_repair, window_repair_description, door_condition, need_door_repair, door_repair_description, no_of_cooking_vessels, no_of_cooking_vessels_required, cooking_vessels_to_be_repaired, no_of_serving_vessels, no_of_serving_vessels_required, mats_available, no_of_mats, no_of_mats_required, mops_available, no_of_mops, no_of_mops_required, broom_available, no_of_broom, no_of_broom_required, dustbin_available, no_of_dustbin, no_of_dustbin_required, plant_pots_available, plant_pots, plant_pots_required, green_cover, green_cover_required, cleanliness, cleanliness_description, pest_control_done_in_last_one_year, pest_control_required, drinking_water, drinking_water_filter, no_of_drinking_water_filter, drinking_water_filter_required, water_taps_in_kitchen, no_of_water_taps_in_kitchen, water_taps_in_kitchen_required, water_taps_in_toilets, no_of_water_taps_in_toilets, water_taps_in_kitchen_toilets, water_storage_containers_in_kitchen, no_of_water_storage_containers_in_kitchen, water_storage_containers_in_kitchen_required, water_storage_containers_in_toilets, no_of_water_storage_containers_in_toilets, water_storage_containers_in_toilets_required, toilet_available, toilet_functioning, toilet_boys, toilet_girls, toilet_doors_condition, mural_art_available, mural_art_required, learning_and_playing_materials_available, learning_and_playing_materials_required, charts_available, charts_required, story_books_available, story_books_required, drawing_and_art_materials_available, drawing_and_art_materials_required, library_kits_available, library_kits_required, sports_material_available, sports_material_required, others_requirements, mothers_committee_formed, no_of_meetings_conducted_in_last_three_months, meetings_documented_in_register, mothers_committee_feedback, bal_vikas_samiti_formed, bal_vikas_samiti_feedback, meetings_documented, arrangements_for_the_children_with_specialneeds_feedback, arrangements_for_the_children_with_specialneeds_requirements, address_id_id, shelter_in_toilets) FROM stdin;
RAJAMIL HUTS	1234	1	1	Shardama	9874568245	Dinesh2	9874563214	dinesh	9874586321	Dinesh3	1	6	7	150	160	3	5	12	25	100	4	3	6	2	3	2	new	1	1	test	1	old ceiling	1		0	11	2	3	2	1	0		0	1		3	1	1	2	1	1	3	1	1	2	1	1	2	1	1	5	3	1	2	5	1	2	1		1	1	1	0	3	1	1	2	1	1	2	1	3	2	3	3	1	2	1	1	2	2	1	1	1	1	0	1	0	0	1	1	1	0	1	0	1		1	2	1		0		1			1	\N
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys  FROM stdin;
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: schools_academicyear_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_academicyear
    ADD CONSTRAINT schools_academicyear_pkey PRIMARY KEY (id);


--
-- Name: schools_address_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_address
    ADD CONSTRAINT schools_address_pkey PRIMARY KEY (id);


--
-- Name: schools_boundary_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_boundary
    ADD CONSTRAINT schools_boundary_pkey PRIMARY KEY (id);


--
-- Name: schools_district_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_district
    ADD CONSTRAINT schools_district_pkey PRIMARY KEY (id);


--
-- Name: schools_school_address_id_id_key; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_school
    ADD CONSTRAINT schools_school_address_id_id_key UNIQUE (address_id_id);


--
-- Name: schools_school_pkey; Type: CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_school
    ADD CONSTRAINT schools_school_pkey PRIMARY KEY (school_code);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: schools_address_boundary_id_id_ddcfbd74; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX schools_address_boundary_id_id_ddcfbd74 ON schools_address USING btree (boundary_id_id);


--
-- Name: schools_address_location_id; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX schools_address_location_id ON schools_address USING gist (location);


--
-- Name: schools_boundary_district_id_d1daf5ef; Type: INDEX; Schema: public; Owner: dinesh
--

CREATE INDEX schools_boundary_district_id_d1daf5ef ON schools_boundary USING btree (district_id);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schools_address_boundary_id_id_ddcfbd74_fk_schools_boundary_id; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_address
    ADD CONSTRAINT schools_address_boundary_id_id_ddcfbd74_fk_schools_boundary_id FOREIGN KEY (boundary_id_id) REFERENCES schools_boundary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schools_boundary_district_id_d1daf5ef_fk_schools_district_id; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_boundary
    ADD CONSTRAINT schools_boundary_district_id_d1daf5ef_fk_schools_district_id FOREIGN KEY (district_id) REFERENCES schools_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: schools_school_address_id_id_981171d1_fk_schools_address_id; Type: FK CONSTRAINT; Schema: public; Owner: dinesh
--

ALTER TABLE ONLY schools_school
    ADD CONSTRAINT schools_school_address_id_id_981171d1_fk_schools_address_id FOREIGN KEY (address_id_id) REFERENCES schools_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

