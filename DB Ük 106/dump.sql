--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg22.04+1)

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
-- Name: soccer; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA soccer;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asst_referee_mast; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.asst_referee_mast (
    ass_ref_id numeric(6,1) NOT NULL,
    ass_ref_name character varying(24) DEFAULT NULL::character varying,
    id_country numeric(5,1) DEFAULT NULL::numeric
);


--
-- Name: coach_mast; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.coach_mast (
    coach_id numeric(5,1) NOT NULL,
    coach_name character varying(19) DEFAULT NULL::character varying
);


--
-- Name: goal_details; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.goal_details (
    goal_id numeric(4,1) NOT NULL,
    id_match numeric(3,1) DEFAULT NULL::numeric,
    id_player numeric(7,1) DEFAULT NULL::numeric,
    id_country numeric(5,1) DEFAULT NULL::numeric,
    goal_time numeric(4,1) DEFAULT NULL::numeric,
    goal_type character varying(1) DEFAULT NULL::character varying,
    play_stage character varying(1) DEFAULT NULL::character varying,
    goal_schedule character varying(2) DEFAULT NULL::character varying,
    goal_half numeric(2,1) DEFAULT NULL::numeric
);


--
-- Name: match_captain; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.match_captain (
    id_match numeric(3,1) NOT NULL,
    id_country numeric(5,1) NOT NULL,
    id_player numeric(7,1) NOT NULL
);


--
-- Name: match_details; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.match_details (
    id integer NOT NULL,
    id_match numeric(3,1) DEFAULT NULL::numeric,
    play_stage character varying(1) DEFAULT NULL::character varying,
    id_country numeric(5,1) DEFAULT NULL::numeric,
    win_loose character varying(1) DEFAULT NULL::character varying,
    decided_by character varying(1) DEFAULT NULL::character varying,
    goal_score numeric(2,1) DEFAULT NULL::numeric,
    penalty_score character varying(1) DEFAULT NULL::character varying,
    id_ass_ref numeric(6,1) DEFAULT NULL::numeric,
    id_player_goalkeeper numeric(7,1) DEFAULT NULL::numeric
);


--
-- Name: match_mast; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.match_mast (
    match_id numeric(3,1) NOT NULL,
    play_stage character varying(1) DEFAULT NULL::character varying,
    play_date date,
    results character varying(4) DEFAULT NULL::character varying,
    decided_by character varying(1) DEFAULT NULL::character varying,
    goal_score character varying(6) DEFAULT NULL::character varying,
    id_venue numeric(6,1) DEFAULT NULL::numeric,
    id_referee numeric(6,1) DEFAULT NULL::numeric,
    audence numeric(6,1) DEFAULT NULL::numeric,
    id_player_of_the_match numeric(7,1) DEFAULT NULL::numeric,
    stop1_sec numeric(4,1) DEFAULT NULL::numeric,
    stop2_sec numeric(4,1) DEFAULT NULL::numeric
);


--
-- Name: penalty_goalkeeper; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.penalty_goalkeeper (
    id_match numeric(3,1) NOT NULL,
    id_country numeric(5,1) NOT NULL,
    id_player numeric(7,1) NOT NULL
);


--
-- Name: penalty_shootout; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.penalty_shootout (
    kick_id numeric(3,1) NOT NULL,
    id_match numeric(3,1) DEFAULT NULL::numeric,
    id_country numeric(5,1) DEFAULT NULL::numeric,
    id_player numeric(7,1) DEFAULT NULL::numeric,
    score_goal character varying(1) DEFAULT NULL::character varying,
    kick_no numeric(3,1) DEFAULT NULL::numeric
);


--
-- Name: player_booked; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.player_booked (
    id integer NOT NULL,
    id_match numeric(3,1) DEFAULT NULL::numeric,
    id_country numeric(5,1) DEFAULT NULL::numeric,
    id_player numeric(7,1) DEFAULT NULL::numeric,
    booking_time numeric(4,1) DEFAULT NULL::numeric,
    sent_off character varying(1) DEFAULT NULL::character varying,
    play_schedule character varying(2) DEFAULT NULL::character varying,
    play_half numeric(2,1) DEFAULT NULL::numeric
);


--
-- Name: player_in_out; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.player_in_out (
    id integer NOT NULL,
    id_match numeric(3,1) DEFAULT NULL::numeric,
    id_country numeric(5,1) DEFAULT NULL::numeric,
    id_player numeric(7,1) DEFAULT NULL::numeric,
    in_out character varying(1) DEFAULT NULL::character varying,
    time_in_out numeric(4,1) DEFAULT NULL::numeric,
    play_schedule character varying(2) DEFAULT NULL::character varying,
    play_half numeric(2,1) DEFAULT NULL::numeric
);


--
-- Name: player_mast; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.player_mast (
    player_id numeric(7,1) NOT NULL,
    id_country numeric(5,1) DEFAULT NULL::numeric,
    jersey_no numeric(3,1) DEFAULT NULL::numeric,
    player_name character varying(22) DEFAULT NULL::character varying,
    id_posi_to_play character varying(2) DEFAULT NULL::character varying,
    date_of_birth date,
    age numeric(3,1) DEFAULT NULL::numeric,
    playing_club character varying(19) DEFAULT NULL::character varying
);


--
-- Name: playing_position; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.playing_position (
    position_id character varying(2) NOT NULL,
    position_desc character varying(15) NOT NULL
);


--
-- Name: referee_mast; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.referee_mast (
    referee_id numeric(6,1) NOT NULL,
    referee_name character varying(23) DEFAULT NULL::character varying,
    id_country numeric(5,1) NOT NULL
);


--
-- Name: soccer_city; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.soccer_city (
    city_id numeric(6,1) NOT NULL,
    city character varying(13) DEFAULT NULL::character varying,
    id_country numeric(5,1) DEFAULT NULL::numeric
);


--
-- Name: soccer_country; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.soccer_country (
    country_id numeric(5,1) NOT NULL,
    country_abbr character varying(3) DEFAULT NULL::character varying,
    country_name character varying(19) DEFAULT NULL::character varying
);


--
-- Name: soccer_team; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.soccer_team (
    id_country numeric(5,1) NOT NULL,
    team_group character varying(1) DEFAULT NULL::character varying,
    match_played numeric(2,1) DEFAULT NULL::numeric,
    won numeric(2,1) DEFAULT NULL::numeric,
    draw numeric(2,1) DEFAULT NULL::numeric,
    lost numeric(2,1) DEFAULT NULL::numeric,
    goal_for numeric(2,1) DEFAULT NULL::numeric,
    goal_agnst numeric(2,1) DEFAULT NULL::numeric,
    goal_diff numeric(2,1) DEFAULT NULL::numeric,
    points numeric(2,1) DEFAULT NULL::numeric,
    group_position numeric(2,1) DEFAULT NULL::numeric
);


--
-- Name: soccer_venue; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.soccer_venue (
    venue_id numeric(6,1) NOT NULL,
    venue_name character varying(23) DEFAULT NULL::character varying,
    id_city numeric(6,1) DEFAULT NULL::numeric,
    aud_capacity numeric(6,1) DEFAULT NULL::numeric
);


--
-- Name: staff_type; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.staff_type (
    type_id integer NOT NULL,
    type character varying(32) NOT NULL
);


--
-- Name: staff_type_type_id_seq; Type: SEQUENCE; Schema: soccer; Owner: -
--

ALTER TABLE soccer.staff_type ALTER COLUMN type_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME soccer.staff_type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: team_coaches; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.team_coaches (
    id_country numeric(5,1) NOT NULL,
    id_coach numeric(5,1)
);


--
-- Name: team_staff; Type: TABLE; Schema: soccer; Owner: -
--

CREATE TABLE soccer.team_staff (
    staff_id integer NOT NULL,
    name character varying(64) NOT NULL,
    id_country numeric(5,1) NOT NULL,
    id_type integer NOT NULL
);


--
-- Name: team_staff_staff_id_seq; Type: SEQUENCE; Schema: soccer; Owner: -
--

ALTER TABLE soccer.team_staff ALTER COLUMN staff_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME soccer.team_staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: asst_referee_mast; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.asst_referee_mast VALUES (80001.0, 'Jure Praprotnik', 1225.0);
INSERT INTO soccer.asst_referee_mast VALUES (80002.0, 'Robert Vukan', 1225.0);
INSERT INTO soccer.asst_referee_mast VALUES (80003.0, 'Roberto Alonso Fernandez', 1219.0);
INSERT INTO soccer.asst_referee_mast VALUES (80004.0, 'Simon Beck', 1206.0);
INSERT INTO soccer.asst_referee_mast VALUES (80005.0, 'Mark Borsch', 1208.0);
INSERT INTO soccer.asst_referee_mast VALUES (80006.0, 'Stephen Child', 1206.0);
INSERT INTO soccer.asst_referee_mast VALUES (80007.0, 'Jake Collin', 1206.0);
INSERT INTO soccer.asst_referee_mast VALUES (80008.0, 'Elenito Di Liberatore', 1211.0);
INSERT INTO soccer.asst_referee_mast VALUES (80009.0, 'Bahattin Duran', 1222.0);
INSERT INTO soccer.asst_referee_mast VALUES (80010.0, 'Dalibor Durdevic', 1227.0);
INSERT INTO soccer.asst_referee_mast VALUES (80011.0, 'Mathias Klasenius', 1220.0);
INSERT INTO soccer.asst_referee_mast VALUES (80012.0, 'Tomasz Listkiewicz', 1213.0);
INSERT INTO soccer.asst_referee_mast VALUES (80013.0, 'Stefan Lupp', 1208.0);
INSERT INTO soccer.asst_referee_mast VALUES (80014.0, 'Mike Mullarkey', 1206.0);
INSERT INTO soccer.asst_referee_mast VALUES (80015.0, 'Tarik Ongun', 1222.0);
INSERT INTO soccer.asst_referee_mast VALUES (80016.0, 'Gyorgy Ring', 1209.0);
INSERT INTO soccer.asst_referee_mast VALUES (80017.0, 'Milovan Ristic', 1227.0);
INSERT INTO soccer.asst_referee_mast VALUES (80018.0, 'Pawel Sokolnicki', 1213.0);
INSERT INTO soccer.asst_referee_mast VALUES (80019.0, 'Mauro Tonolini', 1211.0);
INSERT INTO soccer.asst_referee_mast VALUES (80020.0, 'Vencel Toth', 1209.0);
INSERT INTO soccer.asst_referee_mast VALUES (80021.0, 'Sander van Roekel', 1226.0);
INSERT INTO soccer.asst_referee_mast VALUES (80022.0, 'Daniel Warnmark', 1220.0);
INSERT INTO soccer.asst_referee_mast VALUES (80023.0, 'Juan Yuste Jimenez', 1219.0);
INSERT INTO soccer.asst_referee_mast VALUES (80024.0, 'Erwin Zeinstra', 1226.0);
INSERT INTO soccer.asst_referee_mast VALUES (80025.0, 'Frank Andas', 1229.0);
INSERT INTO soccer.asst_referee_mast VALUES (80026.0, 'Frederic Cano', 1207.0);
INSERT INTO soccer.asst_referee_mast VALUES (80027.0, 'Frank Connor', 1228.0);
INSERT INTO soccer.asst_referee_mast VALUES (80028.0, 'Nicolas Danos', 1207.0);
INSERT INTO soccer.asst_referee_mast VALUES (80029.0, 'Sebastian Gheorghe', 1216.0);
INSERT INTO soccer.asst_referee_mast VALUES (80030.0, 'Nikolay Golubev', 1217.0);
INSERT INTO soccer.asst_referee_mast VALUES (80031.0, 'Kim Haglund', 1229.0);
INSERT INTO soccer.asst_referee_mast VALUES (80032.0, 'Tikhon Kalugin', 1217.0);
INSERT INTO soccer.asst_referee_mast VALUES (80033.0, 'Damien McGraith', 1215.0);
INSERT INTO soccer.asst_referee_mast VALUES (80034.0, 'Tomas Mokrusch', 1205.0);
INSERT INTO soccer.asst_referee_mast VALUES (80035.0, 'Roman Slysko', 1218.0);
INSERT INTO soccer.asst_referee_mast VALUES (80036.0, 'Octavian Sovre', 1216.0);
INSERT INTO soccer.asst_referee_mast VALUES (80037.0, 'Anton Averyanov', 1217.0);
INSERT INTO soccer.asst_referee_mast VALUES (80038.0, 'Martin Wilczek', 1205.0);


--
-- Data for Name: coach_mast; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.coach_mast VALUES (5550.0, 'Gianni De Biasi');
INSERT INTO soccer.coach_mast VALUES (5551.0, 'Marcel Koller');
INSERT INTO soccer.coach_mast VALUES (5552.0, 'Marc Wilmots');
INSERT INTO soccer.coach_mast VALUES (5553.0, 'Ante Cacic');
INSERT INTO soccer.coach_mast VALUES (5554.0, 'Pavel Vrba');
INSERT INTO soccer.coach_mast VALUES (5555.0, 'Roy Hodgson');
INSERT INTO soccer.coach_mast VALUES (5556.0, 'Didier Deschamps');
INSERT INTO soccer.coach_mast VALUES (5557.0, 'Joachim Low');
INSERT INTO soccer.coach_mast VALUES (5558.0, 'Bernd Storck');
INSERT INTO soccer.coach_mast VALUES (5559.0, 'Lars Lagerback');
INSERT INTO soccer.coach_mast VALUES (5560.0, 'Heimir Hallgrímsson');
INSERT INTO soccer.coach_mast VALUES (5561.0, 'Antonio Conte');
INSERT INTO soccer.coach_mast VALUES (5562.0, 'Michael ONeill');
INSERT INTO soccer.coach_mast VALUES (5563.0, 'Adam Nawalka');
INSERT INTO soccer.coach_mast VALUES (5564.0, 'Fernando Santos');
INSERT INTO soccer.coach_mast VALUES (5565.0, 'Martin ONeill');
INSERT INTO soccer.coach_mast VALUES (5566.0, 'Anghel Iordanescu');
INSERT INTO soccer.coach_mast VALUES (5567.0, 'Leonid Slutski');
INSERT INTO soccer.coach_mast VALUES (5568.0, 'Jan Kozak');
INSERT INTO soccer.coach_mast VALUES (5569.0, 'Vicente del Bosque');
INSERT INTO soccer.coach_mast VALUES (5570.0, 'Erik Hamren');
INSERT INTO soccer.coach_mast VALUES (5571.0, 'Vladimir Petkovic');
INSERT INTO soccer.coach_mast VALUES (5572.0, 'Fatih Terim');
INSERT INTO soccer.coach_mast VALUES (5573.0, 'Mykhailo Fomenko');
INSERT INTO soccer.coach_mast VALUES (5574.0, 'Chris Coleman');


--
-- Data for Name: goal_details; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.goal_details VALUES (1.0, 1.0, 160159.0, 1207.0, 57.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (2.0, 1.0, 160368.0, 1216.0, 65.0, 'P', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (3.0, 1.0, 160154.0, 1207.0, 89.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (4.0, 2.0, 160470.0, 1221.0, 5.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (5.0, 3.0, 160547.0, 1224.0, 10.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (6.0, 3.0, 160403.0, 1218.0, 61.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (7.0, 3.0, 160550.0, 1224.0, 81.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (8.0, 4.0, 160128.0, 1206.0, 73.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (9.0, 4.0, 160373.0, 1217.0, 93.0, 'N', 'G', 'ST', 2.0);
INSERT INTO soccer.goal_details VALUES (10.0, 5.0, 160084.0, 1204.0, 41.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (11.0, 6.0, 160298.0, 1213.0, 51.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (12.0, 7.0, 160183.0, 1208.0, 19.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (13.0, 7.0, 160180.0, 1208.0, 93.0, 'N', 'G', 'ST', 2.0);
INSERT INTO soccer.goal_details VALUES (14.0, 8.0, 160423.0, 1219.0, 87.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (15.0, 9.0, 160335.0, 1215.0, 48.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (16.0, 9.0, 160327.0, 1215.0, 71.0, 'O', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (17.0, 10.0, 160244.0, 1211.0, 32.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (18.0, 10.0, 160252.0, 1211.0, 93.0, 'N', 'G', 'ST', 2.0);
INSERT INTO soccer.goal_details VALUES (19.0, 11.0, 160207.0, 1209.0, 62.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (20.0, 11.0, 160200.0, 1209.0, 87.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (21.0, 12.0, 160320.0, 1214.0, 31.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (22.0, 12.0, 160221.0, 1210.0, 50.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (23.0, 13.0, 160411.0, 1218.0, 32.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (24.0, 13.0, 160405.0, 1218.0, 45.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (25.0, 13.0, 160380.0, 1217.0, 80.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (26.0, 14.0, 160368.0, 1216.0, 18.0, 'P', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (27.0, 14.0, 160481.0, 1221.0, 57.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (28.0, 15.0, 160160.0, 1207.0, 90.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (29.0, 15.0, 160154.0, 1207.0, 96.0, 'N', 'G', 'ST', 2.0);
INSERT INTO soccer.goal_details VALUES (30.0, 16.0, 160547.0, 1224.0, 42.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (31.0, 16.0, 160138.0, 1206.0, 56.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (32.0, 16.0, 160137.0, 1206.0, 93.0, 'N', 'G', 'ST', 2.0);
INSERT INTO soccer.goal_details VALUES (33.0, 17.0, 160262.0, 1212.0, 49.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (34.0, 17.0, 160275.0, 1212.0, 96.0, 'N', 'G', 'ST', 2.0);
INSERT INTO soccer.goal_details VALUES (35.0, 19.0, 160248.0, 1211.0, 88.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (36.0, 20.0, 160085.0, 1204.0, 37.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (37.0, 20.0, 160086.0, 1204.0, 59.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (38.0, 20.0, 160115.0, 1205.0, 76.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (39.0, 20.0, 160114.0, 1205.0, 89.0, 'P', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (40.0, 21.0, 160435.0, 1219.0, 34.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (41.0, 21.0, 160436.0, 1219.0, 37.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (42.0, 21.0, 160435.0, 1219.0, 48.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (43.0, 22.0, 160067.0, 1203.0, 48.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (44.0, 22.0, 160064.0, 1203.0, 61.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (45.0, 22.0, 160067.0, 1203.0, 70.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (46.0, 23.0, 160224.0, 1210.0, 40.0, 'P', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (47.0, 23.0, 160216.0, 1210.0, 88.0, 'O', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (48.0, 25.0, 160023.0, 1201.0, 43.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (49.0, 27.0, 160544.0, 1224.0, 11.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (50.0, 27.0, 160538.0, 1224.0, 20.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (51.0, 27.0, 160547.0, 1224.0, 67.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (52.0, 29.0, 160287.0, 1213.0, 54.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (53.0, 30.0, 160182.0, 1208.0, 30.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (54.0, 31.0, 160504.0, 1222.0, 10.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (55.0, 31.0, 160500.0, 1222.0, 65.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (56.0, 32.0, 160435.0, 1219.0, 7.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (57.0, 32.0, 160089.0, 1204.0, 45.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (58.0, 32.0, 160085.0, 1204.0, 87.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (59.0, 33.0, 160226.0, 1210.0, 18.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (60.0, 33.0, 160042.0, 1202.0, 60.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (61.0, 33.0, 160226.0, 1210.0, 94.0, 'N', 'G', 'ST', 2.0);
INSERT INTO soccer.goal_details VALUES (62.0, 34.0, 160203.0, 1209.0, 19.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (63.0, 34.0, 160320.0, 1214.0, 42.0, 'N', 'G', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (64.0, 34.0, 160202.0, 1209.0, 47.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (65.0, 34.0, 160322.0, 1214.0, 50.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (66.0, 34.0, 160202.0, 1209.0, 55.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (67.0, 34.0, 160322.0, 1214.0, 62.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (68.0, 35.0, 160333.0, 1215.0, 85.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (69.0, 36.0, 160063.0, 1203.0, 84.0, 'N', 'G', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (70.0, 37.0, 160287.0, 1213.0, 39.0, 'N', 'R', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (71.0, 37.0, 160476.0, 1221.0, 82.0, 'N', 'R', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (72.0, 38.0, 160262.0, 1212.0, 75.0, 'O', 'R', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (73.0, 39.0, 160321.0, 1214.0, 117.0, 'N', 'R', 'ET', 2.0);
INSERT INTO soccer.goal_details VALUES (74.0, 40.0, 160333.0, 1215.0, 2.0, 'P', 'R', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (75.0, 40.0, 160160.0, 1207.0, 58.0, 'N', 'R', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (76.0, 40.0, 160160.0, 1207.0, 61.0, 'N', 'R', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (77.0, 41.0, 160165.0, 1208.0, 8.0, 'N', 'R', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (78.0, 41.0, 160182.0, 1208.0, 43.0, 'N', 'R', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (79.0, 41.0, 160173.0, 1208.0, 63.0, 'N', 'R', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (80.0, 42.0, 160050.0, 1203.0, 10.0, 'N', 'R', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (81.0, 42.0, 160065.0, 1203.0, 78.0, 'N', 'R', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (82.0, 42.0, 160062.0, 1203.0, 80.0, 'N', 'R', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (83.0, 42.0, 160058.0, 1203.0, 90.0, 'N', 'R', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (84.0, 43.0, 160236.0, 1211.0, 33.0, 'N', 'R', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (85.0, 43.0, 160252.0, 1211.0, 91.0, 'N', 'R', 'ST', 2.0);
INSERT INTO soccer.goal_details VALUES (86.0, 44.0, 160136.0, 1206.0, 4.0, 'P', 'R', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (87.0, 44.0, 160219.0, 1210.0, 6.0, 'N', 'R', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (88.0, 44.0, 160230.0, 1210.0, 18.0, 'N', 'R', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (89.0, 45.0, 160297.0, 1213.0, 2.0, 'N', 'Q', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (90.0, 45.0, 160316.0, 1214.0, 33.0, 'N', 'Q', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (91.0, 46.0, 160063.0, 1203.0, 13.0, 'N', 'Q', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (92.0, 46.0, 160539.0, 1224.0, 31.0, 'N', 'Q', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (93.0, 46.0, 160550.0, 1224.0, 55.0, 'N', 'Q', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (94.0, 46.0, 160551.0, 1224.0, 86.0, 'N', 'Q', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (95.0, 47.0, 160177.0, 1208.0, 65.0, 'N', 'Q', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (96.0, 47.0, 160235.0, 1211.0, 78.0, 'P', 'Q', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (97.0, 48.0, 160159.0, 1207.0, 12.0, 'N', 'Q', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (98.0, 48.0, 160155.0, 1207.0, 20.0, 'N', 'Q', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (99.0, 48.0, 160154.0, 1207.0, 43.0, 'N', 'Q', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (100.0, 48.0, 160160.0, 1207.0, 45.0, 'N', 'Q', 'NT', 1.0);
INSERT INTO soccer.goal_details VALUES (101.0, 48.0, 160230.0, 1210.0, 56.0, 'N', 'Q', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (102.0, 48.0, 160159.0, 1207.0, 59.0, 'N', 'Q', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (103.0, 48.0, 160221.0, 1210.0, 84.0, 'N', 'Q', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (104.0, 49.0, 160322.0, 1214.0, 50.0, 'N', 'S', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (105.0, 49.0, 160320.0, 1214.0, 53.0, 'N', 'S', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (106.0, 50.0, 160160.0, 1207.0, 47.0, 'P', 'S', 'ST', 1.0);
INSERT INTO soccer.goal_details VALUES (107.0, 50.0, 160160.0, 1207.0, 72.0, 'N', 'S', 'NT', 2.0);
INSERT INTO soccer.goal_details VALUES (108.0, 51.0, 160319.0, 1214.0, 109.0, 'N', 'F', 'ET', 2.0);


--
-- Data for Name: match_captain; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.match_captain VALUES (1.0, 1207.0, 160140.0);
INSERT INTO soccer.match_captain VALUES (1.0, 1216.0, 160349.0);
INSERT INTO soccer.match_captain VALUES (2.0, 1201.0, 160013.0);
INSERT INTO soccer.match_captain VALUES (2.0, 1221.0, 160467.0);
INSERT INTO soccer.match_captain VALUES (3.0, 1218.0, 160401.0);
INSERT INTO soccer.match_captain VALUES (3.0, 1224.0, 160539.0);
INSERT INTO soccer.match_captain VALUES (4.0, 1206.0, 160136.0);
INSERT INTO soccer.match_captain VALUES (4.0, 1217.0, 160373.0);
INSERT INTO soccer.match_captain VALUES (5.0, 1204.0, 160076.0);
INSERT INTO soccer.match_captain VALUES (5.0, 1222.0, 160494.0);
INSERT INTO soccer.match_captain VALUES (6.0, 1212.0, 160267.0);
INSERT INTO soccer.match_captain VALUES (6.0, 1213.0, 160297.0);
INSERT INTO soccer.match_captain VALUES (7.0, 1208.0, 160163.0);
INSERT INTO soccer.match_captain VALUES (7.0, 1223.0, 160515.0);
INSERT INTO soccer.match_captain VALUES (8.0, 1205.0, 160110.0);
INSERT INTO soccer.match_captain VALUES (8.0, 1219.0, 160424.0);
INSERT INTO soccer.match_captain VALUES (9.0, 1215.0, 160331.0);
INSERT INTO soccer.match_captain VALUES (9.0, 1220.0, 160459.0);
INSERT INTO soccer.match_captain VALUES (10.0, 1203.0, 160062.0);
INSERT INTO soccer.match_captain VALUES (10.0, 1211.0, 160231.0);
INSERT INTO soccer.match_captain VALUES (11.0, 1202.0, 160028.0);
INSERT INTO soccer.match_captain VALUES (11.0, 1209.0, 160202.0);
INSERT INTO soccer.match_captain VALUES (12.0, 1210.0, 160222.0);
INSERT INTO soccer.match_captain VALUES (12.0, 1214.0, 160322.0);
INSERT INTO soccer.match_captain VALUES (13.0, 1217.0, 160373.0);
INSERT INTO soccer.match_captain VALUES (13.0, 1218.0, 160401.0);
INSERT INTO soccer.match_captain VALUES (14.0, 1216.0, 160349.0);
INSERT INTO soccer.match_captain VALUES (14.0, 1221.0, 160467.0);
INSERT INTO soccer.match_captain VALUES (15.0, 1201.0, 160004.0);
INSERT INTO soccer.match_captain VALUES (15.0, 1207.0, 160140.0);
INSERT INTO soccer.match_captain VALUES (16.0, 1206.0, 160136.0);
INSERT INTO soccer.match_captain VALUES (16.0, 1224.0, 160539.0);
INSERT INTO soccer.match_captain VALUES (17.0, 1212.0, 160267.0);
INSERT INTO soccer.match_captain VALUES (17.0, 1223.0, 160515.0);
INSERT INTO soccer.match_captain VALUES (18.0, 1208.0, 160163.0);
INSERT INTO soccer.match_captain VALUES (18.0, 1213.0, 160297.0);
INSERT INTO soccer.match_captain VALUES (19.0, 1211.0, 160231.0);
INSERT INTO soccer.match_captain VALUES (19.0, 1220.0, 160459.0);
INSERT INTO soccer.match_captain VALUES (20.0, 1204.0, 160076.0);
INSERT INTO soccer.match_captain VALUES (20.0, 1205.0, 160110.0);
INSERT INTO soccer.match_captain VALUES (21.0, 1219.0, 160424.0);
INSERT INTO soccer.match_captain VALUES (21.0, 1222.0, 160494.0);
INSERT INTO soccer.match_captain VALUES (22.0, 1203.0, 160062.0);
INSERT INTO soccer.match_captain VALUES (22.0, 1215.0, 160331.0);
INSERT INTO soccer.match_captain VALUES (23.0, 1209.0, 160202.0);
INSERT INTO soccer.match_captain VALUES (23.0, 1210.0, 160222.0);
INSERT INTO soccer.match_captain VALUES (24.0, 1202.0, 160028.0);
INSERT INTO soccer.match_captain VALUES (24.0, 1214.0, 160322.0);
INSERT INTO soccer.match_captain VALUES (25.0, 1201.0, 160004.0);
INSERT INTO soccer.match_captain VALUES (25.0, 1216.0, 160349.0);
INSERT INTO soccer.match_captain VALUES (26.0, 1207.0, 160140.0);
INSERT INTO soccer.match_captain VALUES (26.0, 1221.0, 160467.0);
INSERT INTO soccer.match_captain VALUES (27.0, 1217.0, 160386.0);
INSERT INTO soccer.match_captain VALUES (27.0, 1224.0, 160539.0);
INSERT INTO soccer.match_captain VALUES (28.0, 1206.0, 160120.0);
INSERT INTO soccer.match_captain VALUES (28.0, 1218.0, 160401.0);
INSERT INTO soccer.match_captain VALUES (29.0, 1213.0, 160297.0);
INSERT INTO soccer.match_captain VALUES (29.0, 1223.0, 160520.0);
INSERT INTO soccer.match_captain VALUES (30.0, 1208.0, 160163.0);
INSERT INTO soccer.match_captain VALUES (30.0, 1212.0, 160267.0);
INSERT INTO soccer.match_captain VALUES (31.0, 1205.0, 160093.0);
INSERT INTO soccer.match_captain VALUES (31.0, 1222.0, 160494.0);
INSERT INTO soccer.match_captain VALUES (32.0, 1204.0, 160076.0);
INSERT INTO soccer.match_captain VALUES (32.0, 1219.0, 160424.0);
INSERT INTO soccer.match_captain VALUES (33.0, 1202.0, 160028.0);
INSERT INTO soccer.match_captain VALUES (33.0, 1210.0, 160222.0);
INSERT INTO soccer.match_captain VALUES (34.0, 1209.0, 160202.0);
INSERT INTO soccer.match_captain VALUES (34.0, 1214.0, 160322.0);
INSERT INTO soccer.match_captain VALUES (35.0, 1211.0, 160235.0);
INSERT INTO soccer.match_captain VALUES (35.0, 1215.0, 160328.0);
INSERT INTO soccer.match_captain VALUES (36.0, 1203.0, 160062.0);
INSERT INTO soccer.match_captain VALUES (36.0, 1220.0, 160459.0);
INSERT INTO soccer.match_captain VALUES (37.0, 1213.0, 160297.0);
INSERT INTO soccer.match_captain VALUES (37.0, 1221.0, 160467.0);
INSERT INTO soccer.match_captain VALUES (38.0, 1212.0, 160267.0);
INSERT INTO soccer.match_captain VALUES (38.0, 1224.0, 160539.0);
INSERT INTO soccer.match_captain VALUES (39.0, 1204.0, 160076.0);
INSERT INTO soccer.match_captain VALUES (39.0, 1214.0, 160322.0);
INSERT INTO soccer.match_captain VALUES (40.0, 1207.0, 160140.0);
INSERT INTO soccer.match_captain VALUES (40.0, 1215.0, 160328.0);
INSERT INTO soccer.match_captain VALUES (41.0, 1208.0, 160163.0);
INSERT INTO soccer.match_captain VALUES (41.0, 1218.0, 160401.0);
INSERT INTO soccer.match_captain VALUES (42.0, 1203.0, 160062.0);
INSERT INTO soccer.match_captain VALUES (42.0, 1209.0, 160202.0);
INSERT INTO soccer.match_captain VALUES (43.0, 1211.0, 160231.0);
INSERT INTO soccer.match_captain VALUES (43.0, 1219.0, 160424.0);
INSERT INTO soccer.match_captain VALUES (44.0, 1206.0, 160136.0);
INSERT INTO soccer.match_captain VALUES (44.0, 1210.0, 160222.0);
INSERT INTO soccer.match_captain VALUES (45.0, 1213.0, 160297.0);
INSERT INTO soccer.match_captain VALUES (45.0, 1214.0, 160322.0);
INSERT INTO soccer.match_captain VALUES (46.0, 1203.0, 160062.0);
INSERT INTO soccer.match_captain VALUES (46.0, 1224.0, 160539.0);
INSERT INTO soccer.match_captain VALUES (47.0, 1208.0, 160163.0);
INSERT INTO soccer.match_captain VALUES (47.0, 1211.0, 160231.0);
INSERT INTO soccer.match_captain VALUES (48.0, 1207.0, 160140.0);
INSERT INTO soccer.match_captain VALUES (48.0, 1210.0, 160222.0);
INSERT INTO soccer.match_captain VALUES (49.0, 1214.0, 160322.0);
INSERT INTO soccer.match_captain VALUES (49.0, 1224.0, 160539.0);
INSERT INTO soccer.match_captain VALUES (50.0, 1207.0, 160140.0);
INSERT INTO soccer.match_captain VALUES (50.0, 1208.0, 160180.0);
INSERT INTO soccer.match_captain VALUES (51.0, 1207.0, 160140.0);
INSERT INTO soccer.match_captain VALUES (51.0, 1214.0, 160322.0);


--
-- Data for Name: match_details; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.match_details VALUES (1, 1.0, 'G', 1207.0, 'W', 'N', 2.0, '', 80016.0, 160140.0);
INSERT INTO soccer.match_details VALUES (2, 1.0, 'G', 1216.0, 'L', 'N', 1.0, '', 80020.0, 160348.0);
INSERT INTO soccer.match_details VALUES (3, 2.0, 'G', 1201.0, 'L', 'N', 0.0, '', 80003.0, 160001.0);
INSERT INTO soccer.match_details VALUES (4, 2.0, 'G', 1221.0, 'W', 'N', 1.0, '', 80023.0, 160463.0);
INSERT INTO soccer.match_details VALUES (5, 3.0, 'G', 1224.0, 'W', 'N', 2.0, '', 80031.0, 160532.0);
INSERT INTO soccer.match_details VALUES (6, 3.0, 'G', 1218.0, 'L', 'N', 1.0, '', 80025.0, 160392.0);
INSERT INTO soccer.match_details VALUES (7, 4.0, 'G', 1206.0, 'D', 'N', 1.0, '', 80008.0, 160117.0);
INSERT INTO soccer.match_details VALUES (8, 4.0, 'G', 1217.0, 'D', 'N', 1.0, '', 80019.0, 160369.0);
INSERT INTO soccer.match_details VALUES (9, 5.0, 'G', 1222.0, 'L', 'N', 0.0, '', 80011.0, 160486.0);
INSERT INTO soccer.match_details VALUES (10, 5.0, 'G', 1204.0, 'W', 'N', 1.0, '', 80022.0, 160071.0);
INSERT INTO soccer.match_details VALUES (11, 6.0, 'G', 1213.0, 'W', 'N', 1.0, '', 80036.0, 160279.0);
INSERT INTO soccer.match_details VALUES (12, 6.0, 'G', 1212.0, 'L', 'N', 0.0, '', 80029.0, 160256.0);
INSERT INTO soccer.match_details VALUES (13, 7.0, 'G', 1208.0, 'W', 'N', 2.0, '', 80014.0, 160163.0);
INSERT INTO soccer.match_details VALUES (14, 7.0, 'G', 1223.0, 'L', 'N', 0.0, '', 80006.0, 160508.0);
INSERT INTO soccer.match_details VALUES (15, 8.0, 'G', 1219.0, 'W', 'N', 1.0, '', 80018.0, 160416.0);
INSERT INTO soccer.match_details VALUES (16, 8.0, 'G', 1205.0, 'L', 'N', 0.0, '', 80012.0, 160093.0);
INSERT INTO soccer.match_details VALUES (17, 9.0, 'G', 1215.0, 'D', 'N', 1.0, '', 80017.0, 160324.0);
INSERT INTO soccer.match_details VALUES (18, 9.0, 'G', 1220.0, 'D', 'N', 1.0, '', 80010.0, 160439.0);
INSERT INTO soccer.match_details VALUES (19, 10.0, 'G', 1203.0, 'L', 'N', 0.0, '', 80004.0, 160047.0);
INSERT INTO soccer.match_details VALUES (20, 10.0, 'G', 1211.0, 'W', 'N', 2.0, '', 80007.0, 160231.0);
INSERT INTO soccer.match_details VALUES (21, 11.0, 'G', 1202.0, 'L', 'N', 0.0, '', 80026.0, 160024.0);
INSERT INTO soccer.match_details VALUES (22, 11.0, 'G', 1209.0, 'W', 'N', 2.0, '', 80028.0, 160187.0);
INSERT INTO soccer.match_details VALUES (23, 12.0, 'G', 1214.0, 'D', 'N', 1.0, '', 80009.0, 160302.0);
INSERT INTO soccer.match_details VALUES (24, 12.0, 'G', 1210.0, 'D', 'N', 1.0, '', 80015.0, 160208.0);
INSERT INTO soccer.match_details VALUES (25, 13.0, 'G', 1217.0, 'L', 'N', 1.0, '', 80001.0, 160369.0);
INSERT INTO soccer.match_details VALUES (26, 13.0, 'G', 1218.0, 'W', 'N', 2.0, '', 80002.0, 160392.0);
INSERT INTO soccer.match_details VALUES (27, 14.0, 'G', 1216.0, 'D', 'N', 1.0, '', 80030.0, 160348.0);
INSERT INTO soccer.match_details VALUES (28, 14.0, 'G', 1221.0, 'D', 'N', 1.0, '', 80032.0, 160463.0);
INSERT INTO soccer.match_details VALUES (29, 15.0, 'G', 1207.0, 'W', 'N', 2.0, '', 80033.0, 160140.0);
INSERT INTO soccer.match_details VALUES (30, 15.0, 'G', 1201.0, 'L', 'N', 0.0, '', 80027.0, 160001.0);
INSERT INTO soccer.match_details VALUES (31, 16.0, 'G', 1206.0, 'W', 'N', 2.0, '', 80005.0, 160117.0);
INSERT INTO soccer.match_details VALUES (32, 16.0, 'G', 1224.0, 'L', 'N', 1.0, '', 80013.0, 160531.0);
INSERT INTO soccer.match_details VALUES (33, 17.0, 'G', 1223.0, 'L', 'N', 0.0, '', 80035.0, 160508.0);
INSERT INTO soccer.match_details VALUES (34, 17.0, 'G', 1212.0, 'W', 'N', 2.0, '', 80034.0, 160256.0);
INSERT INTO soccer.match_details VALUES (35, 18.0, 'G', 1208.0, 'D', 'N', 0.0, '', 80021.0, 160163.0);
INSERT INTO soccer.match_details VALUES (36, 18.0, 'G', 1213.0, 'D', 'N', 0.0, '', 80024.0, 160278.0);
INSERT INTO soccer.match_details VALUES (37, 19.0, 'G', 1211.0, 'W', 'N', 1.0, '', 80016.0, 160231.0);
INSERT INTO soccer.match_details VALUES (38, 19.0, 'G', 1220.0, 'L', 'N', 0.0, '', 80020.0, 160439.0);
INSERT INTO soccer.match_details VALUES (39, 20.0, 'G', 1205.0, 'D', 'N', 2.0, '', 80004.0, 160093.0);
INSERT INTO soccer.match_details VALUES (40, 20.0, 'G', 1204.0, 'D', 'N', 2.0, '', 80007.0, 160071.0);
INSERT INTO soccer.match_details VALUES (41, 21.0, 'G', 1219.0, 'W', 'N', 3.0, '', 80017.0, 160416.0);
INSERT INTO soccer.match_details VALUES (42, 21.0, 'G', 1222.0, 'L', 'N', 0.0, '', 80010.0, 160486.0);
INSERT INTO soccer.match_details VALUES (43, 22.0, 'G', 1203.0, 'W', 'N', 3.0, '', 80009.0, 160047.0);
INSERT INTO soccer.match_details VALUES (44, 22.0, 'G', 1215.0, 'L', 'N', 0.0, '', 80015.0, 160324.0);
INSERT INTO soccer.match_details VALUES (45, 23.0, 'G', 1210.0, 'D', 'N', 1.0, '', 80030.0, 160208.0);
INSERT INTO soccer.match_details VALUES (46, 23.0, 'G', 1209.0, 'D', 'N', 1.0, '', 80032.0, 160187.0);
INSERT INTO soccer.match_details VALUES (47, 24.0, 'G', 1214.0, 'D', 'N', 0.0, '', 80008.0, 160302.0);
INSERT INTO soccer.match_details VALUES (48, 24.0, 'G', 1202.0, 'D', 'N', 0.0, '', 80019.0, 160024.0);
INSERT INTO soccer.match_details VALUES (49, 25.0, 'G', 1216.0, 'L', 'N', 0.0, '', 80035.0, 160348.0);
INSERT INTO soccer.match_details VALUES (50, 25.0, 'G', 1201.0, 'W', 'N', 1.0, '', 80034.0, 160001.0);
INSERT INTO soccer.match_details VALUES (51, 26.0, 'G', 1221.0, 'D', 'N', 0.0, '', 80001.0, 160463.0);
INSERT INTO soccer.match_details VALUES (52, 26.0, 'G', 1207.0, 'D', 'N', 0.0, '', 80002.0, 160140.0);
INSERT INTO soccer.match_details VALUES (53, 27.0, 'G', 1217.0, 'L', 'N', 0.0, '', 80011.0, 160369.0);
INSERT INTO soccer.match_details VALUES (54, 27.0, 'G', 1224.0, 'W', 'N', 3.0, '', 80022.0, 160531.0);
INSERT INTO soccer.match_details VALUES (55, 28.0, 'G', 1218.0, 'D', 'N', 0.0, '', 80003.0, 160392.0);
INSERT INTO soccer.match_details VALUES (56, 28.0, 'G', 1206.0, 'D', 'N', 0.0, '', 80023.0, 160117.0);
INSERT INTO soccer.match_details VALUES (57, 29.0, 'G', 1223.0, 'L', 'N', 0.0, '', 80031.0, 160508.0);
INSERT INTO soccer.match_details VALUES (58, 29.0, 'G', 1213.0, 'W', 'N', 1.0, '', 80025.0, 160278.0);
INSERT INTO soccer.match_details VALUES (59, 30.0, 'G', 1212.0, 'L', 'N', 0.0, '', 80026.0, 160256.0);
INSERT INTO soccer.match_details VALUES (60, 30.0, 'G', 1208.0, 'W', 'N', 1.0, '', 80028.0, 160163.0);
INSERT INTO soccer.match_details VALUES (61, 31.0, 'G', 1205.0, 'L', 'N', 0.0, '', 80033.0, 160093.0);
INSERT INTO soccer.match_details VALUES (62, 31.0, 'G', 1222.0, 'W', 'N', 2.0, '', 80027.0, 160486.0);
INSERT INTO soccer.match_details VALUES (63, 32.0, 'G', 1204.0, 'W', 'N', 2.0, '', 80021.0, 160071.0);
INSERT INTO soccer.match_details VALUES (64, 32.0, 'G', 1219.0, 'L', 'N', 1.0, '', 80024.0, 160416.0);
INSERT INTO soccer.match_details VALUES (65, 33.0, 'G', 1210.0, 'W', 'N', 2.0, '', 80018.0, 160208.0);
INSERT INTO soccer.match_details VALUES (66, 33.0, 'G', 1202.0, 'L', 'N', 1.0, '', 80012.0, 160024.0);
INSERT INTO soccer.match_details VALUES (67, 34.0, 'G', 1209.0, 'D', 'N', 3.0, '', 80014.0, 160187.0);
INSERT INTO soccer.match_details VALUES (68, 34.0, 'G', 1214.0, 'D', 'N', 3.0, '', 80006.0, 160302.0);
INSERT INTO soccer.match_details VALUES (69, 35.0, 'G', 1211.0, 'L', 'N', 0.0, '', 80036.0, 160233.0);
INSERT INTO soccer.match_details VALUES (70, 35.0, 'G', 1215.0, 'W', 'N', 1.0, '', 80029.0, 160324.0);
INSERT INTO soccer.match_details VALUES (71, 36.0, 'G', 1220.0, 'L', 'N', 0.0, '', 80005.0, 160439.0);
INSERT INTO soccer.match_details VALUES (72, 36.0, 'G', 1203.0, 'W', 'N', 1.0, '', 80013.0, 160047.0);
INSERT INTO soccer.match_details VALUES (73, 37.0, 'R', 1221.0, 'L', 'P', 1.0, '4', 80004.0, 160463.0);
INSERT INTO soccer.match_details VALUES (74, 37.0, 'R', 1213.0, 'W', 'P', 1.0, '5', 80007.0, 160278.0);
INSERT INTO soccer.match_details VALUES (75, 38.0, 'R', 1224.0, 'W', 'N', 1.0, '', 80014.0, 160531.0);
INSERT INTO soccer.match_details VALUES (76, 38.0, 'R', 1212.0, 'L', 'N', 0.0, '', 80006.0, 160256.0);
INSERT INTO soccer.match_details VALUES (77, 39.0, 'R', 1204.0, 'L', 'N', 0.0, '', 80003.0, 160071.0);
INSERT INTO soccer.match_details VALUES (78, 39.0, 'R', 1214.0, 'W', 'N', 1.0, '', 80023.0, 160302.0);
INSERT INTO soccer.match_details VALUES (79, 40.0, 'R', 1207.0, 'W', 'N', 2.0, '', 80008.0, 160140.0);
INSERT INTO soccer.match_details VALUES (80, 40.0, 'R', 1215.0, 'L', 'N', 1.0, '', 80019.0, 160324.0);
INSERT INTO soccer.match_details VALUES (81, 41.0, 'R', 1208.0, 'W', 'N', 3.0, '', 80018.0, 160163.0);
INSERT INTO soccer.match_details VALUES (82, 41.0, 'R', 1218.0, 'L', 'N', 0.0, '', 80012.0, 160392.0);
INSERT INTO soccer.match_details VALUES (83, 42.0, 'R', 1209.0, 'L', 'N', 0.0, '', 80017.0, 160187.0);
INSERT INTO soccer.match_details VALUES (84, 42.0, 'R', 1203.0, 'W', 'N', 4.0, '', 80010.0, 160047.0);
INSERT INTO soccer.match_details VALUES (85, 43.0, 'R', 1211.0, 'W', 'N', 2.0, '', 80009.0, 160231.0);
INSERT INTO soccer.match_details VALUES (86, 43.0, 'R', 1219.0, 'L', 'N', 0.0, '', 80015.0, 160416.0);
INSERT INTO soccer.match_details VALUES (87, 44.0, 'R', 1206.0, 'L', 'N', 1.0, '', 80001.0, 160117.0);
INSERT INTO soccer.match_details VALUES (88, 44.0, 'R', 1210.0, 'W', 'N', 2.0, '', 80002.0, 160208.0);
INSERT INTO soccer.match_details VALUES (89, 45.0, 'Q', 1213.0, 'L', 'P', 1.0, '3', 80005.0, 160278.0);
INSERT INTO soccer.match_details VALUES (90, 45.0, 'Q', 1214.0, 'W', 'P', 1.0, '5', 80013.0, 160302.0);
INSERT INTO soccer.match_details VALUES (91, 46.0, 'Q', 1224.0, 'W', 'N', 3.0, '', 80001.0, 160531.0);
INSERT INTO soccer.match_details VALUES (92, 46.0, 'Q', 1203.0, 'L', 'N', 1.0, '', 80002.0, 160047.0);
INSERT INTO soccer.match_details VALUES (93, 47.0, 'Q', 1208.0, 'W', 'P', 1.0, '6', 80016.0, 160163.0);
INSERT INTO soccer.match_details VALUES (94, 47.0, 'Q', 1211.0, 'L', 'P', 1.0, '5', 80020.0, 160231.0);
INSERT INTO soccer.match_details VALUES (95, 48.0, 'Q', 1207.0, 'W', 'N', 5.0, '', 80021.0, 160140.0);
INSERT INTO soccer.match_details VALUES (96, 48.0, 'Q', 1210.0, 'L', 'N', 2.0, '', 80024.0, 160208.0);
INSERT INTO soccer.match_details VALUES (97, 49.0, 'S', 1214.0, 'W', 'N', 2.0, '', 80011.0, 160302.0);
INSERT INTO soccer.match_details VALUES (98, 49.0, 'S', 1224.0, 'L', 'N', 0.0, '', 80022.0, 160531.0);
INSERT INTO soccer.match_details VALUES (99, 50.0, 'S', 1207.0, 'W', 'N', 2.0, '', 80008.0, 160140.0);
INSERT INTO soccer.match_details VALUES (100, 50.0, 'S', 1208.0, 'L', 'N', 1.0, '', 80019.0, 160163.0);
INSERT INTO soccer.match_details VALUES (101, 51.0, 'F', 1214.0, 'W', 'N', 1.0, '', 80004.0, 160302.0);
INSERT INTO soccer.match_details VALUES (102, 51.0, 'F', 1207.0, 'L', 'N', 0.0, '', 80007.0, 160140.0);


--
-- Data for Name: match_mast; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.match_mast VALUES (1.0, 'G', '2016-06-11', 'WIN', 'N', '2-1', 20008.0, 70007.0, 75113.0, 160154.0, 131.0, 242.0);
INSERT INTO soccer.match_mast VALUES (2.0, 'G', '2016-06-11', 'WIN', 'N', '0-1', 20002.0, 70012.0, 33805.0, 160476.0, 61.0, 182.0);
INSERT INTO soccer.match_mast VALUES (3.0, 'G', '2016-06-11', 'WIN', 'N', '2-1', 20001.0, 70017.0, 37831.0, 160540.0, 64.0, 268.0);
INSERT INTO soccer.match_mast VALUES (4.0, 'G', '2016-06-12', 'DRAW', 'N', '1-1', 20005.0, 70011.0, 62343.0, 160128.0, 0.0, 185.0);
INSERT INTO soccer.match_mast VALUES (5.0, 'G', '2016-06-12', 'WIN', 'N', '0-1', 20007.0, 70006.0, 43842.0, 160084.0, 125.0, 325.0);
INSERT INTO soccer.match_mast VALUES (6.0, 'G', '2016-06-12', 'WIN', 'N', '1-0', 20006.0, 70014.0, 33742.0, 160291.0, 2.0, 246.0);
INSERT INTO soccer.match_mast VALUES (7.0, 'G', '2016-06-13', 'WIN', 'N', '2-0', 20003.0, 70002.0, 43035.0, 160176.0, 89.0, 188.0);
INSERT INTO soccer.match_mast VALUES (8.0, 'G', '2016-06-13', 'WIN', 'N', '1-0', 20010.0, 70009.0, 29400.0, 160429.0, 360.0, 182.0);
INSERT INTO soccer.match_mast VALUES (9.0, 'G', '2016-06-13', 'DRAW', 'N', '1-1', 20008.0, 70010.0, 73419.0, 160335.0, 67.0, 194.0);
INSERT INTO soccer.match_mast VALUES (10.0, 'G', '2016-06-14', 'WIN', 'N', '0-2', 20004.0, 70005.0, 55408.0, 160244.0, 63.0, 189.0);
INSERT INTO soccer.match_mast VALUES (11.0, 'G', '2016-06-14', 'WIN', 'N', '0-2', 20001.0, 70018.0, 34424.0, 160197.0, 61.0, 305.0);
INSERT INTO soccer.match_mast VALUES (12.0, 'G', '2016-06-15', 'DRAW', 'N', '1-1', 20009.0, 70004.0, 38742.0, 160320.0, 15.0, 284.0);
INSERT INTO soccer.match_mast VALUES (13.0, 'G', '2016-06-15', 'WIN', 'N', '1-2', 20003.0, 70001.0, 38989.0, 160405.0, 62.0, 189.0);
INSERT INTO soccer.match_mast VALUES (14.0, 'G', '2016-06-15', 'DRAW', 'N', '1-1', 20007.0, 70015.0, 43576.0, 160477.0, 74.0, 206.0);
INSERT INTO soccer.match_mast VALUES (15.0, 'G', '2016-06-16', 'WIN', 'N', '2-0', 20005.0, 70013.0, 63670.0, 160154.0, 71.0, 374.0);
INSERT INTO soccer.match_mast VALUES (16.0, 'G', '2016-06-16', 'WIN', 'N', '2-1', 20002.0, 70003.0, 34033.0, 160540.0, 62.0, 212.0);
INSERT INTO soccer.match_mast VALUES (17.0, 'G', '2016-06-16', 'WIN', 'N', '0-2', 20004.0, 70016.0, 51043.0, 160262.0, 7.0, 411.0);
INSERT INTO soccer.match_mast VALUES (18.0, 'G', '2016-06-17', 'DRAW', 'N', '0-0', 20008.0, 70008.0, 73648.0, 160165.0, 6.0, 208.0);
INSERT INTO soccer.match_mast VALUES (19.0, 'G', '2016-06-17', 'WIN', 'N', '1-0', 20010.0, 70007.0, 29600.0, 160248.0, 2.0, 264.0);
INSERT INTO soccer.match_mast VALUES (20.0, 'G', '2016-06-17', 'DRAW', 'N', '2-2', 20009.0, 70005.0, 38376.0, 160086.0, 71.0, 280.0);
INSERT INTO soccer.match_mast VALUES (21.0, 'G', '2016-06-18', 'WIN', 'N', '3-0', 20006.0, 70010.0, 33409.0, 160429.0, 84.0, 120.0);
INSERT INTO soccer.match_mast VALUES (22.0, 'G', '2016-06-18', 'WIN', 'N', '3-0', 20001.0, 70004.0, 39493.0, 160064.0, 11.0, 180.0);
INSERT INTO soccer.match_mast VALUES (23.0, 'G', '2016-06-18', 'DRAW', 'N', '1-1', 20005.0, 70015.0, 60842.0, 160230.0, 61.0, 280.0);
INSERT INTO soccer.match_mast VALUES (24.0, 'G', '2016-06-19', 'DRAW', 'N', '0-0', 20007.0, 70011.0, 44291.0, 160314.0, 3.0, 200.0);
INSERT INTO soccer.match_mast VALUES (25.0, 'G', '2016-06-20', 'WIN', 'N', '0-1', 20004.0, 70016.0, 49752.0, 160005.0, 125.0, 328.0);
INSERT INTO soccer.match_mast VALUES (26.0, 'G', '2016-06-20', 'DRAW', 'N', '0-0', 20003.0, 70001.0, 45616.0, 160463.0, 60.0, 122.0);
INSERT INTO soccer.match_mast VALUES (27.0, 'G', '2016-06-21', 'WIN', 'N', '0-3', 20010.0, 70006.0, 28840.0, 160544.0, 62.0, 119.0);
INSERT INTO soccer.match_mast VALUES (28.0, 'G', '2016-06-21', 'DRAW', 'N', '0-0', 20009.0, 70012.0, 39051.0, 160392.0, 62.0, 301.0);
INSERT INTO soccer.match_mast VALUES (29.0, 'G', '2016-06-21', 'WIN', 'N', '0-1', 20005.0, 70017.0, 58874.0, 160520.0, 29.0, 244.0);
INSERT INTO soccer.match_mast VALUES (30.0, 'G', '2016-06-21', 'WIN', 'N', '0-1', 20007.0, 70018.0, 44125.0, 160177.0, 21.0, 195.0);
INSERT INTO soccer.match_mast VALUES (31.0, 'G', '2016-06-22', 'WIN', 'N', '0-2', 20002.0, 70013.0, 32836.0, 160504.0, 60.0, 300.0);
INSERT INTO soccer.match_mast VALUES (32.0, 'G', '2016-06-22', 'WIN', 'N', '2-1', 20001.0, 70008.0, 37245.0, 160085.0, 70.0, 282.0);
INSERT INTO soccer.match_mast VALUES (33.0, 'G', '2016-06-22', 'WIN', 'N', '2-1', 20008.0, 70009.0, 68714.0, 160220.0, 7.0, 244.0);
INSERT INTO soccer.match_mast VALUES (34.0, 'G', '2016-06-22', 'DRAW', 'N', '3-3', 20004.0, 70002.0, 55514.0, 160322.0, 70.0, 185.0);
INSERT INTO soccer.match_mast VALUES (35.0, 'G', '2016-06-23', 'WIN', 'N', '0-1', 20003.0, 70014.0, 44268.0, 160333.0, 79.0, 221.0);
INSERT INTO soccer.match_mast VALUES (36.0, 'G', '2016-06-23', 'WIN', 'N', '0-1', 20006.0, 70003.0, 34011.0, 160062.0, 63.0, 195.0);
INSERT INTO soccer.match_mast VALUES (37.0, 'R', '2016-06-25', 'WIN', 'P', '1-1', 20009.0, 70005.0, 38842.0, 160476.0, 126.0, 243.0);
INSERT INTO soccer.match_mast VALUES (38.0, 'R', '2016-06-25', 'WIN', 'N', '1-0', 20007.0, 70002.0, 44342.0, 160547.0, 5.0, 245.0);
INSERT INTO soccer.match_mast VALUES (39.0, 'R', '2016-06-26', 'WIN', 'N', '0-1', 20002.0, 70012.0, 33523.0, 160316.0, 61.0, 198.0);
INSERT INTO soccer.match_mast VALUES (40.0, 'R', '2016-06-26', 'WIN', 'N', '2-1', 20004.0, 70011.0, 56279.0, 160160.0, 238.0, 203.0);
INSERT INTO soccer.match_mast VALUES (41.0, 'R', '2016-06-26', 'WIN', 'N', '3-0', 20003.0, 70009.0, 44312.0, 160173.0, 62.0, 124.0);
INSERT INTO soccer.match_mast VALUES (42.0, 'R', '2016-06-27', 'WIN', 'N', '0-4', 20010.0, 70010.0, 28921.0, 160062.0, 3.0, 133.0);
INSERT INTO soccer.match_mast VALUES (43.0, 'R', '2016-06-27', 'WIN', 'N', '2-0', 20008.0, 70004.0, 76165.0, 160235.0, 63.0, 243.0);
INSERT INTO soccer.match_mast VALUES (44.0, 'R', '2016-06-28', 'WIN', 'N', '1-2', 20006.0, 70001.0, 33901.0, 160217.0, 5.0, 199.0);
INSERT INTO soccer.match_mast VALUES (45.0, 'Q', '2016-07-01', 'WIN', 'P', '1-1', 20005.0, 70003.0, 62940.0, 160316.0, 58.0, 181.0);
INSERT INTO soccer.match_mast VALUES (46.0, 'Q', '2016-07-02', 'WIN', 'N', '3-1', 20003.0, 70001.0, 45936.0, 160550.0, 14.0, 182.0);
INSERT INTO soccer.match_mast VALUES (47.0, 'Q', '2016-07-03', 'WIN', 'P', '1-1', 20001.0, 70007.0, 38764.0, 160163.0, 63.0, 181.0);
INSERT INTO soccer.match_mast VALUES (48.0, 'Q', '2016-07-04', 'WIN', 'N', '5-2', 20008.0, 70008.0, 76833.0, 160159.0, 16.0, 125.0);
INSERT INTO soccer.match_mast VALUES (49.0, 'S', '2016-07-07', 'WIN', 'N', '2-0', 20004.0, 70006.0, 55679.0, 160322.0, 2.0, 181.0);
INSERT INTO soccer.match_mast VALUES (50.0, 'S', '2016-07-08', 'WIN', 'N', '2-0', 20005.0, 70011.0, 64078.0, 160160.0, 126.0, 275.0);
INSERT INTO soccer.match_mast VALUES (51.0, 'F', '2016-07-11', 'WIN', 'N', '1-0', 20008.0, 70005.0, 75868.0, 160307.0, 161.0, 181.0);


--
-- Data for Name: penalty_goalkeeper; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.penalty_goalkeeper VALUES (37.0, 1213.0, 160278.0);
INSERT INTO soccer.penalty_goalkeeper VALUES (37.0, 1221.0, 160463.0);
INSERT INTO soccer.penalty_goalkeeper VALUES (45.0, 1213.0, 160278.0);
INSERT INTO soccer.penalty_goalkeeper VALUES (45.0, 1214.0, 160302.0);
INSERT INTO soccer.penalty_goalkeeper VALUES (47.0, 1208.0, 160163.0);
INSERT INTO soccer.penalty_goalkeeper VALUES (47.0, 1211.0, 160231.0);


--
-- Data for Name: penalty_shootout; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.penalty_shootout VALUES (1.0, 37.0, 1221.0, 160467.0, 'Y', 1.0);
INSERT INTO soccer.penalty_shootout VALUES (2.0, 37.0, 1213.0, 160297.0, 'Y', 2.0);
INSERT INTO soccer.penalty_shootout VALUES (3.0, 37.0, 1221.0, 160477.0, 'N', 3.0);
INSERT INTO soccer.penalty_shootout VALUES (4.0, 37.0, 1213.0, 160298.0, 'Y', 4.0);
INSERT INTO soccer.penalty_shootout VALUES (5.0, 37.0, 1221.0, 160476.0, 'Y', 5.0);
INSERT INTO soccer.penalty_shootout VALUES (6.0, 37.0, 1213.0, 160281.0, 'Y', 6.0);
INSERT INTO soccer.penalty_shootout VALUES (7.0, 37.0, 1221.0, 160470.0, 'Y', 7.0);
INSERT INTO soccer.penalty_shootout VALUES (8.0, 37.0, 1213.0, 160287.0, 'Y', 8.0);
INSERT INTO soccer.penalty_shootout VALUES (9.0, 37.0, 1221.0, 160469.0, 'Y', 9.0);
INSERT INTO soccer.penalty_shootout VALUES (10.0, 37.0, 1213.0, 160291.0, 'Y', 10.0);
INSERT INTO soccer.penalty_shootout VALUES (11.0, 45.0, 1214.0, 160322.0, 'Y', 1.0);
INSERT INTO soccer.penalty_shootout VALUES (12.0, 45.0, 1213.0, 160297.0, 'Y', 2.0);
INSERT INTO soccer.penalty_shootout VALUES (13.0, 45.0, 1214.0, 160316.0, 'Y', 3.0);
INSERT INTO soccer.penalty_shootout VALUES (14.0, 45.0, 1213.0, 160298.0, 'Y', 4.0);
INSERT INTO soccer.penalty_shootout VALUES (15.0, 45.0, 1214.0, 160314.0, 'Y', 5.0);
INSERT INTO soccer.penalty_shootout VALUES (16.0, 45.0, 1213.0, 160281.0, 'Y', 6.0);
INSERT INTO soccer.penalty_shootout VALUES (17.0, 45.0, 1214.0, 160320.0, 'Y', 7.0);
INSERT INTO soccer.penalty_shootout VALUES (18.0, 45.0, 1213.0, 160287.0, 'N', 8.0);
INSERT INTO soccer.penalty_shootout VALUES (19.0, 45.0, 1214.0, 160321.0, 'Y', 9.0);
INSERT INTO soccer.penalty_shootout VALUES (20.0, 47.0, 1211.0, 160251.0, 'Y', 1.0);
INSERT INTO soccer.penalty_shootout VALUES (21.0, 47.0, 1208.0, 160176.0, 'Y', 2.0);
INSERT INTO soccer.penalty_shootout VALUES (22.0, 47.0, 1211.0, 160253.0, 'N', 3.0);
INSERT INTO soccer.penalty_shootout VALUES (23.0, 47.0, 1208.0, 160183.0, 'N', 4.0);
INSERT INTO soccer.penalty_shootout VALUES (24.0, 47.0, 1211.0, 160234.0, 'Y', 5.0);
INSERT INTO soccer.penalty_shootout VALUES (25.0, 47.0, 1208.0, 160177.0, 'N', 6.0);
INSERT INTO soccer.penalty_shootout VALUES (26.0, 47.0, 1211.0, 160252.0, 'N', 7.0);
INSERT INTO soccer.penalty_shootout VALUES (27.0, 47.0, 1208.0, 160173.0, 'Y', 8.0);
INSERT INTO soccer.penalty_shootout VALUES (28.0, 47.0, 1211.0, 160235.0, 'N', 9.0);
INSERT INTO soccer.penalty_shootout VALUES (29.0, 47.0, 1208.0, 160180.0, 'N', 10.0);
INSERT INTO soccer.penalty_shootout VALUES (30.0, 47.0, 1211.0, 160244.0, 'Y', 11.0);
INSERT INTO soccer.penalty_shootout VALUES (31.0, 47.0, 1208.0, 160168.0, 'Y', 12.0);
INSERT INTO soccer.penalty_shootout VALUES (32.0, 47.0, 1211.0, 160246.0, 'Y', 13.0);
INSERT INTO soccer.penalty_shootout VALUES (33.0, 47.0, 1208.0, 160169.0, 'Y', 14.0);
INSERT INTO soccer.penalty_shootout VALUES (34.0, 47.0, 1211.0, 160238.0, 'Y', 15.0);
INSERT INTO soccer.penalty_shootout VALUES (35.0, 47.0, 1208.0, 160165.0, 'Y', 16.0);
INSERT INTO soccer.penalty_shootout VALUES (36.0, 47.0, 1211.0, 160237.0, 'N', 17.0);
INSERT INTO soccer.penalty_shootout VALUES (37.0, 47.0, 1208.0, 160166.0, 'Y', 18.0);


--
-- Data for Name: player_booked; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.player_booked VALUES (1, 1.0, 1216.0, 160349.0, 32.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (2, 1.0, 1216.0, 160355.0, 45.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (3, 1.0, 1207.0, 160159.0, 69.0, 'Y', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (4, 1.0, 1216.0, 160360.0, 78.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (5, 2.0, 1221.0, 160470.0, 14.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (6, 2.0, 1201.0, 160013.0, 23.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (7, 2.0, 1201.0, 160013.0, 36.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (8, 2.0, 1201.0, 160014.0, 63.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (9, 2.0, 1221.0, 160472.0, 66.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (10, 2.0, 1201.0, 160015.0, 89.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (11, 2.0, 1201.0, 160009.0, 93.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (12, 3.0, 1218.0, 160401.0, 2.0, '', 'ST', 2.0);
INSERT INTO soccer.player_booked VALUES (13, 3.0, 1218.0, 160406.0, 31.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (14, 3.0, 1218.0, 160408.0, 78.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (15, 3.0, 1218.0, 160411.0, 80.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (16, 3.0, 1218.0, 160407.0, 83.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (17, 4.0, 1206.0, 160120.0, 62.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (18, 4.0, 1217.0, 160377.0, 72.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (19, 5.0, 1222.0, 160505.0, 31.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (20, 5.0, 1222.0, 160490.0, 48.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (21, 5.0, 1204.0, 160077.0, 80.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (22, 5.0, 1222.0, 160502.0, 91.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (23, 6.0, 1213.0, 160290.0, 65.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (24, 6.0, 1212.0, 160258.0, 69.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (25, 6.0, 1213.0, 160284.0, 89.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (26, 7.0, 1223.0, 160518.0, 68.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (27, 8.0, 1205.0, 160100.0, 61.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (28, 9.0, 1215.0, 160336.0, 43.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (29, 9.0, 1220.0, 160445.0, 61.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (30, 9.0, 1215.0, 160341.0, 77.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (31, 10.0, 1211.0, 160236.0, 65.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (32, 10.0, 1211.0, 160248.0, 75.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (33, 10.0, 1211.0, 160235.0, 78.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (34, 10.0, 1211.0, 160245.0, 84.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (35, 10.0, 1203.0, 160057.0, 93.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (36, 11.0, 1202.0, 160027.0, 33.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (37, 11.0, 1202.0, 160027.0, 66.0, 'Y', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (38, 11.0, 1209.0, 160204.0, 80.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (39, 12.0, 1210.0, 160227.0, 2.0, '', 'ST', 2.0);
INSERT INTO soccer.player_booked VALUES (40, 12.0, 1210.0, 160221.0, 55.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (41, 13.0, 1218.0, 160395.0, 46.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (42, 14.0, 1221.0, 160480.0, 2.0, '', 'ST', 2.0);
INSERT INTO soccer.player_booked VALUES (43, 14.0, 1216.0, 160361.0, 22.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (44, 14.0, 1216.0, 160357.0, 24.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (45, 14.0, 1216.0, 160367.0, 37.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (46, 14.0, 1221.0, 160477.0, 50.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (47, 14.0, 1216.0, 160352.0, 76.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (48, 15.0, 1201.0, 160015.0, 55.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (49, 15.0, 1201.0, 160011.0, 81.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (50, 15.0, 1207.0, 160152.0, 88.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (51, 16.0, 1224.0, 160535.0, 61.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (52, 17.0, 1223.0, 160528.0, 40.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (53, 17.0, 1212.0, 160272.0, 63.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (54, 17.0, 1223.0, 160523.0, 67.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (55, 17.0, 1212.0, 160266.0, 87.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (56, 17.0, 1212.0, 160259.0, 90.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (57, 18.0, 1208.0, 160175.0, 3.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (58, 18.0, 1213.0, 160294.0, 3.0, '', 'ST', 2.0);
INSERT INTO soccer.player_booked VALUES (59, 18.0, 1208.0, 160177.0, 34.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (60, 18.0, 1213.0, 160293.0, 45.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (61, 18.0, 1213.0, 160288.0, 55.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (62, 18.0, 1208.0, 160165.0, 67.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (63, 19.0, 1211.0, 160242.0, 69.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (64, 19.0, 1220.0, 160447.0, 89.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (65, 19.0, 1211.0, 160231.0, 94.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (66, 20.0, 1204.0, 160080.0, 14.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (67, 20.0, 1205.0, 160101.0, 72.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (68, 20.0, 1204.0, 160081.0, 74.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (69, 20.0, 1204.0, 160078.0, 88.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (70, 21.0, 1219.0, 160424.0, 2.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (71, 21.0, 1222.0, 160504.0, 9.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (72, 21.0, 1222.0, 160500.0, 41.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (73, 22.0, 1215.0, 160334.0, 42.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (74, 22.0, 1203.0, 160056.0, 49.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (75, 23.0, 1209.0, 160199.0, 2.0, '', 'ST', 2.0);
INSERT INTO soccer.player_booked VALUES (76, 23.0, 1210.0, 160229.0, 42.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (77, 23.0, 1210.0, 160227.0, 75.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (78, 23.0, 1210.0, 160216.0, 77.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (79, 23.0, 1209.0, 160192.0, 81.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (80, 23.0, 1209.0, 160197.0, 83.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (81, 24.0, 1202.0, 160028.0, 6.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (82, 24.0, 1214.0, 160321.0, 31.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (83, 24.0, 1214.0, 160307.0, 40.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (84, 24.0, 1202.0, 160037.0, 47.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (85, 24.0, 1202.0, 160029.0, 78.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (86, 24.0, 1202.0, 160042.0, 86.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (87, 25.0, 1201.0, 160012.0, 6.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (88, 25.0, 1216.0, 160353.0, 54.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (89, 25.0, 1201.0, 160017.0, 85.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (90, 25.0, 1216.0, 160356.0, 85.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (91, 25.0, 1216.0, 160364.0, 91.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (92, 25.0, 1201.0, 160007.0, 95.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (93, 26.0, 1207.0, 160147.0, 25.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (94, 26.0, 1207.0, 160145.0, 83.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (95, 27.0, 1224.0, 160551.0, 16.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (96, 27.0, 1217.0, 160383.0, 64.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (97, 28.0, 1218.0, 160409.0, 24.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (98, 28.0, 1206.0, 160119.0, 52.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (99, 29.0, 1223.0, 160520.0, 25.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (100, 29.0, 1223.0, 160513.0, 38.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (101, 29.0, 1213.0, 160290.0, 60.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (102, 31.0, 1222.0, 160491.0, 35.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (103, 31.0, 1205.0, 160108.0, 36.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (104, 31.0, 1205.0, 160107.0, 39.0, 'Y', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (105, 31.0, 1222.0, 160490.0, 50.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (106, 31.0, 1205.0, 160112.0, 87.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (107, 32.0, 1204.0, 160087.0, 29.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (108, 32.0, 1204.0, 160079.0, 70.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (109, 32.0, 1204.0, 160076.0, 70.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (110, 32.0, 1204.0, 160085.0, 88.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (111, 33.0, 1210.0, 160218.0, 36.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (112, 33.0, 1210.0, 160230.0, 51.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (113, 33.0, 1202.0, 160045.0, 70.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (114, 33.0, 1210.0, 160220.0, 78.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (115, 33.0, 1210.0, 160208.0, 82.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (116, 34.0, 1209.0, 160190.0, 13.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (117, 34.0, 1209.0, 160191.0, 28.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (118, 34.0, 1209.0, 160203.0, 34.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (119, 34.0, 1209.0, 160202.0, 56.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (120, 35.0, 1211.0, 160233.0, 39.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (121, 35.0, 1215.0, 160343.0, 39.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (122, 35.0, 1215.0, 160332.0, 73.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (123, 35.0, 1211.0, 160234.0, 78.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (124, 35.0, 1211.0, 160253.0, 87.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (125, 35.0, 1211.0, 160251.0, 93.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (126, 36.0, 1203.0, 160064.0, 1.0, '', 'ST', 1.0);
INSERT INTO soccer.player_booked VALUES (127, 36.0, 1203.0, 160055.0, 30.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (128, 36.0, 1220.0, 160451.0, 72.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (129, 37.0, 1221.0, 160470.0, 55.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (130, 37.0, 1213.0, 160282.0, 58.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (131, 38.0, 1212.0, 160266.0, 44.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (132, 38.0, 1224.0, 160538.0, 58.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (133, 38.0, 1212.0, 160267.0, 67.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (134, 38.0, 1224.0, 160544.0, 92.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (135, 39.0, 1214.0, 160318.0, 78.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (136, 40.0, 1215.0, 160328.0, 25.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (137, 40.0, 1207.0, 160152.0, 27.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (138, 40.0, 1215.0, 160334.0, 41.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (139, 40.0, 1207.0, 160147.0, 44.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (140, 40.0, 1215.0, 160329.0, 66.0, 'Y', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (141, 40.0, 1215.0, 160343.0, 72.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (142, 41.0, 1218.0, 160407.0, 2.0, '', 'ST', 2.0);
INSERT INTO soccer.player_booked VALUES (143, 41.0, 1218.0, 160401.0, 13.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (144, 41.0, 1208.0, 160169.0, 46.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (145, 41.0, 1208.0, 160168.0, 67.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (146, 42.0, 1209.0, 160192.0, 34.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (147, 42.0, 1209.0, 160194.0, 47.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (148, 42.0, 1209.0, 160196.0, 61.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (149, 42.0, 1203.0, 160056.0, 67.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (150, 42.0, 1203.0, 160065.0, 89.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (151, 42.0, 1203.0, 160061.0, 91.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (152, 42.0, 1209.0, 160207.0, 92.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (153, 43.0, 1219.0, 160431.0, 2.0, '', 'ST', 2.0);
INSERT INTO soccer.player_booked VALUES (154, 43.0, 1211.0, 160238.0, 24.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (155, 43.0, 1219.0, 160436.0, 41.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (156, 43.0, 1211.0, 160252.0, 54.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (157, 43.0, 1211.0, 160245.0, 89.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (158, 43.0, 1219.0, 160427.0, 89.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (159, 43.0, 1219.0, 160421.0, 89.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (160, 44.0, 1210.0, 160208.0, 38.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (161, 44.0, 1206.0, 160137.0, 47.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (162, 44.0, 1210.0, 160222.0, 65.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (163, 45.0, 1214.0, 160318.0, 2.0, '', 'ST', 2.0);
INSERT INTO soccer.player_booked VALUES (164, 45.0, 1213.0, 160282.0, 42.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (165, 45.0, 1213.0, 160281.0, 66.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (166, 45.0, 1214.0, 160310.0, 70.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (167, 45.0, 1213.0, 160290.0, 89.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (168, 46.0, 1224.0, 160535.0, 5.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (169, 46.0, 1224.0, 160533.0, 16.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (170, 46.0, 1224.0, 160536.0, 24.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (171, 46.0, 1203.0, 160061.0, 59.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (172, 46.0, 1224.0, 160544.0, 75.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (173, 46.0, 1203.0, 160050.0, 85.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (174, 47.0, 1211.0, 160247.0, 56.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (175, 47.0, 1211.0, 160238.0, 57.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (176, 47.0, 1211.0, 160246.0, 59.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (177, 47.0, 1208.0, 160168.0, 90.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (178, 47.0, 1208.0, 160180.0, 112.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (179, 48.0, 1210.0, 160221.0, 58.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (180, 48.0, 1207.0, 160149.0, 75.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (181, 49.0, 1224.0, 160540.0, 8.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (182, 49.0, 1224.0, 160533.0, 62.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (183, 49.0, 1214.0, 160303.0, 71.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (184, 49.0, 1214.0, 160322.0, 72.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (185, 49.0, 1224.0, 160547.0, 88.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (186, 50.0, 1208.0, 160177.0, 1.0, '', 'ST', 1.0);
INSERT INTO soccer.player_booked VALUES (187, 50.0, 1208.0, 160172.0, 36.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (188, 50.0, 1207.0, 160143.0, 43.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (189, 50.0, 1208.0, 160180.0, 45.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (190, 50.0, 1208.0, 160173.0, 50.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (191, 50.0, 1207.0, 160152.0, 75.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (192, 51.0, 1214.0, 160304.0, 34.0, '', 'NT', 1.0);
INSERT INTO soccer.player_booked VALUES (193, 51.0, 1214.0, 160313.0, 62.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (194, 51.0, 1207.0, 160149.0, 80.0, '', 'NT', 2.0);
INSERT INTO soccer.player_booked VALUES (195, 51.0, 1214.0, 160308.0, 95.0, '', 'ET', 1.0);
INSERT INTO soccer.player_booked VALUES (196, 51.0, 1207.0, 160153.0, 97.0, '', 'ET', 1.0);
INSERT INTO soccer.player_booked VALUES (197, 51.0, 1214.0, 160318.0, 98.0, '', 'ET', 1.0);
INSERT INTO soccer.player_booked VALUES (198, 51.0, 1207.0, 160145.0, 107.0, '', 'ET', 2.0);
INSERT INTO soccer.player_booked VALUES (199, 51.0, 1207.0, 160155.0, 115.0, '', 'ET', 2.0);
INSERT INTO soccer.player_booked VALUES (200, 51.0, 1214.0, 160306.0, 119.0, '', 'ET', 2.0);
INSERT INTO soccer.player_booked VALUES (201, 51.0, 1214.0, 160302.0, 122.0, '', 'ET', 2.0);


--
-- Data for Name: player_in_out; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.player_in_out VALUES (1, 1.0, 1207.0, 160151.0, 'I', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (2, 1.0, 1207.0, 160160.0, 'O', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (3, 1.0, 1207.0, 160161.0, 'I', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (4, 1.0, 1207.0, 160161.0, 'O', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (5, 1.0, 1207.0, 160157.0, 'I', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (6, 1.0, 1207.0, 160154.0, 'O', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (7, 1.0, 1216.0, 160365.0, 'I', 61.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (8, 1.0, 1216.0, 160366.0, 'O', 61.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (9, 1.0, 1216.0, 160357.0, 'I', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (10, 1.0, 1216.0, 160363.0, 'O', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (11, 1.0, 1216.0, 160364.0, 'I', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (12, 1.0, 1216.0, 160360.0, 'O', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (13, 2.0, 1201.0, 160014.0, 'I', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (14, 2.0, 1201.0, 160019.0, 'O', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (15, 2.0, 1201.0, 160021.0, 'I', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (16, 2.0, 1201.0, 160018.0, 'O', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (17, 2.0, 1201.0, 160022.0, 'I', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (18, 2.0, 1201.0, 160023.0, 'O', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (19, 2.0, 1221.0, 160480.0, 'I', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (20, 2.0, 1221.0, 160481.0, 'O', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (21, 2.0, 1221.0, 160475.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (22, 2.0, 1221.0, 160473.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (23, 2.0, 1221.0, 160474.0, 'I', 88.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (24, 2.0, 1221.0, 160476.0, 'O', 88.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (25, 3.0, 1218.0, 160413.0, 'I', 59.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (26, 3.0, 1218.0, 160412.0, 'O', 59.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (27, 3.0, 1218.0, 160403.0, 'I', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (28, 3.0, 1218.0, 160406.0, 'O', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (29, 3.0, 1218.0, 160410.0, 'I', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (30, 3.0, 1218.0, 160411.0, 'O', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (31, 3.0, 1224.0, 160543.0, 'I', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (32, 3.0, 1224.0, 160541.0, 'O', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (33, 3.0, 1224.0, 160550.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (34, 3.0, 1224.0, 160546.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (35, 3.0, 1224.0, 160537.0, 'I', 88.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (36, 3.0, 1224.0, 160544.0, 'O', 88.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (37, 4.0, 1206.0, 160133.0, 'I', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (38, 4.0, 1206.0, 160136.0, 'O', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (39, 4.0, 1206.0, 160131.0, 'I', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (40, 4.0, 1206.0, 160132.0, 'O', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (41, 4.0, 1217.0, 160386.0, 'I', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (42, 4.0, 1217.0, 160381.0, 'O', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (43, 4.0, 1217.0, 160380.0, 'I', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (44, 4.0, 1217.0, 160376.0, 'O', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (45, 4.0, 1217.0, 160383.0, 'I', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (46, 4.0, 1217.0, 160391.0, 'O', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (47, 5.0, 1204.0, 160090.0, 'I', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (48, 5.0, 1204.0, 160085.0, 'O', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (49, 5.0, 1204.0, 160075.0, 'I', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (50, 5.0, 1204.0, 160086.0, 'O', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (51, 5.0, 1204.0, 160092.0, 'I', 3.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (52, 5.0, 1204.0, 160091.0, 'O', 3.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (53, 5.0, 1222.0, 160502.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (54, 5.0, 1222.0, 160498.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (55, 5.0, 1222.0, 160504.0, 'I', 65.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (56, 5.0, 1222.0, 160494.0, 'O', 65.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (57, 5.0, 1222.0, 160506.0, 'I', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (58, 5.0, 1222.0, 160505.0, 'O', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (59, 6.0, 1212.0, 160266.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (60, 6.0, 1212.0, 160265.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (61, 6.0, 1212.0, 160276.0, 'I', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (62, 6.0, 1212.0, 160269.0, 'O', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (63, 6.0, 1212.0, 160272.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (64, 6.0, 1212.0, 160257.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (65, 6.0, 1213.0, 160289.0, 'I', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (66, 6.0, 1213.0, 160293.0, 'O', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (67, 6.0, 1213.0, 160288.0, 'I', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (68, 6.0, 1213.0, 160287.0, 'O', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (69, 6.0, 1213.0, 160294.0, 'I', 88.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (70, 6.0, 1213.0, 160290.0, 'O', 88.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (71, 7.0, 1208.0, 160179.0, 'I', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (72, 7.0, 1208.0, 160173.0, 'O', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (73, 7.0, 1208.0, 160180.0, 'I', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (74, 7.0, 1208.0, 160174.0, 'O', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (75, 7.0, 1223.0, 160528.0, 'I', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (76, 7.0, 1223.0, 160529.0, 'O', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (77, 7.0, 1223.0, 160526.0, 'I', 73.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (78, 7.0, 1223.0, 160519.0, 'O', 73.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (79, 8.0, 1205.0, 160113.0, 'I', 75.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (80, 8.0, 1205.0, 160114.0, 'O', 75.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (81, 8.0, 1205.0, 160112.0, 'I', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (82, 8.0, 1205.0, 160096.0, 'O', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (83, 8.0, 1205.0, 160107.0, 'I', 88.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (84, 8.0, 1205.0, 160110.0, 'O', 88.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (85, 8.0, 1219.0, 160433.0, 'I', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (86, 8.0, 1219.0, 160435.0, 'O', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (87, 8.0, 1219.0, 160432.0, 'I', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (88, 8.0, 1219.0, 160428.0, 'O', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (89, 8.0, 1219.0, 160437.0, 'I', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (90, 8.0, 1219.0, 160436.0, 'O', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (91, 9.0, 1215.0, 160337.0, 'I', 64.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (92, 9.0, 1215.0, 160345.0, 'O', 64.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (93, 9.0, 1215.0, 160342.0, 'I', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (94, 9.0, 1215.0, 160335.0, 'O', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (95, 9.0, 1215.0, 160338.0, 'I', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (96, 9.0, 1215.0, 160336.0, 'O', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (97, 9.0, 1220.0, 160444.0, 'I', 45.0, 'NT', 1.0);
INSERT INTO soccer.player_in_out VALUES (98, 9.0, 1220.0, 160446.0, 'O', 45.0, 'NT', 1.0);
INSERT INTO soccer.player_in_out VALUES (99, 9.0, 1220.0, 160458.0, 'I', 59.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (100, 9.0, 1220.0, 160457.0, 'O', 59.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (101, 9.0, 1220.0, 160449.0, 'I', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (102, 9.0, 1220.0, 160455.0, 'O', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (103, 10.0, 1203.0, 160068.0, 'I', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (104, 10.0, 1203.0, 160063.0, 'O', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (105, 10.0, 1203.0, 160069.0, 'I', 73.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (106, 10.0, 1203.0, 160067.0, 'O', 73.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (107, 10.0, 1203.0, 160058.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (108, 10.0, 1203.0, 160051.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (109, 10.0, 1211.0, 160238.0, 'I', 58.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (110, 10.0, 1211.0, 160237.0, 'O', 58.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (111, 10.0, 1211.0, 160250.0, 'I', 75.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (112, 10.0, 1211.0, 160248.0, 'O', 75.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (113, 10.0, 1211.0, 160245.0, 'I', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (114, 10.0, 1211.0, 160242.0, 'O', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (115, 11.0, 1202.0, 160041.0, 'I', 59.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (116, 11.0, 1202.0, 160040.0, 'O', 59.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (117, 11.0, 1202.0, 160046.0, 'I', 65.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (118, 11.0, 1202.0, 160045.0, 'O', 65.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (119, 11.0, 1202.0, 160042.0, 'I', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (120, 11.0, 1202.0, 160037.0, 'O', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (121, 11.0, 1209.0, 160206.0, 'I', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (122, 11.0, 1209.0, 160207.0, 'O', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (123, 11.0, 1209.0, 160200.0, 'I', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (124, 11.0, 1209.0, 160197.0, 'O', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (125, 11.0, 1209.0, 160195.0, 'I', 89.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (126, 11.0, 1209.0, 160204.0, 'O', 89.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (127, 12.0, 1210.0, 160227.0, 'I', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (128, 12.0, 1210.0, 160230.0, 'O', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (129, 12.0, 1210.0, 160211.0, 'I', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (130, 12.0, 1210.0, 160229.0, 'O', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (131, 12.0, 1214.0, 160316.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (132, 12.0, 1214.0, 160314.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (133, 12.0, 1214.0, 160321.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (134, 12.0, 1214.0, 160313.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (135, 12.0, 1214.0, 160319.0, 'I', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (136, 12.0, 1214.0, 160311.0, 'O', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (137, 13.0, 1217.0, 160380.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (138, 13.0, 1217.0, 160383.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (139, 13.0, 1217.0, 160376.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (140, 13.0, 1217.0, 160381.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (141, 13.0, 1217.0, 160386.0, 'I', 75.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (142, 13.0, 1217.0, 160390.0, 'O', 75.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (143, 13.0, 1218.0, 160413.0, 'I', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (144, 13.0, 1218.0, 160403.0, 'O', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (145, 13.0, 1218.0, 160402.0, 'I', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (146, 13.0, 1218.0, 160411.0, 'O', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (147, 13.0, 1218.0, 160412.0, 'I', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (148, 13.0, 1218.0, 160408.0, 'O', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (149, 14.0, 1216.0, 160358.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (150, 14.0, 1216.0, 160359.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (151, 14.0, 1216.0, 160350.0, 'I', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (152, 14.0, 1216.0, 160355.0, 'O', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (153, 14.0, 1216.0, 160366.0, 'I', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (154, 14.0, 1216.0, 160368.0, 'O', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (155, 14.0, 1221.0, 160480.0, 'I', 63.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (156, 14.0, 1221.0, 160482.0, 'O', 63.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (157, 14.0, 1221.0, 160466.0, 'I', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (158, 14.0, 1221.0, 160473.0, 'O', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (159, 14.0, 1221.0, 160483.0, 'I', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (160, 14.0, 1221.0, 160476.0, 'O', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (161, 15.0, 1201.0, 160018.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (162, 15.0, 1201.0, 160008.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (163, 15.0, 1201.0, 160019.0, 'I', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (164, 15.0, 1201.0, 160015.0, 'O', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (165, 15.0, 1201.0, 160010.0, 'I', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (166, 15.0, 1201.0, 160005.0, 'O', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (167, 15.0, 1207.0, 160155.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (168, 15.0, 1207.0, 160161.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (169, 15.0, 1207.0, 160160.0, 'I', 68.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (170, 15.0, 1207.0, 160151.0, 'O', 68.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (171, 15.0, 1207.0, 160158.0, 'I', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (172, 15.0, 1207.0, 160159.0, 'O', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (173, 16.0, 1206.0, 160138.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (174, 16.0, 1206.0, 160137.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (175, 16.0, 1206.0, 160134.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (176, 16.0, 1206.0, 160132.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (177, 16.0, 1206.0, 160135.0, 'I', 73.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (178, 16.0, 1206.0, 160130.0, 'O', 73.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (179, 16.0, 1224.0, 160541.0, 'I', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (180, 16.0, 1224.0, 160543.0, 'O', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (181, 16.0, 1224.0, 160546.0, 'I', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (182, 16.0, 1224.0, 160550.0, 'O', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (183, 17.0, 1212.0, 160275.0, 'I', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (184, 17.0, 1212.0, 160272.0, 'O', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (185, 17.0, 1212.0, 160270.0, 'I', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (186, 17.0, 1212.0, 160276.0, 'O', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (187, 17.0, 1212.0, 160265.0, 'I', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (188, 17.0, 1212.0, 160268.0, 'O', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (189, 17.0, 1223.0, 160529.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (190, 17.0, 1223.0, 160528.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (191, 17.0, 1223.0, 160516.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (192, 17.0, 1223.0, 160523.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (193, 17.0, 1223.0, 160526.0, 'I', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (194, 17.0, 1223.0, 160519.0, 'O', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (195, 18.0, 1208.0, 160179.0, 'I', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (196, 18.0, 1208.0, 160174.0, 'O', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (197, 18.0, 1208.0, 160182.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (198, 18.0, 1208.0, 160173.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (199, 18.0, 1213.0, 160289.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (200, 18.0, 1213.0, 160293.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (201, 18.0, 1213.0, 160290.0, 'I', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (202, 18.0, 1213.0, 160287.0, 'O', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (203, 18.0, 1213.0, 160294.0, 'I', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (204, 18.0, 1213.0, 160288.0, 'O', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (205, 19.0, 1211.0, 160253.0, 'I', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (206, 19.0, 1211.0, 160252.0, 'O', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (207, 19.0, 1211.0, 160245.0, 'I', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (208, 19.0, 1211.0, 160242.0, 'O', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (209, 19.0, 1211.0, 160247.0, 'I', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (210, 19.0, 1211.0, 160243.0, 'O', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (211, 19.0, 1220.0, 160455.0, 'I', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (212, 19.0, 1220.0, 160448.0, 'I', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (213, 19.0, 1220.0, 160449.0, 'O', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (214, 19.0, 1220.0, 160451.0, 'O', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (215, 19.0, 1220.0, 160457.0, 'I', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (216, 19.0, 1220.0, 160458.0, 'O', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (217, 20.0, 1204.0, 160083.0, 'I', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (218, 20.0, 1204.0, 160084.0, 'O', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (219, 20.0, 1204.0, 160075.0, 'I', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (220, 20.0, 1204.0, 160086.0, 'O', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (221, 20.0, 1204.0, 160079.0, 'I', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (222, 20.0, 1204.0, 160077.0, 'O', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (223, 20.0, 1205.0, 160115.0, 'I', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (224, 20.0, 1205.0, 160112.0, 'I', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (225, 20.0, 1205.0, 160113.0, 'O', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (226, 20.0, 1205.0, 160111.0, 'O', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (227, 20.0, 1205.0, 160114.0, 'I', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (228, 20.0, 1205.0, 160108.0, 'O', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (229, 21.0, 1219.0, 160426.0, 'I', 64.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (230, 21.0, 1219.0, 160431.0, 'O', 64.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (231, 21.0, 1219.0, 160430.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (232, 21.0, 1219.0, 160428.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (233, 21.0, 1219.0, 160418.0, 'I', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (234, 21.0, 1219.0, 160421.0, 'O', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (235, 21.0, 1222.0, 160497.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (236, 21.0, 1222.0, 160495.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (237, 21.0, 1222.0, 160499.0, 'I', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (238, 21.0, 1222.0, 160498.0, 'O', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (239, 21.0, 1222.0, 160503.0, 'I', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (240, 21.0, 1222.0, 160501.0, 'O', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (241, 22.0, 1203.0, 160063.0, 'I', 57.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (242, 22.0, 1203.0, 160060.0, 'O', 57.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (243, 22.0, 1203.0, 160068.0, 'I', 64.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (244, 22.0, 1203.0, 160058.0, 'O', 64.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (245, 22.0, 1203.0, 160066.0, 'I', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (246, 22.0, 1203.0, 160067.0, 'O', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (247, 22.0, 1215.0, 160337.0, 'I', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (248, 22.0, 1215.0, 160336.0, 'O', 62.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (249, 22.0, 1215.0, 160338.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (250, 22.0, 1215.0, 160335.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (251, 22.0, 1215.0, 160342.0, 'I', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (252, 22.0, 1215.0, 160343.0, 'O', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (253, 23.0, 1209.0, 160201.0, 'I', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (254, 23.0, 1209.0, 160205.0, 'I', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (255, 23.0, 1209.0, 160206.0, 'O', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (256, 23.0, 1209.0, 160200.0, 'O', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (257, 23.0, 1209.0, 160207.0, 'I', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (258, 23.0, 1209.0, 160191.0, 'O', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (259, 23.0, 1210.0, 160223.0, 'I', 65.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (260, 23.0, 1210.0, 160222.0, 'O', 65.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (261, 23.0, 1210.0, 160227.0, 'I', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (262, 23.0, 1210.0, 160226.0, 'O', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (263, 23.0, 1210.0, 160228.0, 'I', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (264, 23.0, 1210.0, 160230.0, 'O', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (265, 24.0, 1202.0, 160042.0, 'I', 65.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (266, 24.0, 1202.0, 160034.0, 'O', 65.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (267, 24.0, 1202.0, 160044.0, 'I', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (268, 24.0, 1202.0, 160041.0, 'O', 85.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (269, 24.0, 1202.0, 160033.0, 'I', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (270, 24.0, 1202.0, 160038.0, 'O', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (271, 24.0, 1214.0, 160313.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (272, 24.0, 1214.0, 160321.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (273, 24.0, 1214.0, 160319.0, 'I', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (274, 24.0, 1214.0, 160311.0, 'O', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (275, 24.0, 1214.0, 160315.0, 'I', 89.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (276, 24.0, 1214.0, 160320.0, 'O', 89.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (277, 25.0, 1201.0, 160020.0, 'I', 59.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (278, 25.0, 1201.0, 160023.0, 'O', 59.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (279, 25.0, 1201.0, 160018.0, 'I', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (280, 25.0, 1201.0, 160016.0, 'O', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (281, 25.0, 1201.0, 160013.0, 'I', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (282, 25.0, 1201.0, 160012.0, 'O', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (283, 25.0, 1216.0, 160362.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (284, 25.0, 1216.0, 160361.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (285, 25.0, 1216.0, 160364.0, 'I', 57.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (286, 25.0, 1216.0, 160365.0, 'O', 57.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (287, 25.0, 1216.0, 160366.0, 'I', 68.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (288, 25.0, 1216.0, 160360.0, 'O', 68.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (289, 26.0, 1207.0, 160154.0, 'I', 63.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (290, 26.0, 1207.0, 160151.0, 'O', 63.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (291, 26.0, 1207.0, 160153.0, 'I', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (292, 26.0, 1207.0, 160160.0, 'O', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (293, 26.0, 1221.0, 160482.0, 'I', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (294, 26.0, 1221.0, 160480.0, 'O', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (295, 26.0, 1221.0, 160474.0, 'I', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (296, 26.0, 1221.0, 160476.0, 'O', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (297, 26.0, 1221.0, 160466.0, 'I', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (298, 26.0, 1221.0, 160481.0, 'O', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (299, 27.0, 1217.0, 160372.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (300, 27.0, 1217.0, 160373.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (301, 27.0, 1217.0, 160381.0, 'I', 52.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (302, 27.0, 1217.0, 160386.0, 'O', 52.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (303, 27.0, 1217.0, 160384.0, 'I', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (304, 27.0, 1217.0, 160391.0, 'O', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (305, 27.0, 1224.0, 160541.0, 'I', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (306, 27.0, 1224.0, 160540.0, 'O', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (307, 27.0, 1224.0, 160542.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (308, 27.0, 1224.0, 160543.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (309, 27.0, 1224.0, 160548.0, 'I', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (310, 27.0, 1224.0, 160547.0, 'O', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (311, 28.0, 1206.0, 160136.0, 'I', 56.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (312, 28.0, 1206.0, 160133.0, 'O', 56.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (313, 28.0, 1206.0, 160126.0, 'I', 61.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (314, 28.0, 1206.0, 160130.0, 'O', 61.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (315, 28.0, 1206.0, 160134.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (316, 28.0, 1206.0, 160137.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (317, 28.0, 1218.0, 160402.0, 'I', 57.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (318, 28.0, 1218.0, 160403.0, 'O', 57.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (319, 28.0, 1218.0, 160396.0, 'I', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (320, 28.0, 1218.0, 160409.0, 'O', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (321, 28.0, 1218.0, 160400.0, 'I', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (322, 28.0, 1218.0, 160411.0, 'O', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (323, 29.0, 1213.0, 160287.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (324, 29.0, 1213.0, 160296.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (325, 29.0, 1213.0, 160288.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (326, 29.0, 1213.0, 160290.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (327, 29.0, 1213.0, 160295.0, 'I', 3.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (328, 29.0, 1213.0, 160298.0, 'O', 3.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (329, 29.0, 1223.0, 160519.0, 'I', 73.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (330, 29.0, 1223.0, 160526.0, 'O', 73.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (331, 29.0, 1223.0, 160524.0, 'I', 1.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (332, 29.0, 1223.0, 160529.0, 'O', 1.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (333, 30.0, 1208.0, 160179.0, 'I', 55.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (334, 30.0, 1208.0, 160174.0, 'O', 55.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (335, 30.0, 1208.0, 160180.0, 'I', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (336, 30.0, 1208.0, 160175.0, 'O', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (337, 30.0, 1208.0, 160167.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (338, 30.0, 1208.0, 160165.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (339, 30.0, 1212.0, 160274.0, 'I', 59.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (340, 30.0, 1212.0, 160276.0, 'O', 59.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (341, 30.0, 1212.0, 160270.0, 'I', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (342, 30.0, 1212.0, 160272.0, 'O', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (343, 30.0, 1212.0, 160275.0, 'I', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (344, 30.0, 1212.0, 160268.0, 'O', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (345, 31.0, 1205.0, 160115.0, 'I', 57.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (346, 31.0, 1205.0, 160107.0, 'O', 57.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (347, 31.0, 1205.0, 160112.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (348, 31.0, 1205.0, 160104.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (349, 31.0, 1205.0, 160105.0, 'I', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (350, 31.0, 1205.0, 160108.0, 'O', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (351, 31.0, 1222.0, 160498.0, 'I', 61.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (352, 31.0, 1222.0, 160502.0, 'O', 61.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (353, 31.0, 1222.0, 160499.0, 'I', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (354, 31.0, 1222.0, 160506.0, 'O', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (355, 31.0, 1222.0, 160505.0, 'I', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (356, 31.0, 1222.0, 160504.0, 'O', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (357, 32.0, 1204.0, 160083.0, 'I', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (358, 32.0, 1204.0, 160087.0, 'O', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (359, 32.0, 1204.0, 160088.0, 'I', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (360, 32.0, 1204.0, 160092.0, 'O', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (361, 32.0, 1204.0, 160090.0, 'I', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (362, 32.0, 1204.0, 160085.0, 'O', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (363, 32.0, 1219.0, 160426.0, 'I', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (364, 32.0, 1219.0, 160436.0, 'O', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (365, 32.0, 1219.0, 160433.0, 'I', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (366, 32.0, 1219.0, 160435.0, 'O', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (367, 32.0, 1219.0, 160432.0, 'I', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (368, 32.0, 1219.0, 160428.0, 'O', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (369, 33.0, 1202.0, 160042.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (370, 33.0, 1202.0, 160045.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (371, 33.0, 1202.0, 160031.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (372, 33.0, 1202.0, 160038.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (373, 33.0, 1202.0, 160039.0, 'I', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (374, 33.0, 1202.0, 160041.0, 'O', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (375, 33.0, 1210.0, 160211.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (376, 33.0, 1210.0, 160226.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (377, 33.0, 1210.0, 160219.0, 'I', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (378, 33.0, 1210.0, 160230.0, 'O', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (379, 33.0, 1210.0, 160214.0, 'I', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (380, 33.0, 1210.0, 160229.0, 'O', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (381, 34.0, 1209.0, 160188.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (382, 34.0, 1209.0, 160203.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (383, 34.0, 1209.0, 160204.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (384, 34.0, 1209.0, 160207.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (385, 34.0, 1209.0, 160200.0, 'I', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (386, 34.0, 1209.0, 160198.0, 'O', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (387, 34.0, 1214.0, 160316.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (388, 34.0, 1214.0, 160314.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (389, 34.0, 1214.0, 160321.0, 'I', 61.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (390, 34.0, 1214.0, 160311.0, 'O', 61.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (391, 34.0, 1214.0, 160313.0, 'I', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (392, 34.0, 1214.0, 160320.0, 'O', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (393, 35.0, 1211.0, 160237.0, 'I', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (394, 35.0, 1211.0, 160240.0, 'O', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (395, 35.0, 1211.0, 160251.0, 'I', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (396, 35.0, 1211.0, 160250.0, 'O', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (397, 35.0, 1211.0, 160249.0, 'I', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (398, 35.0, 1211.0, 160238.0, 'O', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (399, 35.0, 1215.0, 160338.0, 'I', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (400, 35.0, 1215.0, 160344.0, 'O', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (401, 35.0, 1215.0, 160335.0, 'I', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (402, 35.0, 1215.0, 160336.0, 'O', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (403, 35.0, 1215.0, 160340.0, 'I', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (404, 35.0, 1215.0, 160343.0, 'O', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (405, 36.0, 1203.0, 160068.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (406, 36.0, 1203.0, 160058.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (407, 36.0, 1203.0, 160066.0, 'I', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (408, 36.0, 1203.0, 160067.0, 'O', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (409, 36.0, 1203.0, 160069.0, 'I', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (410, 36.0, 1203.0, 160062.0, 'O', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (411, 36.0, 1220.0, 160458.0, 'I', 63.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (412, 36.0, 1220.0, 160457.0, 'O', 63.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (413, 36.0, 1220.0, 160448.0, 'I', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (414, 36.0, 1220.0, 160454.0, 'O', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (415, 36.0, 1220.0, 160450.0, 'I', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (416, 36.0, 1220.0, 160451.0, 'O', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (417, 37.0, 1213.0, 160289.0, 'I', 101.0, 'ET', 1.0);
INSERT INTO soccer.player_in_out VALUES (418, 37.0, 1213.0, 160293.0, 'O', 101.0, 'ET', 1.0);
INSERT INTO soccer.player_in_out VALUES (419, 37.0, 1213.0, 160294.0, 'I', 104.0, 'ET', 1.0);
INSERT INTO soccer.player_in_out VALUES (420, 37.0, 1213.0, 160288.0, 'O', 104.0, 'ET', 1.0);
INSERT INTO soccer.player_in_out VALUES (421, 37.0, 1221.0, 160480.0, 'I', 58.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (422, 37.0, 1221.0, 160473.0, 'O', 58.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (423, 37.0, 1221.0, 160479.0, 'I', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (424, 37.0, 1221.0, 160481.0, 'O', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (425, 37.0, 1221.0, 160474.0, 'I', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (426, 37.0, 1221.0, 160472.0, 'O', 77.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (427, 38.0, 1212.0, 160276.0, 'I', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (428, 38.0, 1212.0, 160272.0, 'O', 69.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (429, 38.0, 1212.0, 160275.0, 'I', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (430, 38.0, 1212.0, 160271.0, 'O', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (431, 38.0, 1212.0, 160270.0, 'I', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (432, 38.0, 1212.0, 160262.0, 'O', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (433, 38.0, 1224.0, 160550.0, 'I', 55.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (434, 38.0, 1224.0, 160551.0, 'O', 55.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (435, 38.0, 1224.0, 160546.0, 'I', 63.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (436, 38.0, 1224.0, 160543.0, 'O', 63.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (437, 39.0, 1204.0, 160092.0, 'I', 110.0, 'ET', 2.0);
INSERT INTO soccer.player_in_out VALUES (438, 39.0, 1204.0, 160086.0, 'O', 110.0, 'ET', 2.0);
INSERT INTO soccer.player_in_out VALUES (439, 39.0, 1204.0, 160090.0, 'I', 120.0, 'ET', 2.0);
INSERT INTO soccer.player_in_out VALUES (440, 39.0, 1204.0, 160073.0, 'O', 120.0, 'ET', 2.0);
INSERT INTO soccer.player_in_out VALUES (441, 39.0, 1204.0, 160089.0, 'I', 88.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (442, 39.0, 1204.0, 160091.0, 'O', 88.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (443, 39.0, 1214.0, 160313.0, 'I', 117.0, 'ET', 2.0);
INSERT INTO soccer.player_in_out VALUES (444, 39.0, 1214.0, 160310.0, 'O', 117.0, 'ET', 2.0);
INSERT INTO soccer.player_in_out VALUES (445, 39.0, 1214.0, 160316.0, 'I', 50.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (446, 39.0, 1214.0, 160311.0, 'O', 50.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (447, 39.0, 1214.0, 160321.0, 'I', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (448, 39.0, 1214.0, 160313.0, 'O', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (449, 40.0, 1207.0, 160151.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (450, 40.0, 1207.0, 160152.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (451, 40.0, 1207.0, 160158.0, 'I', 73.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (452, 40.0, 1207.0, 160159.0, 'O', 73.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (453, 40.0, 1207.0, 160157.0, 'I', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (454, 40.0, 1207.0, 160151.0, 'O', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (455, 40.0, 1215.0, 160345.0, 'I', 65.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (456, 40.0, 1215.0, 160344.0, 'O', 65.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (457, 40.0, 1215.0, 160331.0, 'I', 68.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (458, 40.0, 1215.0, 160337.0, 'O', 68.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (459, 40.0, 1215.0, 160335.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (460, 40.0, 1215.0, 160336.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (461, 41.0, 1208.0, 160167.0, 'I', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (462, 41.0, 1208.0, 160184.0, 'I', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (463, 41.0, 1208.0, 160165.0, 'O', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (464, 41.0, 1208.0, 160173.0, 'O', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (465, 41.0, 1208.0, 160180.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (466, 41.0, 1208.0, 160175.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (467, 41.0, 1218.0, 160404.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (468, 41.0, 1218.0, 160411.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (469, 41.0, 1218.0, 160414.0, 'I', 64.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (470, 41.0, 1218.0, 160412.0, 'O', 64.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (471, 41.0, 1218.0, 160399.0, 'I', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (472, 41.0, 1218.0, 160396.0, 'O', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (473, 42.0, 1203.0, 160058.0, 'I', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (474, 42.0, 1203.0, 160068.0, 'O', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (475, 42.0, 1203.0, 160065.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (476, 42.0, 1203.0, 160067.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (477, 42.0, 1203.0, 160061.0, 'I', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (478, 42.0, 1203.0, 160062.0, 'O', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (479, 42.0, 1209.0, 160196.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (480, 42.0, 1209.0, 160203.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (481, 42.0, 1209.0, 160205.0, 'I', 75.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (482, 42.0, 1209.0, 160195.0, 'O', 75.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (483, 42.0, 1209.0, 160201.0, 'I', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (484, 42.0, 1209.0, 160191.0, 'O', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (485, 43.0, 1211.0, 160245.0, 'I', 54.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (486, 43.0, 1211.0, 160242.0, 'O', 54.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (487, 43.0, 1211.0, 160251.0, 'I', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (488, 43.0, 1211.0, 160248.0, 'O', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (489, 43.0, 1211.0, 160237.0, 'I', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (490, 43.0, 1211.0, 160243.0, 'O', 84.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (491, 43.0, 1219.0, 160433.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (492, 43.0, 1219.0, 160436.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (493, 43.0, 1219.0, 160434.0, 'I', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (494, 43.0, 1219.0, 160435.0, 'O', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (495, 43.0, 1219.0, 160437.0, 'I', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (496, 43.0, 1219.0, 160433.0, 'O', 81.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (497, 44.0, 1206.0, 160133.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (498, 44.0, 1206.0, 160128.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (499, 44.0, 1206.0, 160138.0, 'I', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (500, 44.0, 1206.0, 160132.0, 'O', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (501, 44.0, 1206.0, 160135.0, 'I', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (502, 44.0, 1206.0, 160136.0, 'O', 87.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (503, 44.0, 1210.0, 160211.0, 'I', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (504, 44.0, 1210.0, 160230.0, 'O', 76.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (505, 44.0, 1210.0, 160219.0, 'I', 89.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (506, 44.0, 1210.0, 160226.0, 'O', 89.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (507, 45.0, 1213.0, 160289.0, 'I', 98.0, 'ET', 1.0);
INSERT INTO soccer.player_in_out VALUES (508, 45.0, 1213.0, 160293.0, 'O', 98.0, 'ET', 1.0);
INSERT INTO soccer.player_in_out VALUES (509, 45.0, 1213.0, 160290.0, 'I', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (510, 45.0, 1213.0, 160288.0, 'O', 82.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (511, 45.0, 1214.0, 160313.0, 'I', 96.0, 'ET', 1.0);
INSERT INTO soccer.player_in_out VALUES (512, 45.0, 1214.0, 160318.0, 'O', 96.0, 'ET', 1.0);
INSERT INTO soccer.player_in_out VALUES (513, 45.0, 1214.0, 160314.0, 'I', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (514, 45.0, 1214.0, 160310.0, 'O', 70.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (515, 45.0, 1214.0, 160321.0, 'I', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (516, 45.0, 1214.0, 160313.0, 'O', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (517, 46.0, 1203.0, 160061.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (518, 46.0, 1203.0, 160058.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (519, 46.0, 1203.0, 160068.0, 'I', 75.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (520, 46.0, 1203.0, 160054.0, 'O', 75.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (521, 46.0, 1203.0, 160065.0, 'I', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (522, 46.0, 1203.0, 160067.0, 'O', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (523, 46.0, 1224.0, 160542.0, 'I', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (524, 46.0, 1224.0, 160543.0, 'O', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (525, 46.0, 1224.0, 160551.0, 'I', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (526, 46.0, 1224.0, 160550.0, 'O', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (527, 46.0, 1224.0, 160534.0, 'I', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (528, 46.0, 1224.0, 160544.0, 'O', 90.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (529, 47.0, 1208.0, 160180.0, 'I', 16.0, 'NT', 1.0);
INSERT INTO soccer.player_in_out VALUES (530, 47.0, 1208.0, 160175.0, 'O', 16.0, 'NT', 1.0);
INSERT INTO soccer.player_in_out VALUES (531, 47.0, 1208.0, 160173.0, 'I', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (532, 47.0, 1208.0, 160182.0, 'O', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (533, 47.0, 1211.0, 160253.0, 'I', 120.0, 'ET', 2.0);
INSERT INTO soccer.player_in_out VALUES (534, 47.0, 1211.0, 160236.0, 'O', 120.0, 'ET', 2.0);
INSERT INTO soccer.player_in_out VALUES (535, 47.0, 1211.0, 160237.0, 'I', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (536, 47.0, 1211.0, 160243.0, 'O', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (537, 47.0, 1211.0, 160251.0, 'I', 108.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (538, 47.0, 1211.0, 160248.0, 'O', 108.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (539, 48.0, 1207.0, 160158.0, 'I', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (540, 48.0, 1207.0, 160159.0, 'O', 60.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (541, 48.0, 1207.0, 160146.0, 'I', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (542, 48.0, 1207.0, 160145.0, 'O', 72.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (543, 48.0, 1207.0, 160151.0, 'I', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (544, 48.0, 1207.0, 160154.0, 'O', 80.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (545, 48.0, 1210.0, 160214.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (546, 48.0, 1210.0, 160227.0, 'I', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (547, 48.0, 1210.0, 160220.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (548, 48.0, 1210.0, 160226.0, 'O', 46.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (549, 48.0, 1210.0, 160228.0, 'I', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (550, 48.0, 1210.0, 160230.0, 'O', 83.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (551, 49.0, 1214.0, 160311.0, 'I', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (552, 49.0, 1214.0, 160316.0, 'O', 74.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (553, 49.0, 1214.0, 160314.0, 'I', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (554, 49.0, 1214.0, 160310.0, 'O', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (555, 49.0, 1214.0, 160321.0, 'I', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (556, 49.0, 1214.0, 160320.0, 'O', 86.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (557, 49.0, 1224.0, 160551.0, 'I', 58.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (558, 49.0, 1224.0, 160543.0, 'O', 58.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (559, 49.0, 1224.0, 160548.0, 'I', 63.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (560, 49.0, 1224.0, 160550.0, 'O', 63.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (561, 49.0, 1224.0, 160546.0, 'I', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (562, 49.0, 1224.0, 160534.0, 'O', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (563, 50.0, 1207.0, 160152.0, 'I', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (564, 50.0, 1207.0, 160154.0, 'O', 71.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (565, 50.0, 1207.0, 160158.0, 'I', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (566, 50.0, 1207.0, 160159.0, 'O', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (567, 50.0, 1207.0, 160150.0, 'I', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (568, 50.0, 1207.0, 160160.0, 'O', 2.0, 'ST', 2.0);
INSERT INTO soccer.player_in_out VALUES (569, 50.0, 1208.0, 160170.0, 'I', 61.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (570, 50.0, 1208.0, 160165.0, 'O', 61.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (571, 50.0, 1208.0, 160174.0, 'I', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (572, 50.0, 1208.0, 160172.0, 'O', 67.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (573, 50.0, 1208.0, 160178.0, 'I', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (574, 50.0, 1208.0, 160180.0, 'O', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (575, 51.0, 1207.0, 160161.0, 'I', 110.0, 'ET', 2.0);
INSERT INTO soccer.player_in_out VALUES (576, 51.0, 1207.0, 160154.0, 'O', 110.0, 'ET', 2.0);
INSERT INTO soccer.player_in_out VALUES (577, 51.0, 1207.0, 160151.0, 'I', 58.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (578, 51.0, 1207.0, 160154.0, 'O', 58.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (579, 51.0, 1207.0, 160158.0, 'I', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (580, 51.0, 1207.0, 160159.0, 'O', 78.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (581, 51.0, 1214.0, 160321.0, 'I', 25.0, 'NT', 1.0);
INSERT INTO soccer.player_in_out VALUES (582, 51.0, 1214.0, 160322.0, 'O', 25.0, 'NT', 1.0);
INSERT INTO soccer.player_in_out VALUES (583, 51.0, 1214.0, 160314.0, 'I', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (584, 51.0, 1214.0, 160310.0, 'O', 66.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (585, 51.0, 1214.0, 160319.0, 'I', 79.0, 'NT', 2.0);
INSERT INTO soccer.player_in_out VALUES (586, 51.0, 1214.0, 160316.0, 'O', 79.0, 'NT', 2.0);


--
-- Data for Name: player_mast; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.player_mast VALUES (160001.0, 1201.0, 1.0, 'Etrit Berisha', 'GK', '1989-03-10', 27.0, 'Lazio');
INSERT INTO soccer.player_mast VALUES (160002.0, 1201.0, 23.0, 'Alban Hoxha', 'GK', '1987-11-23', 28.0, 'Partizani');
INSERT INTO soccer.player_mast VALUES (160003.0, 1201.0, 12.0, 'Orges Shehi', 'GK', '1977-09-25', 38.0, 'Skenderbeu');
INSERT INTO soccer.player_mast VALUES (160004.0, 1201.0, 7.0, 'Ansi Agolli', 'DF', '1982-10-11', 33.0, 'Qarabag');
INSERT INTO soccer.player_mast VALUES (160005.0, 1201.0, 18.0, 'Arlind Ajeti', 'DF', '1993-09-25', 22.0, 'Frosinone');
INSERT INTO soccer.player_mast VALUES (160006.0, 1201.0, 17.0, 'Naser Aliji', 'DF', '1993-12-27', 22.0, 'Basel');
INSERT INTO soccer.player_mast VALUES (160007.0, 1201.0, 4.0, 'Elseid Hysaj', 'DF', '1994-02-20', 22.0, 'Napoli');
INSERT INTO soccer.player_mast VALUES (160008.0, 1201.0, 2.0, 'Andi Lila', 'DF', '1986-02-12', 30.0, 'Giannina');
INSERT INTO soccer.player_mast VALUES (160009.0, 1201.0, 15.0, 'Mergim Mavraj', 'DF', '1986-06-09', 30.0, 'Koln');
INSERT INTO soccer.player_mast VALUES (160010.0, 1201.0, 6.0, 'Frederic Veseli', 'DF', '1992-11-20', 23.0, 'Lugano');
INSERT INTO soccer.player_mast VALUES (160011.0, 1201.0, 22.0, 'Amir Abrashi', 'MF', '1990-03-27', 26.0, 'Freiburg');
INSERT INTO soccer.player_mast VALUES (160012.0, 1201.0, 8.0, 'Migjen Basha', 'MF', '1987-01-05', 29.0, 'Como');
INSERT INTO soccer.player_mast VALUES (160013.0, 1201.0, 5.0, 'Lorik Cana', 'MF', '1983-07-27', 32.0, 'Nantes');
INSERT INTO soccer.player_mast VALUES (160014.0, 1201.0, 20.0, 'Ergys Kace', 'MF', '1993-07-08', 22.0, 'PAOK');
INSERT INTO soccer.player_mast VALUES (160015.0, 1201.0, 13.0, 'Burim Kukeli', 'MF', '1984-01-16', 32.0, 'Zurich');
INSERT INTO soccer.player_mast VALUES (160016.0, 1201.0, 3.0, 'Ermir Lenjani', 'MF', '1989-08-05', 26.0, 'Nantes');
INSERT INTO soccer.player_mast VALUES (160017.0, 1201.0, 9.0, 'Ledian Memushaj', 'MF', '1986-12-17', 29.0, 'Pescara');
INSERT INTO soccer.player_mast VALUES (160018.0, 1201.0, 21.0, 'Odise Roshi', 'MF', '1991-05-22', 25.0, 'Rijeka');
INSERT INTO soccer.player_mast VALUES (160019.0, 1201.0, 14.0, 'Taulant Xhaka', 'MF', '1991-03-28', 25.0, 'Basel');
INSERT INTO soccer.player_mast VALUES (160020.0, 1201.0, 19.0, 'Bekim Balaj', 'FD', '1991-01-11', 25.0, 'Rijeka');
INSERT INTO soccer.player_mast VALUES (160021.0, 1201.0, 16.0, 'Sokol Cikalleshi', 'FD', '1990-07-27', 25.0, 'Istanbul Basaksehir');
INSERT INTO soccer.player_mast VALUES (160022.0, 1201.0, 11.0, 'Shkelzen Gashi', 'FD', '1988-07-15', 27.0, 'Colorado');
INSERT INTO soccer.player_mast VALUES (160023.0, 1201.0, 10.0, 'Armando Sadiku', 'FD', '1991-05-27', 25.0, 'Vaduz');
INSERT INTO soccer.player_mast VALUES (160024.0, 1202.0, 1.0, 'Robert Almer', 'GK', '1984-03-20', 32.0, 'Austria Wien');
INSERT INTO soccer.player_mast VALUES (160025.0, 1202.0, 12.0, 'Heinz Lindner', 'GK', '1990-07-17', 25.0, 'Frankfurt');
INSERT INTO soccer.player_mast VALUES (160026.0, 1202.0, 23.0, 'Ramazan Ozcan', 'GK', '1984-06-28', 31.0, 'Ingolstadt');
INSERT INTO soccer.player_mast VALUES (160027.0, 1202.0, 3.0, 'Aleksandar Dragovic', 'DF', '1991-03-06', 25.0, 'Dynamo Kyiv');
INSERT INTO soccer.player_mast VALUES (160028.0, 1202.0, 5.0, 'Christian Fuchs', 'DF', '1986-04-07', 30.0, 'Leicester');
INSERT INTO soccer.player_mast VALUES (160029.0, 1202.0, 4.0, 'Martin Hinteregger', 'DF', '1992-09-07', 23.0, 'Monchengladbach');
INSERT INTO soccer.player_mast VALUES (160030.0, 1202.0, 17.0, 'Florian Klein', 'DF', '1986-11-17', 29.0, 'Stuttgart');
INSERT INTO soccer.player_mast VALUES (160031.0, 1202.0, 15.0, 'Sebastian Prodl', 'DF', '1987-06-21', 28.0, 'Watford');
INSERT INTO soccer.player_mast VALUES (160032.0, 1202.0, 13.0, 'Markus Suttner', 'DF', '1987-04-16', 29.0, 'Ingolstadt');
INSERT INTO soccer.player_mast VALUES (160033.0, 1202.0, 16.0, 'Kevin Wimmer', 'DF', '1992-11-15', 23.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160034.0, 1202.0, 8.0, 'David Alaba', 'MF', '1992-06-24', 23.0, 'Bayern');
INSERT INTO soccer.player_mast VALUES (160035.0, 1202.0, 14.0, 'Julian Baumgartlinger', 'MF', '1988-01-02', 28.0, 'Mainz');
INSERT INTO soccer.player_mast VALUES (160036.0, 1202.0, 2.0, 'Gyorgy Garics', 'MF', '1984-03-08', 32.0, 'Darmstadt');
INSERT INTO soccer.player_mast VALUES (160037.0, 1202.0, 11.0, 'Martin Harnik', 'MF', '1987-06-10', 29.0, 'Stuttgart');
INSERT INTO soccer.player_mast VALUES (160038.0, 1202.0, 6.0, 'Stefan Ilsanker', 'MF', '1989-05-18', 27.0, 'Leipzig');
INSERT INTO soccer.player_mast VALUES (160039.0, 1202.0, 22.0, 'Jakob Jantscher', 'MF', '1989-01-08', 27.0, 'Luzern');
INSERT INTO soccer.player_mast VALUES (160040.0, 1202.0, 10.0, 'Zlatko Junuzovic', 'MF', '1987-09-26', 28.0, 'Bremen');
INSERT INTO soccer.player_mast VALUES (160041.0, 1202.0, 20.0, 'Marcel Sabitzer', 'MF', '1994-03-17', 22.0, 'Leipzig');
INSERT INTO soccer.player_mast VALUES (160042.0, 1202.0, 18.0, 'Alessandro Schopf', 'MF', '1994-02-07', 22.0, 'Schalke');
INSERT INTO soccer.player_mast VALUES (160043.0, 1202.0, 7.0, 'Marko Arnautovic', 'FD', '1989-04-19', 27.0, 'Stoke');
INSERT INTO soccer.player_mast VALUES (160044.0, 1202.0, 19.0, 'Lukas Hinterseer', 'FD', '1991-03-28', 25.0, 'Ingolstadt');
INSERT INTO soccer.player_mast VALUES (160045.0, 1202.0, 21.0, 'Marc Janko', 'FD', '1983-06-25', 32.0, 'Basel');
INSERT INTO soccer.player_mast VALUES (160046.0, 1202.0, 9.0, 'Rubin Okotie', 'FD', '1987-06-06', 29.0, '1860 Munchen');
INSERT INTO soccer.player_mast VALUES (160047.0, 1203.0, 1.0, 'Thibaut Courtois', 'GK', '1992-05-11', 24.0, 'Chelsea');
INSERT INTO soccer.player_mast VALUES (160048.0, 1203.0, 13.0, 'Jean-Francois Gillet', 'GK', '1979-05-31', 37.0, 'Mechelen');
INSERT INTO soccer.player_mast VALUES (160049.0, 1203.0, 12.0, 'Simon Mignolet', 'GK', '1988-08-06', 27.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160050.0, 1203.0, 2.0, 'Toby Alderweireld', 'DF', '1989-03-02', 27.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160051.0, 1203.0, 23.0, 'Laurent Ciman', 'DF', '1985-08-05', 30.0, 'Montreal');
INSERT INTO soccer.player_mast VALUES (160052.0, 1203.0, 15.0, 'Jason Denayer', 'DF', '1995-06-28', 20.0, 'Galatasaray');
INSERT INTO soccer.player_mast VALUES (160053.0, 1203.0, 18.0, 'Christian Kabasele', 'DF', '1991-02-24', 25.0, 'Genk');
INSERT INTO soccer.player_mast VALUES (160054.0, 1203.0, 21.0, 'Jordan Lukaku', 'DF', '1994-07-25', 21.0, 'Oostende');
INSERT INTO soccer.player_mast VALUES (160055.0, 1203.0, 16.0, 'Thomas Meunier', 'DF', '1991-09-12', 24.0, 'Club Brugge');
INSERT INTO soccer.player_mast VALUES (160056.0, 1203.0, 3.0, 'Thomas Vermaelen', 'DF', '1985-11-14', 30.0, 'Barcelona');
INSERT INTO soccer.player_mast VALUES (160057.0, 1203.0, 5.0, 'Jan Vertonghen', 'DF', '1987-04-24', 29.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160058.0, 1203.0, 11.0, 'Yannick Carrasco', 'MF', '1993-09-04', 22.0, 'Atletico');
INSERT INTO soccer.player_mast VALUES (160059.0, 1203.0, 7.0, 'Kevin De Bruyne', 'MF', '1991-06-28', 24.0, 'Man. City');
INSERT INTO soccer.player_mast VALUES (160060.0, 1203.0, 19.0, 'Mousa Dembele', 'MF', '1987-07-16', 28.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160061.0, 1203.0, 8.0, 'Marouane Fellaini', 'MF', '1987-11-22', 28.0, 'Man. United');
INSERT INTO soccer.player_mast VALUES (160062.0, 1203.0, 10.0, 'Eden Hazard', 'MF', '1991-01-07', 25.0, 'Chelsea');
INSERT INTO soccer.player_mast VALUES (160063.0, 1203.0, 4.0, 'Radja Nainggolan', 'MF', '1988-05-04', 28.0, 'Roma');
INSERT INTO soccer.player_mast VALUES (160064.0, 1203.0, 6.0, 'Axel Witsel', 'MF', '1989-01-12', 27.0, 'Zenit');
INSERT INTO soccer.player_mast VALUES (160065.0, 1203.0, 22.0, 'Michy Batshuayi', 'FD', '1993-10-02', 22.0, 'Marseille');
INSERT INTO soccer.player_mast VALUES (160066.0, 1203.0, 20.0, 'Christian Benteke', 'FD', '1990-12-03', 25.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160067.0, 1203.0, 9.0, 'Romelu Lukaku', 'FD', '1993-05-13', 23.0, 'Everton');
INSERT INTO soccer.player_mast VALUES (160068.0, 1203.0, 14.0, 'Dries Mertens', 'FD', '1987-05-06', 29.0, 'Napoli');
INSERT INTO soccer.player_mast VALUES (160069.0, 1203.0, 17.0, 'Divock Origi', 'FD', '1995-04-18', 21.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160070.0, 1204.0, 12.0, 'Lovre Kalinic', 'GK', '1990-04-03', 26.0, 'Hajduk Split');
INSERT INTO soccer.player_mast VALUES (160071.0, 1204.0, 23.0, 'Danijel SubaSic', 'GK', '1984-10-27', 31.0, 'Monaco');
INSERT INTO soccer.player_mast VALUES (160072.0, 1204.0, 1.0, 'Ivan Vargic', 'GK', '1987-03-15', 29.0, 'Rijeka');
INSERT INTO soccer.player_mast VALUES (160073.0, 1204.0, 5.0, 'Vedran Corluka', 'DF', '1986-02-05', 30.0, 'Lokomotiv Moskva');
INSERT INTO soccer.player_mast VALUES (160074.0, 1204.0, 6.0, 'Tin Jedvaj', 'DF', '1995-11-28', 20.0, 'Leverkusen');
INSERT INTO soccer.player_mast VALUES (160075.0, 1204.0, 13.0, 'Gordon Schildenfeld', 'DF', '1985-03-18', 31.0, 'Dinamo Zagreb');
INSERT INTO soccer.player_mast VALUES (160076.0, 1204.0, 11.0, 'Darijo Srna', 'DF', '1982-05-01', 34.0, 'Shakhtar Donetsk');
INSERT INTO soccer.player_mast VALUES (160077.0, 1204.0, 3.0, 'Ivan Strinic', 'DF', '1987-07-17', 28.0, 'Napoli');
INSERT INTO soccer.player_mast VALUES (160078.0, 1204.0, 21.0, 'Domagoj Vida', 'DF', '1989-04-29', 27.0, 'Dynamo Kyiv');
INSERT INTO soccer.player_mast VALUES (160079.0, 1204.0, 2.0, 'Sime Vrsaljko', 'DF', '1992-01-10', 24.0, 'Sassuolo');
INSERT INTO soccer.player_mast VALUES (160080.0, 1204.0, 19.0, 'Milan Badelj', 'MF', '1989-02-25', 27.0, 'Fiorentina');
INSERT INTO soccer.player_mast VALUES (160081.0, 1204.0, 14.0, 'Marcelo Brozovic', 'MF', '1992-11-16', 23.0, 'Internazionale');
INSERT INTO soccer.player_mast VALUES (160082.0, 1204.0, 18.0, 'Ante Coric', 'MF', '1997-04-14', 19.0, 'Dinamo Zagreb');
INSERT INTO soccer.player_mast VALUES (160083.0, 1204.0, 8.0, 'Mateo Kovacic', 'MF', '1994-05-06', 22.0, 'Real Madrid');
INSERT INTO soccer.player_mast VALUES (160084.0, 1204.0, 10.0, 'Luka Modric', 'MF', '1985-09-09', 30.0, 'Real Madrid');
INSERT INTO soccer.player_mast VALUES (160085.0, 1204.0, 4.0, 'Ivan PeriSic', 'MF', '1989-02-02', 27.0, 'Internazionale');
INSERT INTO soccer.player_mast VALUES (160086.0, 1204.0, 7.0, 'Ivan Rakitic', 'MF', '1988-03-10', 28.0, 'Barcelona');
INSERT INTO soccer.player_mast VALUES (160087.0, 1204.0, 15.0, 'Marko Rog', 'MF', '1995-07-19', 20.0, 'Dinamo Zagreb');
INSERT INTO soccer.player_mast VALUES (160088.0, 1204.0, 22.0, 'Duje Cop', 'FD', '1990-02-01', 26.0, 'Malaga');
INSERT INTO soccer.player_mast VALUES (160089.0, 1204.0, 16.0, 'Nikola Kalinic', 'FD', '1988-01-05', 28.0, 'Fiorentina');
INSERT INTO soccer.player_mast VALUES (160090.0, 1204.0, 9.0, 'Andrej Kramaric', 'FD', '1991-06-19', 24.0, 'Hoffenheim');
INSERT INTO soccer.player_mast VALUES (160091.0, 1204.0, 17.0, 'Mario Mandzukic', 'FD', '1986-05-21', 30.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160092.0, 1204.0, 20.0, 'Marko Pjaca', 'FD', '1995-05-06', 21.0, 'Dinamo Zagreb');
INSERT INTO soccer.player_mast VALUES (160093.0, 1205.0, 1.0, 'Petr Cech', 'GK', '1982-05-20', 34.0, 'Arsenal');
INSERT INTO soccer.player_mast VALUES (160094.0, 1205.0, 23.0, 'TomasKoubek', 'GK', '1992-08-26', 23.0, 'Liberec');
INSERT INTO soccer.player_mast VALUES (160095.0, 1205.0, 16.0, 'TomasVaclik', 'GK', '1989-03-29', 27.0, 'Basel');
INSERT INTO soccer.player_mast VALUES (160096.0, 1205.0, 4.0, 'Theodor Gebre Selassie', 'DF', '1986-12-24', 29.0, 'Bremen');
INSERT INTO soccer.player_mast VALUES (160097.0, 1205.0, 5.0, 'Roman Hubnik', 'DF', '1984-06-06', 32.0, 'Plzen');
INSERT INTO soccer.player_mast VALUES (160098.0, 1205.0, 2.0, 'Pavel Kaderabek', 'DF', '1992-04-25', 24.0, 'Hoffenheim');
INSERT INTO soccer.player_mast VALUES (160099.0, 1205.0, 3.0, 'Michal Kadlec', 'DF', '1984-12-13', 31.0, 'Fenerbahce');
INSERT INTO soccer.player_mast VALUES (160100.0, 1205.0, 8.0, 'David Limbersky', 'DF', '1983-10-06', 32.0, 'Plzen');
INSERT INTO soccer.player_mast VALUES (160101.0, 1205.0, 6.0, 'TomasSivok', 'DF', '1983-09-15', 32.0, 'Bursaspor');
INSERT INTO soccer.player_mast VALUES (160102.0, 1205.0, 17.0, 'Marek Suchy', 'DF', '1988-03-29', 28.0, 'Basel');
INSERT INTO soccer.player_mast VALUES (160103.0, 1205.0, 22.0, 'Vladimir Darida', 'MF', '1990-08-08', 25.0, 'Hertha');
INSERT INTO soccer.player_mast VALUES (160104.0, 1205.0, 9.0, 'Borek Dockal', 'MF', '1988-09-30', 27.0, 'Sparta Praha');
INSERT INTO soccer.player_mast VALUES (160105.0, 1205.0, 14.0, 'Daniel Kolar', 'MF', '1985-10-27', 30.0, 'Plzen');
INSERT INTO soccer.player_mast VALUES (160106.0, 1205.0, 19.0, 'Ladislav Krejci', 'MF', '1992-07-05', 23.0, 'Sparta Praha');
INSERT INTO soccer.player_mast VALUES (160107.0, 1205.0, 15.0, 'David Pavelka', 'MF', '1991-05-18', 25.0, 'Kasimpasa');
INSERT INTO soccer.player_mast VALUES (160108.0, 1205.0, 13.0, 'Jaroslav PlaSil', 'MF', '1982-01-05', 34.0, 'Bordeaux');
INSERT INTO soccer.player_mast VALUES (160109.0, 1205.0, 11.0, 'Daniel Pudil', 'MF', '1985-09-27', 30.0, 'Sheff. Wednesday');
INSERT INTO soccer.player_mast VALUES (160110.0, 1205.0, 10.0, 'TomasRosicky', 'MF', '1980-10-04', 35.0, 'Arsenal');
INSERT INTO soccer.player_mast VALUES (160111.0, 1205.0, 20.0, 'Jiri Skalak', 'MF', '1992-03-12', 24.0, 'Brighton');
INSERT INTO soccer.player_mast VALUES (160112.0, 1205.0, 18.0, 'Josef Sural', 'MF', '1990-05-30', 26.0, 'Sparta Praha');
INSERT INTO soccer.player_mast VALUES (160113.0, 1205.0, 21.0, 'David Lafata', 'FD', '1981-09-18', 34.0, 'Sparta Praha');
INSERT INTO soccer.player_mast VALUES (160114.0, 1205.0, 7.0, 'TomasNecid', 'FD', '1989-08-13', 26.0, 'Bursaspor');
INSERT INTO soccer.player_mast VALUES (160115.0, 1205.0, 12.0, 'Milan Skoda', 'FD', '1986-01-16', 30.0, 'Slavia Praha');
INSERT INTO soccer.player_mast VALUES (160116.0, 1206.0, 13.0, 'Fraser Forster', 'GK', '1988-03-17', 28.0, 'Southampton');
INSERT INTO soccer.player_mast VALUES (160117.0, 1206.0, 1.0, 'Joe Hart', 'GK', '1987-04-19', 29.0, 'Man. City');
INSERT INTO soccer.player_mast VALUES (160118.0, 1206.0, 23.0, 'Tom Heaton', 'GK', '1986-04-15', 30.0, 'Burnley');
INSERT INTO soccer.player_mast VALUES (160119.0, 1206.0, 21.0, 'Ryan Bertrand', 'DF', '1989-08-05', 26.0, 'Southampton');
INSERT INTO soccer.player_mast VALUES (160120.0, 1206.0, 5.0, 'Gary Cahill', 'DF', '1985-12-19', 30.0, 'Chelsea');
INSERT INTO soccer.player_mast VALUES (160121.0, 1206.0, 12.0, 'Nathaniel Clyne', 'DF', '1991-04-05', 25.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160122.0, 1206.0, 3.0, 'Danny Rose', 'DF', '1990-07-02', 25.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160123.0, 1206.0, 6.0, 'Chris Smalling', 'DF', '1989-11-22', 26.0, 'Man. United');
INSERT INTO soccer.player_mast VALUES (160124.0, 1206.0, 16.0, 'John Stones', 'DF', '1994-05-28', 22.0, 'Everton');
INSERT INTO soccer.player_mast VALUES (160125.0, 1206.0, 2.0, 'Kyle Walker', 'DF', '1990-05-28', 26.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160126.0, 1206.0, 20.0, 'Dele Alli', 'MF', '1996-04-11', 20.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160127.0, 1206.0, 19.0, 'Ross Barkley', 'MF', '1993-12-05', 22.0, 'Everton');
INSERT INTO soccer.player_mast VALUES (160128.0, 1206.0, 17.0, 'Eric Dier', 'MF', '1994-01-15', 22.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160129.0, 1206.0, 14.0, 'Jordan Henderson', 'MF', '1990-06-17', 26.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160130.0, 1206.0, 8.0, 'Adam Lallana', 'MF', '1988-05-10', 28.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160131.0, 1206.0, 4.0, 'James Milner', 'MF', '1986-01-04', 30.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160132.0, 1206.0, 7.0, 'Raheem Sterling', 'MF', '1994-12-08', 21.0, 'Man. City');
INSERT INTO soccer.player_mast VALUES (160133.0, 1206.0, 18.0, 'Jack Wilshere', 'MF', '1992-01-01', 24.0, 'Arsenal');
INSERT INTO soccer.player_mast VALUES (160134.0, 1206.0, 9.0, 'Harry Kane', 'FD', '1993-07-28', 22.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160135.0, 1206.0, 22.0, 'Marcus Rashford', 'FD', '1997-10-31', 18.0, 'Man. United');
INSERT INTO soccer.player_mast VALUES (160136.0, 1206.0, 10.0, 'Wayne Rooney', 'FD', '1985-10-24', 30.0, 'Man. United');
INSERT INTO soccer.player_mast VALUES (160137.0, 1206.0, 15.0, 'Daniel Sturridge', 'FD', '1989-09-01', 26.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160138.0, 1206.0, 11.0, 'Jamie Vardy', 'FD', '1987-01-11', 29.0, 'Leicester');
INSERT INTO soccer.player_mast VALUES (160139.0, 1207.0, 23.0, 'Benoit Costil', 'GK', '1987-07-03', 28.0, 'Rennes');
INSERT INTO soccer.player_mast VALUES (160140.0, 1207.0, 1.0, 'Hugo Lloris', 'GK', '1986-12-26', 29.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160141.0, 1207.0, 16.0, 'Steve Mandanda', 'GK', '1985-03-28', 31.0, 'Marseille');
INSERT INTO soccer.player_mast VALUES (160142.0, 1207.0, 17.0, 'Lucas Digne', 'DF', '1993-07-20', 22.0, 'Roma');
INSERT INTO soccer.player_mast VALUES (160143.0, 1207.0, 3.0, 'Patrice Evra', 'DF', '1981-05-15', 35.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160144.0, 1207.0, 2.0, 'Christophe Jallet', 'DF', '1983-10-31', 32.0, 'Lyon');
INSERT INTO soccer.player_mast VALUES (160145.0, 1207.0, 21.0, 'Laurent Koscielny', 'DF', '1985-09-10', 30.0, 'Arsenal');
INSERT INTO soccer.player_mast VALUES (160146.0, 1207.0, 13.0, 'Eliaquim Mangala', 'DF', '1991-02-13', 25.0, 'Man. City');
INSERT INTO soccer.player_mast VALUES (160147.0, 1207.0, 4.0, 'Adil Rami', 'DF', '1985-12-27', 30.0, 'Sevilla');
INSERT INTO soccer.player_mast VALUES (160148.0, 1207.0, 19.0, 'Bacary Sagna', 'DF', '1983-02-14', 33.0, 'Man. City');
INSERT INTO soccer.player_mast VALUES (160149.0, 1207.0, 22.0, 'Samuel Umtiti', 'DF', '1993-11-14', 22.0, 'Lyon');
INSERT INTO soccer.player_mast VALUES (160150.0, 1207.0, 6.0, 'Yohan Cabaye', 'MF', '1986-01-14', 30.0, 'Crystal Palace');
INSERT INTO soccer.player_mast VALUES (160151.0, 1207.0, 20.0, 'Kingsley Coman', 'MF', '1996-06-13', 20.0, 'Bayern');
INSERT INTO soccer.player_mast VALUES (160152.0, 1207.0, 5.0, 'NGolo Kante', 'MF', '1991-03-29', 25.0, 'Leicester');
INSERT INTO soccer.player_mast VALUES (160153.0, 1207.0, 14.0, 'Blaise Matuidi', 'MF', '1987-04-09', 29.0, 'Paris');
INSERT INTO soccer.player_mast VALUES (160154.0, 1207.0, 8.0, 'Dimitri Payet', 'MF', '1987-03-29', 29.0, 'West Ham');
INSERT INTO soccer.player_mast VALUES (160155.0, 1207.0, 15.0, 'Paul Pogba', 'MF', '1993-03-15', 23.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160156.0, 1207.0, 12.0, 'Morgan Schneiderlin', 'MF', '1989-11-08', 26.0, 'Man. United');
INSERT INTO soccer.player_mast VALUES (160157.0, 1207.0, 18.0, 'Moussa Sissoko', 'MF', '1989-08-16', 26.0, 'Newcastle');
INSERT INTO soccer.player_mast VALUES (160158.0, 1207.0, 10.0, 'Andre-Pierre Gignac', 'FD', '1985-12-05', 30.0, 'Tigres');
INSERT INTO soccer.player_mast VALUES (160159.0, 1207.0, 9.0, 'Olivier Giroud', 'FD', '1986-09-30', 29.0, 'Arsenal');
INSERT INTO soccer.player_mast VALUES (160160.0, 1207.0, 7.0, 'Antoine Griezmann', 'FD', '1991-03-21', 25.0, 'Atletico');
INSERT INTO soccer.player_mast VALUES (160161.0, 1207.0, 11.0, 'Anthony Martial', 'FD', '1995-12-05', 20.0, 'Man. United');
INSERT INTO soccer.player_mast VALUES (160162.0, 1208.0, 12.0, 'Bernd Leno', 'GK', '1992-03-04', 24.0, 'Leverkusen');
INSERT INTO soccer.player_mast VALUES (160163.0, 1208.0, 1.0, 'Manuel Neuer', 'GK', '1986-03-27', 30.0, 'Bayern');
INSERT INTO soccer.player_mast VALUES (160164.0, 1208.0, 22.0, 'Marc-Andre ter Stegen', 'GK', '1992-04-30', 24.0, 'Barcelona');
INSERT INTO soccer.player_mast VALUES (160165.0, 1208.0, 17.0, 'Jerome Boateng', 'DF', '1988-09-03', 27.0, 'Bayern');
INSERT INTO soccer.player_mast VALUES (160166.0, 1208.0, 3.0, 'Jonas Hector', 'DF', '1990-05-27', 26.0, 'Koln');
INSERT INTO soccer.player_mast VALUES (160167.0, 1208.0, 4.0, 'Benedikt Howedes', 'DF', '1988-02-29', 28.0, 'Schalke');
INSERT INTO soccer.player_mast VALUES (160168.0, 1208.0, 5.0, 'Mats Hummels', 'DF', '1988-12-16', 27.0, 'Dortmund');
INSERT INTO soccer.player_mast VALUES (160169.0, 1208.0, 21.0, 'Joshua Kimmich', 'DF', '1995-02-08', 21.0, 'Bayern');
INSERT INTO soccer.player_mast VALUES (160170.0, 1208.0, 2.0, 'Shkodran Mustafi', 'DF', '1992-04-17', 24.0, 'Valencia');
INSERT INTO soccer.player_mast VALUES (160171.0, 1208.0, 16.0, 'Jonathan Tah', 'DF', '1996-02-11', 20.0, 'Leverkusen');
INSERT INTO soccer.player_mast VALUES (160172.0, 1208.0, 14.0, 'Emre Can', 'MF', '1994-01-12', 22.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160173.0, 1208.0, 11.0, 'Julian Draxler', 'MF', '1993-09-20', 22.0, 'Wolfsburg');
INSERT INTO soccer.player_mast VALUES (160174.0, 1208.0, 19.0, 'Mario Gotze', 'MF', '1992-06-03', 24.0, 'Bayern');
INSERT INTO soccer.player_mast VALUES (160175.0, 1208.0, 6.0, 'Sami Khedira', 'MF', '1987-04-04', 29.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160176.0, 1208.0, 18.0, 'Toni Kroos', 'MF', '1990-01-04', 26.0, 'Real Madrid');
INSERT INTO soccer.player_mast VALUES (160177.0, 1208.0, 8.0, 'Mesut ozil', 'MF', '1988-10-15', 27.0, 'Arsenal');
INSERT INTO soccer.player_mast VALUES (160178.0, 1208.0, 20.0, 'Leroy Sane', 'MF', '1996-01-11', 20.0, 'Schalke');
INSERT INTO soccer.player_mast VALUES (160179.0, 1208.0, 9.0, 'Andre Schurrle', 'MF', '1990-11-06', 25.0, 'Wolfsburg');
INSERT INTO soccer.player_mast VALUES (160180.0, 1208.0, 7.0, 'Bastian Schweinsteiger', 'MF', '1984-08-01', 31.0, 'Man. United');
INSERT INTO soccer.player_mast VALUES (160181.0, 1208.0, 15.0, 'Julian Weigl', 'MF', '1995-09-08', 20.0, 'Dortmund');
INSERT INTO soccer.player_mast VALUES (160182.0, 1208.0, 23.0, 'Mario Gomez', 'FD', '1985-07-10', 30.0, 'Besiktas');
INSERT INTO soccer.player_mast VALUES (160183.0, 1208.0, 13.0, 'Thomas Muller', 'FD', '1989-09-13', 26.0, 'Bayern');
INSERT INTO soccer.player_mast VALUES (160184.0, 1208.0, 10.0, 'Lukas Podolski', 'FD', '1985-06-04', 31.0, 'Galatasaray');
INSERT INTO soccer.player_mast VALUES (160185.0, 1209.0, 12.0, 'Denes Dibusz', 'GK', '1990-11-16', 25.0, 'Ferencvaros');
INSERT INTO soccer.player_mast VALUES (160186.0, 1209.0, 22.0, 'Peter Gulacsi', 'GK', '1990-05-06', 26.0, 'Leipzig');
INSERT INTO soccer.player_mast VALUES (160187.0, 1209.0, 1.0, 'Gabor Kiraly', 'GK', '1976-04-01', 40.0, 'Haladas');
INSERT INTO soccer.player_mast VALUES (160188.0, 1209.0, 21.0, 'Barnabas Bese', 'DF', '1994-05-06', 22.0, 'MTK');
INSERT INTO soccer.player_mast VALUES (160189.0, 1209.0, 5.0, 'Attila Fiola', 'DF', '1990-02-17', 26.0, 'Puskas Akademia');
INSERT INTO soccer.player_mast VALUES (160190.0, 1209.0, 20.0, 'Richard Guzmics', 'DF', '1987-04-16', 29.0, 'Wisla');
INSERT INTO soccer.player_mast VALUES (160191.0, 1209.0, 23.0, 'Roland Juhasz', 'DF', '1983-07-01', 32.0, 'Videoton');
INSERT INTO soccer.player_mast VALUES (160192.0, 1209.0, 4.0, 'Tamas Kadar', 'DF', '1990-03-14', 26.0, 'Lech');
INSERT INTO soccer.player_mast VALUES (160193.0, 1209.0, 3.0, 'Mihaly Korhut', 'DF', '1988-12-01', 27.0, 'Debrecen');
INSERT INTO soccer.player_mast VALUES (160194.0, 1209.0, 2.0, 'Adam Lang', 'DF', '1993-01-17', 23.0, 'Videoton');
INSERT INTO soccer.player_mast VALUES (160195.0, 1209.0, 16.0, 'adam Pinter', 'DF', '1988-06-12', 28.0, 'Ferencvaros');
INSERT INTO soccer.player_mast VALUES (160196.0, 1209.0, 6.0, 'Akos Elek', 'MF', '1988-07-21', 27.0, 'Diosgyor');
INSERT INTO soccer.player_mast VALUES (160197.0, 1209.0, 15.0, 'Laszlo Kleinheisler', 'MF', '1994-04-08', 22.0, 'Bremen');
INSERT INTO soccer.player_mast VALUES (160198.0, 1209.0, 14.0, 'Gergo Lovrencsics', 'MF', '1988-09-01', 27.0, 'Lech');
INSERT INTO soccer.player_mast VALUES (160199.0, 1209.0, 8.0, 'Adam Nagy', 'MF', '1995-06-17', 21.0, 'Ferencvaros');
INSERT INTO soccer.player_mast VALUES (160200.0, 1209.0, 18.0, 'Zoltan Stieber', 'MF', '1988-10-16', 27.0, 'Nurnberg');
INSERT INTO soccer.player_mast VALUES (160201.0, 1209.0, 13.0, 'Daniel Bode', 'FD', '1986-10-24', 29.0, 'Ferencvaros');
INSERT INTO soccer.player_mast VALUES (160202.0, 1209.0, 7.0, 'Balazs Dzsudzsak', 'FD', '1986-12-23', 29.0, 'Bursaspor');
INSERT INTO soccer.player_mast VALUES (160203.0, 1209.0, 10.0, 'Zoltan Gera', 'FD', '1979-04-22', 37.0, 'Ferencvaros');
INSERT INTO soccer.player_mast VALUES (160204.0, 1209.0, 11.0, 'Krisztian Nemeth', 'FD', '1989-01-05', 27.0, 'Al-Gharafa');
INSERT INTO soccer.player_mast VALUES (160205.0, 1209.0, 17.0, 'Nemanja Nikolic', 'FD', '1987-12-31', 28.0, 'Legia');
INSERT INTO soccer.player_mast VALUES (160206.0, 1209.0, 19.0, 'Tamas Priskin', 'FD', '1986-09-27', 29.0, 'Slovan Bratislava');
INSERT INTO soccer.player_mast VALUES (160207.0, 1209.0, 9.0, 'Adam Szalai', 'FD', '1987-12-09', 28.0, 'Hannover');
INSERT INTO soccer.player_mast VALUES (160208.0, 1210.0, 1.0, 'Hannes Halldorsson', 'GK', '1984-04-27', 32.0, 'Bodo/Glimt');
INSERT INTO soccer.player_mast VALUES (160209.0, 1210.0, 13.0, 'Ingvar Jonsson', 'GK', '1989-10-18', 26.0, 'Sandefjord');
INSERT INTO soccer.player_mast VALUES (160210.0, 1210.0, 12.0, 'Ogmundur Kristinsson', 'GK', '1989-06-19', 26.0, 'Hammarby');
INSERT INTO soccer.player_mast VALUES (160211.0, 1210.0, 18.0, 'Elmar Bjarnason', 'DF', '1987-03-04', 29.0, 'AGF');
INSERT INTO soccer.player_mast VALUES (160212.0, 1210.0, 3.0, 'Haukur Heidar Hauksson', 'DF', '1991-09-01', 24.0, 'AIK');
INSERT INTO soccer.player_mast VALUES (160213.0, 1210.0, 4.0, 'Hjortur Hermannsson', 'DF', '1995-02-08', 21.0, 'Goteborg');
INSERT INTO soccer.player_mast VALUES (160214.0, 1210.0, 5.0, 'Sverrir Ingason', 'DF', '1993-08-05', 22.0, 'Lokeren');
INSERT INTO soccer.player_mast VALUES (160215.0, 1210.0, 19.0, 'Hordur Magnusson', 'DF', '1993-02-11', 23.0, 'Cesena');
INSERT INTO soccer.player_mast VALUES (160216.0, 1210.0, 2.0, 'Birkir Saevarsson', 'DF', '1984-11-11', 31.0, 'Hammarby');
INSERT INTO soccer.player_mast VALUES (160217.0, 1210.0, 6.0, 'Ragnar Sigurdsson', 'DF', '1986-06-19', 29.0, 'Krasnodar');
INSERT INTO soccer.player_mast VALUES (160218.0, 1210.0, 23.0, 'Ari Skulason', 'DF', '1987-05-14', 29.0, 'OB');
INSERT INTO soccer.player_mast VALUES (160219.0, 1210.0, 21.0, 'Arnor Ingvi Traustason', 'DF', '1993-04-30', 23.0, 'Norrkoping');
INSERT INTO soccer.player_mast VALUES (160220.0, 1210.0, 14.0, 'Kari Arnason', 'MF', '1982-10-13', 33.0, 'Malmo');
INSERT INTO soccer.player_mast VALUES (160221.0, 1210.0, 8.0, 'Birkir Bjarnason', 'MF', '1988-05-27', 28.0, 'Basel');
INSERT INTO soccer.player_mast VALUES (160222.0, 1210.0, 17.0, 'Aron Gunnarsson', 'MF', '1989-04-22', 27.0, 'Cardiff');
INSERT INTO soccer.player_mast VALUES (160223.0, 1210.0, 20.0, 'Emil Hallfredsson', 'MF', '1984-06-29', 31.0, 'Udinese');
INSERT INTO soccer.player_mast VALUES (160224.0, 1210.0, 10.0, 'Gylfi Sigurdsson', 'MF', '1989-09-08', 26.0, 'Swansea');
INSERT INTO soccer.player_mast VALUES (160225.0, 1210.0, 16.0, 'Runar Mar Sigurjonsson', 'MF', '1990-06-18', 26.0, 'Sundsvall');
INSERT INTO soccer.player_mast VALUES (160226.0, 1210.0, 15.0, 'Jon Dadi Bodvarsson', 'FD', '1992-05-25', 24.0, 'Kaiserslautern');
INSERT INTO soccer.player_mast VALUES (160227.0, 1210.0, 11.0, 'Alfred Finnbogason', 'FD', '1989-02-01', 27.0, 'Augsburg');
INSERT INTO soccer.player_mast VALUES (160228.0, 1210.0, 22.0, 'Eidur Gudjohnsen', 'FD', '1978-09-15', 37.0, 'Molde');
INSERT INTO soccer.player_mast VALUES (160229.0, 1210.0, 7.0, 'Johann Gudmundsson', 'FD', '1990-10-27', 25.0, 'Charlton');
INSERT INTO soccer.player_mast VALUES (160230.0, 1210.0, 9.0, 'Kolbeinn Sigthorsson', 'FD', '1990-03-14', 26.0, 'Nantes');
INSERT INTO soccer.player_mast VALUES (160231.0, 1211.0, 1.0, 'Gianluigi Buffon', 'GK', '1978-01-28', 38.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160232.0, 1211.0, 13.0, 'Federico Marchetti', 'GK', '1983-02-07', 33.0, 'Lazio');
INSERT INTO soccer.player_mast VALUES (160233.0, 1211.0, 12.0, 'Salvatore Sirigu', 'GK', '1987-01-12', 29.0, 'Paris');
INSERT INTO soccer.player_mast VALUES (160234.0, 1211.0, 15.0, 'Andrea Barzagli', 'DF', '1981-05-08', 35.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160235.0, 1211.0, 19.0, 'Leonardo Bonucci', 'DF', '1987-05-01', 29.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160236.0, 1211.0, 3.0, 'Giorgio Chiellini', 'DF', '1984-08-14', 31.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160237.0, 1211.0, 4.0, 'Matteo Darmian', 'DF', '1989-12-02', 26.0, 'Man. United');
INSERT INTO soccer.player_mast VALUES (160238.0, 1211.0, 2.0, 'Mattia De Sciglio', 'DF', '1992-10-20', 23.0, 'Milan');
INSERT INTO soccer.player_mast VALUES (160239.0, 1211.0, 5.0, 'Angelo Ogbonna', 'DF', '1988-05-23', 28.0, 'West Ham');
INSERT INTO soccer.player_mast VALUES (160240.0, 1211.0, 21.0, 'Federico Bernardeschi', 'MF', '1994-02-16', 22.0, 'Fiorentina');
INSERT INTO soccer.player_mast VALUES (160241.0, 1211.0, 6.0, 'Antonio Candreva', 'MF', '1987-02-28', 29.0, 'Lazio');
INSERT INTO soccer.player_mast VALUES (160242.0, 1211.0, 16.0, 'Daniele De Rossi', 'MF', '1983-07-24', 32.0, 'Roma');
INSERT INTO soccer.player_mast VALUES (160243.0, 1211.0, 8.0, 'Alessandro Florenzi', 'MF', '1991-03-11', 25.0, 'Roma');
INSERT INTO soccer.player_mast VALUES (160244.0, 1211.0, 23.0, 'Emanuele Giaccherini', 'MF', '1985-05-05', 31.0, 'Bologna');
INSERT INTO soccer.player_mast VALUES (160245.0, 1211.0, 10.0, 'Thiago Motta', 'MF', '1982-08-28', 33.0, 'Paris');
INSERT INTO soccer.player_mast VALUES (160246.0, 1211.0, 18.0, 'Marco Parolo', 'MF', '1985-01-25', 31.0, 'Lazio');
INSERT INTO soccer.player_mast VALUES (160247.0, 1211.0, 14.0, 'Stefano Sturaro', 'MF', '1993-03-09', 23.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160248.0, 1211.0, 17.0, 'Eder', 'FD', '1986-11-15', 29.0, 'Internazionale');
INSERT INTO soccer.player_mast VALUES (160249.0, 1211.0, 22.0, 'Stephan El Shaarawy', 'FD', '1992-10-27', 23.0, 'Roma');
INSERT INTO soccer.player_mast VALUES (160250.0, 1211.0, 11.0, 'Ciro Immobile', 'FD', '1990-02-20', 26.0, 'Torino');
INSERT INTO soccer.player_mast VALUES (160251.0, 1211.0, 20.0, 'Lorenzo Insigne', 'FD', '1991-06-04', 25.0, 'Napoli');
INSERT INTO soccer.player_mast VALUES (160252.0, 1211.0, 9.0, 'Graziano Pelle', 'FD', '1985-07-15', 30.0, 'Southampton');
INSERT INTO soccer.player_mast VALUES (160253.0, 1211.0, 7.0, 'Simone Zaza', 'FD', '1991-06-25', 24.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160254.0, 1212.0, 12.0, 'Roy Carroll', 'GK', '1977-09-30', 38.0, 'Notts County');
INSERT INTO soccer.player_mast VALUES (160255.0, 1212.0, 23.0, 'Alan Mannus', 'GK', '1982-05-19', 34.0, 'St Johnstone');
INSERT INTO soccer.player_mast VALUES (160256.0, 1212.0, 1.0, 'Michael McGovern', 'GK', '1984-07-12', 31.0, 'Hamilton');
INSERT INTO soccer.player_mast VALUES (160257.0, 1212.0, 6.0, 'Chris Baird', 'DF', '1982-02-25', 34.0, 'Fulham');
INSERT INTO soccer.player_mast VALUES (160258.0, 1212.0, 20.0, 'Craig Cathcart', 'DF', '1989-02-06', 27.0, 'Watford');
INSERT INTO soccer.player_mast VALUES (160259.0, 1212.0, 5.0, 'Jonny Evans', 'DF', '1988-01-03', 28.0, 'West Brom');
INSERT INTO soccer.player_mast VALUES (160260.0, 1212.0, 22.0, 'Lee Hodson', 'DF', '1991-10-02', 24.0, 'MK Dons');
INSERT INTO soccer.player_mast VALUES (160261.0, 1212.0, 18.0, 'Aaron Hughes', 'DF', '1979-11-08', 36.0, 'Melbourne City');
INSERT INTO soccer.player_mast VALUES (160262.0, 1212.0, 4.0, 'Gareth McAuley', 'DF', '1979-12-05', 36.0, 'West Brom');
INSERT INTO soccer.player_mast VALUES (160263.0, 1212.0, 15.0, 'Luke McCullough', 'DF', '1994-02-15', 22.0, 'Doncaster');
INSERT INTO soccer.player_mast VALUES (160264.0, 1212.0, 2.0, 'Conor McLaughlin', 'DF', '1991-07-26', 24.0, 'Fleetwood');
INSERT INTO soccer.player_mast VALUES (160265.0, 1212.0, 17.0, 'Paddy McNair', 'DF', '1995-04-27', 21.0, 'Man. United');
INSERT INTO soccer.player_mast VALUES (160266.0, 1212.0, 14.0, 'Stuart Dallas', 'MF', '1991-04-19', 25.0, 'Leeds');
INSERT INTO soccer.player_mast VALUES (160267.0, 1212.0, 8.0, 'Steven Davis', 'MF', '1985-01-01', 31.0, 'Southampton');
INSERT INTO soccer.player_mast VALUES (160268.0, 1212.0, 13.0, 'Corry Evans', 'MF', '1990-07-30', 25.0, 'Blackburn');
INSERT INTO soccer.player_mast VALUES (160269.0, 1212.0, 3.0, 'Shane Ferguson', 'MF', '1991-07-12', 24.0, 'Millwall');
INSERT INTO soccer.player_mast VALUES (160270.0, 1212.0, 21.0, 'Josh Magennis', 'MF', '1990-08-15', 25.0, 'Kilmarnock');
INSERT INTO soccer.player_mast VALUES (160271.0, 1212.0, 16.0, 'Oliver Norwood', 'MF', '1991-04-12', 25.0, 'Reading');
INSERT INTO soccer.player_mast VALUES (160272.0, 1212.0, 19.0, 'Jamie Ward', 'MF', '1986-05-12', 30.0, 'Nottm Forest');
INSERT INTO soccer.player_mast VALUES (160273.0, 1212.0, 9.0, 'Will Grigg', 'FD', '1991-07-03', 24.0, 'Wigan');
INSERT INTO soccer.player_mast VALUES (160274.0, 1212.0, 10.0, 'Kyle Lafferty', 'FD', '1987-09-16', 28.0, 'Birmingham');
INSERT INTO soccer.player_mast VALUES (160275.0, 1212.0, 7.0, 'Niall McGinn', 'FD', '1987-07-20', 28.0, 'Aberdeen');
INSERT INTO soccer.player_mast VALUES (160276.0, 1212.0, 11.0, 'Conor Washington', 'FD', '1992-05-18', 24.0, 'QPR');
INSERT INTO soccer.player_mast VALUES (160277.0, 1213.0, 12.0, 'Artur Boruc', 'GK', '1980-02-20', 36.0, 'Bournemouth');
INSERT INTO soccer.player_mast VALUES (160278.0, 1213.0, 22.0, 'Lukasz Fabianski', 'GK', '1985-04-18', 31.0, 'Swansea');
INSERT INTO soccer.player_mast VALUES (160279.0, 1213.0, 1.0, 'Wojciech Szczesny', 'GK', '1990-04-18', 26.0, 'Roma');
INSERT INTO soccer.player_mast VALUES (160280.0, 1213.0, 4.0, 'Thiago Cionek', 'DF', '1986-04-21', 30.0, 'Palermo');
INSERT INTO soccer.player_mast VALUES (160281.0, 1213.0, 15.0, 'Kamil Glik', 'DF', '1988-02-03', 28.0, 'Torino');
INSERT INTO soccer.player_mast VALUES (160282.0, 1213.0, 3.0, 'Artur Jedrzejczyk', 'DF', '1987-11-04', 28.0, 'Legia');
INSERT INTO soccer.player_mast VALUES (160283.0, 1213.0, 2.0, 'Michal Pazdan', 'DF', '1987-09-21', 28.0, 'Legia');
INSERT INTO soccer.player_mast VALUES (160284.0, 1213.0, 20.0, 'Lukasz Piszczek', 'DF', '1985-06-03', 31.0, 'Dortmund');
INSERT INTO soccer.player_mast VALUES (160285.0, 1213.0, 18.0, 'Bartosz Salamon', 'DF', '1991-05-01', 25.0, 'Cagliari');
INSERT INTO soccer.player_mast VALUES (160286.0, 1213.0, 14.0, 'Jakub Wawrzyniak', 'DF', '1983-07-07', 32.0, 'Lechia');
INSERT INTO soccer.player_mast VALUES (160287.0, 1213.0, 16.0, 'Jakub Blaszczykowski', 'MF', '1985-12-14', 30.0, 'Fiorentina');
INSERT INTO soccer.player_mast VALUES (160288.0, 1213.0, 11.0, 'Kamil Grosicki', 'MF', '1988-06-08', 28.0, 'Rennes');
INSERT INTO soccer.player_mast VALUES (160289.0, 1213.0, 6.0, 'Tomasz Jodlowiec', 'MF', '1985-09-08', 30.0, 'Legia');
INSERT INTO soccer.player_mast VALUES (160290.0, 1213.0, 21.0, 'Bartosz Kapustka', 'MF', '1996-12-23', 19.0, '');
INSERT INTO soccer.player_mast VALUES (160291.0, 1213.0, 10.0, 'Grzegorz Krychowiak', 'MF', '1990-01-29', 26.0, 'Sevilla');
INSERT INTO soccer.player_mast VALUES (160292.0, 1213.0, 8.0, 'Karol Linetty', 'MF', '1995-02-02', 21.0, 'Lech');
INSERT INTO soccer.player_mast VALUES (160293.0, 1213.0, 5.0, 'Krzysztof Maczynski', 'MF', '1987-05-23', 29.0, 'Wisla');
INSERT INTO soccer.player_mast VALUES (160294.0, 1213.0, 17.0, 'Slawomir Peszko', 'MF', '1985-02-19', 31.0, 'Lechia');
INSERT INTO soccer.player_mast VALUES (160295.0, 1213.0, 23.0, 'Filip Starzynski', 'MF', '1991-05-27', 25.0, 'Zaglebie');
INSERT INTO soccer.player_mast VALUES (160296.0, 1213.0, 19.0, 'Piotr Zielinski', 'MF', '1994-05-20', 22.0, 'Empoli');
INSERT INTO soccer.player_mast VALUES (160297.0, 1213.0, 9.0, 'Robert Lewandowski', 'FD', '1988-08-21', 27.0, 'Bayern');
INSERT INTO soccer.player_mast VALUES (160298.0, 1213.0, 7.0, 'Arkadiusz Milik', 'FD', '1994-02-28', 22.0, 'Ajax');
INSERT INTO soccer.player_mast VALUES (160299.0, 1213.0, 13.0, 'Mariusz Stepinski', 'FD', '1995-05-12', 21.0, 'Ruch');
INSERT INTO soccer.player_mast VALUES (160300.0, 1214.0, 22.0, 'Eduardo', 'GK', '1982-09-19', 33.0, 'Dinamo Zagreb');
INSERT INTO soccer.player_mast VALUES (160301.0, 1214.0, 12.0, 'Anthony Lopes', 'GK', '1990-10-01', 25.0, 'Lyon');
INSERT INTO soccer.player_mast VALUES (160302.0, 1214.0, 1.0, 'Rui Patricio', 'GK', '1988-02-15', 28.0, 'Sporting CP');
INSERT INTO soccer.player_mast VALUES (160303.0, 1214.0, 2.0, 'Bruno Alves', 'DF', '1981-11-27', 34.0, 'Fenerbahce');
INSERT INTO soccer.player_mast VALUES (160304.0, 1214.0, 21.0, 'Cedric', 'DF', '1991-08-31', 24.0, 'Southampton');
INSERT INTO soccer.player_mast VALUES (160305.0, 1214.0, 19.0, 'Eliseu', 'DF', '1983-10-01', 32.0, 'Benfica');
INSERT INTO soccer.player_mast VALUES (160306.0, 1214.0, 4.0, 'Jose Fonte', 'DF', '1983-12-22', 32.0, 'Southampton');
INSERT INTO soccer.player_mast VALUES (160307.0, 1214.0, 3.0, 'Pepe', 'DF', '1983-02-26', 33.0, 'Real Madrid');
INSERT INTO soccer.player_mast VALUES (160308.0, 1214.0, 5.0, 'Raphael Guerreiro', 'DF', '1993-12-22', 22.0, 'Lorient');
INSERT INTO soccer.player_mast VALUES (160309.0, 1214.0, 6.0, 'Ricardo Carvalho', 'DF', '1978-05-18', 38.0, 'Monaco');
INSERT INTO soccer.player_mast VALUES (160310.0, 1214.0, 23.0, 'Adrien Silva', 'MF', '1989-03-15', 27.0, 'Sporting CP');
INSERT INTO soccer.player_mast VALUES (160311.0, 1214.0, 15.0, 'Andre Gomes', 'MF', '1993-07-30', 22.0, 'Valencia');
INSERT INTO soccer.player_mast VALUES (160312.0, 1214.0, 13.0, 'Danilo', 'MF', '1991-09-09', 24.0, 'Porto');
INSERT INTO soccer.player_mast VALUES (160313.0, 1214.0, 10.0, 'Joao Mario', 'MF', '1993-01-19', 23.0, 'Sporting CP');
INSERT INTO soccer.player_mast VALUES (160314.0, 1214.0, 8.0, 'Joao Moutinho', 'MF', '1986-09-08', 29.0, 'Monaco');
INSERT INTO soccer.player_mast VALUES (160315.0, 1214.0, 18.0, 'Rafa Silva', 'MF', '1993-05-17', 23.0, 'Braga');
INSERT INTO soccer.player_mast VALUES (160316.0, 1214.0, 16.0, 'Renato Sanches', 'MF', '1997-08-18', 18.0, 'Benfica');
INSERT INTO soccer.player_mast VALUES (160317.0, 1214.0, 11.0, 'Vieirinha', 'MF', '1986-01-24', 30.0, 'Wolfsburg');
INSERT INTO soccer.player_mast VALUES (160318.0, 1214.0, 14.0, 'William Carvalho', 'MF', '1992-04-07', 24.0, 'Sporting CP');
INSERT INTO soccer.player_mast VALUES (160319.0, 1214.0, 9.0, 'Eder', 'FD', '1987-12-22', 28.0, 'LOSC');
INSERT INTO soccer.player_mast VALUES (160320.0, 1214.0, 17.0, 'Nani', 'FD', '1986-11-17', 29.0, 'Fenerbahce');
INSERT INTO soccer.player_mast VALUES (160321.0, 1214.0, 20.0, 'Ricardo Quaresma', 'FD', '1983-09-26', 32.0, 'Besiktas');
INSERT INTO soccer.player_mast VALUES (160322.0, 1214.0, 7.0, 'Cristiano Ronaldo', 'FD', '1985-02-05', 31.0, 'Real Madrid');
INSERT INTO soccer.player_mast VALUES (160323.0, 1215.0, 16.0, 'Shay Given', 'GK', '1976-04-20', 40.0, 'Stoke');
INSERT INTO soccer.player_mast VALUES (160324.0, 1215.0, 23.0, 'Darren Randolph', 'GK', '1987-05-12', 29.0, 'West Ham');
INSERT INTO soccer.player_mast VALUES (160325.0, 1215.0, 1.0, 'Keiren Westwood', 'GK', '1984-10-23', 31.0, 'Sheff. Wednesday');
INSERT INTO soccer.player_mast VALUES (160326.0, 1215.0, 15.0, 'Cyrus Christie', 'DF', '1992-09-30', 23.0, 'Derby');
INSERT INTO soccer.player_mast VALUES (160327.0, 1215.0, 3.0, 'Ciaran Clark', 'DF', '1989-09-26', 26.0, 'Aston Villa');
INSERT INTO soccer.player_mast VALUES (160328.0, 1215.0, 2.0, 'Seamus Coleman', 'DF', '1988-10-11', 27.0, 'Everton');
INSERT INTO soccer.player_mast VALUES (160329.0, 1215.0, 12.0, 'Shane Duffy', 'DF', '1992-01-01', 24.0, 'Blackburn');
INSERT INTO soccer.player_mast VALUES (160330.0, 1215.0, 5.0, 'Richard Keogh', 'DF', '1986-08-11', 29.0, 'Derby');
INSERT INTO soccer.player_mast VALUES (160331.0, 1215.0, 4.0, 'John OShea', 'DF', '1981-04-30', 35.0, 'Sunderland');
INSERT INTO soccer.player_mast VALUES (160332.0, 1215.0, 17.0, 'Stephen Ward', 'DF', '1985-08-20', 30.0, 'Burnley');
INSERT INTO soccer.player_mast VALUES (160333.0, 1215.0, 19.0, 'Robbie Brady', 'MF', '1992-01-14', 24.0, 'Norwich');
INSERT INTO soccer.player_mast VALUES (160334.0, 1215.0, 13.0, 'Jeff Hendrick', 'MF', '1992-01-31', 24.0, 'Derby');
INSERT INTO soccer.player_mast VALUES (160335.0, 1215.0, 20.0, 'Wes Hoolahan', 'MF', '1982-05-20', 34.0, 'Norwich');
INSERT INTO soccer.player_mast VALUES (160336.0, 1215.0, 8.0, 'James McCarthy', 'MF', '1990-11-12', 25.0, 'Everton');
INSERT INTO soccer.player_mast VALUES (160337.0, 1215.0, 11.0, 'James McClean', 'MF', '1989-04-22', 27.0, 'West Brom');
INSERT INTO soccer.player_mast VALUES (160338.0, 1215.0, 7.0, 'Aiden McGeady', 'MF', '1986-04-04', 30.0, 'Sheff. Wednesday');
INSERT INTO soccer.player_mast VALUES (160339.0, 1215.0, 18.0, 'David Meyler', 'MF', '1989-05-29', 27.0, 'Hull');
INSERT INTO soccer.player_mast VALUES (160340.0, 1215.0, 22.0, 'Stephen Quinn', 'MF', '1986-04-01', 30.0, 'Reading');
INSERT INTO soccer.player_mast VALUES (160341.0, 1215.0, 6.0, 'Glenn Whelan', 'MF', '1984-01-13', 32.0, 'Stoke');
INSERT INTO soccer.player_mast VALUES (160342.0, 1215.0, 10.0, 'Robbie Keane', 'FD', '1980-07-08', 35.0, 'LA Galaxy');
INSERT INTO soccer.player_mast VALUES (160343.0, 1215.0, 9.0, 'Shane Long', 'FD', '1987-01-22', 29.0, 'Southampton');
INSERT INTO soccer.player_mast VALUES (160344.0, 1215.0, 21.0, 'Daryl Murphy', 'FD', '1983-03-15', 33.0, 'Ipswich');
INSERT INTO soccer.player_mast VALUES (160345.0, 1215.0, 14.0, 'Jon Walters', 'FD', '1983-09-20', 32.0, 'Stoke');
INSERT INTO soccer.player_mast VALUES (160346.0, 1216.0, 23.0, 'Silviu Lung', 'GK', '1989-06-04', 27.0, 'Astra');
INSERT INTO soccer.player_mast VALUES (160347.0, 1216.0, 1.0, 'Costel Pantilimon', 'GK', '1987-02-01', 29.0, 'Watford');
INSERT INTO soccer.player_mast VALUES (160348.0, 1216.0, 12.0, 'Ciprian Tatarusanu', 'GK', '1986-02-09', 30.0, 'Fiorentina');
INSERT INTO soccer.player_mast VALUES (160349.0, 1216.0, 6.0, 'Vlad Chiriches', 'DF', '1989-11-14', 26.0, 'Napoli');
INSERT INTO soccer.player_mast VALUES (160350.0, 1216.0, 16.0, 'Steliano Filip', 'DF', '1994-05-15', 22.0, 'Dinamo Bucuresti');
INSERT INTO soccer.player_mast VALUES (160351.0, 1216.0, 15.0, 'Valerica Gaman', 'DF', '1989-02-25', 27.0, 'Astra');
INSERT INTO soccer.player_mast VALUES (160352.0, 1216.0, 21.0, 'Dragos Grigore', 'DF', '1986-09-07', 29.0, 'Al-Sailiya');
INSERT INTO soccer.player_mast VALUES (160353.0, 1216.0, 2.0, 'Alexandru Matel', 'DF', '1989-10-17', 26.0, 'Dinamo Zagreb');
INSERT INTO soccer.player_mast VALUES (160354.0, 1216.0, 4.0, 'Cosmin Moti', 'DF', '1984-12-03', 31.0, 'Ludogorets');
INSERT INTO soccer.player_mast VALUES (160355.0, 1216.0, 3.0, 'Razvan Rat', 'DF', '1981-05-26', 35.0, 'Rayo Vallecano');
INSERT INTO soccer.player_mast VALUES (160356.0, 1216.0, 22.0, 'Cristian Sapunaru', 'DF', '1984-04-05', 32.0, 'Pandurii');
INSERT INTO soccer.player_mast VALUES (160357.0, 1216.0, 7.0, 'Alexandru Chipciu', 'MF', '1989-05-18', 27.0, 'Steaua');
INSERT INTO soccer.player_mast VALUES (160358.0, 1216.0, 5.0, 'Ovidiu Hoban', 'MF', '1982-12-27', 33.0, 'H. Beer-Sheva');
INSERT INTO soccer.player_mast VALUES (160359.0, 1216.0, 8.0, 'Mihai Pintilii', 'MF', '1984-11-09', 31.0, 'Steaua');
INSERT INTO soccer.player_mast VALUES (160360.0, 1216.0, 20.0, 'Adrian Popa', 'MF', '1988-07-24', 27.0, 'Steaua');
INSERT INTO soccer.player_mast VALUES (160361.0, 1216.0, 18.0, 'Andrei Prepelita', 'MF', '1985-12-08', 30.0, 'Ludogorets');
INSERT INTO soccer.player_mast VALUES (160362.0, 1216.0, 17.0, 'Lucian Sanmartean', 'MF', '1980-03-13', 36.0, 'Al-Ittihad');
INSERT INTO soccer.player_mast VALUES (160363.0, 1216.0, 10.0, 'Nicolae Stanciu', 'MF', '1993-05-07', 23.0, 'Steaua');
INSERT INTO soccer.player_mast VALUES (160364.0, 1216.0, 11.0, 'Gabriel Torje', 'MF', '1989-11-22', 26.0, 'Osmanlispor');
INSERT INTO soccer.player_mast VALUES (160365.0, 1216.0, 9.0, 'Denis Alibec', 'FD', '1991-01-05', 25.0, 'Astra');
INSERT INTO soccer.player_mast VALUES (160366.0, 1216.0, 14.0, 'Florin Andone', 'FD', '1993-04-11', 23.0, 'Cordoba');
INSERT INTO soccer.player_mast VALUES (160367.0, 1216.0, 13.0, 'Claudiu Keeru', 'FD', '1986-12-02', 29.0, 'Ludogorets');
INSERT INTO soccer.player_mast VALUES (160368.0, 1216.0, 19.0, 'Bogdan Stancu', 'FD', '1987-06-28', 28.0, 'Genclerbirligi');
INSERT INTO soccer.player_mast VALUES (160369.0, 1217.0, 1.0, 'Igor Akinfeev', 'GK', '1986-04-08', 30.0, 'CSKA Moskva');
INSERT INTO soccer.player_mast VALUES (160370.0, 1217.0, 16.0, 'Guilherme', 'GK', '1985-12-12', 30.0, 'Lokomotiv Moskva');
INSERT INTO soccer.player_mast VALUES (160371.0, 1217.0, 12.0, 'Yuri Lodygin', 'GK', '1990-05-26', 26.0, 'Zenit');
INSERT INTO soccer.player_mast VALUES (160372.0, 1217.0, 6.0, 'Aleksei Berezutski', 'DF', '1982-06-20', 33.0, 'CSKA Moskva');
INSERT INTO soccer.player_mast VALUES (160373.0, 1217.0, 14.0, 'Vasili Berezutski', 'DF', '1982-06-20', 33.0, 'CSKA Moskva');
INSERT INTO soccer.player_mast VALUES (160374.0, 1217.0, 4.0, 'Sergei Ignashevich', 'DF', '1979-07-14', 36.0, 'CSKA Moskva');
INSERT INTO soccer.player_mast VALUES (160375.0, 1217.0, 23.0, 'Dmitri Kombarov', 'DF', '1987-01-22', 29.0, 'Spartak Moskva');
INSERT INTO soccer.player_mast VALUES (160376.0, 1217.0, 5.0, 'Roman Neustadter', 'DF', '1988-02-18', 28.0, 'Schalke');
INSERT INTO soccer.player_mast VALUES (160377.0, 1217.0, 21.0, 'Georgi Schennikov', 'DF', '1991-04-27', 25.0, 'CSKA Moskva');
INSERT INTO soccer.player_mast VALUES (160378.0, 1217.0, 2.0, 'Roman Shishkin', 'DF', '1987-01-27', 29.0, 'Lokomotiv Moskva');
INSERT INTO soccer.player_mast VALUES (160379.0, 1217.0, 3.0, 'Igor Smolnikov', 'DF', '1988-08-08', 27.0, 'Zenit');
INSERT INTO soccer.player_mast VALUES (160380.0, 1217.0, 8.0, 'Denis Glushakov', 'MF', '1987-01-27', 29.0, 'Spartak Moskva');
INSERT INTO soccer.player_mast VALUES (160381.0, 1217.0, 13.0, 'Aleksandr Golovin', 'MF', '1996-05-30', 20.0, 'CSKA Moskva');
INSERT INTO soccer.player_mast VALUES (160382.0, 1217.0, 18.0, 'Oleg Ivanov', 'MF', '1986-08-04', 29.0, 'Terek');
INSERT INTO soccer.player_mast VALUES (160383.0, 1217.0, 11.0, 'Pavel Mamaev', 'MF', '1988-09-17', 27.0, 'Krasnodar');
INSERT INTO soccer.player_mast VALUES (160384.0, 1217.0, 19.0, 'Aleksandr Samedov', 'MF', '1984-07-19', 31.0, 'Lokomotiv Moskva');
INSERT INTO soccer.player_mast VALUES (160385.0, 1217.0, 17.0, 'Oleg Shatov', 'MF', '1990-07-29', 25.0, 'Zenit');
INSERT INTO soccer.player_mast VALUES (160386.0, 1217.0, 15.0, 'Roman Shirokov', 'MF', '1981-07-06', 34.0, 'CSKA Moskva');
INSERT INTO soccer.player_mast VALUES (160387.0, 1217.0, 20.0, 'Dmitri Torbinski', 'MF', '1984-04-28', 32.0, 'Krasnodar');
INSERT INTO soccer.player_mast VALUES (160388.0, 1217.0, 7.0, 'Artur Yusupov', 'MF', '1989-09-01', 26.0, 'Zenit');
INSERT INTO soccer.player_mast VALUES (160389.0, 1217.0, 22.0, 'Artem Dzyuba', 'FD', '1988-08-22', 27.0, 'Zenit');
INSERT INTO soccer.player_mast VALUES (160390.0, 1217.0, 9.0, 'Aleksandr Kokorin', 'FD', '1991-03-19', 25.0, 'Zenit');
INSERT INTO soccer.player_mast VALUES (160391.0, 1217.0, 10.0, 'Fedor Smolov', 'FD', '1990-02-09', 26.0, 'Krasnodar');
INSERT INTO soccer.player_mast VALUES (160392.0, 1218.0, 23.0, 'MatusKozacik', 'GK', '1983-12-27', 32.0, 'Plzen');
INSERT INTO soccer.player_mast VALUES (160393.0, 1218.0, 1.0, 'Jan Mucha', 'GK', '1982-12-05', 33.0, 'Slovan Bratislava');
INSERT INTO soccer.player_mast VALUES (160394.0, 1218.0, 12.0, 'Jan Novota', 'GK', '1983-11-29', 32.0, 'Rapid Wien');
INSERT INTO soccer.player_mast VALUES (160395.0, 1218.0, 4.0, 'Jan Durica', 'DF', '1981-12-10', 34.0, 'Lokomotiv Moskva');
INSERT INTO soccer.player_mast VALUES (160396.0, 1218.0, 5.0, 'Norbert Gyomber', 'DF', '1992-07-03', 23.0, 'Roma');
INSERT INTO soccer.player_mast VALUES (160397.0, 1218.0, 15.0, 'TomasHubocan', 'DF', '1985-09-17', 30.0, 'Dinamo Moskva');
INSERT INTO soccer.player_mast VALUES (160398.0, 1218.0, 2.0, 'Peter Pekarik', 'DF', '1986-10-30', 29.0, 'Hertha');
INSERT INTO soccer.player_mast VALUES (160399.0, 1218.0, 16.0, 'Kornel Salata', 'DF', '1985-01-24', 31.0, 'Slovan Bratislava');
INSERT INTO soccer.player_mast VALUES (160400.0, 1218.0, 14.0, 'Milan Skriniar', 'DF', '1995-02-11', 21.0, 'Sampdoria');
INSERT INTO soccer.player_mast VALUES (160401.0, 1218.0, 3.0, 'Martin Skrtel', 'DF', '1984-12-15', 31.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160402.0, 1218.0, 18.0, 'Dusan Svento', 'DF', '1985-08-01', 30.0, 'Koln');
INSERT INTO soccer.player_mast VALUES (160403.0, 1218.0, 8.0, 'Ondrej Duda', 'MF', '1994-12-05', 21.0, 'Legia');
INSERT INTO soccer.player_mast VALUES (160404.0, 1218.0, 6.0, 'Jan Gregus', 'MF', '1991-01-29', 25.0, 'Jablonec');
INSERT INTO soccer.player_mast VALUES (160405.0, 1218.0, 17.0, 'Marek Hamsik', 'MF', '1987-07-27', 28.0, 'Napoli');
INSERT INTO soccer.player_mast VALUES (160406.0, 1218.0, 13.0, 'Patrik HroSovsky', 'MF', '1992-04-22', 24.0, 'Plzen');
INSERT INTO soccer.player_mast VALUES (160407.0, 1218.0, 19.0, 'Juraj Kucka', 'MF', '1987-02-26', 29.0, 'Milan');
INSERT INTO soccer.player_mast VALUES (160408.0, 1218.0, 20.0, 'Robert Mak', 'MF', '1991-03-08', 25.0, 'PAOK');
INSERT INTO soccer.player_mast VALUES (160409.0, 1218.0, 22.0, 'Viktor Pecovsky', 'MF', '1983-05-24', 33.0, 'zilina');
INSERT INTO soccer.player_mast VALUES (160410.0, 1218.0, 10.0, 'Miroslav Stoch', 'MF', '1989-10-19', 26.0, 'Bursaspor');
INSERT INTO soccer.player_mast VALUES (160411.0, 1218.0, 7.0, 'Vladimir Weiss', 'MF', '1989-11-30', 26.0, 'Al-Gharafa');
INSERT INTO soccer.player_mast VALUES (160412.0, 1218.0, 21.0, 'Michal Duris', 'FD', '1988-06-01', 28.0, 'Plzen');
INSERT INTO soccer.player_mast VALUES (160413.0, 1218.0, 11.0, 'Adam Nemec', 'FD', '1985-09-02', 30.0, 'Willem II');
INSERT INTO soccer.player_mast VALUES (160414.0, 1218.0, 9.0, 'Stanislav Sestak', 'FD', '1982-12-16', 33.0, 'Ferencvaros');
INSERT INTO soccer.player_mast VALUES (160415.0, 1219.0, 1.0, 'Lker Casillas', 'GK', '1981-05-20', 35.0, 'Porto');
INSERT INTO soccer.player_mast VALUES (160416.0, 1219.0, 13.0, 'David de Gea', 'GK', '1990-11-07', 25.0, 'Man. United');
INSERT INTO soccer.player_mast VALUES (160417.0, 1219.0, 23.0, 'Sergio Rico', 'GK', '1993-09-01', 22.0, 'Sevilla');
INSERT INTO soccer.player_mast VALUES (160418.0, 1219.0, 2.0, 'Cesar Azpilicueta', 'DF', '1989-08-28', 26.0, 'Chelsea');
INSERT INTO soccer.player_mast VALUES (160419.0, 1219.0, 4.0, 'Marc Bartra', 'DF', '1991-01-15', 25.0, 'Barcelona');
INSERT INTO soccer.player_mast VALUES (160420.0, 1219.0, 12.0, 'Hector Bellerin', 'DF', '1995-03-19', 21.0, 'Arsenal');
INSERT INTO soccer.player_mast VALUES (160421.0, 1219.0, 18.0, 'Jordi Alba', 'DF', '1989-03-21', 27.0, 'Barcelona');
INSERT INTO soccer.player_mast VALUES (160422.0, 1219.0, 16.0, 'Juanfran', 'DF', '1985-01-09', 31.0, 'Atletico');
INSERT INTO soccer.player_mast VALUES (160423.0, 1219.0, 3.0, 'Gerard Pique', 'DF', '1987-02-02', 29.0, 'Barcelona');
INSERT INTO soccer.player_mast VALUES (160424.0, 1219.0, 15.0, 'Sergio Ramos', 'DF', '1986-03-30', 30.0, 'Real Madrid');
INSERT INTO soccer.player_mast VALUES (160425.0, 1219.0, 17.0, 'Mikel San Jose', 'DF', '1989-05-30', 27.0, 'Athletic');
INSERT INTO soccer.player_mast VALUES (160426.0, 1219.0, 19.0, 'Bruno Soriano', 'MF', '1984-06-12', 32.0, 'Villarreal');
INSERT INTO soccer.player_mast VALUES (160427.0, 1219.0, 5.0, 'Sergio Busquets', 'MF', '1988-07-16', 27.0, 'Barcelona');
INSERT INTO soccer.player_mast VALUES (160428.0, 1219.0, 10.0, 'Cesc Fabregas', 'MF', '1987-05-04', 29.0, 'Chelsea');
INSERT INTO soccer.player_mast VALUES (160429.0, 1219.0, 6.0, 'Andres Iniesta', 'MF', '1984-05-11', 32.0, 'Barcelona');
INSERT INTO soccer.player_mast VALUES (160430.0, 1219.0, 8.0, 'Koke', 'MF', '1992-01-08', 24.0, 'Atletico');
INSERT INTO soccer.player_mast VALUES (160431.0, 1219.0, 21.0, 'David Silva', 'MF', '1986-01-08', 30.0, 'Man. City');
INSERT INTO soccer.player_mast VALUES (160432.0, 1219.0, 14.0, 'Thiago Alcantara', 'MF', '1991-04-11', 25.0, 'Bayern');
INSERT INTO soccer.player_mast VALUES (160433.0, 1219.0, 20.0, 'Aritz Aduriz', 'FD', '1981-02-11', 35.0, 'Athletic');
INSERT INTO soccer.player_mast VALUES (160434.0, 1219.0, 9.0, 'Lucas Vazquez', 'FD', '1991-07-01', 24.0, 'Real Madrid');
INSERT INTO soccer.player_mast VALUES (160435.0, 1219.0, 7.0, 'Alvaro Morata', 'FD', '1992-10-23', 23.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160436.0, 1219.0, 22.0, 'Nolito', 'FD', '1986-10-15', 29.0, 'Celta');
INSERT INTO soccer.player_mast VALUES (160437.0, 1219.0, 11.0, 'Pedro Rodriguez', 'FD', '1987-07-28', 28.0, 'Chelsea');
INSERT INTO soccer.player_mast VALUES (160438.0, 1220.0, 23.0, 'Patrik Carlgren', 'GK', '1992-01-08', 24.0, 'AIK');
INSERT INTO soccer.player_mast VALUES (160439.0, 1220.0, 1.0, 'Andreas Isaksson', 'GK', '1981-10-03', 34.0, 'Kasimpasa');
INSERT INTO soccer.player_mast VALUES (160440.0, 1220.0, 12.0, 'Robin Olsen', 'GK', '1990-01-08', 26.0, 'Kobenhavn');
INSERT INTO soccer.player_mast VALUES (160441.0, 1220.0, 17.0, 'Ludwig Augustinsson', 'DF', '1994-04-21', 22.0, 'Kobenhavn');
INSERT INTO soccer.player_mast VALUES (160442.0, 1220.0, 4.0, 'Andreas Granqvist', 'DF', '1985-04-16', 31.0, 'Krasnodar');
INSERT INTO soccer.player_mast VALUES (160443.0, 1220.0, 13.0, 'Pontus Jansson', 'DF', '1991-02-13', 25.0, 'Torino');
INSERT INTO soccer.player_mast VALUES (160444.0, 1220.0, 3.0, 'Erik Johansson', 'DF', '1988-12-30', 27.0, 'Kobenhavn');
INSERT INTO soccer.player_mast VALUES (160445.0, 1220.0, 14.0, 'Victor Lindelof', 'DF', '1994-07-17', 21.0, 'Benfica');
INSERT INTO soccer.player_mast VALUES (160446.0, 1220.0, 2.0, 'Mikael Lustig', 'DF', '1986-12-13', 29.0, 'Celtic');
INSERT INTO soccer.player_mast VALUES (160447.0, 1220.0, 5.0, 'Martin Olsson', 'DF', '1988-05-17', 28.0, 'Norwich');
INSERT INTO soccer.player_mast VALUES (160448.0, 1220.0, 21.0, 'Jimmy Durmaz', 'MF', '1989-03-22', 27.0, 'Olympiacos');
INSERT INTO soccer.player_mast VALUES (160449.0, 1220.0, 8.0, 'Albin Ekdal', 'MF', '1989-07-28', 26.0, 'Hamburg');
INSERT INTO soccer.player_mast VALUES (160450.0, 1220.0, 22.0, 'Erkan Zengin', 'MF', '1985-08-05', 30.0, 'Trabzonspor');
INSERT INTO soccer.player_mast VALUES (160451.0, 1220.0, 6.0, 'Emil Forsberg', 'MF', '1991-10-23', 24.0, 'Leipzig');
INSERT INTO soccer.player_mast VALUES (160452.0, 1220.0, 15.0, 'Oscar Hiljemark', 'MF', '1992-06-28', 23.0, 'Palermo');
INSERT INTO soccer.player_mast VALUES (160453.0, 1220.0, 9.0, 'Kim Kallstrom', 'MF', '1982-08-24', 33.0, 'Grasshoppers');
INSERT INTO soccer.player_mast VALUES (160454.0, 1220.0, 7.0, 'Sebastian Larsson', 'MF', '1985-06-06', 31.0, 'Sunderland');
INSERT INTO soccer.player_mast VALUES (160455.0, 1220.0, 18.0, 'Oscar Lewicki', 'MF', '1992-07-14', 23.0, 'Malmo');
INSERT INTO soccer.player_mast VALUES (160456.0, 1220.0, 16.0, 'Pontus Wernbloom', 'MF', '1986-06-25', 29.0, 'CSKA Moskva');
INSERT INTO soccer.player_mast VALUES (160457.0, 1220.0, 11.0, 'Marcus Berg', 'FD', '1986-08-17', 29.0, 'Panathinaikos');
INSERT INTO soccer.player_mast VALUES (160458.0, 1220.0, 20.0, 'John Guidetti', 'FD', '1992-04-15', 24.0, 'Celta');
INSERT INTO soccer.player_mast VALUES (160459.0, 1220.0, 10.0, 'Zlatan Ibrahimovic', 'FD', '1981-10-03', 34.0, 'Paris');
INSERT INTO soccer.player_mast VALUES (160460.0, 1220.0, 19.0, 'Emir Kujovic', 'FD', '1988-06-22', 27.0, 'Norrkoping');
INSERT INTO soccer.player_mast VALUES (160461.0, 1221.0, 21.0, 'Roman Burki', 'GK', '1990-11-14', 25.0, 'Dortmund');
INSERT INTO soccer.player_mast VALUES (160462.0, 1221.0, 12.0, 'Marwin Hitz', 'GK', '1987-09-18', 28.0, 'Augsburg');
INSERT INTO soccer.player_mast VALUES (160463.0, 1221.0, 1.0, 'Yann Sommer', 'GK', '1988-12-17', 27.0, 'Monchengladbach');
INSERT INTO soccer.player_mast VALUES (160464.0, 1221.0, 20.0, 'Johan Djourou', 'DF', '1987-01-18', 29.0, 'Hamburg');
INSERT INTO soccer.player_mast VALUES (160465.0, 1221.0, 4.0, 'Nico Elvedi', 'DF', '1996-09-30', 19.0, 'Monchengladbach');
INSERT INTO soccer.player_mast VALUES (160466.0, 1221.0, 6.0, 'Michael Lang', 'DF', '1991-02-08', 25.0, 'Basel');
INSERT INTO soccer.player_mast VALUES (160467.0, 1221.0, 2.0, 'Stephan Lichtsteiner', 'DF', '1984-01-16', 32.0, 'Juventus');
INSERT INTO soccer.player_mast VALUES (160468.0, 1221.0, 3.0, 'Francois Moubandje', 'DF', '1990-06-21', 25.0, 'Toulouse');
INSERT INTO soccer.player_mast VALUES (160469.0, 1221.0, 13.0, 'Ricardo Rodriguez', 'DF', '1992-08-25', 23.0, 'Wolfsburg');
INSERT INTO soccer.player_mast VALUES (160470.0, 1221.0, 22.0, 'Fabian Schar', 'DF', '1991-12-20', 24.0, 'Hoffenheim');
INSERT INTO soccer.player_mast VALUES (160471.0, 1221.0, 5.0, 'Steve von Bergen', 'DF', '1983-06-10', 33.0, 'Young Boys');
INSERT INTO soccer.player_mast VALUES (160472.0, 1221.0, 11.0, 'Valon Behrami', 'MF', '1985-04-19', 31.0, 'Watford');
INSERT INTO soccer.player_mast VALUES (160473.0, 1221.0, 15.0, 'Blerim Dzemaili', 'MF', '1986-04-12', 30.0, 'Genoa');
INSERT INTO soccer.player_mast VALUES (160474.0, 1221.0, 16.0, 'Gelson Fernandes', 'MF', '1986-09-02', 29.0, 'Rennes');
INSERT INTO soccer.player_mast VALUES (160475.0, 1221.0, 8.0, 'Fabian Frei', 'MF', '1989-01-08', 27.0, 'Mainz');
INSERT INTO soccer.player_mast VALUES (160476.0, 1221.0, 23.0, 'Xherdan Shaqiri', 'MF', '1991-10-10', 24.0, 'Stoke');
INSERT INTO soccer.player_mast VALUES (160477.0, 1221.0, 10.0, 'Granit Xhaka', 'MF', '1992-09-27', 23.0, 'Monchengladbach');
INSERT INTO soccer.player_mast VALUES (160478.0, 1221.0, 14.0, 'Denis Zakaria', 'MF', '1996-11-20', 19.0, 'Young Boys');
INSERT INTO soccer.player_mast VALUES (160479.0, 1221.0, 19.0, 'Eren Derdiyok', 'FD', '1988-06-12', 28.0, 'Kasimpasa');
INSERT INTO soccer.player_mast VALUES (160480.0, 1221.0, 7.0, 'Breel Embolo', 'FD', '1997-02-14', 19.0, 'Basel');
INSERT INTO soccer.player_mast VALUES (160481.0, 1221.0, 18.0, 'Admir Mehmedi', 'FD', '1991-03-16', 25.0, 'Leverkusen');
INSERT INTO soccer.player_mast VALUES (160482.0, 1221.0, 9.0, 'Haris Seferovic', 'FD', '1992-02-22', 24.0, 'Frankfurt');
INSERT INTO soccer.player_mast VALUES (160483.0, 1221.0, 17.0, 'Shani Tarashaj', 'FD', '1995-02-07', 21.0, 'Grasshoppers');
INSERT INTO soccer.player_mast VALUES (160484.0, 1222.0, 23.0, 'Harun Tekin', 'GK', '1989-06-17', 27.0, 'Bursaspor');
INSERT INTO soccer.player_mast VALUES (160485.0, 1222.0, 12.0, 'Onur Kivrak', 'GK', '1988-01-01', 28.0, 'Trabzonspor');
INSERT INTO soccer.player_mast VALUES (160486.0, 1222.0, 1.0, 'Volkan Babacan', 'GK', '1988-08-11', 27.0, 'Istanbul Basaksehir');
INSERT INTO soccer.player_mast VALUES (160487.0, 1222.0, 4.0, 'Ahmet Calik', 'DF', '1994-02-26', 22.0, 'Genclerbirligi');
INSERT INTO soccer.player_mast VALUES (160488.0, 1222.0, 18.0, 'Caner Erkin', 'DF', '1988-10-04', 27.0, 'Fenerbahce');
INSERT INTO soccer.player_mast VALUES (160489.0, 1222.0, 7.0, 'Gokhan Gonul', 'DF', '1985-01-04', 31.0, 'Fenerbahce');
INSERT INTO soccer.player_mast VALUES (160490.0, 1222.0, 3.0, 'Hakan Balta', 'DF', '1983-03-23', 33.0, 'Galatasaray');
INSERT INTO soccer.player_mast VALUES (160491.0, 1222.0, 13.0, 'Ismail Koybasi', 'DF', '1989-07-10', 26.0, 'Besiktas');
INSERT INTO soccer.player_mast VALUES (160492.0, 1222.0, 2.0, 'Semih Kaya', 'DF', '1991-02-24', 25.0, 'Galatasaray');
INSERT INTO soccer.player_mast VALUES (160493.0, 1222.0, 22.0, 'Sener Ozbayrakli', 'DF', '1990-01-23', 26.0, 'Fenerbahce');
INSERT INTO soccer.player_mast VALUES (160494.0, 1222.0, 10.0, 'Arda Turan', 'MF', '1987-01-30', 29.0, 'Barcelona');
INSERT INTO soccer.player_mast VALUES (160495.0, 1222.0, 6.0, 'Hakan Calhanoglu', 'MF', '1994-02-08', 22.0, 'Leverkusen');
INSERT INTO soccer.player_mast VALUES (160496.0, 1222.0, 15.0, 'Mehmet Topal', 'MF', '1986-03-03', 30.0, 'Fenerbahce');
INSERT INTO soccer.player_mast VALUES (160497.0, 1222.0, 5.0, 'Nuri Sahin', 'MF', '1988-09-05', 27.0, 'Dortmund');
INSERT INTO soccer.player_mast VALUES (160498.0, 1222.0, 14.0, 'Oguzhan Ozyakup', 'MF', '1992-09-23', 23.0, 'Besiktas');
INSERT INTO soccer.player_mast VALUES (160499.0, 1222.0, 11.0, 'Olcay Sahan', 'MF', '1987-05-26', 29.0, 'Besiktas');
INSERT INTO soccer.player_mast VALUES (160500.0, 1222.0, 16.0, 'Ozan Tufan', 'MF', '1995-03-23', 21.0, 'Fenerbahce');
INSERT INTO soccer.player_mast VALUES (160501.0, 1222.0, 8.0, 'Selcuk Inan', 'MF', '1985-02-10', 31.0, 'Galatasaray');
INSERT INTO soccer.player_mast VALUES (160502.0, 1222.0, 20.0, 'Volkan Sen', 'MF', '1987-07-07', 28.0, 'Fenerbahce');
INSERT INTO soccer.player_mast VALUES (160503.0, 1222.0, 19.0, 'Yunus Malli', 'MF', '1992-02-24', 24.0, 'Mainz');
INSERT INTO soccer.player_mast VALUES (160504.0, 1222.0, 17.0, 'Burak Yilmaz', 'FD', '1985-07-15', 30.0, 'Beijing Guoan');
INSERT INTO soccer.player_mast VALUES (160505.0, 1222.0, 9.0, 'Cenk Tosun', 'FD', '1991-06-07', 25.0, 'Besiktas');
INSERT INTO soccer.player_mast VALUES (160506.0, 1222.0, 21.0, 'Emre Mor', 'FD', '1997-07-24', 18.0, 'Nordsjælland');
INSERT INTO soccer.player_mast VALUES (160507.0, 1223.0, 1.0, 'Denys Boyko', 'GK', '1988-01-29', 28.0, 'Besiktas');
INSERT INTO soccer.player_mast VALUES (160508.0, 1223.0, 12.0, 'Andriy Pyatov', 'GK', '1984-06-28', 31.0, 'Shakhtar Donetsk');
INSERT INTO soccer.player_mast VALUES (160509.0, 1223.0, 23.0, 'Mykyta Shevchenko', 'GK', '1993-01-26', 23.0, 'Zorya');
INSERT INTO soccer.player_mast VALUES (160510.0, 1223.0, 2.0, 'Bohdan Butko', 'DF', '1991-01-13', 25.0, 'Amkar');
INSERT INTO soccer.player_mast VALUES (160511.0, 1223.0, 17.0, 'Artem Fedetskiy', 'DF', '1985-04-26', 31.0, 'Dnipro');
INSERT INTO soccer.player_mast VALUES (160512.0, 1223.0, 3.0, 'Yevhen Khacheridi', 'DF', '1987-07-28', 28.0, 'Dynamo Kyiv');
INSERT INTO soccer.player_mast VALUES (160513.0, 1223.0, 5.0, 'Olexandr Kucher', 'DF', '1982-10-22', 33.0, 'Shakhtar Donetsk');
INSERT INTO soccer.player_mast VALUES (160514.0, 1223.0, 20.0, 'Yaroslav Rakitskiy', 'DF', '1989-08-03', 26.0, 'Shakhtar Donetsk');
INSERT INTO soccer.player_mast VALUES (160515.0, 1223.0, 13.0, 'Vyacheslav Shevchuk', 'DF', '1979-05-13', 37.0, 'Shakhtar Donetsk');
INSERT INTO soccer.player_mast VALUES (160516.0, 1223.0, 19.0, 'Denys Garmash', 'MF', '1990-04-19', 26.0, 'Dynamo Kyiv');
INSERT INTO soccer.player_mast VALUES (160517.0, 1223.0, 22.0, 'Olexandr Karavaev', 'MF', '1992-06-02', 24.0, 'Zorya');
INSERT INTO soccer.player_mast VALUES (160518.0, 1223.0, 10.0, 'Yevhen Konoplyanka', 'MF', '1989-09-29', 26.0, 'Sevilla');
INSERT INTO soccer.player_mast VALUES (160519.0, 1223.0, 9.0, 'Viktor Kovalenko', 'MF', '1996-02-14', 20.0, 'Shakhtar Donetsk');
INSERT INTO soccer.player_mast VALUES (160520.0, 1223.0, 14.0, 'Ruslan Rotan', 'MF', '1981-10-29', 34.0, 'Dnipro');
INSERT INTO soccer.player_mast VALUES (160521.0, 1223.0, 18.0, 'Serhiy Rybalka', 'MF', '1990-04-01', 26.0, 'Dynamo Kyiv');
INSERT INTO soccer.player_mast VALUES (160522.0, 1223.0, 6.0, 'Taras Stepanenko', 'MF', '1989-08-08', 26.0, 'Shakhtar Donetsk');
INSERT INTO soccer.player_mast VALUES (160523.0, 1223.0, 16.0, 'Serhiy Sydorchuk', 'MF', '1991-05-02', 25.0, 'Dynamo Kyiv');
INSERT INTO soccer.player_mast VALUES (160524.0, 1223.0, 4.0, 'Anatoliy Tymoshchuk', 'MF', '1979-03-30', 37.0, 'Kairat');
INSERT INTO soccer.player_mast VALUES (160525.0, 1223.0, 7.0, 'Andriy Yarmolenko', 'MF', '1989-10-23', 26.0, 'Dynamo Kyiv');
INSERT INTO soccer.player_mast VALUES (160526.0, 1223.0, 21.0, 'Olexandr Zinchenko', 'MF', '1996-12-15', 19.0, 'Ufa');
INSERT INTO soccer.player_mast VALUES (160527.0, 1223.0, 15.0, 'Pylyp Budkivskiy', 'FD', '1992-03-10', 24.0, 'Zorya');
INSERT INTO soccer.player_mast VALUES (160528.0, 1223.0, 11.0, 'Yevhen Seleznyov', 'FD', '1985-07-20', 30.0, 'Shakhtar Donetsk');
INSERT INTO soccer.player_mast VALUES (160529.0, 1223.0, 8.0, 'Roman Zozulya', 'FD', '1989-11-17', 26.0, 'Dnipro');
INSERT INTO soccer.player_mast VALUES (160530.0, 1224.0, 12.0, 'Owain Fon Williams', 'GK', '1987-03-17', 29.0, 'Inverness');
INSERT INTO soccer.player_mast VALUES (160531.0, 1224.0, 1.0, 'Wayne Hennessey', 'GK', '1987-01-24', 29.0, 'Crystal Palace');
INSERT INTO soccer.player_mast VALUES (160532.0, 1224.0, 21.0, 'Danny Ward', 'GK', '1993-06-22', 22.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160533.0, 1224.0, 5.0, 'James Chester', 'DF', '1989-01-23', 27.0, 'West Brom');
INSERT INTO soccer.player_mast VALUES (160534.0, 1224.0, 19.0, 'James Collins', 'DF', '1983-08-23', 32.0, 'West Ham');
INSERT INTO soccer.player_mast VALUES (160535.0, 1224.0, 4.0, 'Ben Davies', 'DF', '1993-04-24', 23.0, 'Tottenham');
INSERT INTO soccer.player_mast VALUES (160536.0, 1224.0, 2.0, 'Chris Gunter', 'DF', '1989-07-21', 26.0, 'Reading');
INSERT INTO soccer.player_mast VALUES (160537.0, 1224.0, 15.0, 'Jazz Richards', 'DF', '1991-04-12', 25.0, 'Fulham');
INSERT INTO soccer.player_mast VALUES (160538.0, 1224.0, 3.0, 'Neil Taylor', 'DF', '1989-02-07', 27.0, 'Swansea');
INSERT INTO soccer.player_mast VALUES (160539.0, 1224.0, 6.0, 'Ashley Williams', 'DF', '1984-08-23', 31.0, 'Swansea');
INSERT INTO soccer.player_mast VALUES (160540.0, 1224.0, 7.0, 'Joe Allen', 'MF', '1990-03-14', 26.0, 'Liverpool');
INSERT INTO soccer.player_mast VALUES (160541.0, 1224.0, 14.0, 'David Edwards', 'MF', '1986-02-03', 30.0, 'Wolves');
INSERT INTO soccer.player_mast VALUES (160542.0, 1224.0, 8.0, 'Andy King', 'MF', '1988-10-29', 27.0, 'Leicester');
INSERT INTO soccer.player_mast VALUES (160543.0, 1224.0, 16.0, 'Joe Ledley', 'MF', '1987-01-23', 29.0, 'Crystal Palace');
INSERT INTO soccer.player_mast VALUES (160544.0, 1224.0, 10.0, 'Aaron Ramsey', 'MF', '1990-12-26', 25.0, 'Arsenal');
INSERT INTO soccer.player_mast VALUES (160545.0, 1224.0, 22.0, 'David Vaughan', 'MF', '1983-02-18', 33.0, 'Nottm Forest');
INSERT INTO soccer.player_mast VALUES (160546.0, 1224.0, 20.0, 'Jonathan Williams', 'MF', '1993-10-09', 22.0, 'Crystal Palace');
INSERT INTO soccer.player_mast VALUES (160547.0, 1224.0, 11.0, 'Gareth Bale', 'FD', '1989-07-16', 26.0, 'Real Madrid');
INSERT INTO soccer.player_mast VALUES (160548.0, 1224.0, 23.0, 'Simon Church', 'FD', '1988-12-10', 27.0, 'MK Dons');
INSERT INTO soccer.player_mast VALUES (160549.0, 1224.0, 17.0, 'David Cotterill', 'FD', '1987-12-04', 28.0, 'Birmingham');
INSERT INTO soccer.player_mast VALUES (160550.0, 1224.0, 9.0, 'Hal Robson-Kanu', 'FD', '1989-05-21', 27.0, 'Reading');
INSERT INTO soccer.player_mast VALUES (160551.0, 1224.0, 18.0, 'Sam Vokes', 'FD', '1989-10-21', 26.0, 'Burnley');
INSERT INTO soccer.player_mast VALUES (160552.0, 1224.0, 13.0, 'George Williams', 'FD', '1995-09-07', 20.0, 'Fulham');


--
-- Data for Name: playing_position; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.playing_position VALUES ('DF', 'Defenders');
INSERT INTO soccer.playing_position VALUES ('FD', 'Defenders');
INSERT INTO soccer.playing_position VALUES ('GK', 'Goalkeepers');
INSERT INTO soccer.playing_position VALUES ('MF', 'Midfielders');


--
-- Data for Name: referee_mast; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.referee_mast VALUES (70001.0, 'Damir Skomina', 1225.0);
INSERT INTO soccer.referee_mast VALUES (70002.0, 'Martin Atkinson', 1206.0);
INSERT INTO soccer.referee_mast VALUES (70003.0, 'Felix Brych', 1208.0);
INSERT INTO soccer.referee_mast VALUES (70004.0, 'Cuneyt Cakir', 1222.0);
INSERT INTO soccer.referee_mast VALUES (70005.0, 'Mark Clattenburg', 1206.0);
INSERT INTO soccer.referee_mast VALUES (70006.0, 'Jonas Eriksson', 1220.0);
INSERT INTO soccer.referee_mast VALUES (70007.0, 'Viktor Kassai', 1209.0);
INSERT INTO soccer.referee_mast VALUES (70008.0, 'Bjorn Kuipers', 1226.0);
INSERT INTO soccer.referee_mast VALUES (70009.0, 'Szymon Marciniak', 1213.0);
INSERT INTO soccer.referee_mast VALUES (70010.0, 'Milorad Mazic', 1227.0);
INSERT INTO soccer.referee_mast VALUES (70011.0, 'Nicola Rizzoli', 1211.0);
INSERT INTO soccer.referee_mast VALUES (70012.0, 'Carlos Velasco Carballo', 1219.0);
INSERT INTO soccer.referee_mast VALUES (70013.0, 'William Collum', 1228.0);
INSERT INTO soccer.referee_mast VALUES (70014.0, 'Ovidiu Hategan', 1216.0);
INSERT INTO soccer.referee_mast VALUES (70015.0, 'Sergei Karasev', 1217.0);
INSERT INTO soccer.referee_mast VALUES (70016.0, 'Pavel Kralovec', 1205.0);
INSERT INTO soccer.referee_mast VALUES (70017.0, 'Svein Oddvar Moen', 1229.0);
INSERT INTO soccer.referee_mast VALUES (70018.0, 'Clement Turpin', 1207.0);


--
-- Data for Name: soccer_city; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.soccer_city VALUES (10001.0, 'Paris', 1207.0);
INSERT INTO soccer.soccer_city VALUES (10002.0, 'Saint-Denis', 1207.0);
INSERT INTO soccer.soccer_city VALUES (10003.0, 'Bordeaux', 1207.0);
INSERT INTO soccer.soccer_city VALUES (10004.0, 'Lens', 1207.0);
INSERT INTO soccer.soccer_city VALUES (10005.0, 'Lille', 1207.0);
INSERT INTO soccer.soccer_city VALUES (10006.0, 'Lyon', 1207.0);
INSERT INTO soccer.soccer_city VALUES (10007.0, 'Marseille', 1207.0);
INSERT INTO soccer.soccer_city VALUES (10008.0, 'Nice', 1207.0);
INSERT INTO soccer.soccer_city VALUES (10009.0, 'Saint-Etienne', 1207.0);
INSERT INTO soccer.soccer_city VALUES (10010.0, 'Toulouse', 1207.0);


--
-- Data for Name: soccer_country; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.soccer_country VALUES (1201.0, 'ALB', 'Albania');
INSERT INTO soccer.soccer_country VALUES (1202.0, 'AUT', 'Austria');
INSERT INTO soccer.soccer_country VALUES (1203.0, 'BEL', 'Belgium');
INSERT INTO soccer.soccer_country VALUES (1204.0, 'CRO', 'Croatia');
INSERT INTO soccer.soccer_country VALUES (1205.0, 'CZE', 'Czech Republic');
INSERT INTO soccer.soccer_country VALUES (1206.0, 'ENG', 'England');
INSERT INTO soccer.soccer_country VALUES (1207.0, 'FRA', 'France');
INSERT INTO soccer.soccer_country VALUES (1208.0, 'GER', 'Germany');
INSERT INTO soccer.soccer_country VALUES (1209.0, 'HUN', 'Hungary');
INSERT INTO soccer.soccer_country VALUES (1210.0, 'ISL', 'Iceland');
INSERT INTO soccer.soccer_country VALUES (1211.0, 'ITA', 'Italy');
INSERT INTO soccer.soccer_country VALUES (1212.0, 'NIR', 'Northern Ireland');
INSERT INTO soccer.soccer_country VALUES (1213.0, 'POL', 'Poland');
INSERT INTO soccer.soccer_country VALUES (1214.0, 'POR', 'Portugal');
INSERT INTO soccer.soccer_country VALUES (1215.0, 'IRL', 'Republic of Ireland');
INSERT INTO soccer.soccer_country VALUES (1216.0, 'ROU', 'Romania');
INSERT INTO soccer.soccer_country VALUES (1217.0, 'RUS', 'Russia');
INSERT INTO soccer.soccer_country VALUES (1218.0, 'SVK', 'Slovakia');
INSERT INTO soccer.soccer_country VALUES (1219.0, 'ESP', 'Spain');
INSERT INTO soccer.soccer_country VALUES (1220.0, 'SWE', 'Sweden');
INSERT INTO soccer.soccer_country VALUES (1221.0, 'SUI', 'Switzerland');
INSERT INTO soccer.soccer_country VALUES (1222.0, 'TUR', 'Turkey');
INSERT INTO soccer.soccer_country VALUES (1223.0, 'UKR', 'Ukraine');
INSERT INTO soccer.soccer_country VALUES (1224.0, 'WAL', 'Wales');
INSERT INTO soccer.soccer_country VALUES (1225.0, 'SLO', 'Slovenia');
INSERT INTO soccer.soccer_country VALUES (1226.0, 'NED', 'Netherlands');
INSERT INTO soccer.soccer_country VALUES (1227.0, 'SRB', 'Serbia');
INSERT INTO soccer.soccer_country VALUES (1228.0, 'SCO', 'Scotland');
INSERT INTO soccer.soccer_country VALUES (1229.0, 'NOR', 'Norway');


--
-- Data for Name: soccer_team; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.soccer_team VALUES (1201.0, 'A', 3.0, 1.0, 0.0, 2.0, 1.0, 3.0, -2.0, 3.0, 3.0);
INSERT INTO soccer.soccer_team VALUES (1202.0, 'F', 3.0, 0.0, 1.0, 2.0, 1.0, 4.0, -3.0, 1.0, 4.0);
INSERT INTO soccer.soccer_team VALUES (1203.0, 'E', 3.0, 2.0, 0.0, 1.0, 4.0, 2.0, 2.0, 6.0, 2.0);
INSERT INTO soccer.soccer_team VALUES (1204.0, 'D', 3.0, 2.0, 1.0, 0.0, 5.0, 3.0, 2.0, 7.0, 1.0);
INSERT INTO soccer.soccer_team VALUES (1205.0, 'D', 3.0, 0.0, 1.0, 2.0, 2.0, 5.0, -3.0, 1.0, 4.0);
INSERT INTO soccer.soccer_team VALUES (1206.0, 'B', 3.0, 1.0, 2.0, 0.0, 3.0, 2.0, 1.0, 5.0, 2.0);
INSERT INTO soccer.soccer_team VALUES (1207.0, 'A', 3.0, 2.0, 1.0, 0.0, 4.0, 1.0, 3.0, 7.0, 1.0);
INSERT INTO soccer.soccer_team VALUES (1208.0, 'C', 3.0, 2.0, 1.0, 0.0, 3.0, 0.0, 3.0, 7.0, 1.0);
INSERT INTO soccer.soccer_team VALUES (1209.0, 'F', 3.0, 1.0, 2.0, 0.0, 6.0, 4.0, 2.0, 5.0, 1.0);
INSERT INTO soccer.soccer_team VALUES (1210.0, 'F', 3.0, 1.0, 2.0, 0.0, 4.0, 3.0, 1.0, 5.0, 2.0);
INSERT INTO soccer.soccer_team VALUES (1211.0, 'E', 3.0, 2.0, 0.0, 1.0, 3.0, 1.0, 2.0, 6.0, 1.0);
INSERT INTO soccer.soccer_team VALUES (1212.0, 'C', 3.0, 1.0, 0.0, 2.0, 2.0, 2.0, 0.0, 3.0, 3.0);
INSERT INTO soccer.soccer_team VALUES (1213.0, 'C', 3.0, 2.0, 1.0, 0.0, 2.0, 0.0, 2.0, 7.0, 2.0);
INSERT INTO soccer.soccer_team VALUES (1214.0, 'F', 3.0, 0.0, 3.0, 0.0, 4.0, 4.0, 0.0, 3.0, 3.0);
INSERT INTO soccer.soccer_team VALUES (1215.0, 'E', 3.0, 1.0, 1.0, 1.0, 2.0, 4.0, -2.0, 4.0, 3.0);
INSERT INTO soccer.soccer_team VALUES (1216.0, 'A', 3.0, 0.0, 1.0, 2.0, 2.0, 4.0, -2.0, 1.0, 4.0);
INSERT INTO soccer.soccer_team VALUES (1217.0, 'B', 3.0, 0.0, 1.0, 2.0, 2.0, 6.0, -4.0, 1.0, 4.0);
INSERT INTO soccer.soccer_team VALUES (1218.0, 'B', 3.0, 1.0, 1.0, 1.0, 3.0, 3.0, 0.0, 4.0, 3.0);
INSERT INTO soccer.soccer_team VALUES (1219.0, 'D', 3.0, 2.0, 0.0, 1.0, 5.0, 2.0, 3.0, 6.0, 2.0);
INSERT INTO soccer.soccer_team VALUES (1220.0, 'E', 3.0, 0.0, 1.0, 2.0, 1.0, 3.0, -2.0, 1.0, 4.0);
INSERT INTO soccer.soccer_team VALUES (1221.0, 'A', 3.0, 1.0, 2.0, 0.0, 2.0, 1.0, 1.0, 5.0, 2.0);
INSERT INTO soccer.soccer_team VALUES (1222.0, 'D', 3.0, 1.0, 0.0, 2.0, 2.0, 4.0, -2.0, 3.0, 3.0);
INSERT INTO soccer.soccer_team VALUES (1223.0, 'C', 3.0, 0.0, 0.0, 3.0, 0.0, 5.0, -5.0, 0.0, 4.0);
INSERT INTO soccer.soccer_team VALUES (1224.0, 'B', 3.0, 2.0, 0.0, 1.0, 6.0, 3.0, 3.0, 6.0, 1.0);


--
-- Data for Name: soccer_venue; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.soccer_venue VALUES (20001.0, 'Stade de Bordeaux', 10003.0, 42115.0);
INSERT INTO soccer.soccer_venue VALUES (20002.0, 'Stade Bollaert-Delelis', 10004.0, 38223.0);
INSERT INTO soccer.soccer_venue VALUES (20003.0, 'Stade Pierre Mauroy', 10005.0, 49822.0);
INSERT INTO soccer.soccer_venue VALUES (20004.0, 'Stade de Lyon', 10006.0, 58585.0);
INSERT INTO soccer.soccer_venue VALUES (20005.0, 'Stade VElodrome', 10007.0, 64354.0);
INSERT INTO soccer.soccer_venue VALUES (20006.0, 'Stade de Nice', 10008.0, 35624.0);
INSERT INTO soccer.soccer_venue VALUES (20007.0, 'Parc des Princes', 10001.0, 47294.0);
INSERT INTO soccer.soccer_venue VALUES (20008.0, 'Stade de France', 10002.0, 80100.0);
INSERT INTO soccer.soccer_venue VALUES (20009.0, 'Stade Geoffroy Guichard', 10009.0, 42000.0);
INSERT INTO soccer.soccer_venue VALUES (20010.0, 'Stadium de Toulouse', 10010.0, 33150.0);


--
-- Data for Name: staff_type; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.staff_type VALUES (1, 'Team doctory');
INSERT INTO soccer.staff_type VALUES (2, 'Masseur');
INSERT INTO soccer.staff_type VALUES (3, 'Physiotherapist');
INSERT INTO soccer.staff_type VALUES (4, 'Association delegate');


--
-- Data for Name: team_coaches; Type: TABLE DATA; Schema: soccer; Owner: -
--

INSERT INTO soccer.team_coaches VALUES (1201.0, 5550.0);
INSERT INTO soccer.team_coaches VALUES (1202.0, 5551.0);
INSERT INTO soccer.team_coaches VALUES (1203.0, 5552.0);
INSERT INTO soccer.team_coaches VALUES (1204.0, 5553.0);
INSERT INTO soccer.team_coaches VALUES (1205.0, 5554.0);
INSERT INTO soccer.team_coaches VALUES (1206.0, 5555.0);
INSERT INTO soccer.team_coaches VALUES (1207.0, 5556.0);
INSERT INTO soccer.team_coaches VALUES (1208.0, 5557.0);
INSERT INTO soccer.team_coaches VALUES (1209.0, 5558.0);
INSERT INTO soccer.team_coaches VALUES (1210.0, 5559.0);
INSERT INTO soccer.team_coaches VALUES (1210.0, 5560.0);
INSERT INTO soccer.team_coaches VALUES (1211.0, 5561.0);
INSERT INTO soccer.team_coaches VALUES (1212.0, 5562.0);
INSERT INTO soccer.team_coaches VALUES (1213.0, 5563.0);
INSERT INTO soccer.team_coaches VALUES (1214.0, 5564.0);
INSERT INTO soccer.team_coaches VALUES (1215.0, 5565.0);
INSERT INTO soccer.team_coaches VALUES (1216.0, 5566.0);
INSERT INTO soccer.team_coaches VALUES (1217.0, 5567.0);
INSERT INTO soccer.team_coaches VALUES (1218.0, 5568.0);
INSERT INTO soccer.team_coaches VALUES (1219.0, 5569.0);
INSERT INTO soccer.team_coaches VALUES (1220.0, 5570.0);
INSERT INTO soccer.team_coaches VALUES (1221.0, 5571.0);
INSERT INTO soccer.team_coaches VALUES (1222.0, 5572.0);
INSERT INTO soccer.team_coaches VALUES (1223.0, 5573.0);
INSERT INTO soccer.team_coaches VALUES (1224.0, 5574.0);


--
-- Data for Name: team_staff; Type: TABLE DATA; Schema: soccer; Owner: -
--



--
-- Name: staff_type_type_id_seq; Type: SEQUENCE SET; Schema: soccer; Owner: -
--

SELECT pg_catalog.setval('soccer.staff_type_type_id_seq', 1, false);


--
-- Name: team_staff_staff_id_seq; Type: SEQUENCE SET; Schema: soccer; Owner: -
--

SELECT pg_catalog.setval('soccer.team_staff_staff_id_seq', 1, false);


--
-- Name: asst_referee_mast asst_referee_mast_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.asst_referee_mast
    ADD CONSTRAINT asst_referee_mast_pkey PRIMARY KEY (ass_ref_id);


--
-- Name: coach_mast coach_mast_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.coach_mast
    ADD CONSTRAINT coach_mast_pkey PRIMARY KEY (coach_id);


--
-- Name: goal_details goal_details_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.goal_details
    ADD CONSTRAINT goal_details_pkey PRIMARY KEY (goal_id);


--
-- Name: match_captain match_captain_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_captain
    ADD CONSTRAINT match_captain_pkey PRIMARY KEY (id_match, id_country, id_player);


--
-- Name: match_details match_details_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_details
    ADD CONSTRAINT match_details_pkey PRIMARY KEY (id);


--
-- Name: match_mast match_mast_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_mast
    ADD CONSTRAINT match_mast_pkey PRIMARY KEY (match_id);


--
-- Name: penalty_goalkeeper penalty_goalkeeper_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.penalty_goalkeeper
    ADD CONSTRAINT penalty_goalkeeper_pkey PRIMARY KEY (id_match, id_country, id_player);


--
-- Name: penalty_shootout penalty_shootout_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.penalty_shootout
    ADD CONSTRAINT penalty_shootout_pkey PRIMARY KEY (kick_id);


--
-- Name: player_booked player_booked_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_booked
    ADD CONSTRAINT player_booked_pkey PRIMARY KEY (id);


--
-- Name: player_in_out player_in_out_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_in_out
    ADD CONSTRAINT player_in_out_pkey PRIMARY KEY (id);


--
-- Name: player_mast player_mast_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_mast
    ADD CONSTRAINT player_mast_pkey PRIMARY KEY (player_id);


--
-- Name: playing_position playing_position_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.playing_position
    ADD CONSTRAINT playing_position_pkey PRIMARY KEY (position_id);


--
-- Name: referee_mast referee_mast_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.referee_mast
    ADD CONSTRAINT referee_mast_pkey PRIMARY KEY (referee_id);


--
-- Name: soccer_city soccer_city_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.soccer_city
    ADD CONSTRAINT soccer_city_pkey PRIMARY KEY (city_id);


--
-- Name: soccer_country soccer_country_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.soccer_country
    ADD CONSTRAINT soccer_country_pkey PRIMARY KEY (country_id);


--
-- Name: soccer_venue soccer_venue_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.soccer_venue
    ADD CONSTRAINT soccer_venue_pkey PRIMARY KEY (venue_id);


--
-- Name: staff_type staff_type_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.staff_type
    ADD CONSTRAINT staff_type_pkey PRIMARY KEY (type_id);


--
-- Name: team_staff team_staff_pkey; Type: CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.team_staff
    ADD CONSTRAINT team_staff_pkey PRIMARY KEY (staff_id);


--
-- Name: idx_asst_referee_mast_id_country; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_asst_referee_mast_id_country ON soccer.asst_referee_mast USING btree (id_country);


--
-- Name: idx_goal_details_id_country; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_goal_details_id_country ON soccer.goal_details USING btree (id_country);


--
-- Name: idx_goal_details_id_match; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_goal_details_id_match ON soccer.goal_details USING btree (id_match);


--
-- Name: idx_goal_details_id_player; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_goal_details_id_player ON soccer.goal_details USING btree (id_player);


--
-- Name: idx_match_captain_id_country; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_match_captain_id_country ON soccer.match_captain USING btree (id_country);


--
-- Name: idx_match_captain_id_player; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_match_captain_id_player ON soccer.match_captain USING btree (id_player);


--
-- Name: idx_match_details_id_ass_ref; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_match_details_id_ass_ref ON soccer.match_details USING btree (id_ass_ref);


--
-- Name: idx_match_details_id_country; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_match_details_id_country ON soccer.match_details USING btree (id_country);


--
-- Name: idx_match_details_id_match; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_match_details_id_match ON soccer.match_details USING btree (id_match);


--
-- Name: idx_match_details_id_player_goalkeeper; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_match_details_id_player_goalkeeper ON soccer.match_details USING btree (id_player_goalkeeper);


--
-- Name: idx_match_mast_id_player_of_the_match; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_match_mast_id_player_of_the_match ON soccer.match_mast USING btree (id_player_of_the_match);


--
-- Name: idx_match_mast_id_referee; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_match_mast_id_referee ON soccer.match_mast USING btree (id_referee);


--
-- Name: idx_match_mast_id_venue; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_match_mast_id_venue ON soccer.match_mast USING btree (id_venue);


--
-- Name: idx_penalty_goalkeeper_id_country; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_penalty_goalkeeper_id_country ON soccer.penalty_goalkeeper USING btree (id_country);


--
-- Name: idx_penalty_goalkeeper_id_player; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_penalty_goalkeeper_id_player ON soccer.penalty_goalkeeper USING btree (id_player);


--
-- Name: idx_penalty_shootout_id_country; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_penalty_shootout_id_country ON soccer.penalty_shootout USING btree (id_country);


--
-- Name: idx_penalty_shootout_id_match; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_penalty_shootout_id_match ON soccer.penalty_shootout USING btree (id_match);


--
-- Name: idx_penalty_shootout_id_player; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_penalty_shootout_id_player ON soccer.penalty_shootout USING btree (id_player);


--
-- Name: idx_player_booked_id_match; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_player_booked_id_match ON soccer.player_booked USING btree (id_match);


--
-- Name: idx_player_booked_id_player; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_player_booked_id_player ON soccer.player_booked USING btree (id_player);


--
-- Name: idx_player_booked_id_team; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_player_booked_id_team ON soccer.player_booked USING btree (id_country);


--
-- Name: idx_player_in_out_id_country; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_player_in_out_id_country ON soccer.player_in_out USING btree (id_country);


--
-- Name: idx_player_in_out_id_match; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_player_in_out_id_match ON soccer.player_in_out USING btree (id_match);


--
-- Name: idx_player_in_out_id_player; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_player_in_out_id_player ON soccer.player_in_out USING btree (id_player);


--
-- Name: idx_player_mast_id_country; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_player_mast_id_country ON soccer.player_mast USING btree (id_country);


--
-- Name: idx_player_mast_id_posi_to_play; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_player_mast_id_posi_to_play ON soccer.player_mast USING btree (id_posi_to_play);


--
-- Name: idx_referee_mast_id_country; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_referee_mast_id_country ON soccer.referee_mast USING btree (id_country);


--
-- Name: idx_soccer_city_id_country; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_soccer_city_id_country ON soccer.soccer_city USING btree (id_country);


--
-- Name: idx_soccer_venue_id_city; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_soccer_venue_id_city ON soccer.soccer_venue USING btree (id_city);


--
-- Name: idx_team_coaches_id_coach; Type: INDEX; Schema: soccer; Owner: -
--

CREATE INDEX idx_team_coaches_id_coach ON soccer.team_coaches USING btree (id_coach);


--
-- Name: soccer_team Soccer_team_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.soccer_team
    ADD CONSTRAINT "Soccer_team_ibfk_1" FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: asst_referee_mast asst_referee_mast_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.asst_referee_mast
    ADD CONSTRAINT asst_referee_mast_ibfk_1 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: goal_details goal_details_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.goal_details
    ADD CONSTRAINT goal_details_ibfk_1 FOREIGN KEY (id_match) REFERENCES soccer.match_mast(match_id);


--
-- Name: goal_details goal_details_ibfk_2; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.goal_details
    ADD CONSTRAINT goal_details_ibfk_2 FOREIGN KEY (id_player) REFERENCES soccer.player_mast(player_id);


--
-- Name: goal_details goal_details_ibfk_3; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.goal_details
    ADD CONSTRAINT goal_details_ibfk_3 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: match_captain match_captain_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_captain
    ADD CONSTRAINT match_captain_ibfk_1 FOREIGN KEY (id_match) REFERENCES soccer.match_mast(match_id);


--
-- Name: match_captain match_captain_ibfk_2; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_captain
    ADD CONSTRAINT match_captain_ibfk_2 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: match_captain match_captain_ibfk_3; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_captain
    ADD CONSTRAINT match_captain_ibfk_3 FOREIGN KEY (id_player) REFERENCES soccer.player_mast(player_id);


--
-- Name: match_details match_details_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_details
    ADD CONSTRAINT match_details_ibfk_1 FOREIGN KEY (id_match) REFERENCES soccer.match_mast(match_id);


--
-- Name: match_details match_details_ibfk_2; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_details
    ADD CONSTRAINT match_details_ibfk_2 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: match_details match_details_ibfk_3; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_details
    ADD CONSTRAINT match_details_ibfk_3 FOREIGN KEY (id_ass_ref) REFERENCES soccer.asst_referee_mast(ass_ref_id);


--
-- Name: match_details match_details_ibfk_4; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_details
    ADD CONSTRAINT match_details_ibfk_4 FOREIGN KEY (id_player_goalkeeper) REFERENCES soccer.player_mast(player_id);


--
-- Name: match_mast match_mast_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_mast
    ADD CONSTRAINT match_mast_ibfk_1 FOREIGN KEY (id_venue) REFERENCES soccer.soccer_venue(venue_id);


--
-- Name: match_mast match_mast_ibfk_2; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_mast
    ADD CONSTRAINT match_mast_ibfk_2 FOREIGN KEY (id_referee) REFERENCES soccer.referee_mast(referee_id);


--
-- Name: match_mast match_mast_ibfk_3; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.match_mast
    ADD CONSTRAINT match_mast_ibfk_3 FOREIGN KEY (id_player_of_the_match) REFERENCES soccer.player_mast(player_id);


--
-- Name: penalty_goalkeeper penalty_goalkeeper_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.penalty_goalkeeper
    ADD CONSTRAINT penalty_goalkeeper_ibfk_1 FOREIGN KEY (id_match) REFERENCES soccer.match_mast(match_id);


--
-- Name: penalty_goalkeeper penalty_goalkeeper_ibfk_2; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.penalty_goalkeeper
    ADD CONSTRAINT penalty_goalkeeper_ibfk_2 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: penalty_goalkeeper penalty_goalkeeper_ibfk_3; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.penalty_goalkeeper
    ADD CONSTRAINT penalty_goalkeeper_ibfk_3 FOREIGN KEY (id_player) REFERENCES soccer.player_mast(player_id);


--
-- Name: penalty_shootout penalty_shootout_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.penalty_shootout
    ADD CONSTRAINT penalty_shootout_ibfk_1 FOREIGN KEY (id_match) REFERENCES soccer.match_mast(match_id);


--
-- Name: penalty_shootout penalty_shootout_ibfk_2; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.penalty_shootout
    ADD CONSTRAINT penalty_shootout_ibfk_2 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: penalty_shootout penalty_shootout_ibfk_3; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.penalty_shootout
    ADD CONSTRAINT penalty_shootout_ibfk_3 FOREIGN KEY (id_player) REFERENCES soccer.player_mast(player_id);


--
-- Name: player_booked player_booked_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_booked
    ADD CONSTRAINT player_booked_ibfk_1 FOREIGN KEY (id_match) REFERENCES soccer.match_mast(match_id);


--
-- Name: player_booked player_booked_ibfk_2; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_booked
    ADD CONSTRAINT player_booked_ibfk_2 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: player_booked player_booked_ibfk_3; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_booked
    ADD CONSTRAINT player_booked_ibfk_3 FOREIGN KEY (id_player) REFERENCES soccer.player_mast(player_id);


--
-- Name: player_in_out player_in_out_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_in_out
    ADD CONSTRAINT player_in_out_ibfk_1 FOREIGN KEY (id_match) REFERENCES soccer.match_mast(match_id);


--
-- Name: player_in_out player_in_out_ibfk_2; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_in_out
    ADD CONSTRAINT player_in_out_ibfk_2 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: player_in_out player_in_out_ibfk_3; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_in_out
    ADD CONSTRAINT player_in_out_ibfk_3 FOREIGN KEY (id_player) REFERENCES soccer.player_mast(player_id);


--
-- Name: player_mast player_mast_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_mast
    ADD CONSTRAINT player_mast_ibfk_1 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: player_mast player_mast_ibfk_2; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.player_mast
    ADD CONSTRAINT player_mast_ibfk_2 FOREIGN KEY (id_posi_to_play) REFERENCES soccer.playing_position(position_id);


--
-- Name: referee_mast referee_mast_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.referee_mast
    ADD CONSTRAINT referee_mast_ibfk_1 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: soccer_city soccer_city_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.soccer_city
    ADD CONSTRAINT soccer_city_ibfk_1 FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: soccer_venue soccer_venue_ibfk_1; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.soccer_venue
    ADD CONSTRAINT soccer_venue_ibfk_1 FOREIGN KEY (id_city) REFERENCES soccer.soccer_city(city_id);


--
-- Name: team_coaches team_coaches_id_fk; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.team_coaches
    ADD CONSTRAINT team_coaches_id_fk FOREIGN KEY (id_coach) REFERENCES soccer.coach_mast(coach_id) ON DELETE SET NULL;


--
-- Name: team_staff team_staff_id_country_fkey; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.team_staff
    ADD CONSTRAINT team_staff_id_country_fkey FOREIGN KEY (id_country) REFERENCES soccer.soccer_country(country_id);


--
-- Name: team_staff team_staff_id_type_fkey; Type: FK CONSTRAINT; Schema: soccer; Owner: -
--

ALTER TABLE ONLY soccer.team_staff
    ADD CONSTRAINT team_staff_id_type_fkey FOREIGN KEY (id_type) REFERENCES soccer.staff_type(type_id);


--
-- PostgreSQL database dump complete
--

