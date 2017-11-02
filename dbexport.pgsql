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
-- Name: aanganwadi_demographics; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE aanganwadi_demographics (
    id integer NOT NULL,
    male_teachers integer,
    female_teachers integer,
    total_boys integer,
    total_girls integer,
    household_covering_the_catchment_area integer,
    total_population_under_center integer,
    total_childrens_in_population integer,
    school_id integer NOT NULL
);


ALTER TABLE public.aanganwadi_demographics OWNER TO blcindia;

--
-- Name: aanganwadi_demographics_id_seq; Type: SEQUENCE; Schema: public; Owner: blcindia
--

CREATE SEQUENCE aanganwadi_demographics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aanganwadi_demographics_id_seq OWNER TO blcindia;

--
-- Name: aanganwadi_demographics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blcindia
--

ALTER SEQUENCE aanganwadi_demographics_id_seq OWNED BY aanganwadi_demographics.id;


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
-- Name: profiles_profile; Type: TABLE; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE TABLE profiles_profile (
    user_id integer NOT NULL,
    slug uuid NOT NULL,
    picture character varying(100),
    bio character varying(200),
    email_verified boolean NOT NULL
);


ALTER TABLE public.profiles_profile OWNER TO blcindia;

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

ALTER TABLE ONLY aanganwadi_demographics ALTER COLUMN id SET DEFAULT nextval('aanganwadi_demographics_id_seq'::regclass);


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
1	Thirumenahalli, Mandur post, Bidarahalli hobli, Bangalore Urban	Mandur	560049	lake	0101000020E61000005C8FC2F5285C53401283C0CAA1452B40	temple	1
2	Horamavu(p)Banglore-13		560013		0101000020E61000000A6A53D0486A5340A428E1534A0D2A40		1
3	horamavu		560013		0101000020E61000001229722DFF695340F6854666E4122A40		1
4	Horamavu(p)Banglore-43		560043	Lake	0101000020E6100000123D9DE92D4453407A9164B1A80F2A40	Lake	1
5	centre:K.CHANNASANDRA				0101000020E6100000D5EF1D905F6B5340CA17B49080152A40		2
\.


--
-- Name: aanganwadi_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_address_id_seq', 5, true);


--
-- Data for Name: aanganwadi_basicfacilities; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_basicfacilities (id, electricity_available, cleanliness, cleanliness_description, pest_control_done_in_last_one_year, pest_control_required, drinking_water, drinking_water_filter, drinking_water_filter_available, drinking_water_filter_required, electric_bulbs, electric_bulbs_required, electric_fans_available, electric_fans_required, school_id) FROM stdin;
1	1	1		1	1	3	2	5	1	5	5	1	1	2
2	1	1		1	1	2	1	\N	\N	4	4	4	4	3
3	1	1		1	1	2	1	\N	\N	\N	\N	\N	\N	5
4	1	1		0	1	3	1	2	2	2	2	1	2	1
5	0	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
6	1	1		1	0	1	\N	\N	\N	\N	\N	\N	\N	4
7	3	1		0	1	2	\N	\N	\N	\N	\N	\N	\N	4
8	1	1		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
\.


--
-- Name: aanganwadi_basicfacilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_basicfacilities_id_seq', 8, true);


--
-- Data for Name: aanganwadi_boundary; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_boundary (id, block, district_id) FROM stdin;
2	Rural	2
1	Urban	2
\.


--
-- Name: aanganwadi_boundary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_boundary_id_seq', 2, true);


--
-- Data for Name: aanganwadi_communityengagement; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_communityengagement (id, mothers_committee_formed, no_of_meetings_conducted_in_last_three_months, meetings_documented_in_register, mothers_committee_feedback, bal_vikas_samiti_formed, bal_vikas_samiti_feedback, meetings_documented, arrangements_for_the_children_with_specialneeds_feedback, arrangements_for_the_children_with_specialneeds_requirements, pregnant_mothers_in_population, lactating_mothers_in_population, school_id) FROM stdin;
4	1	\N	1		1		\N			12	7	4
2	1	1	1		1		1			20	18	2
5	1	\N	1		1		\N			15	11	5
1	1	1	1		1		1			3	4	1
6	1	15	\N		\N		\N			\N	\N	4
7	1	\N	1		1		1			\N	\N	4
8	\N	2	\N	2	\N	2	\N	2	3	12	14	4
9	1	1	1	1	1	1	1	1	2	3	4	4
10	1	\N	1		1		1	1234	123	16	12	3
3	1	\N	1		1		1			15	13	3
\.


--
-- Name: aanganwadi_communityengagement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_communityengagement_id_seq', 10, true);


--
-- Data for Name: aanganwadi_demographics; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_demographics (id, male_teachers, female_teachers, total_boys, total_girls, household_covering_the_catchment_area, total_population_under_center, total_childrens_in_population, school_id) FROM stdin;
1	\N	\N	42	43	123	653	\N	1
2	\N	1	130	21	455	1822	78	2
5	\N	\N	80	32	453	2775	52	5
4	\N	\N	64	18	373	1514	83	4
3	0	2	200	17	511	2225	160	3
\.


--
-- Name: aanganwadi_demographics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_demographics_id_seq', 5, true);


--
-- Data for Name: aanganwadi_district; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_district (id, name, dise_slug, type, school_type, status) FROM stdin;
1	Urban	\N	Urban	Urban	2
2	Bengaluru	\N	Urban	\N	2
3	Mandur	\N	Rural	\N	2
\.


--
-- Name: aanganwadi_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_district_id_seq', 3, true);


--
-- Data for Name: aanganwadi_learningenvironment; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_learningenvironment (id, learning_and_playing_materials_available, learning_and_playing_materials_required, charts_available, charts_required, story_books_available, story_books_required, drawing_and_art_materials_available, drawing_and_art_materials_required, library_kits_available, library_kits_required, sports_material_available, sports_material_required, others_requirements, school_id) FROM stdin;
1	1	1	1	1	0	1	1	0	1	\N	\N	\N		2
3	1	1	1	1	1	1	0	0	1	0	1	1		5
4	1	0	1	0	1	0	1	0	1	0	1	\N		1
5	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		4
6	\N	1	1	\N	1	\N	\N	\N	1	\N	1	\N		3
7	1	1	1	1	1	1	1	1	1	1	1	\N		3
2	1	1	1	1	1	1	1	0	0	1	1	1		3
\.


--
-- Name: aanganwadi_learningenvironment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_learningenvironment_id_seq', 7, true);


--
-- Data for Name: aanganwadi_safeenvironment; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_safeenvironment (id, shelves_in_kitchen, shelves_required_in_kitchen, shelves_in_store_room, shelves_required_in_store_room, shelves_in_playing_area, shelves_required_in_playing_area, building_paint, need_painting_in_building, need_flooring_in_building, flooring_requirement_description, need_ceiling_repair, ceiling_requirement_description, need_walls_repair, walls_repair_requirement_description, window_condition, need_window_repair, window_repair_description, door_condition, need_door_repair, door_repair_description, no_of_cooking_vessels, no_of_cooking_vessels_required, cooking_vessels_to_be_repaired, no_of_serving_vessels, no_of_serving_vessels_required, mats_available, no_of_mats, no_of_mats_required, mops_available, no_of_mops, no_of_mops_required, broom_available, no_of_broom, no_of_broom_required, dustbin_available, no_of_dustbin, no_of_dustbin_required, plant_pots_available, plant_pots, plant_pots_required, green_cover, green_cover_required, water_taps_in_kitchen, no_of_water_taps_in_kitchen, water_taps_in_kitchen_required, shelter_in_toilets, water_taps_in_toilets, no_of_water_taps_required_in_toilets, water_storage_containers_in_kitchen, no_of_water_storage_containers_required_in_kitchen, water_storage_containers_in_toilets, no_of_water_storage_containers_required_in_toilets, toilet_available, toilet_functioning, toilet_boys, toilet_girls, toilet_doors_condition, mural_art_available, mural_art_required, school_id) FROM stdin;
1	1	1	1	1	\N	\N		\N	\N		\N		\N		\N	\N		\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
2	\N	\N	\N	\N	\N	\N	new	1	1		\N		\N		\N	\N		\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2
3	0	2	0	2	0	1	old	1	1		0		0		\N	\N		\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5
4	\N	\N	\N	\N	\N	\N		\N	\N		\N		\N		\N	\N		\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	0	1	\N	5
5	1	2	1	1	1	1	new	0	1		1		1		1	1		\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1
6	15	2	15	2	\N	\N		\N	\N		\N		\N		\N	\N		\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4
7	2	2	2	2	2	2	new	1	1		1		1		1	0		1	1		\N	\N	\N	\N	\N	1	\N	\N	1	\N	\N	1	\N	\N	1	\N	\N	1	\N	\N	1	\N	1	\N	\N	1	1	\N	1	\N	1	\N	1	1	\N	\N	\N	\N	\N	3
\.


--
-- Name: aanganwadi_safeenvironment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_safeenvironment_id_seq', 7, true);


--
-- Data for Name: aanganwadi_school; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_school (id, name, rural_urban, building_status, worker_name, worker_number, helper_name, helper_number, supervisor_name, supervisor_number, cdpo_name, cdpo_number, address_id, type_id) FROM stdin;
4	JYOTHIGRAMA	1	1	Mouli Thomas	\N		\N		\N	Prakash kumar	\N	4	2
2	HORAMAVU	2	3	Anjinamma	\N		\N		\N		\N	2	2
5	K.CHANNASANDRA	1	1	Shree shaila	9538299609	Saraswatamma	\N	Saradamba	\N	Prakash kumar	\N	5	2
1	Thirumenahalli	2	1	Ms.Shanthama	\N		\N		\N		\N	1	2
3	HORAMAVU AGARA	2	1	Anjinamma	\N	Shilpa .P.J	\N	Anjinamma	\N		\N	3	2
\.


--
-- Name: aanganwadi_school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_school_id_seq', 5, true);


--
-- Data for Name: aanganwadi_schoolimages; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_schoolimages (id, image, school_id) FROM stdin;
1	schoolImages/1.jpg	1
2	schoolImages/9.jpg	1
5	schoolImages/15089026464591594082632.jpg	4
6	schoolImages/6.jpg	1
7	schoolImages/4.jpg	2
\.


--
-- Name: aanganwadi_schoolimages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('aanganwadi_schoolimages_id_seq', 7, true);


--
-- Data for Name: aanganwadi_type; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY aanganwadi_type (id, name) FROM stdin;
2	Aanganwadi
1	PreSchool
3	School
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
1	Can add group	1	add_group
2	Can change group	1	change_group
3	Can delete group	1	delete_group
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
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
19	Can add source	7	add_source
20	Can change source	7	change_source
21	Can delete source	7	delete_source
22	Can add thumbnail	8	add_thumbnail
23	Can change thumbnail	8	change_thumbnail
24	Can delete thumbnail	8	delete_thumbnail
25	Can add thumbnail dimensions	9	add_thumbnaildimensions
26	Can change thumbnail dimensions	9	change_thumbnaildimensions
27	Can delete thumbnail dimensions	9	delete_thumbnaildimensions
28	Can add academic year	10	add_academicyear
29	Can change academic year	10	change_academicyear
30	Can delete academic year	10	delete_academicyear
31	Can add district	11	add_district
32	Can change district	11	change_district
33	Can delete district	11	delete_district
34	Can add boundary	12	add_boundary
35	Can change boundary	12	change_boundary
36	Can delete boundary	12	delete_boundary
37	Can add address	13	add_address
38	Can change address	13	change_address
39	Can delete address	13	delete_address
40	Can add type	14	add_type
41	Can change type	14	change_type
42	Can delete type	14	delete_type
43	Can add school	15	add_school
44	Can change school	15	change_school
45	Can delete school	15	delete_school
46	Can add demographics	16	add_demographics
47	Can change demographics	16	change_demographics
48	Can delete demographics	16	delete_demographics
49	Can add basic facilities	17	add_basicfacilities
50	Can change basic facilities	17	change_basicfacilities
51	Can delete basic facilities	17	delete_basicfacilities
52	Can add learning environment	18	add_learningenvironment
53	Can change learning environment	18	change_learningenvironment
54	Can delete learning environment	18	delete_learningenvironment
55	Can add safe environment	19	add_safeenvironment
56	Can change safe environment	19	change_safeenvironment
57	Can delete safe environment	19	delete_safeenvironment
58	Can add community engagement	20	add_communityengagement
59	Can change community engagement	20	change_communityengagement
60	Can delete community engagement	20	delete_communityengagement
61	Can add school images	21	add_schoolimages
62	Can change school images	21	change_schoolimages
63	Can delete school images	21	delete_schoolimages
64	Can add profile	22	add_profile
65	Can change profile	22	change_profile
66	Can delete profile	22	delete_profile
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('auth_permission_id_seq', 66, true);


--
-- Data for Name: authtools_user; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY authtools_user (id, password, last_login, is_superuser, email, is_staff, is_active, date_joined, name) FROM stdin;
2	pbkdf2_sha256$36000$o3wfGN5ADpop$ani2ZSpnSEVDyoJI0Bslm+ZpZ2hRXdlX46Jk6n7YIE8=	\N	f	python@gmail.com	f	t	2017-10-19 11:04:46.173422+00	python
3	pbkdf2_sha256$36000$nB7Fw3C5U3sj$bSKG8cDLDdoLI3kY+w5swNGqWc5TYHQHcTZ5jLHOFBw=	2017-10-25 04:56:27.158529+00	t	admin@blcindia.com	t	t	2017-10-19 11:18:10.172347+00	Manager
5	pbkdf2_sha256$36000$eRAr7KaRJ8tA$wbzTFO2BebaDTY4oFFa9I0ci7Za2mTAYRWWokrs9veM=	2017-10-25 05:04:43.240718+00	t	sudhir.gowda@hotmail.com	t	t	2017-10-24 10:54:38.362996+00	Sudhir RG hotmail
1	pbkdf2_sha256$36000$u6IN0FL187up$WDXdBOqhMTgYBk39J0JgnAZh+pbYi3739X8MJ5ftIo8=	2017-10-25 10:11:54.020124+00	f	admin@gmail.com	t	t	2017-10-19 10:38:11.272445+00	field staff admin
4	pbkdf2_sha256$36000$MimHtQDDjMZQ$dAHcguJlAPIp0T67/LfwJLp/V5JcQ9HzwEP6feQpDqI=	\N	t	sudhir.gowda@gmail.com	f	t	2017-10-24 07:02:27.556656+00	Sudhir Raj Gowda
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

SELECT pg_catalog.setval('authtools_user_id_seq', 5, true);


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
1	2017-10-20 07:15:02.084215+00	1	Urban	1	[{"added": {}}]	11	3
2	2017-10-20 07:15:07.519775+00	1	Urban	1	[{"added": {}}]	12	3
3	2017-10-20 10:23:54.295921+00	1	Urban	1	[{"added": {}}]	14	3
4	2017-10-20 10:24:04.708967+00	2	Rural	1	[{"added": {}}]	14	3
5	2017-10-20 10:24:04.991146+00	3	Rural	1	[{"added": {}}]	14	3
6	2017-10-20 12:37:27.536177+00	1	Thirumenahalli, Mandur post, Bidarahalli hobli, Bangalore Urban, Mandur, 560049	1	[{"added": {}}]	13	3
7	2017-10-20 12:45:08.528839+00	1	Thirumenahalli	1	[{"added": {}}, {"added": {"object": "Demographics object", "name": "demographics"}}, {"added": {"object": "CommunityEngagement object", "name": "community engagement"}}]	15	3
8	2017-10-20 14:24:07.252243+00	1	SchoolImages object	1	[{"added": {}}]	21	3
9	2017-10-20 14:24:30.307287+00	2	SchoolImages object	1	[{"added": {}}]	21	3
10	2017-10-20 14:36:36.471905+00	2	Bengaluru	1	[{"added": {}}]	11	3
11	2017-10-20 14:37:14.985289+00	3	Mandur	1	[{"added": {}}]	11	3
12	2017-10-20 14:40:58.539767+00	2	Horamavu(p)Banglore-13, 560013	1	[{"added": {}}]	13	3
13	2017-10-20 14:43:34.723399+00	2	HORAMAVU	1	[{"added": {}}, {"added": {"object": "Demographics object", "name": "demographics"}}, {"added": {"object": "CommunityEngagement object", "name": "community engagement"}}]	15	3
14	2017-10-20 14:46:00.966862+00	3	horamavu, 560013	1	[{"added": {}}]	13	3
15	2017-10-20 14:47:45.257352+00	3	HORAMAVU AGARA	1	[{"added": {}}, {"added": {"object": "Demographics object", "name": "demographics"}}, {"added": {"object": "CommunityEngagement object", "name": "community engagement"}}]	15	3
16	2017-10-20 14:53:52.015718+00	4	Horamavu(p)Banglore-43, 560043	1	[{"added": {}}]	13	3
17	2017-10-20 14:56:57.082071+00	4	JYOTHIGRAMA	1	[{"added": {}}, {"added": {"object": "Demographics object", "name": "demographics"}}, {"added": {"object": "SafeEnvironment object", "name": "safe environment"}}, {"added": {"object": "CommunityEngagement object", "name": "community engagement"}}]	15	3
18	2017-10-21 05:56:43.491393+00	2	HORAMAVU	2	[{"changed": {"fields": ["type"]}}]	15	3
19	2017-10-22 06:19:10.014002+00	2	HORAMAVU	2	[{"added": {"object": "BasicFacilities object", "name": "basic facilities"}}, {"added": {"object": "LearningEnvironment object", "name": "learning environment"}}, {"added": {"object": "SafeEnvironment object", "name": "safe environment"}}, {"changed": {"fields": ["mothers_committee_formed", "no_of_meetings_conducted_in_last_three_months", "meetings_documented_in_register", "bal_vikas_samiti_formed", "meetings_documented"], "object": "CommunityEngagement object", "name": "community engagement"}}]	15	3
20	2017-10-23 09:59:35.923633+00	3	HORAMAVU AGARA	2	[{"added": {"object": "BasicFacilities object", "name": "basic facilities"}}, {"added": {"object": "LearningEnvironment object", "name": "learning environment"}}]	15	3
21	2017-10-23 10:00:28.437515+00	3	HORAMAVU AGARA	2	[{"changed": {"fields": ["electric_bulbs", "electric_bulbs_required", "electric_fans_available", "electric_fans_required"], "object": "BasicFacilities object", "name": "basic facilities"}}]	15	3
22	2017-10-24 06:00:29.147191+00	3	SchoolImages object	1	[{"added": {}}]	21	3
23	2017-10-24 06:08:54.927263+00	3	SchoolImages object	3		21	3
24	2017-10-24 06:29:35.154989+00	3	Manager <admin@blcindia.com>	2	[{"changed": {"fields": ["name"]}}, {"changed": {"fields": ["bio"], "object": "Manager <admin@blcindia.com>'s profile", "name": "profile"}}]	6	3
25	2017-10-24 07:02:27.676792+00	4	Sudhir Raj Gowda <sudhir.gowda@gmail.com>	1	[{"added": {}}, {"added": {"object": "Sudhir Raj Gowda <sudhir.gowda@gmail.com>'s profile", "name": "profile"}}]	6	3
26	2017-10-24 07:02:54.871608+00	4	Sudhir Raj Gowda <sudhir.gowda@gmail.com>	2	[{"changed": {"fields": ["is_superuser"]}}]	6	3
27	2017-10-24 07:05:01.245935+00	1	field staff admin <admin@gmail.com>	2	[{"changed": {"fields": ["name"]}}]	6	3
28	2017-10-24 07:06:53.158489+00	1	field staff admin <admin@gmail.com>	2	[{"changed": {"fields": ["is_staff"]}}, {"added": {"object": "field staff admin <admin@gmail.com>'s profile", "name": "profile"}}]	6	3
29	2017-10-24 10:51:05.024052+00	3	Manager <admin@blcindia.com>	2	[{"changed": {"fields": ["is_staff"]}}]	6	3
30	2017-10-24 10:55:31.506391+00	3	Manager <admin@blcindia.com>	2	[{"changed": {"fields": ["is_staff"]}}]	6	5
31	2017-10-24 16:33:43.764398+00	2	Rural	1	[{"added": {}}]	12	5
32	2017-10-24 16:34:06.025222+00	1	Urban	2	[{"changed": {"fields": ["district"]}}]	12	5
33	2017-10-24 16:43:13.220906+00	5	centre:K.CHANNASANDRA	1	[{"added": {}}]	13	5
34	2017-10-24 16:45:26.622784+00	5	K.CHANNASANDRA	1	[{"added": {}}]	15	5
35	2017-10-24 17:34:48.02547+00	5	K.CHANNASANDRA	2	[{"added": {"object": "Demographics object", "name": "demographics"}}, {"added": {"object": "BasicFacilities object", "name": "basic facilities"}}, {"added": {"object": "LearningEnvironment object", "name": "learning environment"}}, {"added": {"object": "SafeEnvironment object", "name": "safe environment"}}, {"added": {"object": "SafeEnvironment object", "name": "safe environment"}}, {"added": {"object": "CommunityEngagement object", "name": "community engagement"}}]	15	5
36	2017-10-25 01:49:46.990613+00	1	Thirumenahalli	2	[{"added": {"object": "BasicFacilities object", "name": "basic facilities"}}, {"added": {"object": "LearningEnvironment object", "name": "learning environment"}}, {"added": {"object": "SafeEnvironment object", "name": "safe environment"}}, {"changed": {"fields": ["mothers_committee_formed", "no_of_meetings_conducted_in_last_three_months", "meetings_documented_in_register", "bal_vikas_samiti_formed", "meetings_documented"], "object": "CommunityEngagement object", "name": "community engagement"}}]	15	5
37	2017-10-25 02:09:20.57395+00	4	SchoolImages object	1	[{"added": {}}]	21	3
38	2017-10-25 02:15:45.839577+00	4	SchoolImages object	3		21	3
39	2017-10-25 03:38:06.444022+00	5	SchoolImages object	1	[{"added": {}}]	21	3
40	2017-10-25 05:23:44.737568+00	3	HORAMAVU AGARA	2	[{"changed": {"fields": ["total_boys"], "object": "Demographics object", "name": "demographics"}}]	15	3
41	2017-10-25 09:15:50.204406+00	6	SchoolImages object	1	[{"added": {}}]	21	5
42	2017-10-25 10:29:32.224511+00	7	SchoolImages object	1	[{"added": {}}]	21	5
43	2017-10-28 12:22:12.245168+00	3	HORAMAVU AGARA	2	[{"changed": {"fields": ["learning_and_playing_materials_required", "charts_available", "charts_required", "story_books_available", "story_books_required", "drawing_and_art_materials_available", "drawing_and_art_materials_required", "library_kits_available", "library_kits_required", "sports_material_available", "sports_material_required"], "object": "LearningEnvironment object", "name": "learning environment"}}, {"added": {"object": "SafeEnvironment object", "name": "safe environment"}}, {"changed": {"fields": ["mothers_committee_formed", "meetings_documented_in_register", "bal_vikas_samiti_formed", "meetings_documented"], "object": "CommunityEngagement object", "name": "community engagement"}}]	15	5
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 43, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	group
2	auth	permission
3	admin	logentry
4	contenttypes	contenttype
5	sessions	session
6	authtools	user
7	easy_thumbnails	source
8	easy_thumbnails	thumbnail
9	easy_thumbnails	thumbnaildimensions
10	aanganwadi	academicyear
11	aanganwadi	district
12	aanganwadi	boundary
13	aanganwadi	address
14	aanganwadi	type
15	aanganwadi	school
16	aanganwadi	demographics
17	aanganwadi	basicfacilities
18	aanganwadi	learningenvironment
19	aanganwadi	safeenvironment
20	aanganwadi	communityengagement
21	aanganwadi	schoolimages
22	profiles	profile
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('django_content_type_id_seq', 22, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-10-19 10:37:48.339528+00
2	auth	0001_initial	2017-10-19 10:37:48.453001+00
3	authtools	0001_initial	2017-10-19 10:37:48.576381+00
4	admin	0001_initial	2017-10-19 10:37:48.636945+00
5	admin	0002_logentry_remove_auto_add	2017-10-19 10:37:48.659205+00
6	contenttypes	0002_remove_content_type_name	2017-10-19 10:37:48.726261+00
7	auth	0002_alter_permission_name_max_length	2017-10-19 10:37:48.742631+00
8	auth	0003_alter_user_email_max_length	2017-10-19 10:37:48.761266+00
9	auth	0004_alter_user_username_opts	2017-10-19 10:37:48.777086+00
10	auth	0005_alter_user_last_login_null	2017-10-19 10:37:48.792999+00
11	auth	0006_require_contenttypes_0002	2017-10-19 10:37:48.797591+00
12	auth	0007_alter_validators_add_error_messages	2017-10-19 10:37:48.814153+00
13	auth	0008_alter_user_username_max_length	2017-10-19 10:37:48.830014+00
14	authtools	0002_django18	2017-10-19 10:37:48.849588+00
15	authtools	0003_auto_20160128_0912	2017-10-19 10:37:48.874478+00
16	easy_thumbnails	0001_initial	2017-10-19 10:37:48.998888+00
17	easy_thumbnails	0002_thumbnaildimensions	2017-10-19 10:37:49.038645+00
18	sessions	0001_initial	2017-10-19 10:37:49.08161+00
19	aanganwadi	0001_initial	2017-10-19 11:17:32.442535+00
20	profiles	0001_initial	2017-10-19 11:17:32.476912+00
21	aanganwadi	0002_auto_20171020_0400	2017-10-20 04:00:33.133679+00
22	aanganwadi	0003_auto_20171024_1550	2017-10-24 15:50:59.365626+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('django_migrations_id_seq', 22, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
a36fbcobatyc31e03sxq7p0nnlzvqb0g	NjZlYzBjMDFjYWI3NDUwOGQyNzdlNzg5ZDQ5MDRiMzVlNGEwZjA4NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU2N2Y0NjU2MGI5YmI5YTg3NjY1NTZkYzVlMmU2MmZlMmIwMTdjNWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-11-02 11:31:36.818984+00
jk4qm2hn2ayhdizgewtyq4n4wquxu77w	NjZlYzBjMDFjYWI3NDUwOGQyNzdlNzg5ZDQ5MDRiMzVlNGEwZjA4NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU2N2Y0NjU2MGI5YmI5YTg3NjY1NTZkYzVlMmU2MmZlMmIwMTdjNWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-11-03 07:10:45.599899+00
z7inio94vhgmquymhfxiyqe81zj9yt4z	OTlkNjI3MGM5ZTRiMjE4M2NhN2UyMjQwNDI4YTZiZDEyOTQzNjNlNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjdkNmE0ODc2YjYxNmU0ZmY4NDczMGNlYjgzOTE0MmQ1ZDVkOTUzMzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-03 10:15:24.873796+00
h1co71bl50j653yxztdpbckcevvgi8xj	NjZlYzBjMDFjYWI3NDUwOGQyNzdlNzg5ZDQ5MDRiMzVlNGEwZjA4NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU2N2Y0NjU2MGI5YmI5YTg3NjY1NTZkYzVlMmU2MmZlMmIwMTdjNWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-11-07 06:35:30.604122+00
d4xwcworaz54y7sjabaev32sxt7ahg8e	MjEyODA0ZjYyM2I1ZWI5OTY5ODBkNjBjOTMyMDhlMzYyMzA2Y2MyMzp7Il9zZXNzaW9uX2V4cGlyeSI6MjU5MjAwMCwiX2F1dGhfdXNlcl9oYXNoIjoiN2Q2YTQ4NzZiNjE2ZTRmZjg0NzMwY2ViODM5MTQyZDVkNWQ5NTMzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2017-11-23 13:59:04.069225+00
5igwwi4et4ixeygnc4z4musdgbkophpx	NjZlYzBjMDFjYWI3NDUwOGQyNzdlNzg5ZDQ5MDRiMzVlNGEwZjA4NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU2N2Y0NjU2MGI5YmI5YTg3NjY1NTZkYzVlMmU2MmZlMmIwMTdjNWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-11-08 04:56:27.163875+00
7euz8tjuth51kh32m2wl5f7w3r6zultg	NzVkNDM3M2E2MjUyMDFmMjU5NGIwNjEwNGI2YzFhMzYzNWYxZDQ2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQyZmJhOWJjMDY4NjU1MThkNTVkYTgyMzljYTkwN2UxNjlmOGRiZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2017-11-08 05:04:43.245887+00
nxc3570go6f8du4d9cq8tmyj3qchfhhc	OTlkNjI3MGM5ZTRiMjE4M2NhN2UyMjQwNDI4YTZiZDEyOTQzNjNlNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjdkNmE0ODc2YjYxNmU0ZmY4NDczMGNlYjgzOTE0MmQ1ZDVkOTUzMzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-11-08 10:11:54.025708+00
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
1	f9bde26a1556cd667f742bd34ec7c55e	profile_pics/2017-10-20/1.jpg	2017-10-20 14:50:16.007138+00
2	f9bde26a1556cd667f742bd34ec7c55e	profile_pics/2017-10-24/9.jpg	2017-10-24 07:07:34.116087+00
3	f9bde26a1556cd667f742bd34ec7c55e	profile_pics/2017-10-24/9_oMqTaNS.jpg	2017-10-24 17:53:38.727947+00
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 3, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
1	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2017-10-20/1.jpg.30x30_q85_crop.png	2017-10-20 14:50:15.869736+00	1
2	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2017-10-20/1.jpg.140x140_q85_crop.png	2017-10-20 14:50:16.038489+00	1
3	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2017-10-24/9.jpg.30x30_q85_crop.png	2017-10-24 07:07:33.983782+00	2
4	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2017-10-24/9.jpg.140x140_q85_crop.png	2017-10-24 07:07:34.12144+00	2
5	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2017-10-24/9_oMqTaNS.jpg.30x30_q85_crop.png	2017-10-24 17:53:38.59548+00	3
6	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2017-10-24/9_oMqTaNS.jpg.140x140_q85_crop.png	2017-10-24 17:53:38.733169+00	3
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blcindia
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 6, true);


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
-- Data for Name: profiles_profile; Type: TABLE DATA; Schema: public; Owner: blcindia
--

COPY profiles_profile (user_id, slug, picture, bio, email_verified) FROM stdin;
3	e668c68e-0703-49db-9915-d0ab09b08424	profile_pics/2017-10-20/1.jpg	Manager Staff	f
4	7bdc3779-bbce-4007-b753-ae4057b7cd4e	profile_pics/2017-10-24/tvs-bmw-g310r-india-1.jpg	Manager Staff one	t
1	8a71e191-5bff-4912-b9d4-0cd384de4d0e	profile_pics/2017-10-24/9.jpg	field staff	t
5	dcad7465-f289-4574-8280-159e17ba6b93	profile_pics/2017-10-24/9_oMqTaNS.jpg	Manager/FieldStaff	f
\.


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
-- Name: aanganwadi_demographics_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY aanganwadi_demographics
    ADD CONSTRAINT aanganwadi_demographics_pkey PRIMARY KEY (id);


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
-- Name: profiles_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: blcindia; Tablespace: 
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_pkey PRIMARY KEY (user_id);


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
-- Name: aanganwadi_demographics_school_id_f4acd6f2; Type: INDEX; Schema: public; Owner: blcindia; Tablespace: 
--

CREATE INDEX aanganwadi_demographics_school_id_f4acd6f2 ON aanganwadi_demographics USING btree (school_id);


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
-- Name: aanganwadi_demograph_school_id_f4acd6f2_fk_aanganwad; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY aanganwadi_demographics
    ADD CONSTRAINT aanganwadi_demograph_school_id_f4acd6f2_fk_aanganwad FOREIGN KEY (school_id) REFERENCES aanganwadi_school(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: profiles_profile_user_id_a3e81f91_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blcindia
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_a3e81f91_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


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

