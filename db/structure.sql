--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: refinery_calendar_events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_calendar_events (
    id integer NOT NULL,
    title character varying(255),
    "from" date,
    "to" date,
    registration_link character varying(255),
    excerpt character varying(255),
    description text,
    "position" integer,
    featured boolean,
    slug character varying(255),
    venue_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_calendar_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_calendar_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_calendar_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_calendar_events_id_seq OWNED BY refinery_calendar_events.id;


--
-- Name: refinery_calendar_venues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_calendar_venues (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    url character varying(255),
    phone character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_calendar_venues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_calendar_venues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_calendar_venues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_calendar_venues_id_seq OWNED BY refinery_calendar_venues.id;


--
-- Name: refinery_contact_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_contact_types (
    id integer NOT NULL,
    name character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    inputs hstore
);


--
-- Name: refinery_contact_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_contact_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_contact_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_contact_types_id_seq OWNED BY refinery_contact_types.id;


--
-- Name: refinery_images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_images (
    id integer NOT NULL,
    image_mime_type character varying(255),
    image_name character varying(255),
    image_size integer,
    image_width integer,
    image_height integer,
    image_uid character varying(255),
    image_ext character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_images_id_seq OWNED BY refinery_images.id;


--
-- Name: refinery_inquiries_inquiries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_inquiries_inquiries (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    phone character varying(255),
    message text,
    spam boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_inquiries_inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_inquiries_inquiries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_inquiries_inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_inquiries_inquiries_id_seq OWNED BY refinery_inquiries_inquiries.id;


--
-- Name: refinery_news_item_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_news_item_translations (
    id integer NOT NULL,
    refinery_news_item_id integer,
    locale character varying(255),
    title character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    source character varying(255)
);


--
-- Name: refinery_news_item_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_news_item_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_news_item_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_news_item_translations_id_seq OWNED BY refinery_news_item_translations.id;


--
-- Name: refinery_news_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_news_items (
    id integer NOT NULL,
    title character varying(255),
    body text,
    publish_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_id integer,
    expiration_date timestamp without time zone,
    source character varying(255),
    slug character varying(255)
);


--
-- Name: refinery_news_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_news_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_news_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_news_items_id_seq OWNED BY refinery_news_items.id;


--
-- Name: refinery_page_part_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_page_part_translations (
    id integer NOT NULL,
    refinery_page_part_id integer,
    locale character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_page_part_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_page_part_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_page_part_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_page_part_translations_id_seq OWNED BY refinery_page_part_translations.id;


--
-- Name: refinery_page_parts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_page_parts (
    id integer NOT NULL,
    refinery_page_id integer,
    title character varying(255),
    body text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_page_parts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_page_parts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_page_parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_page_parts_id_seq OWNED BY refinery_page_parts.id;


--
-- Name: refinery_page_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_page_translations (
    id integer NOT NULL,
    refinery_page_id integer,
    locale character varying(255),
    title character varying(255),
    custom_slug character varying(255),
    menu_title character varying(255),
    slug character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_page_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_page_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_page_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_page_translations_id_seq OWNED BY refinery_page_translations.id;


--
-- Name: refinery_pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_pages (
    id integer NOT NULL,
    parent_id integer,
    path character varying(255),
    slug character varying(255),
    show_in_menu boolean DEFAULT true,
    link_url character varying(255),
    menu_match character varying(255),
    deletable boolean DEFAULT true,
    draft boolean DEFAULT false,
    skip_to_first_child boolean DEFAULT false,
    lft integer,
    rgt integer,
    depth integer,
    view_template character varying(255),
    layout_template character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_pages_id_seq OWNED BY refinery_pages.id;


--
-- Name: refinery_resources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_resources (
    id integer NOT NULL,
    file_mime_type character varying(255),
    file_name character varying(255),
    file_size integer,
    file_uid character varying(255),
    file_ext character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_resources_id_seq OWNED BY refinery_resources.id;


--
-- Name: refinery_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_roles (
    id integer NOT NULL,
    title character varying(255)
);


--
-- Name: refinery_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_roles_id_seq OWNED BY refinery_roles.id;


--
-- Name: refinery_roles_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_roles_users (
    user_id integer,
    role_id integer
);


--
-- Name: refinery_settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_settings (
    id integer NOT NULL,
    name character varying(255),
    value text,
    destroyable boolean DEFAULT true,
    scoping character varying(255),
    restricted boolean DEFAULT false,
    form_value_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_settings_id_seq OWNED BY refinery_settings.id;


--
-- Name: refinery_user_plugins; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_user_plugins (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    "position" integer
);


--
-- Name: refinery_user_plugins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_user_plugins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_user_plugins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_user_plugins_id_seq OWNED BY refinery_user_plugins.id;


--
-- Name: refinery_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    encrypted_password character varying(255) NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    sign_in_count integer,
    remember_created_at timestamp without time zone,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_users_id_seq OWNED BY refinery_users.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: seo_meta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE seo_meta (
    id integer NOT NULL,
    seo_meta_id integer,
    seo_meta_type character varying(255),
    browser_title character varying(255),
    meta_keywords character varying(255),
    meta_description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: seo_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seo_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seo_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE seo_meta_id_seq OWNED BY seo_meta.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_calendar_events ALTER COLUMN id SET DEFAULT nextval('refinery_calendar_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_calendar_venues ALTER COLUMN id SET DEFAULT nextval('refinery_calendar_venues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_contact_types ALTER COLUMN id SET DEFAULT nextval('refinery_contact_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_images ALTER COLUMN id SET DEFAULT nextval('refinery_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_inquiries_inquiries ALTER COLUMN id SET DEFAULT nextval('refinery_inquiries_inquiries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_news_item_translations ALTER COLUMN id SET DEFAULT nextval('refinery_news_item_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_news_items ALTER COLUMN id SET DEFAULT nextval('refinery_news_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_page_part_translations ALTER COLUMN id SET DEFAULT nextval('refinery_page_part_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_page_parts ALTER COLUMN id SET DEFAULT nextval('refinery_page_parts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_page_translations ALTER COLUMN id SET DEFAULT nextval('refinery_page_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_pages ALTER COLUMN id SET DEFAULT nextval('refinery_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_resources ALTER COLUMN id SET DEFAULT nextval('refinery_resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_roles ALTER COLUMN id SET DEFAULT nextval('refinery_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_settings ALTER COLUMN id SET DEFAULT nextval('refinery_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_user_plugins ALTER COLUMN id SET DEFAULT nextval('refinery_user_plugins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_users ALTER COLUMN id SET DEFAULT nextval('refinery_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY seo_meta ALTER COLUMN id SET DEFAULT nextval('seo_meta_id_seq'::regclass);


--
-- Name: refinery_calendar_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_calendar_events
    ADD CONSTRAINT refinery_calendar_events_pkey PRIMARY KEY (id);


--
-- Name: refinery_calendar_venues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_calendar_venues
    ADD CONSTRAINT refinery_calendar_venues_pkey PRIMARY KEY (id);


--
-- Name: refinery_contact_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_contact_types
    ADD CONSTRAINT refinery_contact_types_pkey PRIMARY KEY (id);


--
-- Name: refinery_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_images
    ADD CONSTRAINT refinery_images_pkey PRIMARY KEY (id);


--
-- Name: refinery_inquiries_inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_inquiries_inquiries
    ADD CONSTRAINT refinery_inquiries_inquiries_pkey PRIMARY KEY (id);


--
-- Name: refinery_news_item_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_news_item_translations
    ADD CONSTRAINT refinery_news_item_translations_pkey PRIMARY KEY (id);


--
-- Name: refinery_news_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_news_items
    ADD CONSTRAINT refinery_news_items_pkey PRIMARY KEY (id);


--
-- Name: refinery_page_part_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_page_part_translations
    ADD CONSTRAINT refinery_page_part_translations_pkey PRIMARY KEY (id);


--
-- Name: refinery_page_parts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_page_parts
    ADD CONSTRAINT refinery_page_parts_pkey PRIMARY KEY (id);


--
-- Name: refinery_page_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_page_translations
    ADD CONSTRAINT refinery_page_translations_pkey PRIMARY KEY (id);


--
-- Name: refinery_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_pages
    ADD CONSTRAINT refinery_pages_pkey PRIMARY KEY (id);


--
-- Name: refinery_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_resources
    ADD CONSTRAINT refinery_resources_pkey PRIMARY KEY (id);


--
-- Name: refinery_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_roles
    ADD CONSTRAINT refinery_roles_pkey PRIMARY KEY (id);


--
-- Name: refinery_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_settings
    ADD CONSTRAINT refinery_settings_pkey PRIMARY KEY (id);


--
-- Name: refinery_user_plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_user_plugins
    ADD CONSTRAINT refinery_user_plugins_pkey PRIMARY KEY (id);


--
-- Name: refinery_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_users
    ADD CONSTRAINT refinery_users_pkey PRIMARY KEY (id);


--
-- Name: seo_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY seo_meta
    ADD CONSTRAINT seo_meta_pkey PRIMARY KEY (id);


--
-- Name: index_refinery_inquiries_inquiries_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_inquiries_inquiries_on_id ON refinery_inquiries_inquiries USING btree (id);


--
-- Name: index_refinery_news_item_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_news_item_translations_on_locale ON refinery_news_item_translations USING btree (locale);


--
-- Name: index_refinery_news_item_translations_on_refinery_news_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_news_item_translations_on_refinery_news_item_id ON refinery_news_item_translations USING btree (refinery_news_item_id);


--
-- Name: index_refinery_news_items_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_news_items_on_id ON refinery_news_items USING btree (id);


--
-- Name: index_refinery_page_part_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_part_translations_on_locale ON refinery_page_part_translations USING btree (locale);


--
-- Name: index_refinery_page_part_translations_on_refinery_page_part_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_part_translations_on_refinery_page_part_id ON refinery_page_part_translations USING btree (refinery_page_part_id);


--
-- Name: index_refinery_page_parts_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_parts_on_id ON refinery_page_parts USING btree (id);


--
-- Name: index_refinery_page_parts_on_refinery_page_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_parts_on_refinery_page_id ON refinery_page_parts USING btree (refinery_page_id);


--
-- Name: index_refinery_page_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_translations_on_locale ON refinery_page_translations USING btree (locale);


--
-- Name: index_refinery_page_translations_on_refinery_page_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_translations_on_refinery_page_id ON refinery_page_translations USING btree (refinery_page_id);


--
-- Name: index_refinery_pages_on_depth; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_pages_on_depth ON refinery_pages USING btree (depth);


--
-- Name: index_refinery_pages_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_pages_on_id ON refinery_pages USING btree (id);


--
-- Name: index_refinery_pages_on_lft; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_pages_on_lft ON refinery_pages USING btree (lft);


--
-- Name: index_refinery_pages_on_parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_pages_on_parent_id ON refinery_pages USING btree (parent_id);


--
-- Name: index_refinery_pages_on_rgt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_pages_on_rgt ON refinery_pages USING btree (rgt);


--
-- Name: index_refinery_roles_users_on_role_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_roles_users_on_role_id_and_user_id ON refinery_roles_users USING btree (role_id, user_id);


--
-- Name: index_refinery_roles_users_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_roles_users_on_user_id_and_role_id ON refinery_roles_users USING btree (user_id, role_id);


--
-- Name: index_refinery_settings_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_settings_on_name ON refinery_settings USING btree (name);


--
-- Name: index_refinery_user_plugins_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_user_plugins_on_name ON refinery_user_plugins USING btree (name);


--
-- Name: index_refinery_user_plugins_on_user_id_and_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_refinery_user_plugins_on_user_id_and_name ON refinery_user_plugins USING btree (user_id, name);


--
-- Name: index_refinery_users_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_users_on_id ON refinery_users USING btree (id);


--
-- Name: index_seo_meta_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_seo_meta_on_id ON seo_meta USING btree (id);


--
-- Name: index_seo_meta_on_seo_meta_id_and_seo_meta_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_seo_meta_on_seo_meta_id_and_seo_meta_type ON seo_meta USING btree (seo_meta_id, seo_meta_type);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20130603063929');

INSERT INTO schema_migrations (version) VALUES ('20130603063934');

INSERT INTO schema_migrations (version) VALUES ('20130603063939');

INSERT INTO schema_migrations (version) VALUES ('20130603063945');

INSERT INTO schema_migrations (version) VALUES ('20130603063950');

INSERT INTO schema_migrations (version) VALUES ('20130603224300');

INSERT INTO schema_migrations (version) VALUES ('20130603224301');

INSERT INTO schema_migrations (version) VALUES ('20130603224302');

INSERT INTO schema_migrations (version) VALUES ('20130603224303');

INSERT INTO schema_migrations (version) VALUES ('20130603224304');

INSERT INTO schema_migrations (version) VALUES ('20130603224305');

INSERT INTO schema_migrations (version) VALUES ('20130603224306');

INSERT INTO schema_migrations (version) VALUES ('20130603224307');

INSERT INTO schema_migrations (version) VALUES ('20130603224308');

INSERT INTO schema_migrations (version) VALUES ('20130603224309');

INSERT INTO schema_migrations (version) VALUES ('20130603235343');

INSERT INTO schema_migrations (version) VALUES ('20130604065314');

INSERT INTO schema_migrations (version) VALUES ('20130604072722');

INSERT INTO schema_migrations (version) VALUES ('20130604073654');

INSERT INTO schema_migrations (version) VALUES ('20130604075553');

INSERT INTO schema_migrations (version) VALUES ('20130604075554');