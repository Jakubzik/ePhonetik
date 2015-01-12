--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.13
-- Dumped by pg_dump version 9.1.13
-- Started on 2015-01-06 19:52:45 CET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1962 (class 1262 OID 179085)
-- Name: ePhonetik; Type: DATABASE; Schema: -; Owner: heiko
--

CREATE DATABASE "ePhonetik" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'de_DE.UTF-8' LC_CTYPE = 'de_DE.UTF-8';

\connect "ePhonetik"

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1963 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- TOC entry 167 (class 3079 OID 11693)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- TOC entry 1965 (class 0 OID 0)
-- Dependencies: 167
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


SET search_path = "public", pg_catalog;

--
-- TOC entry 179 (class 1255 OID 179086)
-- Dependencies: 6
-- Name: plpgsql_call_handler(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "plpgsql_call_handler"() RETURNS "language_handler"
    LANGUAGE "c"
    AS '$libdir/plpgsql', 'plpgsql_call_handler';


ALTER FUNCTION "public"."plpgsql_call_handler"() OWNER TO "postgres";

--
-- TOC entry 161 (class 1259 OID 179087)
-- Dependencies: 6
-- Name: autowert; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "autowert"
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."autowert" OWNER TO "postgres";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 166 (class 1259 OID 179149)
-- Dependencies: 1829 1830 6
-- Name: tblAppInfo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tblAppInfo" (
    "strAppInfoVersion" character varying(12) NOT NULL,
    "strAppInfoVersionBeschreibung" "text",
    "blnAppInfoVersionAktiv" boolean,
    "strAppInfoVersionDatum" "date" DEFAULT ('now'::"text")::"date",
    "strAppInfoVersionAutor" "text" DEFAULT 'shj'::"text"
);


ALTER TABLE "public"."tblAppInfo" OWNER TO "postgres";

--
-- TOC entry 162 (class 1259 OID 179089)
-- Dependencies: 1820 1821 6
-- Name: tblSdAntwort; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tblSdAntwort" (
    "lngFrageID" integer DEFAULT 0,
    "lngAntwortID" integer DEFAULT 0,
    "strAntwortText" "text",
    "blnAntwortKorrekt" boolean
);


ALTER TABLE "public"."tblSdAntwort" OWNER TO "postgres";

--
-- TOC entry 163 (class 1259 OID 179097)
-- Dependencies: 1822 1823 6
-- Name: tblSdFrage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tblSdFrage" (
    "lngFrageID" integer DEFAULT 0 NOT NULL,
    "strFrageText" "text",
    "lngFrageSequence" integer DEFAULT 0
);


ALTER TABLE "public"."tblSdFrage" OWNER TO "postgres";

--
-- TOC entry 164 (class 1259 OID 179105)
-- Dependencies: 1824 1825 6
-- Name: tblSdLektion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tblSdLektion" (
    "lngLektionID" integer DEFAULT 0,
    "strLektionBezeichnung" "text",
    "strLektionBeschreibung" "text",
    "lngLektionSequence" integer DEFAULT 0
);


ALTER TABLE "public"."tblSdLektion" OWNER TO "postgres";

--
-- TOC entry 165 (class 1259 OID 179113)
-- Dependencies: 1826 1827 1828 6
-- Name: tblSdLektionXFrage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tblSdLektionXFrage" (
    "lngLektionID" integer DEFAULT 0,
    "lngFrageID" integer DEFAULT 0,
    "lngLektionFrageSequence" integer DEFAULT 0
);


ALTER TABLE "public"."tblSdLektionXFrage" OWNER TO "postgres";

--
-- TOC entry 1967 (class 0 OID 0)
-- Dependencies: 161
-- Name: autowert; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"autowert"', 0, false);


--
-- TOC entry 1957 (class 0 OID 179149)
-- Dependencies: 166 1958
-- Data for Name: tblAppInfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tblAppInfo" VALUES ('1-00-00-00', 'Umgewandelt von alter eTranscription WebApp', true, '2015-01-02', 'shj');


--
-- TOC entry 1953 (class 0 OID 179089)
-- Dependencies: 162 1958
-- Data for Name: tblSdAntwort; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tblSdAntwort" VALUES (58, 15, 'vuːduː', true);
INSERT INTO "tblSdAntwort" VALUES (59, 16, 'kwɪk', true);
INSERT INTO "tblSdAntwort" VALUES (60, 17, 'ɪlevən', true);
INSERT INTO "tblSdAntwort" VALUES (61, 18, 'rɪpiːt', true);
INSERT INTO "tblSdAntwort" VALUES (62, 19, 'spjuː', true);
INSERT INTO "tblSdAntwort" VALUES (63, 20, 'jʌŋ', true);
INSERT INTO "tblSdAntwort" VALUES (64, 21, 'bʊʃ', true);
INSERT INTO "tblSdAntwort" VALUES (65, 22, 'ənɔɪ', true);
INSERT INTO "tblSdAntwort" VALUES (68, 25, 'tekst', true);
INSERT INTO "tblSdAntwort" VALUES (128, 85, 'mʌnθs', true);
INSERT INTO "tblSdAntwort" VALUES (69, 26, 'saɪz', true);
INSERT INTO "tblSdAntwort" VALUES (70, 27, 'dʌl', true);
INSERT INTO "tblSdAntwort" VALUES (71, 28, 'tʃerɪ', true);
INSERT INTO "tblSdAntwort" VALUES (72, 29, 'ʃiːp', true);
INSERT INTO "tblSdAntwort" VALUES (73, 30, 'vælɪ', true);
INSERT INTO "tblSdAntwort" VALUES (74, 31, 'fənetɪks', true);
INSERT INTO "tblSdAntwort" VALUES (129, 86, 'θɪŋk', true);
INSERT INTO "tblSdAntwort" VALUES (80, 37, 'æŋgə', true);
INSERT INTO "tblSdAntwort" VALUES (130, 87, 'æŋgər', true);
INSERT INTO "tblSdAntwort" VALUES (82, 39, 'glʌv', true);
INSERT INTO "tblSdAntwort" VALUES (83, 40, 'raʊndɪd', true);
INSERT INTO "tblSdAntwort" VALUES (84, 41, 'kləʊðz', true);
INSERT INTO "tblSdAntwort" VALUES (85, 42, 'juːnɪvɜːsɪtɪ', true);
INSERT INTO "tblSdAntwort" VALUES (86, 43, 'mædʒɪk', true);
INSERT INTO "tblSdAntwort" VALUES (87, 44, 'tʌtʃt', true);
INSERT INTO "tblSdAntwort" VALUES (88, 45, 'wɪəd', true);
INSERT INTO "tblSdAntwort" VALUES (89, 46, 'rɪŋɪŋ', true);
INSERT INTO "tblSdAntwort" VALUES (90, 47, 'kɪsɪz', true);
INSERT INTO "tblSdAntwort" VALUES (91, 48, 'wɔːtə', true);
INSERT INTO "tblSdAntwort" VALUES (92, 49, 'bʌtə', true);
INSERT INTO "tblSdAntwort" VALUES (131, 88, 'vaɪn', true);
INSERT INTO "tblSdAntwort" VALUES (93, 50, 'bʌzd', true);
INSERT INTO "tblSdAntwort" VALUES (94, 51, 'hɪz', true);
INSERT INTO "tblSdAntwort" VALUES (95, 52, 'sæp', true);
INSERT INTO "tblSdAntwort" VALUES (176, 133, 'enɪ', true);
INSERT INTO "tblSdAntwort" VALUES (322, 279, 'g', true);
INSERT INTO "tblSdAntwort" VALUES (323, 280, 'h', true);
INSERT INTO "tblSdAntwort" VALUES (324, 281, 'n', true);
INSERT INTO "tblSdAntwort" VALUES (315, 272, 'ŋ', true);
INSERT INTO "tblSdAntwort" VALUES (325, 282, 'ʃ', true);
INSERT INTO "tblSdAntwort" VALUES (326, 283, 'r', true);
INSERT INTO "tblSdAntwort" VALUES (327, 284, 'ɑː', true);
INSERT INTO "tblSdAntwort" VALUES (328, 285, 'ɪ', true);
INSERT INTO "tblSdAntwort" VALUES (329, 286, 'ə', true);
INSERT INTO "tblSdAntwort" VALUES (330, 287, 'ɜː', true);
INSERT INTO "tblSdAntwort" VALUES (331, 288, 'e', true);
INSERT INTO "tblSdAntwort" VALUES (332, 289, 'ʌ', true);
INSERT INTO "tblSdAntwort" VALUES (333, 290, 'aʊ', true);
INSERT INTO "tblSdAntwort" VALUES (335, 292, 'ɔː', true);
INSERT INTO "tblSdAntwort" VALUES (336, 293, 'eɪ', true);
INSERT INTO "tblSdAntwort" VALUES (337, 294, 'ɔɪ', true);
INSERT INTO "tblSdAntwort" VALUES (338, 295, 'ɔɪ', true);
INSERT INTO "tblSdAntwort" VALUES (339, 296, 'ʊ', true);
INSERT INTO "tblSdAntwort" VALUES (340, 297, 'aɪ', true);
INSERT INTO "tblSdAntwort" VALUES (341, 298, 'iː', true);
INSERT INTO "tblSdAntwort" VALUES (342, 299, 'æ', true);
INSERT INTO "tblSdAntwort" VALUES (354, 311, 'ɪts wʌn əv ə kaɪnd', true);
INSERT INTO "tblSdAntwort" VALUES (357, 314, 'ɪts lɑːrdʒər ðən laɪf', true);
INSERT INTO "tblSdAntwort" VALUES (360, 317, 'ʃiːz frəm dʒɜːrmənɪ', true);
INSERT INTO "tblSdAntwort" VALUES (362, 319, 'mɔːrgɪdʒ', true);
INSERT INTO "tblSdAntwort" VALUES (195, 152, 'ɑːftə', true);
INSERT INTO "tblSdAntwort" VALUES (258, 215, 'ʌnfɔːrtʃənətlɪ', true);
INSERT INTO "tblSdAntwort" VALUES (259, 216, 'eksentrɪk', true);
INSERT INTO "tblSdAntwort" VALUES (260, 217, 'saɪkɑːlədʒɪ', true);
INSERT INTO "tblSdAntwort" VALUES (201, 158, 'nɪr', true);
INSERT INTO "tblSdAntwort" VALUES (45, 2, 'kæt', true);
INSERT INTO "tblSdAntwort" VALUES (126, 83, 'hʌzbənd', true);
INSERT INTO "tblSdAntwort" VALUES (46, 3, 'spɪn', true);
INSERT INTO "tblSdAntwort" VALUES (47, 4, 'geɪm', true);
INSERT INTO "tblSdAntwort" VALUES (48, 5, 'meθəd', true);
INSERT INTO "tblSdAntwort" VALUES (263, 220, 'ræzberɪ', true);
INSERT INTO "tblSdAntwort" VALUES (228, 185, 'bɑːt', true);
INSERT INTO "tblSdAntwort" VALUES (281, 238, 'ðɪs ɪz ən æpl', true);
INSERT INTO "tblSdAntwort" VALUES (283, 240, 'aɪ laɪk bɪl ənd æn', true);
INSERT INTO "tblSdAntwort" VALUES (285, 242, 'aɪ laɪk ðəm', true);
INSERT INTO "tblSdAntwort" VALUES (231, 188, 'vaʊəl', true);
INSERT INTO "tblSdAntwort" VALUES (229, 186, 'sɑːsɪdʒ', true);
INSERT INTO "tblSdAntwort" VALUES (232, 189, 'ʌnfɔːtʃənətlɪ', true);
INSERT INTO "tblSdAntwort" VALUES (233, 190, 'mɪljəneə', true);
INSERT INTO "tblSdAntwort" VALUES (235, 192, 'saɪkalədʒɪ', true);
INSERT INTO "tblSdAntwort" VALUES (236, 193, 'θɪəretɪkl', true);
INSERT INTO "tblSdAntwort" VALUES (237, 194, 'kəngrætjʊleɪʃənz', true);
INSERT INTO "tblSdAntwort" VALUES (127, 84, 'kwestʃən', true);
INSERT INTO "tblSdAntwort" VALUES (50, 7, 'pænɪk', true);
INSERT INTO "tblSdAntwort" VALUES (51, 8, 'kʌntrɪ', true);
INSERT INTO "tblSdAntwort" VALUES (52, 9, 'piːnʌt', true);
INSERT INTO "tblSdAntwort" VALUES (53, 10, 'θriː', true);
INSERT INTO "tblSdAntwort" VALUES (54, 11, 'guːs', true);
INSERT INTO "tblSdAntwort" VALUES (55, 12, 'briːð', true);
INSERT INTO "tblSdAntwort" VALUES (56, 13, 'ɪgzæm', true);
INSERT INTO "tblSdAntwort" VALUES (57, 14, 'ɪnʌf', true);
INSERT INTO "tblSdAntwort" VALUES (173, 130, 'dʒɜːnɪ', true);
INSERT INTO "tblSdAntwort" VALUES (174, 131, 'ʌnjən', true);
INSERT INTO "tblSdAntwort" VALUES (270, 227, 'əsperəgəs', true);
INSERT INTO "tblSdAntwort" VALUES (271, 228, 'juːfəmɪzm', true);
INSERT INTO "tblSdAntwort" VALUES (272, 229, 'fətɑːgrəfər', true);
INSERT INTO "tblSdAntwort" VALUES (273, 230, 'kəθɑːlɪsɪzm', true);
INSERT INTO "tblSdAntwort" VALUES (274, 231, 'prənʌntsɪeɪʃn', true);
INSERT INTO "tblSdAntwort" VALUES (275, 232, 'dɪmɑːkrəsɪ', true);
INSERT INTO "tblSdAntwort" VALUES (276, 233, 'mɑːnəlɪθɪkəlɪ', true);
INSERT INTO "tblSdAntwort" VALUES (277, 234, 'ɪmətɪrɪəl', true);
INSERT INTO "tblSdAntwort" VALUES (278, 235, 'næʃənəlaɪzeɪʃən', true);
INSERT INTO "tblSdAntwort" VALUES (279, 236, 'vəraɪətɪ', true);
INSERT INTO "tblSdAntwort" VALUES (282, 239, 'ðɪs ɪz ðə sɪtɪ', true);
INSERT INTO "tblSdAntwort" VALUES (284, 241, 'aɪ nəʊ ðæt', true);
INSERT INTO "tblSdAntwort" VALUES (286, 243, 'ðɪs ɪz fə dʒɪm', true);
INSERT INTO "tblSdAntwort" VALUES (289, 246, 'aɪ wəz last', true);
INSERT INTO "tblSdAntwort" VALUES (293, 250, 'ðɪs ɪz ðə sɪtɪ', true);
INSERT INTO "tblSdAntwort" VALUES (294, 251, 'aɪ laɪk bɪl ənd æn', true);
INSERT INTO "tblSdAntwort" VALUES (295, 252, 'aɪ noʊ ðæt', true);
INSERT INTO "tblSdAntwort" VALUES (296, 253, 'aɪ laɪk ðəm', true);
INSERT INTO "tblSdAntwort" VALUES (297, 254, 'ðɪs ɪz fər dʒɪm', true);
INSERT INTO "tblSdAntwort" VALUES (298, 255, 'aɪ wɑːnt tə goʊ', true);
INSERT INTO "tblSdAntwort" VALUES (299, 256, 'aɪ wɑːnt tʊ ænsər', true);
INSERT INTO "tblSdAntwort" VALUES (300, 257, 'aɪ wəz lɑːst', true);
INSERT INTO "tblSdAntwort" VALUES (301, 258, 'wɪ wər wɑːkɪŋ', true);
INSERT INTO "tblSdAntwort" VALUES (302, 259, 'jʊ kən duː ɪt', true);
INSERT INTO "tblSdAntwort" VALUES (358, 315, 'aɪ noʊ ðət ɪts greɪt', true);
INSERT INTO "tblSdAntwort" VALUES (361, 318, 'ɪts wʌn əv ə kaɪnd', true);
INSERT INTO "tblSdAntwort" VALUES (352, 309, 'wɪər ət həʊm', true);
INSERT INTO "tblSdAntwort" VALUES (291, 248, 'jʊ kən duː ɪt', true);
INSERT INTO "tblSdAntwort" VALUES (355, 312, 'ʃɪz frəm dʒɜːmənɪ', true);
INSERT INTO "tblSdAntwort" VALUES (349, 306, 'hiːz əz gʊd əz juː', true);
INSERT INTO "tblSdAntwort" VALUES (303, 260, 'kəngrætjʊleɪʃənz', true);
INSERT INTO "tblSdAntwort" VALUES (304, 261, 'p', true);
INSERT INTO "tblSdAntwort" VALUES (103, 60, 'gæs', true);
INSERT INTO "tblSdAntwort" VALUES (104, 61, 'sɪŋə', true);
INSERT INTO "tblSdAntwort" VALUES (105, 62, 'wɪntə', true);
INSERT INTO "tblSdAntwort" VALUES (106, 63, 'hɪlz', true);
INSERT INTO "tblSdAntwort" VALUES (107, 64, 'laʊd', true);
INSERT INTO "tblSdAntwort" VALUES (108, 65, 'dʒɜːmən', true);
INSERT INTO "tblSdAntwort" VALUES (109, 66, 'sɔːd', true);
INSERT INTO "tblSdAntwort" VALUES (110, 67, 'ləʊð', true);
INSERT INTO "tblSdAntwort" VALUES (111, 68, 'pɔːz', true);
INSERT INTO "tblSdAntwort" VALUES (112, 69, 'bætl', true);
INSERT INTO "tblSdAntwort" VALUES (113, 70, 'mʌg', true);
INSERT INTO "tblSdAntwort" VALUES (114, 71, 'fɑːðə', true);
INSERT INTO "tblSdAntwort" VALUES (115, 72, 'bɜːd', true);
INSERT INTO "tblSdAntwort" VALUES (116, 73, 'laŋgə', true);
INSERT INTO "tblSdAntwort" VALUES (117, 74, 'sɪmpəθɪ', true);
INSERT INTO "tblSdAntwort" VALUES (118, 75, 'bʌtn', true);
INSERT INTO "tblSdAntwort" VALUES (119, 76, 'lʌndən', true);
INSERT INTO "tblSdAntwort" VALUES (133, 90, 'raʊndɪd', true);
INSERT INTO "tblSdAntwort" VALUES (134, 91, 'kloʊðz', true);
INSERT INTO "tblSdAntwort" VALUES (135, 92, 'juːnɪvɜːrsɪtɪ', true);
INSERT INTO "tblSdAntwort" VALUES (136, 93, 'mædʒɪk', true);
INSERT INTO "tblSdAntwort" VALUES (137, 94, 'tʌtʃt', true);
INSERT INTO "tblSdAntwort" VALUES (138, 95, 'wɪrd', true);
INSERT INTO "tblSdAntwort" VALUES (139, 96, 'rɪŋɪŋ', true);
INSERT INTO "tblSdAntwort" VALUES (140, 97, 'kɪsɪz', true);
INSERT INTO "tblSdAntwort" VALUES (142, 99, 'bʌtər', true);
INSERT INTO "tblSdAntwort" VALUES (143, 100, 'bʌzd', true);
INSERT INTO "tblSdAntwort" VALUES (120, 77, 'ðəʊ', true);
INSERT INTO "tblSdAntwort" VALUES (121, 78, 'hʌzbənd', true);
INSERT INTO "tblSdAntwort" VALUES (122, 79, 'kwestʃən', true);
INSERT INTO "tblSdAntwort" VALUES (123, 80, 'mʌnθs', true);
INSERT INTO "tblSdAntwort" VALUES (144, 101, 'hɪz', true);
INSERT INTO "tblSdAntwort" VALUES (145, 102, 'sæp', true);
INSERT INTO "tblSdAntwort" VALUES (146, 103, 'zæp', true);
INSERT INTO "tblSdAntwort" VALUES (147, 104, 'ɜːrθ', true);
INSERT INTO "tblSdAntwort" VALUES (148, 105, 'vet', true);
INSERT INTO "tblSdAntwort" VALUES (149, 106, 'smuːð', true);
INSERT INTO "tblSdAntwort" VALUES (150, 107, 'kraɪsɪs', true);
INSERT INTO "tblSdAntwort" VALUES (151, 108, 'fɪkʃən', true);
INSERT INTO "tblSdAntwort" VALUES (152, 109, 'pɑːrk', true);
INSERT INTO "tblSdAntwort" VALUES (153, 110, 'gæs', true);
INSERT INTO "tblSdAntwort" VALUES (154, 111, 'sɪŋər', true);
INSERT INTO "tblSdAntwort" VALUES (155, 112, 'wɪntər', true);
INSERT INTO "tblSdAntwort" VALUES (156, 113, 'hɪlz', true);
INSERT INTO "tblSdAntwort" VALUES (157, 114, 'laʊd', true);
INSERT INTO "tblSdAntwort" VALUES (158, 115, 'dʒɜːrmən', true);
INSERT INTO "tblSdAntwort" VALUES (159, 116, 'sɔːrd', true);
INSERT INTO "tblSdAntwort" VALUES (160, 117, 'loʊð', true);
INSERT INTO "tblSdAntwort" VALUES (161, 118, 'pɑːz', true);
INSERT INTO "tblSdAntwort" VALUES (162, 119, 'bætl', true);
INSERT INTO "tblSdAntwort" VALUES (163, 120, 'mʌg', true);
INSERT INTO "tblSdAntwort" VALUES (164, 121, 'fɑːðər', true);
INSERT INTO "tblSdAntwort" VALUES (165, 122, 'bɜːrd', true);
INSERT INTO "tblSdAntwort" VALUES (166, 123, 'lɑːŋgər', true);
INSERT INTO "tblSdAntwort" VALUES (167, 124, 'sɪmpəθɪ', true);
INSERT INTO "tblSdAntwort" VALUES (168, 125, 'bʌtn', true);
INSERT INTO "tblSdAntwort" VALUES (169, 126, 'wɑːʃɪŋtən', true);
INSERT INTO "tblSdAntwort" VALUES (268, 225, 'dɪsprəpɔːrʃənət', true);
INSERT INTO "tblSdAntwort" VALUES (269, 226, 'kɑːrboʊhaɪdreɪt', true);
INSERT INTO "tblSdAntwort" VALUES (170, 127, 'biːt', true);
INSERT INTO "tblSdAntwort" VALUES (171, 128, 'bɪd', true);
INSERT INTO "tblSdAntwort" VALUES (172, 129, 'nɪə', true);
INSERT INTO "tblSdAntwort" VALUES (288, 245, 'aɪ want tʊ ɑːnsə', true);
INSERT INTO "tblSdAntwort" VALUES (365, 322, 'waɪz', true);
INSERT INTO "tblSdAntwort" VALUES (132, 89, 'glʌv', true);
INSERT INTO "tblSdAntwort" VALUES (96, 53, 'zæp', true);
INSERT INTO "tblSdAntwort" VALUES (261, 218, 'θɪəretɪkl', true);
INSERT INTO "tblSdAntwort" VALUES (97, 54, 'ɜːθ', true);
INSERT INTO "tblSdAntwort" VALUES (98, 55, 'vet', true);
INSERT INTO "tblSdAntwort" VALUES (99, 56, 'smuːð', true);
INSERT INTO "tblSdAntwort" VALUES (100, 57, 'kraɪsɪs', true);
INSERT INTO "tblSdAntwort" VALUES (101, 58, 'fɪkʃn', true);
INSERT INTO "tblSdAntwort" VALUES (102, 59, 'kɑːr endʒɪn', true);
INSERT INTO "tblSdAntwort" VALUES (265, 222, 'kjuːkʌmbər', true);
INSERT INTO "tblSdAntwort" VALUES (266, 223, 'pɑːlɪtɪʃn', true);
INSERT INTO "tblSdAntwort" VALUES (267, 224, 'bæleɪ', true);
INSERT INTO "tblSdAntwort" VALUES (334, 291, 'uː', true);
INSERT INTO "tblSdAntwort" VALUES (192, 149, 'bʊtʃə', true);
INSERT INTO "tblSdAntwort" VALUES (193, 150, 'fand', true);
INSERT INTO "tblSdAntwort" VALUES (194, 151, 'helθ', true);
INSERT INTO "tblSdAntwort" VALUES (290, 247, 'wɪ wə wɔːkɪŋ', true);
INSERT INTO "tblSdAntwort" VALUES (292, 249, 'ðɪs ɪz ən æpl', true);
INSERT INTO "tblSdAntwort" VALUES (356, 313, 'hiːz əz gʊd əz juː', true);
INSERT INTO "tblSdAntwort" VALUES (359, 316, 'wɪr ət hoʊm', true);
INSERT INTO "tblSdAntwort" VALUES (257, 214, 'kəngrætjʊleɪʃənz', true);
INSERT INTO "tblSdAntwort" VALUES (264, 221, 'mɔːrfoʊfəniːmɪks', true);
INSERT INTO "tblSdAntwort" VALUES (316, 273, 'ð', true);
INSERT INTO "tblSdAntwort" VALUES (317, 274, 'w', true);
INSERT INTO "tblSdAntwort" VALUES (234, 191, 'ɪksentrɪk', true);
INSERT INTO "tblSdAntwort" VALUES (305, 262, 'j', true);
INSERT INTO "tblSdAntwort" VALUES (306, 263, 'k', true);
INSERT INTO "tblSdAntwort" VALUES (308, 265, 'f', true);
INSERT INTO "tblSdAntwort" VALUES (309, 266, 'm', true);
INSERT INTO "tblSdAntwort" VALUES (310, 267, 'z', true);
INSERT INTO "tblSdAntwort" VALUES (311, 268, 'dʒ', true);
INSERT INTO "tblSdAntwort" VALUES (312, 269, 'l', true);
INSERT INTO "tblSdAntwort" VALUES (313, 270, 's', true);
INSERT INTO "tblSdAntwort" VALUES (314, 271, 'd', true);
INSERT INTO "tblSdAntwort" VALUES (318, 275, 'v', true);
INSERT INTO "tblSdAntwort" VALUES (319, 276, 't', true);
INSERT INTO "tblSdAntwort" VALUES (320, 277, 'ʒ', true);
INSERT INTO "tblSdAntwort" VALUES (321, 278, 'θ', true);
INSERT INTO "tblSdAntwort" VALUES (363, 320, 'wɑːtər', true);
INSERT INTO "tblSdAntwort" VALUES (364, 321, 'aɪ nəʊ ðət ɪts greɪt', true);
INSERT INTO "tblSdAntwort" VALUES (350, 307, 'ɪts lɑːdʒə ðən laɪf ', true);
INSERT INTO "tblSdAntwort" VALUES (175, 132, 'pɪləʊ', true);
INSERT INTO "tblSdAntwort" VALUES (177, 134, 'keə', true);
INSERT INTO "tblSdAntwort" VALUES (178, 135, 'iːdn', true);
INSERT INTO "tblSdAntwort" VALUES (179, 136, 'dʒuːs', true);
INSERT INTO "tblSdAntwort" VALUES (180, 137, 'səʊldʒə', true);
INSERT INTO "tblSdAntwort" VALUES (124, 81, 'vaɪn', true);
INSERT INTO "tblSdAntwort" VALUES (181, 138, 'vɔɪɪdʒ', true);
INSERT INTO "tblSdAntwort" VALUES (182, 139, 'hed', true);
INSERT INTO "tblSdAntwort" VALUES (183, 140, 'merɪ', true);
INSERT INTO "tblSdAntwort" VALUES (184, 141, 'mærɪ', true);
INSERT INTO "tblSdAntwort" VALUES (185, 142, 'leɪdɪz', true);
INSERT INTO "tblSdAntwort" VALUES (186, 143, 'dʌn', true);
INSERT INTO "tblSdAntwort" VALUES (187, 144, 'pʊə', true);
INSERT INTO "tblSdAntwort" VALUES (188, 145, 'wɜːld', true);
INSERT INTO "tblSdAntwort" VALUES (189, 146, 'kwɔːtə', true);
INSERT INTO "tblSdAntwort" VALUES (190, 147, 'pæt', true);
INSERT INTO "tblSdAntwort" VALUES (191, 148, 'sʌndɪ', true);
INSERT INTO "tblSdAntwort" VALUES (238, 195, 'rɑːzbərɪ', true);
INSERT INTO "tblSdAntwort" VALUES (239, 196, 'mɔːfəʊfəniːmɪks', true);
INSERT INTO "tblSdAntwort" VALUES (240, 197, 'kjuːkʌmbə', true);
INSERT INTO "tblSdAntwort" VALUES (241, 198, 'palɪtɪʃn', true);
INSERT INTO "tblSdAntwort" VALUES (242, 199, 'bæleɪ', true);
INSERT INTO "tblSdAntwort" VALUES (243, 200, 'dɪsprəpɔːʃənət', true);
INSERT INTO "tblSdAntwort" VALUES (244, 201, 'kɑːbəʊhaɪdreɪt', true);
INSERT INTO "tblSdAntwort" VALUES (245, 202, 'əspærəgəs', true);
INSERT INTO "tblSdAntwort" VALUES (246, 203, 'juːfəmɪzm', true);
INSERT INTO "tblSdAntwort" VALUES (247, 204, 'fətagrəfə', true);
INSERT INTO "tblSdAntwort" VALUES (248, 205, 'kəθalɪsɪzm', true);
INSERT INTO "tblSdAntwort" VALUES (249, 206, 'prənʌntsɪeɪʃn', true);
INSERT INTO "tblSdAntwort" VALUES (250, 207, 'dɪmakrəsɪ', true);
INSERT INTO "tblSdAntwort" VALUES (251, 208, 'manəlɪθɪkəlɪ', true);
INSERT INTO "tblSdAntwort" VALUES (252, 209, 'ɪmətɪərɪəl', true);
INSERT INTO "tblSdAntwort" VALUES (253, 210, 'næʃənəlaɪzeɪʃən', true);
INSERT INTO "tblSdAntwort" VALUES (254, 211, 'vəraɪətɪ', true);
INSERT INTO "tblSdAntwort" VALUES (287, 244, 'aɪ want tə gəʊ', true);
INSERT INTO "tblSdAntwort" VALUES (256, 213, 'vaʊəl', true);
INSERT INTO "tblSdAntwort" VALUES (230, 187, 'mɔːgɪdʒ', true);
INSERT INTO "tblSdAntwort" VALUES (196, 153, 'læmp', true);
INSERT INTO "tblSdAntwort" VALUES (197, 154, 'bɔːt', true);
INSERT INTO "tblSdAntwort" VALUES (200, 157, 'kɑːmən', true);
INSERT INTO "tblSdAntwort" VALUES (199, 156, 'kamən', true);
INSERT INTO "tblSdAntwort" VALUES (206, 163, 'pɪloʊ', true);
INSERT INTO "tblSdAntwort" VALUES (202, 159, 'dʒɜːrnɪ', true);
INSERT INTO "tblSdAntwort" VALUES (203, 160, 'biːt', true);
INSERT INTO "tblSdAntwort" VALUES (204, 161, 'bɪd', true);
INSERT INTO "tblSdAntwort" VALUES (205, 162, 'ʌnjən', true);
INSERT INTO "tblSdAntwort" VALUES (207, 164, 'enɪ', true);
INSERT INTO "tblSdAntwort" VALUES (208, 165, 'ker', true);
INSERT INTO "tblSdAntwort" VALUES (209, 166, 'iːdn', true);
INSERT INTO "tblSdAntwort" VALUES (210, 167, 'dʒuːs', true);
INSERT INTO "tblSdAntwort" VALUES (211, 168, 'soʊldʒər', true);
INSERT INTO "tblSdAntwort" VALUES (212, 169, 'vɔɪɪdʒ', true);
INSERT INTO "tblSdAntwort" VALUES (213, 170, 'hed', true);
INSERT INTO "tblSdAntwort" VALUES (214, 171, 'merɪ', true);
INSERT INTO "tblSdAntwort" VALUES (215, 172, 'merɪ', true);
INSERT INTO "tblSdAntwort" VALUES (216, 173, 'leɪdɪz', true);
INSERT INTO "tblSdAntwort" VALUES (217, 174, 'dʌn', true);
INSERT INTO "tblSdAntwort" VALUES (218, 175, 'pʊr', true);
INSERT INTO "tblSdAntwort" VALUES (219, 176, 'wɜːrld', true);
INSERT INTO "tblSdAntwort" VALUES (220, 177, 'kwɔːrtər', true);
INSERT INTO "tblSdAntwort" VALUES (221, 178, 'pæt', true);
INSERT INTO "tblSdAntwort" VALUES (222, 179, 'sʌndɪ', true);
INSERT INTO "tblSdAntwort" VALUES (223, 180, 'bʊtʃər', true);
INSERT INTO "tblSdAntwort" VALUES (224, 181, 'fɑːnd', true);
INSERT INTO "tblSdAntwort" VALUES (225, 182, 'helθ', true);
INSERT INTO "tblSdAntwort" VALUES (226, 183, 'æftər', true);
INSERT INTO "tblSdAntwort" VALUES (227, 184, 'læmp', true);
INSERT INTO "tblSdAntwort" VALUES (307, 264, 'b', true);
INSERT INTO "tblSdAntwort" VALUES (343, 300, 'r', true);
INSERT INTO "tblSdAntwort" VALUES (344, 301, 'aʊ', true);
INSERT INTO "tblSdAntwort" VALUES (345, 302, 'm', true);
INSERT INTO "tblSdAntwort" VALUES (346, 303, 'm', true);
INSERT INTO "tblSdAntwort" VALUES (347, 304, 'n', true);
INSERT INTO "tblSdAntwort" VALUES (348, 305, 'z', true);


--
-- TOC entry 1954 (class 0 OID 179097)
-- Dependencies: 163 1958
-- Data for Name: tblSdFrage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tblSdFrage" VALUES (358, 'Transcribe: <i>I know that it''s great</i>.', 754);
INSERT INTO "tblSdFrage" VALUES (361, 'Transcribe: <i>It''s one of a kind</i>.', 757);
INSERT INTO "tblSdFrage" VALUES (363, 'Transcribe the word <i>water</i>.', 759);
INSERT INTO "tblSdFrage" VALUES (364, 'Transcribe: <i>I know that it''s great</i>.', 760);
INSERT INTO "tblSdFrage" VALUES (352, 'Transcribe: <i>We''re at home</i>.', 748);
INSERT INTO "tblSdFrage" VALUES (355, 'Transcribe: <i>She''s from Germany</i>.', 751);
INSERT INTO "tblSdFrage" VALUES (127, 'Transcribe the word <i>question</i>.', 523);
INSERT INTO "tblSdFrage" VALUES (45, 'Transcribe the word <i>cat</i>.', 441);
INSERT INTO "tblSdFrage" VALUES (129, 'Transcribe the word <i>think</i>.', 525);
INSERT INTO "tblSdFrage" VALUES (46, 'Transcribe the word <i>spin</i>.', 442);
INSERT INTO "tblSdFrage" VALUES (47, 'Transcribe the word <i>game</i>.', 443);
INSERT INTO "tblSdFrage" VALUES (48, 'Transcribe the word <i>method</i>.', 444);
INSERT INTO "tblSdFrage" VALUES (131, 'Transcribe the word <i>vine</i>.', 527);
INSERT INTO "tblSdFrage" VALUES (50, 'Transcribe the word <i>panic</i>.', 446);
INSERT INTO "tblSdFrage" VALUES (51, 'Transcribe the word <i>country</i>.', 447);
INSERT INTO "tblSdFrage" VALUES (52, 'Transcribe the word <i>peanut</i>.', 448);
INSERT INTO "tblSdFrage" VALUES (53, 'Transcribe the word <i>three</i>.', 449);
INSERT INTO "tblSdFrage" VALUES (54, 'Transcribe the word <i>goose</i>.', 450);
INSERT INTO "tblSdFrage" VALUES (55, 'Transcribe the word <i>breathe</i>.', 451);
INSERT INTO "tblSdFrage" VALUES (56, 'Transcribe the word <i>exam</i>.', 452);
INSERT INTO "tblSdFrage" VALUES (57, 'Transcribe the word <i>enough</i>.', 453);
INSERT INTO "tblSdFrage" VALUES (58, 'Transcribe the word <i>voodoo</i>.', 454);
INSERT INTO "tblSdFrage" VALUES (59, 'Transcribe the word <i>quick</i>.', 455);
INSERT INTO "tblSdFrage" VALUES (60, 'Transcribe the word <i>eleven</i>.', 456);
INSERT INTO "tblSdFrage" VALUES (61, 'Transcribe the word <i>repeat</i>.', 457);
INSERT INTO "tblSdFrage" VALUES (62, 'Transcribe the word <i>spew</i>.', 458);
INSERT INTO "tblSdFrage" VALUES (63, 'Transcribe the word <i>young</i>.', 459);
INSERT INTO "tblSdFrage" VALUES (64, 'Transcribe the word <i>bush</i>.', 460);
INSERT INTO "tblSdFrage" VALUES (65, 'Transcribe the word <i>annoy</i>.', 461);
INSERT INTO "tblSdFrage" VALUES (68, 'Transcribe the word <i>text</i>.', 464);
INSERT INTO "tblSdFrage" VALUES (133, 'Transcribe the word <i>rounded</i>.', 529);
INSERT INTO "tblSdFrage" VALUES (69, 'Transcribe the word <i>size</i>.', 465);
INSERT INTO "tblSdFrage" VALUES (70, 'Transcribe the word <i>dull</i>.', 466);
INSERT INTO "tblSdFrage" VALUES (71, 'Transcribe the word <i>cherry</i>.', 467);
INSERT INTO "tblSdFrage" VALUES (72, 'Transcribe the word <i>sheep</i>.', 468);
INSERT INTO "tblSdFrage" VALUES (73, 'Transcribe the word <i>valley</i>.', 469);
INSERT INTO "tblSdFrage" VALUES (74, 'Transcribe the word <i>phonetics</i>.', 470);
INSERT INTO "tblSdFrage" VALUES (135, 'Transcribe the word <i>university</i>.', 531);
INSERT INTO "tblSdFrage" VALUES (80, 'Transcribe the word <i>anger</i>.', 476);
INSERT INTO "tblSdFrage" VALUES (137, 'Transcribe the word <i>touched</i>.', 533);
INSERT INTO "tblSdFrage" VALUES (82, 'Transcribe the word <i>glove</i>.', 478);
INSERT INTO "tblSdFrage" VALUES (83, 'Transcribe the word <i>rounded</i>.', 479);
INSERT INTO "tblSdFrage" VALUES (84, 'Transcribe the word <i>clothes</i>.', 480);
INSERT INTO "tblSdFrage" VALUES (85, 'Transcribe the word <i>university</i>.', 481);
INSERT INTO "tblSdFrage" VALUES (86, 'Transcribe the word <i>magic</i>.', 482);
INSERT INTO "tblSdFrage" VALUES (87, 'Transcribe the word <i>touched</i>.', 483);
INSERT INTO "tblSdFrage" VALUES (88, 'Transcribe the word <i>weird</i>.', 484);
INSERT INTO "tblSdFrage" VALUES (89, 'Transcribe the word <i>ringing</i>.', 485);
INSERT INTO "tblSdFrage" VALUES (90, 'Transcribe the word <i>kisses</i>.', 486);
INSERT INTO "tblSdFrage" VALUES (91, 'Transcribe the word <i>water</i>.', 487);
INSERT INTO "tblSdFrage" VALUES (92, 'Transcribe the word <i>butter</i>.', 488);
INSERT INTO "tblSdFrage" VALUES (139, 'Transcribe the word <i>ringing</i>.', 535);
INSERT INTO "tblSdFrage" VALUES (93, 'Transcribe the word <i>buzzed</i>.', 489);
INSERT INTO "tblSdFrage" VALUES (94, 'Transcribe the word <i>his</i>.', 490);
INSERT INTO "tblSdFrage" VALUES (95, 'Transcribe the word <i>sap</i>.', 491);
INSERT INTO "tblSdFrage" VALUES (96, 'Transcribe the word <i>zap</i>.', 492);
INSERT INTO "tblSdFrage" VALUES (97, 'Transcribe the word <i>earth</i>.', 493);
INSERT INTO "tblSdFrage" VALUES (98, 'Transcribe the word <i>vet</i>.', 494);
INSERT INTO "tblSdFrage" VALUES (99, 'Transcribe the word <i>smooth</i>.', 495);
INSERT INTO "tblSdFrage" VALUES (100, 'Transcribe the word <i>crisis</i>.', 496);
INSERT INTO "tblSdFrage" VALUES (101, 'Transcribe the word <i>fiction</i>.', 497);
INSERT INTO "tblSdFrage" VALUES (102, 'Transcribe the word <i>car engine</i>.', 498);
INSERT INTO "tblSdFrage" VALUES (103, 'Transcribe the word <i>gas</i>.', 499);
INSERT INTO "tblSdFrage" VALUES (104, 'Transcribe the word <i>singer</i>.', 500);
INSERT INTO "tblSdFrage" VALUES (105, 'Transcribe the word <i>winter</i>.', 501);
INSERT INTO "tblSdFrage" VALUES (106, 'Transcribe the word <i>hills</i>.', 502);
INSERT INTO "tblSdFrage" VALUES (107, 'Transcribe the word <i>loud</i>.', 503);
INSERT INTO "tblSdFrage" VALUES (108, 'Transcribe the word <i>German</i>.', 504);
INSERT INTO "tblSdFrage" VALUES (109, 'Transcribe the word <i>sword</i>.', 505);
INSERT INTO "tblSdFrage" VALUES (110, 'Transcribe the word <i>loathe</i>.', 506);
INSERT INTO "tblSdFrage" VALUES (111, 'Transcribe the word <i>pause</i>.', 507);
INSERT INTO "tblSdFrage" VALUES (112, 'Transcribe the word <i>battle</i>.', 508);
INSERT INTO "tblSdFrage" VALUES (113, 'Transcribe the word <i>mug</i>.', 509);
INSERT INTO "tblSdFrage" VALUES (114, 'Transcribe the word <i>father</i>.', 510);
INSERT INTO "tblSdFrage" VALUES (115, 'Transcribe the word <i>bird</i>.', 511);
INSERT INTO "tblSdFrage" VALUES (116, 'Transcribe the word <i>longer</i>.', 512);
INSERT INTO "tblSdFrage" VALUES (117, 'Transcribe the word <i>sympathy</i>.', 513);
INSERT INTO "tblSdFrage" VALUES (118, 'Transcribe the word <i>button</i>.', 514);
INSERT INTO "tblSdFrage" VALUES (119, 'Transcribe the word <i>London</i>.', 515);
INSERT INTO "tblSdFrage" VALUES (124, 'Transcribe the word <i>vine</i>.', 520);
INSERT INTO "tblSdFrage" VALUES (126, 'Transcribe the word <i>husband</i>.', 522);
INSERT INTO "tblSdFrage" VALUES (128, 'Transcribe the word <i>months</i>.', 524);
INSERT INTO "tblSdFrage" VALUES (130, 'Transcribe the word <i>anger</i>.', 526);
INSERT INTO "tblSdFrage" VALUES (132, 'Transcribe the word <i>glove</i>.', 528);
INSERT INTO "tblSdFrage" VALUES (134, 'Transcribe the word <i>clothes</i>.', 530);
INSERT INTO "tblSdFrage" VALUES (136, 'Transcribe the word <i>magic</i>.', 532);
INSERT INTO "tblSdFrage" VALUES (138, 'Transcribe the word <i>weird</i>.', 534);
INSERT INTO "tblSdFrage" VALUES (140, 'Transcribe the word <i>kisses</i>.', 536);
INSERT INTO "tblSdFrage" VALUES (142, 'Transcribe the word <i>butter</i>.', 538);
INSERT INTO "tblSdFrage" VALUES (143, 'Transcribe the word <i>buzzed</i>.', 539);
INSERT INTO "tblSdFrage" VALUES (120, 'Transcribe the word <i>though</i>.', 516);
INSERT INTO "tblSdFrage" VALUES (121, 'Transcribe the word <i>husband</i>.', 517);
INSERT INTO "tblSdFrage" VALUES (122, 'Transcribe the word <i>question</i>.', 518);
INSERT INTO "tblSdFrage" VALUES (123, 'Transcribe the word <i>months</i>.', 519);
INSERT INTO "tblSdFrage" VALUES (144, 'Transcribe the word <i>his</i>.', 540);
INSERT INTO "tblSdFrage" VALUES (145, 'Transcribe the word <i>sap</i>.', 541);
INSERT INTO "tblSdFrage" VALUES (146, 'Transcribe the word <i>zap</i>.', 542);
INSERT INTO "tblSdFrage" VALUES (147, 'Transcribe the word <i>earth</i>.', 543);
INSERT INTO "tblSdFrage" VALUES (148, 'Transcribe the word <i>vet</i>.', 544);
INSERT INTO "tblSdFrage" VALUES (149, 'Transcribe the word <i>smooth</i>.', 545);
INSERT INTO "tblSdFrage" VALUES (150, 'Transcribe the word <i>crisis</i>.', 546);
INSERT INTO "tblSdFrage" VALUES (151, 'Transcribe the word <i>fiction</i>.', 547);
INSERT INTO "tblSdFrage" VALUES (152, 'Transcribe the word <i>park</i>.', 548);
INSERT INTO "tblSdFrage" VALUES (153, 'Transcribe the word <i>gas</i>.', 549);
INSERT INTO "tblSdFrage" VALUES (154, 'Transcribe the word <i>singer</i>.', 550);
INSERT INTO "tblSdFrage" VALUES (155, 'Transcribe the word <i>winter</i>.', 551);
INSERT INTO "tblSdFrage" VALUES (156, 'Transcribe the word <i>hills</i>.', 552);
INSERT INTO "tblSdFrage" VALUES (157, 'Transcribe the word <i>loud</i>.', 553);
INSERT INTO "tblSdFrage" VALUES (158, 'Transcribe the word <i>German</i>.', 554);
INSERT INTO "tblSdFrage" VALUES (159, 'Transcribe the word <i>sword</i>.', 555);
INSERT INTO "tblSdFrage" VALUES (160, 'Transcribe the word <i>loathe</i>.', 556);
INSERT INTO "tblSdFrage" VALUES (161, 'Transcribe the word <i>pause</i>.', 557);
INSERT INTO "tblSdFrage" VALUES (162, 'Transcribe the word <i>battle</i>.', 558);
INSERT INTO "tblSdFrage" VALUES (163, 'Transcribe the word <i>mug</i>.', 559);
INSERT INTO "tblSdFrage" VALUES (164, 'Transcribe the word <i>father</i>.', 560);
INSERT INTO "tblSdFrage" VALUES (165, 'Transcribe the word <i>bird</i>.', 561);
INSERT INTO "tblSdFrage" VALUES (166, 'Transcribe the word <i>longer</i>.', 562);
INSERT INTO "tblSdFrage" VALUES (167, 'Transcribe the word <i>sympathy</i>.', 563);
INSERT INTO "tblSdFrage" VALUES (168, 'Transcribe the word <i>button</i>.', 564);
INSERT INTO "tblSdFrage" VALUES (169, 'Transcribe the word <i>Washington</i>.', 565);
INSERT INTO "tblSdFrage" VALUES (349, 'Transcribe: <i>He''s as good as you</i>.', 745);
INSERT INTO "tblSdFrage" VALUES (170, 'Transcribe the word <i>beat</i>.', 566);
INSERT INTO "tblSdFrage" VALUES (171, 'Transcribe the word <i>bid</i>.', 567);
INSERT INTO "tblSdFrage" VALUES (172, 'Transcribe the word <i>near</i>.', 568);
INSERT INTO "tblSdFrage" VALUES (173, 'Transcribe the word <i>journey</i>.', 569);
INSERT INTO "tblSdFrage" VALUES (174, 'Transcribe the word <i>onion</i>.', 570);
INSERT INTO "tblSdFrage" VALUES (175, 'Transcribe the word <i>pillow</i>.', 571);
INSERT INTO "tblSdFrage" VALUES (176, 'Transcribe the word <i>any</i>.', 572);
INSERT INTO "tblSdFrage" VALUES (177, 'Transcribe the word <i>care</i>.', 573);
INSERT INTO "tblSdFrage" VALUES (178, 'Transcribe the word <i>Eden</i>.', 574);
INSERT INTO "tblSdFrage" VALUES (179, 'Transcribe the word <i>juice</i>.', 575);
INSERT INTO "tblSdFrage" VALUES (180, 'Transcribe the word <i>soldier</i>.', 576);
INSERT INTO "tblSdFrage" VALUES (181, 'Transcribe the word <i>voyage</i>.', 577);
INSERT INTO "tblSdFrage" VALUES (182, 'Transcribe the word <i>head</i>.', 578);
INSERT INTO "tblSdFrage" VALUES (183, 'Transcribe the word <i>merry</i>.', 579);
INSERT INTO "tblSdFrage" VALUES (184, 'Transcribe the word <i>marry</i>.', 580);
INSERT INTO "tblSdFrage" VALUES (185, 'Transcribe the word <i>ladies</i>.', 581);
INSERT INTO "tblSdFrage" VALUES (186, 'Transcribe the word <i>done</i>.', 582);
INSERT INTO "tblSdFrage" VALUES (187, 'Transcribe the word <i>poor</i>.', 583);
INSERT INTO "tblSdFrage" VALUES (188, 'Transcribe the word <i>world</i>.', 584);
INSERT INTO "tblSdFrage" VALUES (189, 'Transcribe the word <i>quarter</i>.', 585);
INSERT INTO "tblSdFrage" VALUES (190, 'Transcribe the word <i>pat</i>.', 586);
INSERT INTO "tblSdFrage" VALUES (191, 'Transcribe the word <i>Sunday</i>.', 587);
INSERT INTO "tblSdFrage" VALUES (192, 'Transcribe the word <i>butcher</i>.', 588);
INSERT INTO "tblSdFrage" VALUES (193, 'Transcribe the word <i>fond</i>.', 589);
INSERT INTO "tblSdFrage" VALUES (194, 'Transcribe the word <i>health</i>.', 590);
INSERT INTO "tblSdFrage" VALUES (195, 'Transcribe the word <i>after</i>.', 591);
INSERT INTO "tblSdFrage" VALUES (196, 'Transcribe the word <i>lamp</i>.', 592);
INSERT INTO "tblSdFrage" VALUES (197, 'Transcribe the word <i>bought</i>.', 593);
INSERT INTO "tblSdFrage" VALUES (200, 'Transcribe the word <i>common</i>.', 596);
INSERT INTO "tblSdFrage" VALUES (199, 'Transcribe the word <i>common</i>.', 595);
INSERT INTO "tblSdFrage" VALUES (206, 'Transcribe the word <i>pillow</i>.', 602);
INSERT INTO "tblSdFrage" VALUES (201, 'Transcribe the word <i>near</i>.', 597);
INSERT INTO "tblSdFrage" VALUES (202, 'Transcribe the word <i>journey</i>.', 598);
INSERT INTO "tblSdFrage" VALUES (203, 'Transcribe the word <i>beat</i>.', 599);
INSERT INTO "tblSdFrage" VALUES (204, 'Transcribe the word <i>bid</i>.', 600);
INSERT INTO "tblSdFrage" VALUES (205, 'Transcribe the word <i>onion</i>.', 601);
INSERT INTO "tblSdFrage" VALUES (207, 'Transcribe the word <i>any</i>.', 603);
INSERT INTO "tblSdFrage" VALUES (208, 'Transcribe the word <i>care</i>.', 604);
INSERT INTO "tblSdFrage" VALUES (209, 'Transcribe the word <i>Eden</i>.', 605);
INSERT INTO "tblSdFrage" VALUES (210, 'Transcribe the word <i>juice</i>.', 606);
INSERT INTO "tblSdFrage" VALUES (211, 'Transcribe the word <i>soldier</i>.', 607);
INSERT INTO "tblSdFrage" VALUES (212, 'Transcribe the word <i>voyage</i>.', 608);
INSERT INTO "tblSdFrage" VALUES (213, 'Transcribe the word <i>head</i>.', 609);
INSERT INTO "tblSdFrage" VALUES (214, 'Transcribe the word <i>merry</i>.', 610);
INSERT INTO "tblSdFrage" VALUES (215, 'Transcribe the word <i>marry</i>.', 611);
INSERT INTO "tblSdFrage" VALUES (216, 'Transcribe the word <i>ladies</i>.', 612);
INSERT INTO "tblSdFrage" VALUES (217, 'Transcribe the word <i>done</i>.', 613);
INSERT INTO "tblSdFrage" VALUES (218, 'Transcribe the word <i>poor</i>.', 614);
INSERT INTO "tblSdFrage" VALUES (219, 'Transcribe the word <i>world</i>.', 615);
INSERT INTO "tblSdFrage" VALUES (220, 'Transcribe the word <i>quarter</i>.', 616);
INSERT INTO "tblSdFrage" VALUES (221, 'Transcribe the word <i>pat</i>.', 617);
INSERT INTO "tblSdFrage" VALUES (222, 'Transcribe the word <i>Sunday</i>.', 618);
INSERT INTO "tblSdFrage" VALUES (223, 'Transcribe the word <i>butcher</i>.', 619);
INSERT INTO "tblSdFrage" VALUES (224, 'Transcribe the word <i>fond</i>.', 620);
INSERT INTO "tblSdFrage" VALUES (225, 'Transcribe the word <i>health</i>.', 621);
INSERT INTO "tblSdFrage" VALUES (226, 'Transcribe the word <i>after</i>.', 622);
INSERT INTO "tblSdFrage" VALUES (227, 'Transcribe the word <i>lamp</i>.', 623);
INSERT INTO "tblSdFrage" VALUES (228, 'Transcribe the word <i>bought</i>.', 624);
INSERT INTO "tblSdFrage" VALUES (281, 'Transcribe: <i>This is an apple</i>.', 677);
INSERT INTO "tblSdFrage" VALUES (282, 'Transcribe: <i>This is the city</i>.', 678);
INSERT INTO "tblSdFrage" VALUES (231, 'Transcribe the word <i>vowel</i>.', 627);
INSERT INTO "tblSdFrage" VALUES (229, 'Transcribe the word <i>sausage</i>.', 625);
INSERT INTO "tblSdFrage" VALUES (232, 'Transcribe the word <i>unfortunately</i>.', 628);
INSERT INTO "tblSdFrage" VALUES (233, 'Transcribe the word <i>millionaire</i>.', 629);
INSERT INTO "tblSdFrage" VALUES (235, 'Transcribe the word <i>psychology</i>.', 631);
INSERT INTO "tblSdFrage" VALUES (236, 'Transcribe the word <i>theoretical</i>.', 632);
INSERT INTO "tblSdFrage" VALUES (237, 'Transcribe the word <i>congratulations</i>.', 633);
INSERT INTO "tblSdFrage" VALUES (238, 'Transcribe the word <i>raspberry</i>.', 634);
INSERT INTO "tblSdFrage" VALUES (239, 'Transcribe the word <i>morphophonemics</i>.', 635);
INSERT INTO "tblSdFrage" VALUES (240, 'Transcribe the word <i>cucumber</i>.', 636);
INSERT INTO "tblSdFrage" VALUES (241, 'Transcribe the word <i>politician</i>.', 637);
INSERT INTO "tblSdFrage" VALUES (242, 'Transcribe the word <i>ballet</i>.', 638);
INSERT INTO "tblSdFrage" VALUES (243, 'Transcribe the word <i>disproportionate</i>.', 639);
INSERT INTO "tblSdFrage" VALUES (244, 'Transcribe the word <i>carbohydrate</i>.', 640);
INSERT INTO "tblSdFrage" VALUES (245, 'Transcribe the word <i>asparagus</i>.', 641);
INSERT INTO "tblSdFrage" VALUES (246, 'Transcribe the word <i>euphemism</i>.', 642);
INSERT INTO "tblSdFrage" VALUES (247, 'Transcribe the word <i>photographer</i>.', 643);
INSERT INTO "tblSdFrage" VALUES (248, 'Transcribe the word <i>Catholicism</i>.', 644);
INSERT INTO "tblSdFrage" VALUES (249, 'Transcribe the word <i>pronunciation</i>.', 645);
INSERT INTO "tblSdFrage" VALUES (250, 'Transcribe the word <i>democracy</i>.', 646);
INSERT INTO "tblSdFrage" VALUES (251, 'Transcribe the word <i>monolithically</i>.', 647);
INSERT INTO "tblSdFrage" VALUES (252, 'Transcribe the word <i>immaterial</i>.', 648);
INSERT INTO "tblSdFrage" VALUES (253, 'Transcribe the word <i>nationalisation</i>.', 649);
INSERT INTO "tblSdFrage" VALUES (254, 'Transcribe the word <i>variety</i>.', 650);
INSERT INTO "tblSdFrage" VALUES (283, 'Transcribe: <i>I like Bill and Ann</i>.', 679);
INSERT INTO "tblSdFrage" VALUES (362, 'Transcribe the word <i>mortgage</i>.', 758);
INSERT INTO "tblSdFrage" VALUES (256, 'Transcribe the word <i>vowel</i>.', 652);
INSERT INTO "tblSdFrage" VALUES (284, 'Transcribe: <i>I know that</i>.', 680);
INSERT INTO "tblSdFrage" VALUES (230, 'Transcribe the word <i>mortgage</i>.', 626);
INSERT INTO "tblSdFrage" VALUES (258, 'Transcribe the word <i>unfortunately</i>.', 654);
INSERT INTO "tblSdFrage" VALUES (259, 'Transcribe the word <i>eccentric</i>.', 655);
INSERT INTO "tblSdFrage" VALUES (260, 'Transcribe the word <i>psychology</i>.', 656);
INSERT INTO "tblSdFrage" VALUES (261, 'Transcribe the word <i>theoretical</i>.', 657);
INSERT INTO "tblSdFrage" VALUES (303, 'Transcribe the word <i>congratulations</i>.', 699);
INSERT INTO "tblSdFrage" VALUES (257, 'Transcribe the word <i>congratulations</i>.', 653);
INSERT INTO "tblSdFrage" VALUES (263, 'Transcribe the word <i>raspberry</i>.', 659);
INSERT INTO "tblSdFrage" VALUES (264, 'Transcribe the word <i>morphophonemics</i>.', 660);
INSERT INTO "tblSdFrage" VALUES (265, 'Transcribe the word <i>cucumber</i>.', 661);
INSERT INTO "tblSdFrage" VALUES (266, 'Transcribe the word <i>politician</i>.', 662);
INSERT INTO "tblSdFrage" VALUES (267, 'Transcribe the word <i>ballet</i>.', 663);
INSERT INTO "tblSdFrage" VALUES (268, 'Transcribe the word <i>disproportionate</i>.', 664);
INSERT INTO "tblSdFrage" VALUES (269, 'Transcribe the word <i>carbohydrate</i>.', 665);
INSERT INTO "tblSdFrage" VALUES (270, 'Transcribe the word <i>asparagus</i>.', 666);
INSERT INTO "tblSdFrage" VALUES (271, 'Transcribe the word <i>euphemism</i>.', 667);
INSERT INTO "tblSdFrage" VALUES (272, 'Transcribe the word <i>photographer</i>.', 668);
INSERT INTO "tblSdFrage" VALUES (273, 'Transcribe the word <i>Catholicism</i>.', 669);
INSERT INTO "tblSdFrage" VALUES (274, 'Transcribe the word <i>pronunciation</i>.', 670);
INSERT INTO "tblSdFrage" VALUES (275, 'Transcribe the word <i>democracy</i>.', 671);
INSERT INTO "tblSdFrage" VALUES (276, 'Transcribe the word <i>monolithically</i>.', 672);
INSERT INTO "tblSdFrage" VALUES (277, 'Transcribe the word <i>immaterial</i>.', 673);
INSERT INTO "tblSdFrage" VALUES (278, 'Transcribe the word <i>nationalization</i>.', 674);
INSERT INTO "tblSdFrage" VALUES (279, 'Transcribe the word <i>variety</i>.', 675);
INSERT INTO "tblSdFrage" VALUES (285, 'Transcribe: <i>I like them</i>.', 681);
INSERT INTO "tblSdFrage" VALUES (286, 'Transcribe: <i>This is for Jim</i>.', 682);
INSERT INTO "tblSdFrage" VALUES (287, 'Transcribe: <i>I want to go</i>.', 683);
INSERT INTO "tblSdFrage" VALUES (288, 'Transcribe: <i>I want to answer</i>.', 684);
INSERT INTO "tblSdFrage" VALUES (289, 'Transcribe: <i>I was lost</i>.', 685);
INSERT INTO "tblSdFrage" VALUES (290, 'Transcribe: <i>We were walking</i>.', 686);
INSERT INTO "tblSdFrage" VALUES (356, 'Transcribe: <i>He''s as good as you</i>.', 752);
INSERT INTO "tblSdFrage" VALUES (292, 'Transcribe: <i>This is an apple</i>.', 688);
INSERT INTO "tblSdFrage" VALUES (293, 'Transcribe: <i>This is the city</i>.', 689);
INSERT INTO "tblSdFrage" VALUES (294, 'Transcribe: <i>I like Bill and Ann</i>.', 690);
INSERT INTO "tblSdFrage" VALUES (295, 'Transcribe: <i>I know that</i>.', 691);
INSERT INTO "tblSdFrage" VALUES (296, 'Transcribe: <i>I like them</i>.', 692);
INSERT INTO "tblSdFrage" VALUES (297, 'Transcribe: <i>This is for Jim</i>.', 693);
INSERT INTO "tblSdFrage" VALUES (298, 'Transcribe: <i>I want to go</i>.', 694);
INSERT INTO "tblSdFrage" VALUES (299, 'Transcribe: <i>I want to answer</i>.', 695);
INSERT INTO "tblSdFrage" VALUES (300, 'Transcribe: <i>I was lost</i>.', 696);
INSERT INTO "tblSdFrage" VALUES (301, 'Transcribe: <i>We were walking</i>.', 697);
INSERT INTO "tblSdFrage" VALUES (302, 'Transcribe: <i>You can do it</i>.', 698);
INSERT INTO "tblSdFrage" VALUES (359, 'Transcribe: <i>We''re at home</i>.', 755);
INSERT INTO "tblSdFrage" VALUES (291, 'Transcribe: <i>You can do it</i>.', 687);
INSERT INTO "tblSdFrage" VALUES (234, 'Transcribe the word <i>eccentric</i>.', 630);
INSERT INTO "tblSdFrage" VALUES (350, 'Transcribe: <i>It''s larger than life</i>.', 746);
INSERT INTO "tblSdFrage" VALUES (304, 'What is the first sound in <i>pint</i>?', 700);
INSERT INTO "tblSdFrage" VALUES (305, 'What is the first sound in <i>year</i>?', 701);
INSERT INTO "tblSdFrage" VALUES (306, 'What is the last sound in <i>picnic</i>?', 702);
INSERT INTO "tblSdFrage" VALUES (365, 'Transcribe the word <i>wise</i>.', 761);
INSERT INTO "tblSdFrage" VALUES (309, 'What is the first sound in <i>mother</i>?', 705);
INSERT INTO "tblSdFrage" VALUES (310, 'What is the consonant in <i>easy</i>?', 706);
INSERT INTO "tblSdFrage" VALUES (311, 'What is the first (double) sound in <i>jungle</i>?', 707);
INSERT INTO "tblSdFrage" VALUES (312, 'What is the last sound in <i>bottle</i>?', 708);
INSERT INTO "tblSdFrage" VALUES (313, 'What is the second consonant in <i>fussy</i>?', 709);
INSERT INTO "tblSdFrage" VALUES (314, 'What is the first sound in <i>doom</i>?', 710);
INSERT INTO "tblSdFrage" VALUES (315, 'What is the last sound in <i>sing</i>?', 711);
INSERT INTO "tblSdFrage" VALUES (316, 'What is the first sound in <i>this</i>?', 712);
INSERT INTO "tblSdFrage" VALUES (317, 'What is the first consonant in <i>awake</i>?', 713);
INSERT INTO "tblSdFrage" VALUES (318, 'What is the second consonant in <i>adventure</i>?', 714);
INSERT INTO "tblSdFrage" VALUES (319, 'What is the last sound in <i>right</i>?', 715);
INSERT INTO "tblSdFrage" VALUES (320, 'What is the first sound in <i>genre</i>?', 716);
INSERT INTO "tblSdFrage" VALUES (321, 'What is the first consonant in <i>author</i>?', 717);
INSERT INTO "tblSdFrage" VALUES (322, 'What is the first sound in <i>giggle</i>?', 718);
INSERT INTO "tblSdFrage" VALUES (323, 'What is the first sound in <i>house</i>?', 719);
INSERT INTO "tblSdFrage" VALUES (324, 'What is the middle sound in <i>any</i>?', 720);
INSERT INTO "tblSdFrage" VALUES (325, 'What is the last sound in <i>ash</i>?', 721);
INSERT INTO "tblSdFrage" VALUES (326, 'What is the second consonant in <i>through</i>?', 722);
INSERT INTO "tblSdFrage" VALUES (327, 'What is the vowel in <i>far</i>?', 723);
INSERT INTO "tblSdFrage" VALUES (328, 'What is the vowel in <i>knit</i>?', 724);
INSERT INTO "tblSdFrage" VALUES (329, 'What is the first sound in <i>alive</i>?', 725);
INSERT INTO "tblSdFrage" VALUES (330, 'What is the vowel in <i>bird</i>?', 726);
INSERT INTO "tblSdFrage" VALUES (331, 'What is the vowel in <i>kettle</i>?', 727);
INSERT INTO "tblSdFrage" VALUES (332, 'What is the first sound in <i>up</i>?', 728);
INSERT INTO "tblSdFrage" VALUES (333, 'What is the vowel in <i>house</i>?', 729);
INSERT INTO "tblSdFrage" VALUES (334, 'What is the last sound in <i>zoo</i>?', 730);
INSERT INTO "tblSdFrage" VALUES (335, 'What is the vowel in <i>court</i>?', 731);
INSERT INTO "tblSdFrage" VALUES (336, 'What is the last sound in <i>hay</i>?', 732);
INSERT INTO "tblSdFrage" VALUES (337, 'What is the vowel in <i>choice</i>?', 733);
INSERT INTO "tblSdFrage" VALUES (338, 'What is the vowel in <i>choice</i>?', 734);
INSERT INTO "tblSdFrage" VALUES (339, 'What is the vowel in <i>good</i>?', 735);
INSERT INTO "tblSdFrage" VALUES (340, 'What is the vowel in <i>price</i>?', 736);
INSERT INTO "tblSdFrage" VALUES (341, 'What is the vowel in <i>bee</i>?', 737);
INSERT INTO "tblSdFrage" VALUES (342, 'What is the vowel in <i>bank</i>?', 738);
INSERT INTO "tblSdFrage" VALUES (343, 'What is the first sound in <i>write</i>?', 739);
INSERT INTO "tblSdFrage" VALUES (344, 'What is the first sound in <i>hour</i>?', 740);
INSERT INTO "tblSdFrage" VALUES (345, 'What is the second consonant in <i>calm</i>?', 741);
INSERT INTO "tblSdFrage" VALUES (346, 'What is the last sound in <i>climb</i>?', 742);
INSERT INTO "tblSdFrage" VALUES (347, 'What is the first sound in <i>knight</i>?', 743);
INSERT INTO "tblSdFrage" VALUES (348, 'What is the third consonant in <i>president</i>?', 744);
INSERT INTO "tblSdFrage" VALUES (354, 'Transcribe: <i>It''s one of a kind</i>.', 750);
INSERT INTO "tblSdFrage" VALUES (357, 'Transcribe: <i>It''s larger than life</i>.', 753);
INSERT INTO "tblSdFrage" VALUES (360, 'Transcribe: <i>She''s from Germany</i>.', 756);
INSERT INTO "tblSdFrage" VALUES (307, 'What is the second consonant in <i>lobby</i>?', 703);
INSERT INTO "tblSdFrage" VALUES (308, 'What is the last sound in <i>calf</i>', 704);


--
-- TOC entry 1955 (class 0 OID 179105)
-- Dependencies: 164 1958
-- Data for Name: tblSdLektion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tblSdLektion" VALUES (1, 'Lesson 1', 'Sounds and symbols', 0);
INSERT INTO "tblSdLektion" VALUES (2, 'Lesson 2', 'Transcribing words beginners'' level', 1);
INSERT INTO "tblSdLektion" VALUES (3, 'Lesson 3', '3a: Consonant troubles (British)', 2);
INSERT INTO "tblSdLektion" VALUES (4, 'Lesson 4', '3b: Consonant troubles (American)', 3);
INSERT INTO "tblSdLektion" VALUES (6, 'Lesson 6', '4b: Vowel troubles (American)', 5);
INSERT INTO "tblSdLektion" VALUES (7, 'Lesson 7', '5a: Transcribing words advanved level (British)', 6);
INSERT INTO "tblSdLektion" VALUES (5, 'Lesson 5', '4a: Vowel troubles (British)', 4);
INSERT INTO "tblSdLektion" VALUES (8, 'Lesson 8', '5b: Transcribing words advanced level (American)', 7);
INSERT INTO "tblSdLektion" VALUES (9, 'Lesson 9', '6a: Transcribing short sentences (British)', 8);
INSERT INTO "tblSdLektion" VALUES (10, 'Lesson 10', '6b: Transcribing short sentences (American)', 9);
INSERT INTO "tblSdLektion" VALUES (11, 'Test', 'Durch automatischen Text erzeugte Lektion', 2001);
INSERT INTO "tblSdLektion" VALUES (12, 'Test', 'Durch automatischen Text erzeugte Lektion', 2001);
INSERT INTO "tblSdLektion" VALUES (13, 'Test', 'Durch automatischen Text erzeugte Lektion', 2001);
INSERT INTO "tblSdLektion" VALUES (14, 'Test', 'Durch automatischen Text erzeugte Lektion', 2001);
INSERT INTO "tblSdLektion" VALUES (15, 'Test', 'Durch automatischen Text erzeugte Lektion', 2001);
INSERT INTO "tblSdLektion" VALUES (16, 'Test', 'Durch automatischen Text erzeugte Lektion', 2001);
INSERT INTO "tblSdLektion" VALUES (17, 'Test', 'Durch automatischen Text erzeugte Lektion', 2001);
INSERT INTO "tblSdLektion" VALUES (19, 'Test222', 'Durch automatischen Text geänderte Lektion', -2001);


--
-- TOC entry 1956 (class 0 OID 179113)
-- Dependencies: 165 1958
-- Data for Name: tblSdLektionXFrage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tblSdLektionXFrage" VALUES (9, 350, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 352, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 354, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 356, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 358, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 360, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 362, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 363, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 364, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 124, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 45, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 46, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 47, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 48, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 126, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 50, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 51, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 52, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 53, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 54, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 55, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 56, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 57, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 58, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 59, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 60, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 61, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 62, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 63, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 64, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 65, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 68, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 69, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 70, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 71, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 72, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 73, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 74, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 127, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 128, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 129, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 80, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 130, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 82, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 83, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 84, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 85, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 86, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 87, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 88, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 89, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 90, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 91, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 92, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 93, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 94, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 95, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 96, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 97, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 98, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 99, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 100, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 101, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 102, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 103, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 104, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 105, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 106, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 107, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 108, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 109, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 110, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 111, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 112, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 113, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 114, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 115, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 116, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 117, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 118, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 119, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 131, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 132, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 133, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 134, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 135, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 136, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 120, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 121, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 122, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (3, 123, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 137, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 138, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 139, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 140, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 142, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 143, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 144, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 145, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 146, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 147, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 148, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 149, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 150, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 151, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 152, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 153, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 154, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 155, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 156, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 157, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 158, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 159, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 160, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 161, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 162, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 163, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 164, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 165, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 166, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 167, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 168, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (4, 169, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 170, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 171, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 172, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 173, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 174, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 175, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 176, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 177, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 178, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 179, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 180, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 181, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 182, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 183, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 184, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 185, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 186, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 187, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 188, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 189, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 190, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 191, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 192, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 193, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 194, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 195, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 196, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 197, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 206, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (5, 199, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 200, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 201, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 202, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 203, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 204, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 205, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 207, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 208, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 209, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 210, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 211, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 212, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 213, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 214, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 215, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 216, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 217, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 218, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 219, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 220, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 221, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 222, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 223, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 224, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 225, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 226, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 227, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 228, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (6, 229, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 230, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 231, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 232, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 233, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 234, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 235, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 236, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 237, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 238, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 239, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 240, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 241, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 242, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 243, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 244, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 245, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 246, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 247, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 248, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 249, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 250, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 251, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 252, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 253, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (7, 254, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (2, 365, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 256, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 257, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 258, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 259, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 260, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 261, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 349, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 263, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 264, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 265, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 266, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 267, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 268, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 269, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 270, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 271, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 272, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 273, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 274, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 275, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 276, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 277, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 278, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 279, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 281, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 282, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 283, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 284, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 285, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 286, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 287, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 288, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 289, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 290, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 291, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 292, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 293, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 294, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 295, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 296, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 297, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 298, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 299, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 300, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 301, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 302, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (9, 355, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (8, 303, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 357, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 304, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 305, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 306, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 307, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 308, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 309, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 310, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 311, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 312, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 313, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 314, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 315, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 316, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 317, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 318, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 319, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 320, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 321, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 322, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 323, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 324, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 325, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 326, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 327, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 328, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 329, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 330, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 331, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 332, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 333, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 334, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 335, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 336, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 337, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 338, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 339, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 340, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 341, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 342, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 343, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 344, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 345, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 346, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 347, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (1, 348, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 359, 0);
INSERT INTO "tblSdLektionXFrage" VALUES (10, 361, 0);


--
-- TOC entry 1847 (class 2606 OID 179170)
-- Dependencies: 166 166 1959
-- Name: pkey_AppInfo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tblAppInfo"
    ADD CONSTRAINT "pkey_AppInfo" PRIMARY KEY ("strAppInfoVersion");


--
-- TOC entry 1836 (class 2606 OID 179172)
-- Dependencies: 163 163 1959
-- Name: pkey_Frage; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tblSdFrage"
    ADD CONSTRAINT "pkey_Frage" PRIMARY KEY ("lngFrageID");


--
-- TOC entry 1831 (class 1259 OID 179119)
-- Dependencies: 162 1959
-- Name: lngantwortid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "lngantwortid_idx" ON "tblSdAntwort" USING "btree" ("lngAntwortID");


--
-- TOC entry 1841 (class 1259 OID 179120)
-- Dependencies: 165 1959
-- Name: lngfrageid1_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "lngfrageid1_idx" ON "tblSdLektionXFrage" USING "btree" ("lngFrageID");


--
-- TOC entry 1832 (class 1259 OID 179121)
-- Dependencies: 162 1959
-- Name: lngfrageid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "lngfrageid_idx" ON "tblSdAntwort" USING "btree" ("lngFrageID");


--
-- TOC entry 1842 (class 1259 OID 179122)
-- Dependencies: 165 1959
-- Name: lnglektionid1_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "lnglektionid1_idx" ON "tblSdLektionXFrage" USING "btree" ("lngLektionID");


--
-- TOC entry 1839 (class 1259 OID 179123)
-- Dependencies: 164 1959
-- Name: lnglektionid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "lnglektionid_idx" ON "tblSdLektion" USING "btree" ("lngLektionID");


--
-- TOC entry 1837 (class 1259 OID 179124)
-- Dependencies: 163 1959
-- Name: primarykey1_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "primarykey1_idx" ON "tblSdFrage" USING "btree" ("lngFrageID");


--
-- TOC entry 1840 (class 1259 OID 179125)
-- Dependencies: 164 1959
-- Name: primarykey2_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "primarykey2_idx" ON "tblSdLektion" USING "btree" ("lngLektionID");


--
-- TOC entry 1843 (class 1259 OID 179126)
-- Dependencies: 165 165 1959
-- Name: primarykey3_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "primarykey3_idx" ON "tblSdLektionXFrage" USING "btree" ("lngLektionID", "lngFrageID");


--
-- TOC entry 1833 (class 1259 OID 179127)
-- Dependencies: 162 162 1959
-- Name: primarykey_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "primarykey_idx" ON "tblSdAntwort" USING "btree" ("lngFrageID", "lngAntwortID");


--
-- TOC entry 1838 (class 1259 OID 179128)
-- Dependencies: 163 1959
-- Name: tblfrageid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "tblfrageid_idx" ON "tblSdFrage" USING "btree" ("lngFrageID");


--
-- TOC entry 1834 (class 1259 OID 179129)
-- Dependencies: 162 1959
-- Name: tblsdfragetblsdantwort_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "tblsdfragetblsdantwort_idx" ON "tblSdAntwort" USING "btree" ("lngFrageID");


--
-- TOC entry 1844 (class 1259 OID 179130)
-- Dependencies: 165 1959
-- Name: tblsdfragetblsdlektionxfrage_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "tblsdfragetblsdlektionxfrage_id" ON "tblSdLektionXFrage" USING "btree" ("lngFrageID");


--
-- TOC entry 1845 (class 1259 OID 179131)
-- Dependencies: 165 1959
-- Name: tblsdlektiontblsdlektionxfrage_; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "tblsdlektiontblsdlektionxfrage_" ON "tblSdLektionXFrage" USING "btree" ("lngLektionID");


--
-- TOC entry 1848 (class 2606 OID 179132)
-- Dependencies: 162 163 1837 1959
-- Name: reftblsdfragetotblsdantwort; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "tblSdAntwort"
    ADD CONSTRAINT "reftblsdfragetotblsdantwort" FOREIGN KEY ("lngFrageID") REFERENCES "tblSdFrage"("lngFrageID");


--
-- TOC entry 1849 (class 2606 OID 179137)
-- Dependencies: 1837 165 163 1959
-- Name: reftblsdfragetotblsdlektionxfra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "tblSdLektionXFrage"
    ADD CONSTRAINT "reftblsdfragetotblsdlektionxfra" FOREIGN KEY ("lngFrageID") REFERENCES "tblSdFrage"("lngFrageID");


--
-- TOC entry 1850 (class 2606 OID 179142)
-- Dependencies: 164 1840 165 1959
-- Name: reftblsdlektiontotblsdlektionxf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "tblSdLektionXFrage"
    ADD CONSTRAINT "reftblsdlektiontotblsdlektionxf" FOREIGN KEY ("lngLektionID") REFERENCES "tblSdLektion"("lngLektionID");


--
-- TOC entry 1964 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA "public" FROM PUBLIC;
REVOKE ALL ON SCHEMA "public" FROM "postgres";
GRANT ALL ON SCHEMA "public" TO "postgres";
GRANT ALL ON SCHEMA "public" TO PUBLIC;


--
-- TOC entry 1966 (class 0 OID 0)
-- Dependencies: 179
-- Name: plpgsql_call_handler(); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION "plpgsql_call_handler"() FROM PUBLIC;
REVOKE ALL ON FUNCTION "plpgsql_call_handler"() FROM "postgres";
GRANT ALL ON FUNCTION "plpgsql_call_handler"() TO PUBLIC;


-- Completed on 2015-01-06 19:52:45 CET

--
-- PostgreSQL database dump complete
--

