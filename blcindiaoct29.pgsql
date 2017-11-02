--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: aanganwadi_academicyear; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_academicyear (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    to_year integer,
    from_year integer
);


ALTER TABLE public.aanganwadi_academicyear OWNER TO blcindia;

--
-- Name: aanganwadi_academicyear_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_academicyear_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_academicyear_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_academicyear_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_academicyear_id_seq OWNED BY aanganwadi_academicyear.id;


--
-- Name: aanganwadi_address; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_address (
    id integer NOT NULL,
    address character varying(1000) NOT NULL,
    area character varying(1000) NOT NULL,
    pincode character varying(20) NOT NULL,
    landmark character varying(1000) NOT NULL,
    location geometry(Point,4326) NOT NULL,
    instidentification character varying(1000) NOT NULL,
    boundary_id integer
);


ALTER TABLE public.aanganwadi_address OWNER TO blcindia;

--
-- Name: aanganwadi_address_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_address_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_address_id_seq OWNED BY aanganwadi_address.id;


--
-- Name: aanganwadi_basicfacilities; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_basicfacilities (
    id integer NOT NULL,
    electricity_available integer,
    cleanliness integer,
    cleanliness_description character varying(200) NOT NULL,
    pest_control_done_in_last_one_year integer,
    pest_control_required integer,
    drinking_water integer,
    drinking_water_filter integer,
    drinking_water_filter_available integer,
    drinking_water_filter_required integer,
    electric_bulbs integer,
    electric_bulbs_required integer,
    electric_fans_available integer,
    electric_fans_required integer,
    school_id integer NOT NULL
);


ALTER TABLE public.aanganwadi_basicfacilities OWNER TO blcindia;

--
-- Name: aanganwadi_basicfacilities_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_basicfacilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_basicfacilities_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_basicfacilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_basicfacilities_id_seq OWNED BY aanganwadi_basicfacilities.id;


--
-- Name: aanganwadi_boundary; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_boundary (
    id integer NOT NULL,
    block character varying(100) NOT NULL,
    district_id integer NOT NULL
);


ALTER TABLE public.aanganwadi_boundary OWNER TO blcindia;

--
-- Name: aanganwadi_boundary_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_boundary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_boundary_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_boundary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_boundary_id_seq OWNED BY aanganwadi_boundary.id;


--
-- Name: aanganwadi_communityengagement; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_communityengagement (
    id integer NOT NULL,
    mothers_committee_formed integer,
    no_of_meetings_conducted_in_last_three_months integer,
    meetings_documented_in_register integer,
    mothers_committee_feedback character varying(200) NOT NULL,
    bal_vikas_samiti_formed integer,
    bal_vikas_samiti_feedback character varying(200) NOT NULL,
    meetings_documented integer,
    arrangements_for_the_children_with_specialneeds_feedback character varying(200) NOT NULL,
    arrangements_for_the_children_with_specialneeds_requirements character varying(200) NOT NULL,
    pregnant_mothers_in_population integer,
    lactating_mothers_in_population integer,
    school_id integer NOT NULL
);


ALTER TABLE public.aanganwadi_communityengagement OWNER TO blcindia;

--
-- Name: aanganwadi_communityengagement_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_communityengagement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_communityengagement_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_communityengagement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_communityengagement_id_seq OWNED BY aanganwadi_communityengagement.id;


--
-- Name: aanganwadi_district; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_district (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    dise_slug character varying(100),
    type character varying(100),
    school_type character varying(100),
    status integer NOT NULL
);


ALTER TABLE public.aanganwadi_district OWNER TO blcindia;

--
-- Name: aanganwadi_district_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_district_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_district_id_seq OWNED BY aanganwadi_district.id;


--
-- Name: aanganwadi_learningenvironment; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_learningenvironment (
    id integer NOT NULL,
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
    school_id integer NOT NULL
);


ALTER TABLE public.aanganwadi_learningenvironment OWNER TO blcindia;

--
-- Name: aanganwadi_learningenvironment_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_learningenvironment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_learningenvironment_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_learningenvironment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_learningenvironment_id_seq OWNED BY aanganwadi_learningenvironment.id;


--
-- Name: aanganwadi_safeenvironment; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_safeenvironment (
    id integer NOT NULL,
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
    water_taps_in_kitchen integer,
    no_of_water_taps_in_kitchen integer,
    water_taps_in_kitchen_required integer,
    shelter_in_toilets integer,
    water_taps_in_toilets integer,
    no_of_water_taps_required_in_toilets integer,
    water_storage_containers_in_kitchen integer,
    no_of_water_storage_containers_required_in_kitchen integer,
    water_storage_containers_in_toilets integer,
    no_of_water_storage_containers_required_in_toilets integer,
    toilet_available integer,
    toilet_functioning integer,
    toilet_boys integer,
    toilet_girls integer,
    toilet_doors_condition integer,
    mural_art_available integer,
    mural_art_required integer,
    school_id integer NOT NULL
);


ALTER TABLE public.aanganwadi_safeenvironment OWNER TO blcindia;

--
-- Name: aanganwadi_safeenvironment_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_safeenvironment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_safeenvironment_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_safeenvironment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_safeenvironment_id_seq OWNED BY aanganwadi_safeenvironment.id;


--
-- Name: aanganwadi_school; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_school (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
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
    total_childrens_in_population integer,
    address_id integer,
    type_id integer
);


ALTER TABLE public.aanganwadi_school OWNER TO blcindia;

--
-- Name: aanganwadi_school_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_school_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_school_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_school_id_seq OWNED BY aanganwadi_school.id;


--
-- Name: aanganwadi_schoolimages; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_schoolimages (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    school_id integer NOT NULL
);


ALTER TABLE public.aanganwadi_schoolimages OWNER TO blcindia;

--
-- Name: aanganwadi_schoolimages_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_schoolimages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_schoolimages_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_schoolimages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_schoolimages_id_seq OWNED BY aanganwadi_schoolimages.id;


--
-- Name: aanganwadi_type; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_type (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.aanganwadi_type OWNER TO blcindia;

--
-- Name: aanganwadi_type_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_type_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_type_id_seq OWNED BY aanganwadi_type.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO blcindia;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO blcindia;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO blcindia;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO blcindia;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO blcindia;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO blcindia;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: authtools_user; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE authtools_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(255) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authtools_user OWNER TO blcindia;

--
-- Name: authtools_user_groups; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE authtools_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.authtools_user_groups OWNER TO blcindia;

--
-- Name: authtools_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE authtools_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authtools_user_groups_id_seq OWNER TO blcindia;

--
-- Name: authtools_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE authtools_user_groups_id_seq OWNED BY authtools_user_groups.id;


--
-- Name: authtools_user_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE authtools_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authtools_user_id_seq OWNER TO blcindia;

--
-- Name: authtools_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE authtools_user_id_seq OWNED BY authtools_user.id;


--
-- Name: authtools_user_user_permissions; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE authtools_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.authtools_user_user_permissions OWNER TO blcindia;

--
-- Name: authtools_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE authtools_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authtools_user_user_permissions_id_seq OWNER TO blcindia;

--
-- Name: authtools_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE authtools_user_user_permissions_id_seq OWNED BY authtools_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
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


ALTER TABLE public.django_admin_log OWNER TO blcindia;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO blcindia;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO blcindia;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO blcindia;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO blcindia;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO blcindia;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO blcindia;

--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO blcindia;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO blcindia;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO blcindia;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO blcindia;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE public.easy_thumbnails_thumbnaildimensions OWNER TO blcindia;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnaildimensions_id_seq OWNER TO blcindia;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_academicyear ALTER COLUMN id SET DEFAULT nextval('aanganwadi_academicyear_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_address ALTER COLUMN id SET DEFAULT nextval('aanganwadi_address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_basicfacilities ALTER COLUMN id SET DEFAULT nextval('aanganwadi_basicfacilities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_boundary ALTER COLUMN id SET DEFAULT nextval('aanganwadi_boundary_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_communityengagement ALTER COLUMN id SET DEFAULT nextval('aanganwadi_communityengagement_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_district ALTER COLUMN id SET DEFAULT nextval('aanganwadi_district_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_learningenvironment ALTER COLUMN id SET DEFAULT nextval('aanganwadi_learningenvironment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_safeenvironment ALTER COLUMN id SET DEFAULT nextval('aanganwadi_safeenvironment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_school ALTER COLUMN id SET DEFAULT nextval('aanganwadi_school_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_schoolimages ALTER COLUMN id SET DEFAULT nextval('aanganwadi_schoolimages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_type ALTER COLUMN id SET DEFAULT nextval('aanganwadi_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY authtools_user ALTER COLUMN id SET DEFAULT nextval('authtools_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY authtools_user_groups ALTER COLUMN id SET DEFAULT nextval('authtools_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY authtools_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('authtools_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Data for Name: aanganwadi_academicyear; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_academicyear (id, name, to_year, from_year) FROM stdin;
\.


--
-- Name: aanganwadi_academicyear_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_academicyear_id_seq', 1, false);


--
-- Data for Name: aanganwadi_address; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_address (id, address, area, pincode, landmark, location, instidentification, boundary_id) FROM stdin;
1	Thirumenahalli, Mandur post, Bidarahalli hobli, Bangalore Urban		560049		0101000020E61000005C8FC2F5285C53403333333333332B40		1
2	Horamavu(p)Banglore-13		560013		0101000020E61000000A6A53D0486A5340A428E1534A0D2A40		2
\.


--
-- Name: aanganwadi_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_address_id_seq', 2, true);


--
-- Data for Name: aanganwadi_basicfacilities; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_basicfacilities (id, electricity_available, cleanliness, cleanliness_description, pest_control_done_in_last_one_year, pest_control_required, drinking_water, drinking_water_filter, drinking_water_filter_available, drinking_water_filter_required, electric_bulbs, electric_bulbs_required, electric_fans_available, electric_fans_required, school_id) FROM stdin;
1	1	1		0	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2	1	\N		\N	1	\N	\N	\N	\N	\N	\N	3	3	1
3	2	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
4	3	0		1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
5	1	1		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
\.


--
-- Name: aanganwadi_basicfacilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_basicfacilities_id_seq', 5, true);


--
-- Data for Name: aanganwadi_boundary; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_boundary (id, block, district_id) FROM stdin;
1	Mandur	1
2	Bangalore Urban	2
\.


--
-- Name: aanganwadi_boundary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_boundary_id_seq', 2, true);


--
-- Data for Name: aanganwadi_communityengagement; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_communityengagement (id, mothers_committee_formed, no_of_meetings_conducted_in_last_three_months, meetings_documented_in_register, mothers_committee_feedback, bal_vikas_samiti_formed, bal_vikas_samiti_feedback, meetings_documented, arrangements_for_the_children_with_specialneeds_feedback, arrangements_for_the_children_with_specialneeds_requirements, pregnant_mothers_in_population, lactating_mothers_in_population, school_id) FROM stdin;
1	\N	\N	\N		1		\N			20	18	2
\.


--
-- Name: aanganwadi_communityengagement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_communityengagement_id_seq', 1, true);


--
-- Data for Name: aanganwadi_district; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_district (id, name, dise_slug, type, school_type, status) FROM stdin;
1	Mandur	\N	\N	Aaganwadi	2
2	Bengaluru Urban	\N	\N	Aaganwadi	2
\.


--
-- Name: aanganwadi_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_district_id_seq', 2, true);


--
-- Data for Name: aanganwadi_learningenvironment; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_learningenvironment (id, learning_and_playing_materials_available, learning_and_playing_materials_required, charts_available, charts_required, story_books_available, story_books_required, drawing_and_art_materials_available, drawing_and_art_materials_required, library_kits_available, library_kits_required, sports_material_available, sports_material_required, others_requirements, school_id) FROM stdin;
1	\N	\N	\N	\N	\N	1	1	1	1	\N	\N	\N		2
\.


--
-- Name: aanganwadi_learningenvironment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_learningenvironment_id_seq', 1, true);


--
-- Data for Name: aanganwadi_safeenvironment; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_safeenvironment (id, shelves_in_kitchen, shelves_required_in_kitchen, shelves_in_store_room, shelves_required_in_store_room, shelves_in_playing_area, shelves_required_in_playing_area, building_paint, need_painting_in_building, need_flooring_in_building, flooring_requirement_description, need_ceiling_repair, ceiling_requirement_description, need_walls_repair, walls_repair_requirement_description, window_condition, need_window_repair, window_repair_description, door_condition, need_door_repair, door_repair_description, no_of_cooking_vessels, no_of_cooking_vessels_required, cooking_vessels_to_be_repaired, no_of_serving_vessels, no_of_serving_vessels_required, mats_available, no_of_mats, no_of_mats_required, mops_available, no_of_mops, no_of_mops_required, broom_available, no_of_broom, no_of_broom_required, dustbin_available, no_of_dustbin, no_of_dustbin_required, plant_pots_available, plant_pots, plant_pots_required, green_cover, green_cover_required, water_taps_in_kitchen, no_of_water_taps_in_kitchen, water_taps_in_kitchen_required, shelter_in_toilets, water_taps_in_toilets, no_of_water_taps_required_in_toilets, water_storage_containers_in_kitchen, no_of_water_storage_containers_required_in_kitchen, water_storage_containers_in_toilets, no_of_water_storage_containers_required_in_toilets, toilet_available, toilet_functioning, toilet_boys, toilet_girls, toilet_doors_condition, mural_art_available, mural_art_required, school_id) FROM stdin;
1	\N	\N	\N	\N	\N	\N		\N	\N		\N		\N		1	1		0	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
2	\N	\N	\N	\N	\N	\N		\N	\N		\N		\N		\N	\N		\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	1	0	1
3	\N	\N	\N	\N	\N	\N	new	1	\N		\N		\N		\N	\N		\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
\.


--
-- Name: aanganwadi_safeenvironment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_safeenvironment_id_seq', 3, true);


--
-- Data for Name: aanganwadi_school; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_school (id, name, rural_urban, building_status, worker_name, worker_number, helper_name, helper_number, supervisor_name, supervisor_number, cdpo_name, cdpo_number, male_teachers, female_teachers, total_boys, total_girls, household_covering_the_catchment_area, total_population_under_center, total_childrens_in_population, address_id, type_id) FROM stdin;
1	Thirumenahalli	2	1	Ms.Shanthama	7760091648	Nalina	\N	Ms.Savita	\N	Mr.Prakash Kumar	\N	\N	\N	42	43	\N	\N	\N	1	3
2	HORAMAVU	2	3	Arunamma J.H	\N	Anjinamma	\N	Sharadamba	\N	Prakash kumar	\N	\N	\N	130	21	455	1822	78	2	3
\.


--
-- Name: aanganwadi_school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_school_id_seq', 2, true);


--
-- Data for Name: aanganwadi_schoolimages; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_schoolimages (id, image, school_id) FROM stdin;
1	schoolImages/1_WVQrzTE.jpg	1
2	schoolImages/4_V4T7ixW.jpg	1
\.


--
-- Name: aanganwadi_schoolimages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_schoolimages_id_seq', 2, true);


--
-- Data for Name: aanganwadi_type; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_type (id, name) FROM stdin;
1	Urban
2	Rural
3	Aaganwadi
\.


--
-- Name: aanganwadi_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_type_id_seq', 3, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add log entry	3	add_logentry
8	Can change log entry	3	change_logentry
9	Can delete log entry	3	delete_logentry
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add user	6	add_user
17	Can change user	6	change_user
18	Can delete user	6	delete_user
19	Can add thumbnail	7	add_thumbnail
20	Can change thumbnail	7	change_thumbnail
21	Can delete thumbnail	7	delete_thumbnail
22	Can add source	8	add_source
23	Can change source	8	change_source
24	Can delete source	8	delete_source
25	Can add thumbnail dimensions	9	add_thumbnaildimensions
26	Can change thumbnail dimensions	9	change_thumbnaildimensions
27	Can delete thumbnail dimensions	9	delete_thumbnaildimensions
28	Can add profile	10	add_profile
29	Can change profile	10	change_profile
30	Can delete profile	10	delete_profile
31	Can add academic year	11	add_academicyear
32	Can change academic year	11	change_academicyear
33	Can delete academic year	11	delete_academicyear
34	Can add district	12	add_district
35	Can change district	12	change_district
36	Can delete district	12	delete_district
37	Can add address	13	add_address
38	Can change address	13	change_address
39	Can delete address	13	delete_address
40	Can add Aanganwadi	14	add_school
41	Can change Aanganwadi	14	change_school
42	Can delete Aanganwadi	14	delete_school
43	Can add safe environment	15	add_safeenvironment
44	Can change safe environment	15	change_safeenvironment
45	Can delete safe environment	15	delete_safeenvironment
46	Can add boundary	16	add_boundary
47	Can change boundary	16	change_boundary
48	Can delete boundary	16	delete_boundary
49	Can add basic facilities	17	add_basicfacilities
50	Can change basic facilities	17	change_basicfacilities
51	Can delete basic facilities	17	delete_basicfacilities
52	Can add type	18	add_type
53	Can change type	18	change_type
54	Can delete type	18	delete_type
55	Can add learning environment	19	add_learningenvironment
56	Can change learning environment	19	change_learningenvironment
57	Can delete learning environment	19	delete_learningenvironment
58	Can add community engagement	20	add_communityengagement
59	Can change community engagement	20	change_communityengagement
60	Can delete community engagement	20	delete_communityengagement
61	Can add school images	21	add_schoolimages
62	Can change school images	21	change_schoolimages
63	Can delete school images	21	delete_schoolimages
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('auth_permission_id_seq', 63, true);


--
-- Data for Name: authtools_user; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY authtools_user (id, password, last_login, is_superuser, email, is_staff, is_active, date_joined, name) FROM stdin;
2	pbkdf2_sha256$36000$171xyFwG0e3v$Zn+IsdJxRZuiQSQRcbKp2hqRmXDNtTxcHNuAyv/1txs=	2017-10-29 03:36:33.714976+00	f	admin@gmail.com	f	t	2017-10-29 03:26:05.486701+00	Field Engineer
1	pbkdf2_sha256$36000$IJaOQkNDVWqw$Wu9IZzwRzyQ4/DXZ4AvXMpl/3dxeYmAkQ7YbLteSQt4=	2017-10-29 07:35:00.61119+00	t	admin@blcindia.com	t	t	2017-10-29 03:23:52.285698+00	Admin
\.


--
-- Data for Name: authtools_user_groups; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY authtools_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: authtools_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('authtools_user_groups_id_seq', 1, false);


--
-- Name: authtools_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('authtools_user_id_seq', 2, true);


--
-- Data for Name: authtools_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY authtools_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: authtools_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('authtools_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-10-29 03:41:35.1477+00	1	Mandur	1	[{"added": {}}]	12	1
2	2017-10-29 03:41:39.470062+00	1	Mandur	1	[{"added": {}}]	16	1
3	2017-10-29 03:41:59.034009+00	1	Urban	1	[{"added": {}}]	18	1
4	2017-10-29 03:42:08.226542+00	2	Rural	1	[{"added": {}}]	18	1
5	2017-10-29 03:46:25.282265+00	1	Thirumenahalli, Mandur post, Bidarahalli hobli, Bangalore Urban, 560049	1	[{"added": {}}]	13	1
6	2017-10-29 03:47:06.355833+00	3	Aaganwadi	1	[{"added": {}}]	18	1
7	2017-10-29 03:49:43.176089+00	1	Thirumenahalli	1	[{"added": {}}]	14	1
8	2017-10-29 17:35:00.363049+00	2	Bengaluru Urban	1	[{"added": {}}]	12	1
9	2017-10-29 17:35:07.408394+00	2	Bangalore Urban	1	[{"added": {}}]	16	1
10	2017-10-29 17:36:13.844367+00	2	Horamavu(p)Banglore-13, 560013	1	[{"added": {}}]	13	1
11	2017-10-29 17:40:32.007256+00	2	HORAMAVU	1	[{"added": {}}, {"added": {"object": "BasicFacilities object", "name": "basic facilities"}}, {"added": {"object": "LearningEnvironment object", "name": "learning environment"}}, {"added": {"object": "SafeEnvironment object", "name": "safe environment"}}, {"added": {"object": "CommunityEngagement object", "name": "community engagement"}}]	14	1
12	2017-10-29 17:41:13.48318+00	1	SchoolImages object	1	[{"added": {}}]	21	1
13	2017-10-29 17:41:27.750498+00	2	SchoolImages object	1	[{"added": {}}]	21	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 13, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	admin	logentry
4	contenttypes	contenttype
5	sessions	session
6	authtools	user
7	easy_thumbnails	thumbnail
8	easy_thumbnails	source
9	easy_thumbnails	thumbnaildimensions
10	profiles	profile
11	aanganwadi	academicyear
12	aanganwadi	district
13	aanganwadi	address
14	aanganwadi	school
15	aanganwadi	safeenvironment
16	aanganwadi	boundary
17	aanganwadi	basicfacilities
18	aanganwadi	type
19	aanganwadi	learningenvironment
20	aanganwadi	communityengagement
21	aanganwadi	schoolimages
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('django_content_type_id_seq', 21, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	aanganwadi	0001_initial	2017-10-29 03:23:16.362132+00
2	contenttypes	0001_initial	2017-10-29 03:23:16.398876+00
3	auth	0001_initial	2017-10-29 03:23:16.497898+00
4	authtools	0001_initial	2017-10-29 03:23:16.602259+00
5	admin	0001_initial	2017-10-29 03:23:16.653774+00
6	admin	0002_logentry_remove_auto_add	2017-10-29 03:23:16.673017+00
7	contenttypes	0002_remove_content_type_name	2017-10-29 03:23:16.728965+00
8	auth	0002_alter_permission_name_max_length	2017-10-29 03:23:16.743149+00
9	auth	0003_alter_user_email_max_length	2017-10-29 03:23:16.758704+00
10	auth	0004_alter_user_username_opts	2017-10-29 03:23:16.774301+00
11	auth	0005_alter_user_last_login_null	2017-10-29 03:23:16.789714+00
12	auth	0006_require_contenttypes_0002	2017-10-29 03:23:16.794246+00
13	auth	0007_alter_validators_add_error_messages	2017-10-29 03:23:16.81041+00
14	auth	0008_alter_user_username_max_length	2017-10-29 03:23:16.825165+00
15	authtools	0002_django18	2017-10-29 03:23:16.842611+00
16	authtools	0003_auto_20160128_0912	2017-10-29 03:23:16.865798+00
17	easy_thumbnails	0001_initial	2017-10-29 03:23:16.982057+00
18	easy_thumbnails	0002_thumbnaildimensions	2017-10-29 03:23:17.012627+00
19	sessions	0001_initial	2017-10-29 03:23:17.049228+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('django_migrations_id_seq', 19, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
kdup1m0af2k40vnbsgiza5e4hn3u10xc	YTM4NjhhYTBkMjE1N2Y3ZTg5NGFlYjkzNDYwNjU5OTBkMjRiNzFmOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYTJmNTk1NTdhMjk4OWM5MWU4ZmQ1NWM2MGQxM2ZlYTc5OTBhNTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-12 03:33:39.203647+00
6om1gp58r1zlr7221npb89ecu8261ey3	YTM4NjhhYTBkMjE1N2Y3ZTg5NGFlYjkzNDYwNjU5OTBkMjRiNzFmOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYTJmNTk1NTdhMjk4OWM5MWU4ZmQ1NWM2MGQxM2ZlYTc5OTBhNTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-12 03:40:33.473527+00
z7gwxo1seja8xw28mdg0h38cd5eho9xy	YTM4NjhhYTBkMjE1N2Y3ZTg5NGFlYjkzNDYwNjU5OTBkMjRiNzFmOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlYTJmNTk1NTdhMjk4OWM5MWU4ZmQ1NWM2MGQxM2ZlYTc5OTBhNTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-12 07:35:00.616238+00
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys  FROM stdin;
\.


--
-- Name: aanganwadi_academicyear_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_academicyear
    ADD CONSTRAINT aanganwadi_academicyear_pkey PRIMARY KEY (id);


--
-- Name: aanganwadi_address_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_address
    ADD CONSTRAINT aanganwadi_address_pkey PRIMARY KEY (id);


--
-- Name: aanganwadi_basicfacilities_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_basicfacilities
    ADD CONSTRAINT aanganwadi_basicfacilities_pkey PRIMARY KEY (id);


--
-- Name: aanganwadi_boundary_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_boundary
    ADD CONSTRAINT aanganwadi_boundary_pkey PRIMARY KEY (id);


--
-- Name: aanganwadi_communityengagement_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_communityengagement
    ADD CONSTRAINT aanganwadi_communityengagement_pkey PRIMARY KEY (id);


--
-- Name: aanganwadi_district_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_district
    ADD CONSTRAINT aanganwadi_district_pkey PRIMARY KEY (id);


--
-- Name: aanganwadi_learningenvironment_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_learningenvironment
    ADD CONSTRAINT aanganwadi_learningenvironment_pkey PRIMARY KEY (id);


--
-- Name: aanganwadi_safeenvironment_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_safeenvironment
    ADD CONSTRAINT aanganwadi_safeenvironment_pkey PRIMARY KEY (id);


--
-- Name: aanganwadi_school_address_id_key; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_school
    ADD CONSTRAINT aanganwadi_school_address_id_key UNIQUE (address_id);


--
-- Name: aanganwadi_school_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_school
    ADD CONSTRAINT aanganwadi_school_pkey PRIMARY KEY (id);


--
-- Name: aanganwadi_schoolimages_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_schoolimages
    ADD CONSTRAINT aanganwadi_schoolimages_pkey PRIMARY KEY (id);


--
-- Name: aanganwadi_type_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_type
    ADD CONSTRAINT aanganwadi_type_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_email_key; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY authtools_user
    ADD CONSTRAINT authtools_user_email_key UNIQUE (email);


--
-- Name: authtools_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_groups_user_id_group_id_a8658824_uniq; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_user_id_group_id_a8658824_uniq UNIQUE (user_id, group_id);


--
-- Name: authtools_user_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY authtools_user
    ADD CONSTRAINT authtools_user_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_user_perm_user_id_permission_id_3e9e8ba9_uniq; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_user_perm_user_id_permission_id_3e9e8ba9_uniq UNIQUE (user_id, permission_id);


--
-- Name: authtools_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_name_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_name_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: aanganwadi_address_boundary_id_5fbcde4d; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX aanganwadi_address_boundary_id_5fbcde4d ON aanganwadi_address USING btree (boundary_id);


--
-- Name: aanganwadi_address_location_id; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX aanganwadi_address_location_id ON aanganwadi_address USING gist (location);


--
-- Name: aanganwadi_basicfacilities_school_id_2057663b; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX aanganwadi_basicfacilities_school_id_2057663b ON aanganwadi_basicfacilities USING btree (school_id);


--
-- Name: aanganwadi_boundary_district_id_1d703514; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX aanganwadi_boundary_district_id_1d703514 ON aanganwadi_boundary USING btree (district_id);


--
-- Name: aanganwadi_communityengagement_school_id_5bccaa61; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX aanganwadi_communityengagement_school_id_5bccaa61 ON aanganwadi_communityengagement USING btree (school_id);


--
-- Name: aanganwadi_learningenvironment_school_id_3f892daf; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX aanganwadi_learningenvironment_school_id_3f892daf ON aanganwadi_learningenvironment USING btree (school_id);


--
-- Name: aanganwadi_safeenvironment_school_id_6f5fe7f1; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX aanganwadi_safeenvironment_school_id_6f5fe7f1 ON aanganwadi_safeenvironment USING btree (school_id);


--
-- Name: aanganwadi_school_type_id_ad8523ae; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX aanganwadi_school_type_id_ad8523ae ON aanganwadi_school USING btree (type_id);


--
-- Name: aanganwadi_schoolimages_school_id_b9d5e652; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX aanganwadi_schoolimages_school_id_b9d5e652 ON aanganwadi_schoolimages USING btree (school_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: authtools_user_email_f133274f_like; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX authtools_user_email_f133274f_like ON authtools_user USING btree (email varchar_pattern_ops);


--
-- Name: authtools_user_groups_group_id_fdf65e59; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX authtools_user_groups_group_id_fdf65e59 ON authtools_user_groups USING btree (group_id);


--
-- Name: authtools_user_groups_user_id_c1c2c51f; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX authtools_user_groups_user_id_c1c2c51f ON authtools_user_groups USING btree (user_id);


--
-- Name: authtools_user_user_permissions_permission_id_039bf6fe; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX authtools_user_user_permissions_permission_id_039bf6fe ON authtools_user_user_permissions USING btree (permission_id);


--
-- Name: authtools_user_user_permissions_user_id_d172ce6b; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX authtools_user_user_permissions_user_id_d172ce6b ON authtools_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_name_5fe0edc6; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6 ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31 ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_source_id_5b57bc77; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_source_id_5b57bc77 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: aanganwadi_address_boundary_id_5fbcde4d_fk_aanganwad; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_address
    ADD CONSTRAINT aanganwadi_address_boundary_id_5fbcde4d_fk_aanganwad FOREIGN KEY (boundary_id) REFERENCES aanganwadi_boundary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aanganwadi_basicfaci_school_id_2057663b_fk_aanganwad; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_basicfacilities
    ADD CONSTRAINT aanganwadi_basicfaci_school_id_2057663b_fk_aanganwad FOREIGN KEY (school_id) REFERENCES aanganwadi_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aanganwadi_boundary_district_id_1d703514_fk_aanganwad; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_boundary
    ADD CONSTRAINT aanganwadi_boundary_district_id_1d703514_fk_aanganwad FOREIGN KEY (district_id) REFERENCES aanganwadi_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aanganwadi_community_school_id_5bccaa61_fk_aanganwad; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_communityengagement
    ADD CONSTRAINT aanganwadi_community_school_id_5bccaa61_fk_aanganwad FOREIGN KEY (school_id) REFERENCES aanganwadi_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aanganwadi_learninge_school_id_3f892daf_fk_aanganwad; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_learningenvironment
    ADD CONSTRAINT aanganwadi_learninge_school_id_3f892daf_fk_aanganwad FOREIGN KEY (school_id) REFERENCES aanganwadi_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aanganwadi_safeenvir_school_id_6f5fe7f1_fk_aanganwad; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_safeenvironment
    ADD CONSTRAINT aanganwadi_safeenvir_school_id_6f5fe7f1_fk_aanganwad FOREIGN KEY (school_id) REFERENCES aanganwadi_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aanganwadi_school_address_id_af47d847_fk_aanganwadi_address_id; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_school
    ADD CONSTRAINT aanganwadi_school_address_id_af47d847_fk_aanganwadi_address_id FOREIGN KEY (address_id) REFERENCES aanganwadi_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aanganwadi_school_type_id_ad8523ae_fk_aanganwadi_type_id; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_school
    ADD CONSTRAINT aanganwadi_school_type_id_ad8523ae_fk_aanganwadi_type_id FOREIGN KEY (type_id) REFERENCES aanganwadi_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: aanganwadi_schoolima_school_id_b9d5e652_fk_aanganwad; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_schoolimages
    ADD CONSTRAINT aanganwadi_schoolima_school_id_b9d5e652_fk_aanganwad FOREIGN KEY (school_id) REFERENCES aanganwadi_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_groups_group_id_fdf65e59_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_group_id_fdf65e59_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_groups_user_id_c1c2c51f_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_user_id_c1c2c51f_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_user__permission_id_039bf6fe_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_user__permission_id_039bf6fe_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_user__user_id_d172ce6b_fk_authtools; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_user__user_id_d172ce6b_fk_authtools FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


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

