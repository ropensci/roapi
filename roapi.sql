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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appveyor; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE appveyor (
    projectid integer,
    accountid integer,
    accountname character varying(50),
    name character varying(50),
    repositoryname character varying(50),
    repositorybranch character varying(50),
    created timestamp without time zone,
    updated timestamp without time zone,
    buildid integer,
    buildnumber integer,
    version character varying(50),
    message character varying(1000),
    branch character varying(50),
    commitid character varying(100),
    committername character varying(100),
    status character varying(50),
    finished timestamp without time zone,
    inserted timestamp without time zone
);


--
-- Name: cran; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE cran (
    name character varying(500),
    title character varying(500),
    description character varying(1000),
    version character varying(500),
    license character varying(500),
    authors_r character varying(1000),
    url character varying(500),
    bugreports character varying(500),
    lazydata character varying(500),
    vignettebuilder character varying(500),
    imports character varying(500),
    suggests character varying(500),
    packaged character varying(500),
    author character varying(500),
    maintainer character varying(500),
    needscompilation character varying(500),
    repository character varying(500),
    crandb_file_date timestamp without time zone,
    releases character varying(500),
    date_publication timestamp without time zone,
    type character varying(500),
    depends character varying(500),
    pkg_collate character varying(8000),
    systemrequirements character varying(500),
    enhances character varying(500),
    lazyload character varying(500),
    copyright character varying(500),
    biarch character varying(500),
    additional_repositories character varying(500),
    encoding character varying(500),
    lazydatacompression character varying(500),
    inserted timestamp without time zone
);


--
-- Name: cranlogs; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE cranlogs (
    name character varying(50) NOT NULL,
    cran_downloads integer,
    collected timestamp without time zone,
    inserted timestamp without time zone
);


--
-- Name: github; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE github (
    id integer,
    name character varying(150),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    size integer,
    language character varying(20),
    forks smallint,
    open_issues smallint,
    watchers smallint,
    default_branch character varying(50),
    inserted timestamp without time zone
);


--
-- Name: repos; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE repos (
    name character varying(50) NOT NULL,
    repo_type character varying(50) NOT NULL,
    maintainer character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    installable boolean NOT NULL,
    build_vignettes boolean NOT NULL,
    category character varying(50) NOT NULL,
    on_cran boolean NOT NULL,
    cran_archived boolean,
    url character varying(50) NOT NULL,
    root character varying(50),
    fork boolean NOT NULL,
    description text,
    route_github_travis character varying(50),
    route_appveyor character varying(50)
);


--
-- Name: travis; Type: TABLE; Schema: public; Owner: -; Tablespace:
--

CREATE TABLE travis (
    name character varying(50),
    repository_id integer,
    commit_id integer,
    number character varying(50),
    pull_request boolean,
    pull_request_number character varying(50),
    pull_request_title character varying(500),
    state character varying(50),
    started_at timestamp without time zone,
    finished_at timestamp without time zone,
    duration smallint,
    job_ids character varying(50),
    language character varying(50),
    os character varying(50),
    inserted timestamp without time zone
);


--
-- Data for Name: appveyor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY appveyor (projectid, accountid, accountname, name, repositoryname, repositorybranch, created, updated, buildid, buildnumber, version, message, branch, commitid, committername, status, finished, inserted) FROM stdin;
42054	13586	sckott	alm	ropensci/alm	master	2014-08-06 20:29:51.420934	2014-10-29 20:02:07.286214	1156099	459	1.0.459	fixed bug in alm_Events parsing of wikipedia data source	master	bebc4e4c0d2ef8847d95d270628cdbcb56bb261b	Scott Chamberlain	failed	2015-07-27 11:02:54.080707	2015-07-28 00:14:28
42911	13636	karthik	AntWeb	ropensci/AntWeb	master	2014-08-11 20:11:08.932992	2014-10-13 19:04:52.018277	1156100	373	1.0.373	Fixed spacing in footer	master	c6092021055abb6c7b56bc66875acb3f5a61f47f	Karthik Ram	success	2015-07-27 10:03:11.117295	2015-07-28 00:14:28
50767	13636	karthik	aRxiv	ropensci/aRxiv	master	2014-09-16 20:45:29.155553	2014-10-13 19:05:18.898638	1156082	333	1.0.333	Merge pull request #31 from kbroman/master	master	0d6f7e7fba30ece72157fecbd5bc8f3b8ad6c228	Karl Broman	success	2015-07-27 09:55:35.997659	2015-07-28 00:14:28
43107	13586	sckott	bmc	ropensci/bmc	master	2014-08-12 20:13:01.18245	2014-10-13 14:54:50.970818	1156068	355	1.0.355	rbuildignore readme, and update readme, added readme.rmd	master	9659b3a62b7e421e0816e495fd9e403b64c9af9a	Scott Chamberlain	success	2015-07-27 10:03:41.043447	2015-07-28 00:14:28
44413	13586	sckott	bold	ropensci/bold	master	2014-08-20 14:36:56.287831	2014-10-13 14:55:15.591534	1156066	370	1.0.370	updated egs to not run timeout egs	master	5636cb26cf6e6f8f0c89383c0c06724234b09fcc	Scott Chamberlain	success	2015-07-27 09:59:37.209594	2015-07-28 00:14:28
75771	13636	karthik	chromer	ropensci/chromer	master	2014-12-02 00:50:47.006309	\N	400363	35	1.0.35	Update version number on github to 0.1.0.9999	master	b603bf478928cf32b91633522f6f85ec3ef1b3cb	matthew pennell	success	2015-01-13 22:21:57.229157	2015-07-28 00:14:28
84891	13586	sckott	ckanr	ropensci/ckanr	master	2015-01-03 00:46:53.072226	2015-05-27 17:40:36.139595	1156076	300	1.0.300	trying to fix appveyor build, do xml2 from cran now	master	03f7f7f5ac63d1a8b0af4633849e833a371c9202	Scott Chamberlain	success	2015-07-27 10:13:35.804623	2015-07-28 00:14:28
42569	13636	karthik	ecoengine	ropensci/ecoengine	master	2014-08-09 18:59:24.181433	2014-10-13 19:04:08.585182	1156057	427	1.0.427	Updated roxygen docs	master	f9c648d899ed4b432e9d7fe2ded9d1b579b3eee3	Karthik Ram	success	2015-07-27 09:40:30.838529	2015-07-28 00:14:28
108916	13586	sckott	elasticdsl	ropensci/elasticdsl	master	2015-04-01 14:24:58.526143	2015-04-01 14:25:08.838509	1156103	121	1.0.121	bumped patch ver	master	c1ff2d17351ffa3bafcd028972dc6634674ea720	Scott Chamberlain	success	2015-07-27 11:11:56.055763	2015-07-28 00:14:28
101291	13586	sckott	finch	ropensci/finch	master	2015-03-06 15:44:09.878381	2015-03-06 15:44:24.302427	1156092	153	1.0.153	fixes to description fiel	master	1e9ecfb90416be463713b3d7f20c226324004693	Scott Chamberlain	success	2015-07-27 10:52:54.420349	2015-07-28 00:14:28
57677	13586	sckott	fulltext	ropensci/fulltext	master	2014-10-14 15:22:10.01203	2014-10-14 15:23:36.188224	1158373	342	1.0.342	attmept to fix appveyor builds, install slam before test	master	39f507a8da5cb236cfcfdea00ff611f136b1e41e	Scott Chamberlain	success	2015-07-27 17:16:28.58852	2015-07-28 00:14:28
57680	13586	sckott	gistr	ropensci/gistr	master	2014-10-14 15:32:45.678341	2015-03-05 23:55:08.254043	1156095	447	1.0.447	bump 99 ver	master	ffb9cceb6bc846f7ad29da6af77613fbb6e38cb6	Scott Chamberlain	success	2015-07-27 10:45:59.385307	2015-07-28 00:14:28
44789	13636	karthik	git2r	ropensci/git2r	master	2014-08-22 18:54:38.129685	2014-10-13 19:03:32.361928	1156060	701	1.0.701	Update configure.win to download libssh2	master	867d78621f0e4b550e9f9c34a926e0430ba13ccd	Stefan Widgren	success	2015-07-27 09:49:06.419782	2015-07-28 00:14:28
101141	13586	sckott	lawn	ropensci/lawn	master	2015-03-06 02:17:04.961139	2015-03-06 02:18:12.39543	1156086	250	1.0.250	updated readme, showing new print method	master	b7046db6be9bfb5b840e80978ddd8b33ec98b9a6	Scott Chamberlain	success	2015-07-27 10:26:17.212961	2015-07-28 00:14:28
68115	13586	sckott	musemeta	ropensci/musemeta	master	2014-11-13 03:03:17.137366	2015-07-11 13:59:41.997314	1156094	293	1.0.293	fixes to getty() fxns, updated readme	master	de6ac92fc718d2b30f4fb5e4e8c69a6a907fd828	Scott Chamberlain	success	2015-07-27 10:59:44.717001	2015-07-28 00:14:28
57679	13586	sckott	ots	ropensci/ots	master	2014-10-14 15:27:38.120037	2014-10-30 14:09:48.095363	1156093	294	1.0.294	bump patch ver	master	9f01a929f036ce6cbfc9bd4b7134f067b9ffb445	Scott Chamberlain	success	2015-07-27 11:05:56.041021	2015-07-28 00:14:28
62698	13586	sckott	pangaear	ropensci/pangaear	master	2014-10-27 18:58:50.992198	\N	649768	15	1.0.15	another attempt to send builds to build room instead of package dev	master	d490ae422cfa5d5037450cb3e3d9177d9eea5e1f	Scott Chamberlain	success	2015-03-31 16:06:06.839671	2015-07-28 00:14:28
44604	13586	sckott	prism	ropensci/prism	master	2014-08-21 17:19:52.247641	2014-10-13 14:57:07.57173	1156075	369	1.0.369	- Fixed several small bugs like warning messages are now outputing with the proper year	master	aca8431929519908effc10a46825a8a48c8a14ac	Ted Hart	failed	2015-07-27 10:16:16.154662	2015-07-28 00:14:28
103971	13586	sckott	proj	ropensci/proj	master	2015-03-16 16:22:54.772121	2015-03-16 16:23:06.303663	1156056	135	1.0.135	added appveyor file, updated readme with ci badges	master	70de3883c0fd91445dec61480cb065dc09e7dc2d	Scott Chamberlain	success	2015-07-27 09:50:08.770392	2015-07-28 00:14:28
42928	13636	karthik	rAltmetric	ropensci/rAltmetric	master	2014-08-11 22:08:59.726016	2014-10-13 19:04:43.929952	1156097	362	1.0.362	updated cran comments	master	37afc1dec894b1e3ae5f0a12c7b21b064ceed272	Karthik Ram	success	2015-07-27 10:01:23.703552	2015-07-28 00:14:28
43104	13586	sckott	rbhl	ropensci/rbhl	master	2014-08-12 20:01:14.478208	2014-12-08 15:26:14.608297	1156065	369	1.0.369	do --as-cran in rstudio	master	7af8eb413e80b0cfdb089614c7acb4927c2dbb90	Scott Chamberlain	success	2015-07-27 10:01:28.453515	2015-07-28 00:14:28
134185	13586	sckott	rbison	ropensci/rbison	master	2015-07-09 16:54:51.10145	\N	1067210	1	1.0.1	bumped ver to v0.4.8	master	0c003762139c9cc3ba70278c2305bcb7a109a57a	Scott Chamberlain	success	2015-07-09 16:57:16.350868	2015-07-28 00:14:28
43110	13586	sckott	rcrossref	ropensci/rcrossref	master	2014-08-12 20:17:04.862064	2014-10-13 14:56:59.288113	1158393	472	1.0.472	bumped to v 0.3.4 cran push version	master	1ecd025993cc5cf96e4442324a2ddedb384c89e3	Scott Chamberlain	success	2015-07-27 17:18:40.20428	2015-07-28 00:14:28
114065	13586	sckott	rebird	ropensci/rebird	master	2015-04-24 14:05:08.861167	2015-04-24 14:05:40.996236	1156088	121	1.0.121	Merge pull request #33 from sebpardo/master	master	9711918f9c2a338797c9d577bec41747775ddce1	Sebastian Pardo	success	2015-07-27 10:50:45.399706	2015-07-28 00:14:28
42979	13586	sckott	rentrez	ropensci/rentrez	master	2014-08-12 04:23:03.324466	2014-10-13 14:57:39.820452	1156077	475	1.0.475	tests for extracting summary/ always_return_list	master	896a8bb46734fb4214415c5e401fb01febfb2b43	David Winter	success	2015-07-27 10:37:14.410371	2015-07-28 00:14:28
101284	13586	sckott	rerddap	ropensci/rerddap	master	2015-03-06 15:24:19.820408	2015-03-06 15:25:02.53798	1156096	198	1.0.198	trying to fix appveyor build, do xml2 from cran now	master	604a67895d18d351f3da01e2b6509d4120740d05	Scott Chamberlain	success	2015-07-27 11:08:05.971739	2015-07-28 00:14:28
42929	13636	karthik	rfisheries	ropensci/rfisheries	master	2014-08-11 22:11:19.385004	2014-10-13 19:04:17.124782	1156063	362	1.0.362	Fixed var name	master	9f0386fd9775b73c5f062ab067b155faf16cb172	Karthik Ram	success	2015-07-27 09:42:40.750811	2015-07-28 00:14:28
44352	13586	sckott	rgbif	ropensci/rgbif	master	2014-08-20 07:06:24.511028	2015-03-05 23:44:13.032406	1156080	495	1.0.495	fixed occ_isssues test problem, bumped to v0.8.8	master	f19c0f0e605012e172b43f40eb351169ccce6d0b	Scott Chamberlain	success	2015-07-27 10:35:09.050928	2015-07-28 00:14:28
42988	13586	sckott	rinat	ropensci/rinat	master	2014-08-12 04:52:13.583631	2014-10-13 14:56:56.546219	1156090	355	1.0.355	removed install assertthat from github	master	cbd643ac1fcfc1f1f991f47c119e8e9110a4e163	Scott Chamberlain	success	2015-07-27 10:57:57.708306	2015-07-28 00:14:28
61800	13586	sckott	rmetadata	ropensci/rmetadata	master	2014-10-24 01:57:10.845154	\N	244638	5	1.0.5	updated readme with note about new europeana packgae	master	26b90cb2ca198b44f04bba0088612ff9b294b8e9	Scott Chamberlain	success	2014-10-28 23:39:48.595642	2015-07-28 00:14:28
75995	13586	sckott	rnbn	ropensci/rnbn	master	2014-12-02 18:09:25.029616	\N	335098	4	1.0.4	Update README.md	master	d887a794e9f2663f25826e36ba47800acf98aba0	Dr Tom August	success	2014-12-12 16:16:08.984973	2015-07-28 00:14:28
42994	13586	sckott	rnoaa	ropensci/rnoaa	master	2014-08-12 05:08:04.574611	2014-10-16 16:09:23.821906	1158478	455	1.0.455	fixes to appveyor file	master	56658b190713b6fea53b70f6252a35260a15923b	Scott Chamberlain	success	2015-07-27 17:36:15.329725	2015-07-28 00:14:28
43111	13586	sckott	rnpn	ropensci/rnpn	master	2014-08-12 20:19:50.380819	2014-10-13 14:55:39.330867	1156074	357	1.0.357	upated readme	master	08b23d0e09118bad3f0f3da05a0782211efb1169	Scott Chamberlain	success	2015-07-27 10:07:41.28031	2015-07-28 00:14:28
48170	13586	sckott	rorcid	ropensci/rorcid	master	2014-09-11 20:31:50.4607	2014-10-13 14:55:57.891309	1156064	329	1.0.329	updated readme	master	deef72ab0fee043123e867b56ae8f55f50277d9a	Scott Chamberlain	success	2015-07-27 10:09:06.293856	2015-07-28 00:14:28
42983	13586	sckott	rplos	ropensci/rplos	master	2014-08-12 04:42:19.222847	2014-10-13 14:57:13.318157	1156098	410	1.0.410	smaller news header sizes, bumped to github version	master	5516c97f61666aab33ddc2cc0d26eeae645c4c27	Scott Chamberlain	success	2015-07-27 10:56:20.048062	2015-07-28 00:14:28
42982	13586	sckott	rsnps	ropensci/rsnps	master	2014-08-12 04:37:45.199924	2014-10-13 14:57:28.658335	1156078	369	1.0.369	added cran ver badge to readme files	master	48b168beb43383c5ad92892b58ab27c31155e98a	Scott Chamberlain	success	2015-07-27 10:22:41.001363	2015-07-28 00:14:28
48173	13586	sckott	rvertnet	ropensci/rvertnet	master	2014-09-11 20:48:42.92762	2014-10-13 14:57:24.97488	1156061	372	1.0.372	bumped version to 99	master	62af40bf756df2bc0a5aaf14f41c032713768c4b	Scott Chamberlain	success	2015-07-27 09:52:46.559613	2015-07-28 00:14:28
42990	13586	sckott	rWBclimate	ropensci/rWBclimate	master	2014-08-12 04:54:36.748909	2014-10-13 14:57:10.235032	1156058	354	1.0.354	tidied some man file text, and fixed a problem in low level fxn to fix list elements in data.frames	master	77c43f8298a9753213a6f8a115d23948e58546ac	Scott Chamberlain	success	2015-07-27 09:42:17.755877	2015-07-28 00:14:28
42981	13586	sckott	solr	ropensci/solr	master	2014-08-12 04:35:02.123806	2014-10-13 14:54:46.454675	1156089	404	1.0.404	started new connector fxn using R6, rbuildignore it, #52	master	8cf1cde498bf771a2a1b597b6a506ca36d20cdbc	Scott Chamberlain	success	2015-07-27 10:48:08.10397	2015-07-28 00:14:28
132916	13586	sckott	spocc	ropensci/spocc	master	2015-07-04 19:06:43.310241	2015-07-06 15:02:22.639412	1156081	28	1.0.28	fix #138 made more obvious what parameters being used in each data source	master	733c9c85aeecdde3a2f4ae51d62e480479baa678	Scott Chamberlain	success	2015-07-27 10:44:07.108548	2015-07-28 00:14:28
42987	13586	sckott	treeBASE	ropensci/treeBASE	master	2014-08-12 04:50:15.308663	2014-10-13 14:56:48.117459	1156079	356	1.0.356	update cran testing	master	0629628cc85570cb2beef3bf446bdb67cbae5bd0	Carl Boettiger	failed	2015-07-27 10:39:56.700024	2015-07-28 00:14:28
110247	14651	EDiLD	webchem	ropensci/webchem	master	2015-04-06 20:13:39.719037	\N	1035095	53	1.0.53	ignore README_files	master	0648bf2e8a991b5df7b8867afcc67281e386b9ed	edisz	success	2015-07-02 13:08:47.633542	2015-07-28 00:14:28
102884	13586	sckott	wellknown	ropensci/wellknown	master	2015-03-14 07:00:59.21248	2015-03-14 07:01:07.959381	1156072	171	1.0.171	no longer need to install leaflet from github for CI	master	83e26931c84836be7f8f7057ba04ebb5213757d0	Scott Chamberlain	success	2015-07-27 10:05:50.313052	2015-07-28 00:14:28
\.


--
-- Data for Name: cran; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cran (name, title, description, version, license, authors_r, url, bugreports, lazydata, vignettebuilder, imports, suggests, packaged, author, maintainer, needscompilation, repository, crandb_file_date, releases, date_publication, type, depends, pkg_collate, systemrequirements, enhances, lazyload, copyright, biarch, additional_repositories, encoding, lazydatacompression, inserted) FROM stdin;
alm	R Client for the Lagotto Altmetrics Platform	An R interface to the open source article level metrics platform\n<https://github.com/articlemetrics/lagotto/> created by the Public Library\nof Science (PLOS). A number of publishers are using the open source app\ncreated by PLOS, so you can drop in a different base URL to the functions\nin this package to get to not only PLOS data, but data for Crossref,\nand more as the open source PLOS software is used.	0.4.0	MIT + file LICENSE	c(person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"),\nperson("Carl", "Boettiger", role = "aut",\nemail = "cboettig@gmail.com"),\nperson("Karthik", "Ram", role = "aut",\nemail = "karthik.ram@gmail.com"),\nperson("Fenner", "Martin", role = "aut",\nemail = "mfenner.ram@plos.org"))	https://github.com/ropensci/alm	http://www.github.com/ropensci/alm/issues	true	knitr	ggplot2/*, plyr/*, stringr/*, reshape/*, reshape2/*, httr/*, grid/*, jsonlite/*, lubridate/*	testthat/*, roxygen2/*, rplos/*, knitr/*	2015-03-13 17:52:12 UTC; sacmac	Scott Chamberlain [aut, cre],\nCarl Boettiger [aut],\nKarthik Ram [aut],\nFenner Martin [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-03-13 15:24:29	\N	2015-03-13 20:22:04	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
AntWeb	programmatic interface to the AntWeb	A complete programmatic interface to the AntWeb database from the<U+000a>California Academy of Sciences.	0.7	CC0	'Karthik Ram <karthik.ram@gmail.com> [aut, cre]'	https://github.com/ropensci/AntWeb	https://github.com/ropensci/AntWeb/issues	true	\N	rjson/*, plyr/*, assertthat/*, httr/*, leafletR/>= 0.1-1	\N	2014-08-13 20:38:54 UTC; karthik	'Karthik Ram' [aut, cre]	'Karthik Ram' <karthik.ram@gmail.com>	no	CRAN	2014-08-13 18:40:15	\N	2014-08-14 00:40:13	Package	R/>= 3.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
aRxiv	Interface to the arXiv API	An interface to the API for arXiv, a repository of\nelectronic preprints for computer science, mathematics, physics,\nquantitative biology, quantitative finance, and statistics.	0.5.10	MIT + file LICENSE	c(person("Karthik", "Ram", role="aut",\nemail="karthik.ram@gmail.com"),\nperson("Karl", "Broman", rol=c("aut","cre"),\nemail="kbroman@biostat.wisc.edu"))	https://github.com/ropensci/aRxiv	https://github.com/ropensci/aRxiv/issues	true	knitr	httr/*, utils/*, XML/*	devtools/*, knitr/*, roxygen2/*, testthat/*	2015-05-26 20:29:24 UTC; kbroman	Karthik Ram [aut],\nKarl Broman [aut, cre]	Karl Broman <kbroman@biostat.wisc.edu>	no	CRAN	2015-05-26 19:33:20	\N	2015-05-27 01:32:38	\N	R/>= 3.0.0	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
bold	Interface to Bold Systems API	A programmatic interface to the Web Service methods provided by\nBold Systems for genetic barcode data. Functions include methods for\nsearching by sequences by taxonomic names, ids, collectors, and\ninstitutions; as well as a function for searching for specimens, and\ndownloading trace files.	0.2.6	MIT + file LICENSE	c(person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"))	https://github.com/ropensci/bold	https://github.com/ropensci/bold/issues	yes	knitr	XML/*, httr/*, stringr/*, assertthat/*, jsonlite/*, reshape/*, plyr/*	sangerseqR/*, knitr/*, testthat/*	2015-04-17 20:22:02 UTC; sacmac	Scott Chamberlain [aut, cre]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-04-18 03:00:54	\N	2015-04-18 08:56:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
chromer	Interface to Chromosome Counts Database API	A programmatic interface to the Chromosome Counts Database\n(http://ccdb.tau.ac.il/). This package is part of the rOpenSci suite\n(http://ropensci.org)	0.1	CC0	person("Matthew", "Pennell", role = c("aut", "cre"),\nemail = "mwpennell@gmail.com")	http://www.github.com/ropensci/chromer	http://www.github.com/ropensci/chromer/issues/new	\N	\N	dplyr/*, httr/*, data.table/*	testthat/*, roxygen2/*	2014-12-19 21:10:50 UTC; mwp	Matthew Pennell [aut, cre]	Matthew Pennell <mwpennell@gmail.com>	no	CRAN	2015-01-13 04:29:24	\N	2015-01-13 10:27:09	\N	R/>= 2.15	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
clifro	Easily Download and Visualise Climate Data from CliFlo	CliFlo is a web portal to the New Zealand National Climate\nDatabase and provides public access (via subscription) to around 6,500\nvarious climate stations. Collating and manipulating data from CliFlo\n(hence clifro) and importing into R for further analysis, exploration and\nvisualisation is now straightforward and coherent. The user is required to\nhave an internet connection, and a current CliFlo subscription (free) if\ndata from stations, other than the public Reefton electronic weather\nstation, is sought.	2.4-0	GPL-2	person("Blake", "Seers", role = c("aut", "cre"),\nemail = "blake.seers@gmail.com")	http://cliflo.niwa.co.nz/ https://github.com/ropensci/clifro	https://github.com/ropensci/clifro/issues	\N	knitr	methods/*, lubridate/*, XML/*, selectr/*, RCurl/*, utils/*, ggplot2/*, scales/*, RColorBrewer/*, reshape2/*	knitr/*, ggmap/*	2015-03-04 21:31:08 UTC; bsee002	Blake Seers [aut, cre]	Blake Seers <blake.seers@gmail.com>	no	CRAN	2015-03-04 17:48:25	\N	2015-03-04 23:47:33	Package	\N	'dataFrame.R' 'cfStation.R' 'cfData.R' 'cfDataList.R'\n'cfData-plotMethods.R' 'cfDatatype.R' 'cfQuery.R' 'cfUser.R'\n'findStations.R'	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
dashboard	Interactive Data Visualization with D3.js	The dashboard package allows users to create web pages which display<U+000a>interactive data visualizations working in a standard modern browser. It displays them locally<U+000a>using the Rook server. Nor knowledge about web technologies nor Internet connection are<U+000a>required. D3.js is a JavaScript library for manipulating documents based on data.<U+000a>D3 helps the dashboard package bring data to life using HTML, SVG and CSS.	0.1.0	GPL-2	\N	\N	\N	\N	\N	Rook/*	\N	2014-12-07 20:05:36 UTC; johannlaurent	Johann Laurent	Johann Laurent. <johannlaurent1@gmail.com>	no	CRAN	2014-12-07 16:54:24	\N	2014-12-07 22:48:31	Package	R/>= 2.13.0	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
dvn	Access to The Dataverse Network APIs	Provides access to The Dataverse Network APIs via the RCurl package, enabling access to archived data (and metadata), and the ability to create and manipulate studies in a user's dataverse(s).	0.3.3	GPL-2	\N	https://github.com/leeper/dvn	https://github.com/leeper/dvn/issues	\N	\N	RCurl/*, XML/*	\N	2013-12-02 20:41:19 UTC; Thomas	Thomas J. Leeper	Thomas J. Leeper <thosjleeper@gmail.com>	no	CRAN	2013-12-02 15:50:21	3.0.3, 3.1.0, 3.1.1	2013-12-02 21:50:19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
ecoengine	Programmatic Interface to the API Serving UC Berkeley's Natural\nHistory Data	The ecoengine provides access to more than 5 million georeferenced specimen records from the University of California, Berkeley's Natural History Museums.	1.9.1	CC0	c(person("Karthik", "Ram", role = c("aut", "cre"), email =\n"karthik.ram@gmail.com"))	https://github.com/ropensci/ecoengine	https://github.com/ropensci/ecoengine/issues	yes	\N	httr/>= 0.3, plyr/*, assertthat/*, whisker/*, dplyr/>= 0.2, jsonlite/*, lubridate/*, leafletR/>= 0.1-1	testthat/*, knitr/*, ggplot2/*	2015-03-30 03:27:08 UTC; karthik	Karthik Ram [aut, cre]	Karthik Ram <karthik.ram@gmail.com>	no	CRAN	2015-03-30 01:38:29	\N	2015-03-30 07:36:30	Package	R/>= 3.1.1	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
ecoretriever	R Interface to the EcoData Retriever	Provides an R interface to the EcoData Retriever<U+000a>(http://ecodataretriever.org/) via the EcoData Retriever's<U+000a>command line interface. The EcoData Retriever automates the<U+000a>tasks of finding, downloading, and cleaning ecological datasets,<U+000a>and then stores them in a local database.	0.1	MIT + file LICENSE	c(person("Daniel", "McGlinn", role = c("aut", "cre"),<U+000a>email = "danmcglinn@gmail.com"),<U+000a>person("Ethan", "White", role = "aut",<U+000a>email = "ethan@weecology.org"))	https://github.com/ropensci/ecoretriever/	https://github.com/ropensci/ecoretriever/issues	true	\N	\N	\N	2014-09-28 14:46:23 UTC; danmcglinn	Daniel McGlinn [aut, cre],<U+000a>Ethan White [aut]	Daniel McGlinn <danmcglinn@gmail.com>	no	CRAN	2014-09-28 12:28:23	\N	2014-09-28 18:18:03	\N	R/>= 3.0.0	\N	EcoData Retriever (>= 1.6)	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
elastic	General Purpose Interface to 'Elasticsearch'	Connect to 'Elasticsearch', a 'NoSQL' database built on the 'Java' Virtual Machine.\nInteracts with the 'Elasticsearch' 'HTTP' 'API' (http://elasticsearch.org), including\nfunctions for setting connection details to 'Elasticsearch' instances, loading bulk\ndata, searching for documents with both 'HTTP' query variables and 'JSON' based body\nrequests. In addition, 'elastic' provides functions for interacting with 'APIs' for\n'indices', documents, nodes, clusters, an interface to the cat 'API', and more.	0.5.0	MIT + file LICENSE	person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com")	https://github.com/ropensci/elastic	https://github.com/ropensci/elastic/issues	\N	knitr	utils/*, methods/*, httr/*, curl/*, jsonlite/*	testthat/*, roxygen2/*, knitr/*	2015-07-02 18:18:31 UTC; sacmac	Scott Chamberlain [aut, cre]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-07-02 18:24:18	\N	2015-07-03 00:20:06	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
gender	Predict Gender from Names Using Historical Data	Encodes gender based on names and dates of birth, using either the\nSocial Security Administration's data set of first names by year of birth\nor the Census Bureau data from 1789 to 1940, both from the United States of\nAmerica. By using these data sets instead of lists of male and female names,\nthis package is able to more accurately guess the gender of a name, and it\nis able to report the probability that a name was male or female.	0.4.3	MIT + file LICENSE	c(person("Lincoln", "Mullen", role = c("aut", "cre"),\nemail = "lincoln@lincolnmullen.com"),\nperson("Cameron", "Blevins", role = "ctb"),\nperson("Ben", "Schmidt", role = "ctb"))	https://github.com/ropensci/gender	https://github.com/ropensci/gender/issues	yes	knitr	devtools/>= 1.5, dplyr/>= 0.2, httr/>= 0.4, jsonlite/>=\n0.9.10	ggplot2/*, knitr/*, magrittr/*, testthat/*	2014-12-24 00:21:27 UTC; lmullen	Lincoln Mullen [aut, cre],\nCameron Blevins [ctb],\nBen Schmidt [ctb]	Lincoln Mullen <lincoln@lincolnmullen.com>	no	CRAN	2014-12-23 19:49:23	\N	2014-12-24 01:48:11	Package	R/>= 3.0.0, utils/*, stats/*	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
geojsonio	Convert Data from and to 'geoJSON' or 'topoJSON'	Convert data to 'geoJSON' or 'topoJSON' from various R classes,\nincluding vectors, lists, data frames, shape files, and spatial\nclasses. 'geojsonio' does not aim to replace packages like 'sp', 'rgdal', 'rgeos',\nbut rather aims to be a high level client to simplify conversions of data\nfrom and to 'geoJSON' and 'topoJSON'.	0.1.0	MIT + file LICENSE	c(person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"),\nperson("Andy", "Teucher", role = "aut",\nemail = "andy.teucher@gmail.com"))	\N	\N	true	knitr	methods/*, sp/*, rgdal/*, rgeos/*, httr/*, maptools/*, jsonlite/*, magrittr/*, V8/*	gistr/*, testthat/*, knitr/*	2015-04-30 02:15:22 UTC; sacmac	Scott Chamberlain [aut, cre],\nAndy Teucher [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-04-30 03:08:26	\N	2015-04-30 08:57:36	\N	R/>= 2.10	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
geonames	Interface to www.geonames.org web service	Code for querying the web service at www.geonames.org	0.998	GPL-3	\N	\N	https://github.com/ropensci/geonames/issues	\N	\N	rjson/*	\N	2014-12-19 17:40:07 UTC; rowlings	Barry Rowlingson	Barry Rowlingson <b.rowlingson@gmail.com>	no	CRAN	2014-12-19 13:03:21	\N	2014-12-19 19:02:02	Package	R/>= 2.2.0	\N	\N	\N	yes	\N	\N	\N	\N	\N	2015-07-09 23:27:06
gistr	Work with 'GitHub' 'Gists'	Work with 'GitHub' 'gists' from 'R' (e.g.,\nhttp://en.wikipedia.org/wiki/GitHub#Gist,\nhttps://help.github.com/articles/about-gists/). A 'gist' is simply one or\nmore files with code/text/images/etc. This package allows the user to\ncreate new 'gists', update 'gists' with new files, rename files, delete files,\nget and delete 'gists', star and 'un-star' 'gists', fork 'gists', open a 'gist' in\nyour default browser, get embed code for a 'gist', list 'gist' 'commits', and\nget rate limit information when 'authenticated'. Some requests require\nauthentication and some do not. 'Gists' website: https://gist.github.com/.	0.3.0	MIT + file LICENSE	c(\nperson("Ramnath", "Vaidyanathan", role = "aut", email = "ramnath.vaidya@gmail.com"),\nperson("Karthik", "Ram", role = "aut", email = "karthik.ram@gmail.com"),\nperson("Scott", "Chamberlain", role = c("aut", "cre"), email = "myrmecocystus@gmail.com")\n)	https://github.com/ropensci/gistr	http://www.github.com/ropensci/gistr/issues	\N	knitr	utils/*, methods/*, stats/*, jsonlite/*, httr/*, magrittr/*, assertthat/*, knitr/*, rmarkdown/*, dplyr/*	roxygen2/*, testthat/*	2015-07-03 01:40:49 UTC; sacmac	Ramnath Vaidyanathan [aut],\nKarthik Ram [aut],\nScott Chamberlain [aut, cre]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-07-02 23:46:27	\N	2015-07-03 05:44:51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
git2r	Provides Access to Git Repositories	Interface to the 'libgit2' library, which is a pure C\nimplementation of the 'Git' core methods. Provides access to 'Git'\nrepositories to extract data and running some basic 'Git'\ncommands.	0.10.1	GPL-2	\N	https://github.com/ropensci/git2r	https://github.com/ropensci/git2r/issues	true	\N	\N	\N	2015-05-07 18:44:46 UTC; stefan	See AUTHORS file.	Stefan Widgren <stefan.widgren@gmail.com>	yes	CRAN	2015-05-07 17:12:39	\N	2015-05-07 23:10:22	Package	R/>= 3.0.2, methods/*	'S4_classes.r' 'blame.r' 'blob.r' 'branch.r'\n'bundle_r_package.r' 'checkout.r' 'commit.r' 'config.r'\n'contributions.r' 'credential.r' 'diff.r' 'fetch.r' 'git2r.r'\n'index.r' 'libgit2.r' 'merge.r' 'note.r' 'odb.r' 'plot.r'\n'pull.r' 'push.r' 'reference.r' 'reflog.r' 'remote.r'\n'repository.r' 'reset.r' 'revparse.r' 'signature.r' 'stash.r'\n'status.r' 'tag.r' 'time.r' 'tree.r' 'when.r'	zlib headers and library. OpenSSL (non-Windows)\nheaders and library. Optional LibSSH2 (non-Windows) to enable\nthe SSH transport.	\N	\N	See COPYRIGHTS file.	true	\N	\N	\N	2015-07-09 23:27:06
historydata	Data Sets for Historians	These sample data sets are intended for historians\nlearning R. They include population, institutional, religious,\nmilitary, and prosopographical data suitable for mapping,\nquantitative analysis, and network analysis.	0.1	MIT + file LICENSE	c(person("Lincoln", "Mullen",\nrole = c("aut", "cre"),\nemail = "lincoln@lincolnmullen.com"))	https://github.com/ropensci/historydata	https://github.com/ropensci/historydata/issues	true	\N	\N	ggplot2/>= 1.0.0	2014-12-24 00:51:11 UTC; lmullen	Lincoln Mullen [aut, cre]	Lincoln Mullen <lincoln@lincolnmullen.com>	no	CRAN	2014-12-24 00:09:21	\N	2014-12-24 06:08:09	\N	R/>= 3.0.2	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
internetarchive	An API Client for the Internet Archive	Search the Internet Archive, retrieve metadata, and download\nfiles.	0.1.2	MIT + file LICENSE	c(person("Lincoln", "Mullen",\nrole = c("aut", "cre"),\nemail = "lincoln@lincolnmullen.com"))	https://github.com/ropensci/internetarchive	https://github.com/ropensci/internetarchive/issues	TRUE	knitr	httr/>= 0.6.1, jsonlite/>= 0.9.14, dplyr/>= 0.4.1	knitr/*, testthat/*	2015-03-24 22:17:51 UTC; lmullen	Lincoln Mullen [aut, cre]	Lincoln Mullen <lincoln@lincolnmullen.com>	no	CRAN	2015-03-24 19:21:18	\N	2015-03-25 00:19:59	Package	R/>= 3.1.0	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
lawn	R Client for 'Turfjs' for 'Geospatial' Analysis	R client for 'Turfjs' (http://turfjs.org/) for\n'geospatial' analysis. The package revolves around using 'GeoJSON'\ndata. Functions are included for creating 'GeoJSON' data objects,\nmeasuring aspects of 'GeoJSON', and combining, transforming,\nand creating random 'GeoJSON' data objects.	0.1.0	MIT + file LICENSE	c(\nperson("Scott", "Chamberlain", role = c("aut", "cre"), email = "myrmecocystus@gmail.com"),\nperson("Jeff", "Hollister", role = "aut", email = "hollister.jeff@epa.gov")\n)	https://github.com/ropensci/lawn	http://www.github.com/ropensci/lawn/issues	true	knitr	V8/*, jsonlite/*, magrittr/*	testthat/*, knitr/*, leaflet/*	2015-05-16 01:29:56 UTC; sacmac	Scott Chamberlain [aut, cre],\nJeff Hollister [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-05-16 03:54:30	\N	2015-05-16 09:44:53	Package	\N	\N	\N	\N	\N	\N	\N	http://www.carlboettiger.info/drat	\N	\N	2015-07-09 23:27:06
neotoma	Access to the Neotoma Paleoecological Database Through R	Access paleoecological datasets from the Neotoma Paleoecological\nDatabase using the published API (http://api.neotomadb.org/).  The functions\nin this package access various pre-built API functions and attempt to return\nthe results from Neotoma in a usable format for researchers and the public.	1.3.0	MIT + file LICENSE	c(person(given = c("Simon", "J."), family = "Goring",\nrole = c("aut", "cre"), email = "goring@wisc.edu"),\nperson(given = c("Gavin", "L."), family = "Simpson", role = "aut"),\nperson(given = c("Jeremiah", "P."), family = "Marsicek", role = "ctb"),\nperson(given = "Karthik", family = "Ram", role = "aut"),\nperson(given = "Luke", family = "Sosalla", role = "ctb"))	https://github.com/ropensci/neotoma	https://github.com/ropensci/neotoma/issues	\N	\N	RJSONIO/*, RCurl/>= 1.6, plyr/*, reshape2/*	testthat/*, knitr/*	2015-05-28 21:38:49 UTC; Simon Goring	Simon J. Goring [aut, cre], Gavin L. Simpson [aut], Jeremiah P. Marsicek [ctb],\nKarthik Ram [aut], Luke Sosalla [ctb]	Simon J. Goring <goring@wisc.edu>	no	CRAN	2015-05-29 03:05:35	\N	2015-05-29 08:58:01	Package	R/>= 2.10	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
paleobioDB	Download and Process Data from the Paleobiology Database	19 functions to wrap each endpoint of\nthe PaleobioDB API, plus 8 functions to visualize and process the fossil\ndata. The API documentation for the Paleobiology Database can be found in\n<http://paleobiodb.org/data1.1/>	0.3	GPL-2	c(person("Sara", "Varela", role = c("aut", "cre"),\nemail = "svarela@paleobiogeography.org"),\nperson("Javier", "González Hernández", role = "aut",\nemail = "javigzz@yahoo.es"),\nperson("Luciano", "Fabris Sgarbi", role = "aut",\nemail = "luciano.f.sgarbi@gmail.com"))	https://github.com/ropensci/paleobioDB	https://github.com/ropensci/paleobioDB/issues	true	\N	rjson/*, gtools/*, RCurl/*, plyr/*, scales/*	roxygen2/*, testthat/*	2014-11-24 12:35:03 UTC; sara	Sara Varela [aut, cre],\nJavier González Hernández [aut],\nLuciano Fabris Sgarbi [aut]	Sara Varela <svarela@paleobiogeography.org>	no	CRAN	2014-11-24 09:57:59	\N	2014-11-24 15:45:27	Package	raster/*, maps/*	'network.R' 'paleobioDB-package.R' 'pbdb_cache.R'\n'pbdb_geographic_functions.R' 'pbdb_querys.R'\n'rest_api_tools.R' 'pbdb_rest_api_setup.R'\n'pbdb_taxonomic_functions.R' 'pbdb_temporal_functions.R'	\N	\N	\N	\N	\N	\N	UTF-8	\N	2015-07-09 23:27:06
rAltmetric	Retrieves Altmerics Data For Any Published Paper From\nAltmetric.com	Programmatic interface to the Altmetric.com API.	0.6	CC0	\N	https://github.com/ropensci/rAltmetric	https://github.com/ropensci/rAltmetric/issues/	\N	\N	plyr/*, RCurl/*, reshape2/*, png/*, ggplot2/>= 0.9.2.1, RJSONIO/*	testthat/*	2014-12-04 18:44:55 UTC; karthik	Karthik Ram [aut, cre]	Karthik Ram <karthik.ram@gmail.com>	no	CRAN	2014-12-04 14:58:21	\N	2014-12-04 20:46:38	Package	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rAvis	Interface to the Bird-Watching Dataset Proyecto AVIS	Interface to <http://proyectoavis.com> database.\nIt provides means to download data filtered by species, order,\nfamily, and several other criteria. Provides also basic functionality to\nplot exploratory maps of the datasets.	0.1.4	GPL-2	\N	https://github.com/ropensci/rAvis	https://github.com/ropensci/rAvis/issues	true	\N	stringr/*, XML/*, RCurl/*, scrapeR/*, gdata/*, scales/*, rgdal/*, maptools/*, raster/*, sp/*, tools/*	testthat/*, roxygen2/*	2015-06-21 21:49:22 UTC; sara	Javier González Hernández <javigzz@yahoo.es>, Sara Varela <svarela@paleobiogeography.org>	Sara Varela <svarela@paleobiogeography.org>	no	CRAN	2015-06-21 19:45:26	\N	2015-06-22 01:44:46	Package	R/>= 2.10	\N	\N	\N	\N	\N	\N	\N	UTF-8	\N	2015-07-09 23:27:06
rbefdata	BEFdata R package	Basic R package to access data structures offered by any\nBEFdata portal instance.	0.3.5	MIT + file LICENSE	c(person("Claas-Thido", "Pfaff",\nemail="claas-thido.pfaff@idiv-biodiversity.de", role=c("cre","aut")),\nperson("Karin", "Nadrowski", email="nadrowski@uni-leipzig.de", role="aut"),\nperson("Xingxing", "Man", email="manxingxing@gmail.com", role="aut"))	https://github.com/befdata/rbefdata	\N	\N	\N	XML/*, RCurl/*, rjson/*, wordcloud/*, rtematres/*, RColorBrewer/*	ggplot2/*, plyr/*	2013-11-18 11:38:10 UTC; sabsirro	Claas-Thido Pfaff [cre, aut],\nKarin Nadrowski [aut],\nXingxing Man [aut]	Claas-Thido Pfaff <claas-thido.pfaff@idiv-biodiversity.de>	no	CRAN	2013-11-18 11:50:11	3.0.3, 3.1.0, 3.1.1	2013-11-18 17:50:08	\N	\N	'bef.options.R' 'zzz.R' 'rbefdata-package.R'\n'bef.portal.get.dataset.R' 'bef.portal.get.proposal.R'\n'bef.portal.get.metadata.R' 'bef.portal.get.keywords.R'\n'bef.portal.get.categories.R' 'bef.portal.upload.R'\n'bef.portal.api.R' 'bef.mediawiki.api.R' 'bef.tematres.api.R'\n'helper.R' 'bef.portal.get.attachments.R'\n'rbefdata-deprecated.R' 'rbefdata-defunct.R'\n'bef.portal.vizalize.R'	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rbhl	R interface to the Biodiversity Heritage Library.	Interface to Biodiversity Heritage Library (BHL) API methods. BHL\nis a repository of digitized literature on biodiversity studies,\nincluding floras, research papers, and more.	0.1.0	MIT + file LICENSE	c(person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"),\nperson("Karthik", "Ram", role = "aut",\nemail = "karthik.ram@gmail.com"))	https://github.com/ropensci/rbhl	https://github.com/ropensci/rbhl/issues	true	knitr	httr/*, XML/*, RJSONIO/*, plyr/*	testthat/*, roxygen2/*, knitr/*	2014-01-17 06:10:09 UTC; scottmac2	Scott Chamberlain [aut, cre],\nKarthik Ram [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2014-01-17 01:52:55	3.0.3, 3.1.0, 3.1.1	2014-01-17 07:52:53	Package	\N	\N	\N	\N	true	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rbison	Interface to the 'USGS' 'BISON' 'API'	Interface to the 'USGS' 'BISON' 'API', a 'database' for\nspecies occurrence data on the web. Data comes from species in the\nUnited States from participating data providers. You can get\ndata via 'taxonomic' and location based queries. A simple function\nis provided to help visualize data.	0.4.8	MIT + file LICENSE	c(person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"))	https://github.com/ropensci/rbison	https://github.com/ropensci/rbison/issues	true	knitr	methods/*, stats/*, plyr/*, httr/*, ggplot2/*, mapproj/*, grid/*, sp/*, dplyr/*, jsonlite/*	knitr/*, testthat/*, taxize/*	2015-07-01 22:40:23 UTC; sacmac	Scott Chamberlain [aut, cre]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-07-02 00:02:42	\N	2015-07-02 01:34:06	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rcrossref	Client for Various CrossRef APIs	Client for various CrossRef APIs, including metadata search\nwith their old and search APIs, get citations in various formats\n(including bibtex, citeproc-json, rdf-xml, etc.), convert DOIs to PMIDs,\nand vice versa, get citations for DOIs, and get links to full text of\narticles when available.	0.3.0	MIT + file LICENSE	c(person("Carl", "Boettiger", role = "aut"),\nperson("Ted", "Hart", role = "aut"),\nperson("Scott", "Chamberlain", role = c("aut", "cre"), email =\n"myrmecocystus@gmail.com"),\nperson("Karthik", "Ram", role = "aut"))	https://github.com/ropensci/rcrossref	https://github.com/ropensci/rcrossref/issues	\N	knitr	jsonlite/*, XML/*, httr/>= 0.6.0, plyr/*, bibtex/*, dplyr/*	testthat/*, roxygen2/>= 4.0.1, knitr/*	2015-03-03 22:48:55 UTC; sacmac	Carl Boettiger [aut],\nTed Hart [aut],\nScott Chamberlain [aut, cre],\nKarthik Ram [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-03-03 23:45:47	\N	2015-03-04 05:43:32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
RCryptsy	Access to Cryptsy Crypto-Currency Exchange Public Information\nAPI via R	Basic Public API for the Crypto-Currency exchange Cryptsy	0.2	GPL-3	\N	https://github.com/kylehamilton/RCryptsy	https://github.com/kylehamilton/RCryptsy/issues	\N	\N	\N	\N	2014-11-22 13:33:36 UTC; Kyle	William Kyle Hamilton <kyle.hamilton@gmail.com>	William Kyle Hamilton <kyle.hamilton@gmail.com>	no	CRAN	2014-11-23 17:43:16	\N	2014-11-23 23:41:18	Package	R/>= 3.0.3, RJSONIO/*, RCurl/*	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rdryad	Dryad API interface.	Interface to the API for Dryad	0.1.1	CC0	c(person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"), person("Carl", "Boettiger",\nrole = "aut", email = "cboettig@gmail.com"), person("Karthik",\n"Ram", role = "aut", email = "karthik.ram@gmail.com"))	http://www.github.com/ropensci/rdryad	https://github.com/ropensci/rdryad/issues	\N	\N	XML/*, RCurl/*, OAIHarvester/*, ape/*, gdata/*, plyr/*, stringr/*, RJSONIO/*	\N	2013-01-30 06:20:44 UTC; scottmac2	Scott Chamberlain [aut, cre], Carl Boettiger [aut], Karthik Ram\n[aut]	Scott Chamberlain <myrmecocystus@gmail.com>	\N	CRAN	2013-01-30 01:29:18	2.15.3, 3.0.0, 3.0.1, 3.0.2, 3.0.3, 3.1.0, 3.1.1	2013-01-30 07:29:16	Package	\N	'download_dryadmetadata.r' 'download_url.r' 'dryad_getfile.r'\n'getalldryad_metadata.r' 'search_dryad.r' 'totimp.r'\n'totimp_dryad.r' 'dr_identify.r' 'dr_listidentifiers.r'\n'dr_listmetadataformats.r' 'dr_listsets.r'	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rebird	R Client for the eBird Database of Bird Observations	A programmatic client for the eBird database, including functions\nfor searching for bird observations by geographic location (latitude,\nlongitude), eBird hotspots, location identifiers, by notable sightings, by\nregion, and by taxonomic name.	0.2	MIT + file LICENSE	c(person("Rafael", "Maia", role = "aut",\nemail = "rm72@zips.uakron.edu"),\nperson("Scott", "Chamberlain", role = "aut",\nemail = "myrmecocystus@gmail.com"),\nperson("Andy", "Teucher", role = "aut",\nemail = "andy.teucher@gmail.com"),\nperson("Sebastian", "Pardo", role = c("aut", "cre"),\nemail = "sebpardo@gmail.com"))	http://github.com/ropensci/rebird	http://github.com/ropensci/rebird/issues	\N	knitr	methods/*, utils/*, stats/*, jsonlite/*, httr/*, dplyr/*	knitr/*, testthat/*	2015-07-08 22:30:03 UTC; mavzz	Rafael Maia [aut],\nScott Chamberlain [aut],\nAndy Teucher [aut],\nSebastian Pardo [aut, cre]	Sebastian Pardo <sebpardo@gmail.com>	no	CRAN	2015-07-09 08:50:22	\N	2015-07-09 14:47:54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rentrez	Entrez in R	Provides an R interact to the NCBI's EUtils API allowing\nusers to search databases like genbank and pubmed, process the resulting\nfiles and pull data into their R sessions.	0.4.2	MIT + file LICENSE	c(person("David", "Winter", role=c("aut", "cre"),\nemail = "david.winter@gmail.com"),\nperson("Scott", "Chamberlain", role="ctb",\nemail = "myrmecocystus@gmail.com"))	\N	\N	\N	knitr	httr/*, jsonlite/*	testthat/*, knitr/*	2015-06-26 15:54:04 UTC; david	David Winter [aut, cre],\nScott Chamberlain [ctb]	David Winter <david.winter@gmail.com>	no	CRAN	2015-06-26 12:26:21	\N	2015-06-26 18:23:37	\N	R/>= 2.6.0, XML/*	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rerddap	General Purpose Client for 'ERDDAP' Servers	General purpose R client for 'ERDDAP' servers. Includes\nfunctions to search for 'datasets', get summary information on\n'datasets', and fetch 'datasets', in either 'csv' or 'netCDF' format.\n'ERDDAP' information: http://upwell.pfeg.noaa.gov/erddap/information.html.	0.2.0	MIT + file LICENSE	c(person("Scott", "Chamberlain", role = c("aut","cre"),\nemail = "myrmecocystus@gmail.com"))	https://github.com/ropensci/rerddap	http://www.github.com/ropensci/rerddap/issues	true	knitr	methods/*, utils/*, stats/*, httr/*, dplyr/*, data.table/*, jsonlite/*, xml2/*, digest/*, ncdf/*	roxygen2/*, knitr/*, testthat/*, ncdf4/*	2015-06-30 20:53:38 UTC; sacmac	Scott Chamberlain [aut, cre]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-07-01 00:13:23	\N	2015-07-01 06:11:42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rfigshare	An R Interface to 'figshare'	An interface to 'figshare' (http://figshare.com), a scientific repository to archive and assign 'DOIs' to data, software, figures, and more.	0.3.7	CC0	c(person("Carl", "Boettiger", role = c("aut", "cre"), email =\n"cboettig@gmail.com"), person("Scott", "Chamberlain", role = "aut"),\nperson("Karthik", "Ram", role = "aut"), person("Edmund", "Hart",\nrole="aut"))	https://github.com/ropensci/rfigshare	https://github.com/ropensci/rfigshare/issues	\N	\N	RJSONIO/*, httr/>= 0.3, httpuv/*, plyr/*, yaml/*, ggplot2/*, XML/*	testthat/*, gdata/*, uuid/*	2015-06-15 04:16:52 UTC; rstudio	Carl Boettiger [aut, cre],\nScott Chamberlain [aut],\nKarthik Ram [aut],\nEdmund Hart [aut]	Carl Boettiger <cboettig@gmail.com>	no	CRAN	2015-06-15 02:00:28	\N	2015-06-15 07:59:06	\N	R/>= 3.0, methods/*	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rfishbase	R Interface to FishBASE	A programmatic interface to fishbase.org.	0.2-2	CC0	c(person("Carl", "Boettiger", role = c("aut", "cre"), email =\n"cboettig@gmail.com"), person("Duncan", "Temple Lang", role = "aut"),\nperson(c("Peter", "C."), "Wainwright", role = "aut"))	https://github.com/ropensci/rfishbase	https://github.com/ropensci/rfishbase/issues	\N	\N	XML/*, RCurl/>= 1.6	testthat/*	2014-01-07 05:27:41 UTC; cboettig	Carl Boettiger [aut, cre],\nDuncan Temple Lang [aut],\nPeter C. Wainwright [aut]	Carl Boettiger <cboettig@gmail.com>	no	CRAN	2014-01-07 01:29:01	3.0.3, 3.1.0, 3.1.1	2014-01-07 07:28:59	\N	R/>= 2.10	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rfisheries	R interface for fisheries data	A programmatic interface to openfisheries.org. This package is\npart of the rOpenSci suite (http://ropensci.org)	0.1	CC0	c(person("Karthik", "Ram", role = c("aut", "cre"), email =\n"karthik.ram@gmail.com"), person("Carl", "Boettiger", role = "aut"),\nperson("Andrew", "Dyck", role = "aut"))	http://www.github.com/ropensci/rfisheries	http://www.github.com/ropensci/rfisheries/issues/new	yes	\N	httr/*, data.table/*, assertthat/*, ggplot2/*, rjson/*	\N	2014-02-18 17:40:19 UTC; karthik	Karthik Ram [aut, cre],\nCarl Boettiger [aut],\nAndrew Dyck [aut]	Karthik Ram <karthik.ram@gmail.com>	no	CRAN	2014-02-18 16:19:31	3.0.3, 3.1.0, 3.1.1	2014-02-18 22:19:30	\N	R/>= 2.15	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rgauges	R wrapper to Gaug.es API	This package provides functions to interact with the\nGaug.es API. Gaug.es is a web analytics service, like Google\nanalytics. You have to have a Gaug.es account to use this package.	0.2.0	MIT + file LICENSE	c(person("Scott", "Chamberlain", role = c("aut", "cre"), email =\n"myrmecocystus@gmail.com"),\nperson("Karthik", "Ram", role = "aut", email =\n"karthik.ram@gmail.com"))	https://github.com/ropensci/rgauges	https://github.com/ropensci/rgauges/issues	\N	knitr	ggplot2/*, lubridate/*, plyr/*, httr/*, reshape2/*, gridExtra/*, scales/*, data.table/*	roxygen2/*, knitr/*	2014-03-14 15:46:03 UTC; sacmac	Scott Chamberlain [aut, cre],\nKarthik Ram [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2014-03-14 11:53:46	3.1.0, 3.1.1	2014-03-14 16:53:44	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rgbif	Interface to the Global 'Biodiversity' Information Facility\n'API'	A programmatic interface to the Web Service methods\nprovided by the Global Biodiversity Information Facility ('GBIF').\n'GBIF' is a database of species occurrence records from sources all\nover the globe. 'rgbif' includes functions for searching for\ntaxonomic names, retrieving information on data providers,\ngetting species occurrence records, and getting counts of\noccurrence records.	0.8.6	MIT + file LICENSE	c(person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"),\nperson("Karthik", "Ram", role = "aut",\nemail = "karthik.ram@gmail.com"),\nperson("Vijay", "Barve", role = "aut",\nemail = "vijay.barve@gmail.com"),\nperson("Dan", "Mcglinn", role = "aut",\nemail = "danmcglinn@gmail.com"))	https://github.com/ropensci/rgbif	https://github.com/ropensci/rgbif/issues	true	knitr	methods/*, utils/*, stats/*, XML/*, ggplot2/*, httr/>= 1.0.0, data.table/*, whisker/*, magrittr/*, jsonlite/>= 0.9.16, V8/*	roxygen2/*, testthat/*, knitr/*, reshape2/*, maps/*	2015-07-03 05:44:05 UTC; sacmac	Scott Chamberlain [aut, cre],\nKarthik Ram [aut],\nVijay Barve [aut],\nDan Mcglinn [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-07-03 02:49:18	\N	2015-07-03 08:47:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rglobi	R Interface to Global Biotic Interactions	A programmatic interface to the web service methods\nprovided by Global Biotic Interactions (GloBI). GloBI provides\naccess to spatial-temporal species interaction records from\nsources all over the world. rglobi provides methods to search\nspecies interactions by location, interaction type, and\ntaxonomic name. In addition, it supports Cypher, a graph query\nlanguage, to allow for executing custom queries on the GloBI\naggregate species interaction dataset.	0.2.8	MIT + file LICENSE	c(person("Jorrit", "Poelen", role = c("aut", "cre"),\nemail = "jhpoelen@xs4all.nl"),\nperson("Stephen", "Gosnell", role = "aut",\nemail = "stephen.gosnell@baruch.cuny.edu"),\nperson("Sergey", "Slyusarev", role = "aut",\nemail = "cph.lmy@gmail.com"))	https://github.com/ropensci/rglobi	https://github.com/ropensci/rglobi/issues	\N	knitr	rjson/>= 0.2.13, RCurl/*	testthat/*, knitr/*	2015-05-13 15:56:38 UTC; jorrit	Jorrit Poelen [aut, cre],\nStephen Gosnell [aut],\nSergey Slyusarev [aut]	Jorrit Poelen <jhpoelen@xs4all.nl>	no	CRAN	2015-05-13 13:57:28	\N	2015-05-13 19:55:01	Package	R/>= 3.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rImpactStory	Retrieves altmetrics from ImpactStory. See\nhttp://impactstory.org for more about the metrics.	Provides a programmatic interface to ImpactStory API	0.05	CC0	c(person("Karthik", "Ram", role = c("aut", "cre"), email =\n"karthik.ram@gmail.com"), person("Scott", "Chamberlain", role =\n"aut"))	http://github.com/ropensci/rImpactStory	http://github.com/ropensci/rImpactStory/issues	\N	\N	RJSONIO/*, XML/*, RCurl/*, stringr/*, plyr/*	\N	2012-12-19 07:37:29 UTC; karthik	Karthik Ram [aut, cre], Scott Chamberlain [aut]	Karthik Ram <karthik.ram@gmail.com>	\N	CRAN	2012-12-19 02:42:27	2.15.3, 3.0.0, 3.0.1, 3.0.2	2012-12-19 08:42:25	Package	RJSONIO/*, XML/*, reshape2/*, RCurl/>= 1.6, stringr/*, plyr/*	'getMetrics.R' 'collection.R' 'api_info.R' 'tiID.R'\n'ti_providers.R'	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rinat	Access iNaturalist data through APIs	A programmatic interface to the<U+000a>API provided by the iNaturalist website.	0.1.4	MIT + file LICENSE	\N	\N	\N	\N	\N	httr/*, plyr/*, jsonlite/*, ggplot2/*, maps/*	\N	2014-07-03 21:25:21 UTC; thart	Vijay Barve<vijay.barve@gmail.com>,<U+000a>Edmund Hart <edmund.m.hart@gmail.com>	Edmund Hart <edmund.m.hart@gmail.com>	no	CRAN	2014-07-03 20:23:52	3.1.1	2014-07-04 02:23:50	Package	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
ritis	Taxonomic search of ITIS data.	An interface to the Integrated Taxonomic Information\nSystem (ITIS).	0.0.3	CC0	c(person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"))	https://github.com/ropensci/ritis	https://github.com/ropensci/ritis/issues	\N	\N	RCurl/*, XML/*	\N	2012-12-05 20:50:39 UTC; ScottMac	Scott Chamberlain [aut, cre]	Scott Chamberlain <myrmecocystus@gmail.com>	\N	CRAN	2012-12-05 15:59:31	2.15.3, 3.0.0, 3.0.1	2012-12-05 21:59:29	\N	\N	'getcommentdetailfromtsn.R' 'getitistermsfromcommonname.R'\n'getitistermsfromscientificname.R'\n'gettsnbyvernacularlanguage.R' 'getacceptednamesfromtsn.R'\n'getanymatchcount.R' 'searchbycommonname.R'\n'searchbycommonnamebeginswith.R' 'searchbycommonnameendswith.R'\n'searchbyscientificname.R' 'searchforanymatch.R'\n'searchforanymatchpaged.R' 'getcommonnamesfromtsn.R'\n'getcoremetadatafromtsn.R' 'getcoveragefromtsn.R'\n'getcredibilityratingfromtsn.R' 'getcurrencyfromtsn.R'\n'getdatedatafromtsn.R' 'getexpertsfromtsn.R'\n'getfullrecordfromtsn.R' 'getgeographicdivisionsfromtsn.R'\n'getglobalspeciescompletenessfromtsn.R'\n'getjurisdictionaloriginfromtsn.R' 'getkingdomnamefromtsn.R'\n'getothersourcesfromtsn.R' 'getparenttsnfromtsn.R'\n'getpublicationsfromtsn.R' 'getreviewyearfromtsn.R'\n'getscientificnamefromtsn.R' 'getsynonymnamesfromtsn.R'\n'gettaxonauthorshipfromtsn.R' 'gettaxonomicranknamefromtsn.R'\n'getfullhierarchyfromtsn.R' 'gettaxonomicusagefromtsn.R'\n'getunacceptabilityreasonfromtsn.R' 'getfullrecordfromlsid.R'\n'gethierarchydownfromtsn.R' 'gethierarchyupfromtsn.R'\n'getlsidfromtsn.R' 'getrecordfromlsid.R' 'gettsnfromlsid.R'\n'getcredibilityratings.R' 'getdescription.R'\n'getgeographicvalues.R' 'getjurisdictionoriginvalues.R'\n'getjurisdictionvalues.R' 'getkingdomnames.R'\n'getlastchangedate.R' 'getranknames.R'\n'getvernacularlanguages.R'	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
RMendeley	Interface to Mendeley API methods	A programmatic interface to the Web Service methods\nprovided by the Mendeley open science project.	0.1-2	BSD	\N	\N	\N	\N	\N	RJSONIO/*, RCurl/>= 1.6	\N	2012-08-05 21:36:58 UTC; cboettig	Carl Boettiger, Duncan Temple Lang	Carl Boettiger <cboettig@gmail.com>	\N	CRAN	2012-08-05 17:41:34	2.15.2, 2.15.3, 3.0.0, 3.0.1, 3.0.2, 3.0.3, 3.1.0, 3.1.1	2012-08-05 21:41:32	\N	\N	'authored.R' 'authors.R' 'categories.R' 'details.R' 'groups.R'\n'papers.R' 'public_groups_details.R'\n'public_groups_documents.R' 'public_groups_overview.R'\n'public_groups_people.R' 'publications.R' 'related.R'\n'search.R' 'subcategories.R' 'tagged.R' 'tags.R' 'utilities.R'	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
RMETAR	Functionality to extract weather information from METAR reports.	Functions to extract weather information from METAR reports\n(Aviation Routine Weather Reports). Using the METAR Decoder Software\nPackage Library (mdsplib) which is provided by the National Weather\nService.	1.0	LGPL-2.1	c(person("Jan", "Wijffels", role = c("aut", "cre", "cph"),\nemail = "jwijffels@bnosac.be"), person("Eric", "McCarthy", role\n= c("cph"), email = "eric@desert.net"))	http://www.bnosac.be	\N	\N	\N	\N	ff/*, ffbase/*, testthat/*	2013-08-08 06:38:13 UTC; janw	Jan Wijffels [aut, cre, cph],\nEric McCarthy [cph]	Jan Wijffels <jwijffels@bnosac.be>	yes	CRAN	2013-08-09 01:06:03	\N	2013-08-09 07:06:02	Package	\N	'decodemetar.R'	\N	\N	\N	C code in the src folder is taken and adapted from\nhttp://sourceforge.net/projects/mdsplib/ for which Copyright\nbelongs to Eric McCarthy. This code has LGPL-2.1 license.	\N	\N	\N	\N	2015-07-09 23:27:06
rnbn	Access NBN Data	Access to data held by the National Biodiversity Network (NBN, www.nbn.org.uk). The NBN acts as a data warehouse for biological records data in the UK and is the UK node of GBIF (Global Biodiversity Information Facility). In this package NBN data is accessed via its web-services.	1.0.3	MIT + file LICENSE	\N	https://github.com/ropensci/rnbn	https://github.com/ropensci/rnbn/issues	TRUE	knitr	httr/*	testthat/>= 0.8.0, roxygen2/*, knitr/*	2014-12-12 14:59:18 UTC; tomaug	Stuart Ball & Tom August	Tom August <tomaug@ceh.ac.uk>	no	CRAN	2014-12-12 15:33:18	\N	2014-12-12 21:31:02	Package	R/>= 3.0.0	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rWBclimate	A package for accessing World Bank climate data	This package will download model predictions from 15 different global circulation models in 20 year intervals from the world bank.  Users can also access historical data, and create maps at 2 different spatial scales.	0.1.3	MIT + file LICENSE	c(person("Edmund", "Hart", role = c("aut", "cre"),\nemail = "edmund.m.hart@gmail.com"))	http://github.com/ropensci/rWBclimate	http://github.com/ropensci/rWBclimate/issues	True	knitr	ggplot2/*, httr/*, plyr/*, rgdal/*, jsonlite/*, reshape2/*, sp/*	knitr/*	2014-04-18 21:09:16 UTC; tedhart	Edmund Hart [aut, cre]	Edmund Hart <edmund.m.hart@gmail.com>	no	CRAN	2014-04-18 18:53:15	3.1.1	2014-04-19 00:53:12	Package	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
solr	General purpose R interface to Solr	This package provides a set of functions for querying and parsing<U+000a>data from Solr endpoints (local and remote), including search, faceting,<U+000a>highlighting, stats, and 'more like this'.	0.1.4	MIT + file LICENSE	person("Scott", "Chamberlain", role = c("aut", "cre"),<U+000a>email = "myrmecocystus@gmail.com")	https://github.com/ropensci/solr	http://www.github.com/ropensci/solr/issues	true	knitr	plyr/*, httr/*, XML/*, assertthat/*, rjson/*	testthat/*, roxygen2/*, knitr/*	2014-03-14 16:57:18 UTC; sacmac	Scott Chamberlain [aut, cre]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2014-03-14 13:30:19	3.1.0, 3.1.1	2014-03-14 18:30:17	\N	\N	\N	\N	\N	true	\N	\N	\N	\N	\N	2015-07-09 23:27:06
RNeXML	Semantically Rich I/O for the 'NeXML' Format	Provides access to phyloinformatic data in NeXML format.  The\npackage should add new functionality to R such as the possibility to\nmanipulate NeXML objects in more various and refined way and compatibility\nwith 'ape' objects.	2.0.3	BSD_3_clause + file LICENSE	c(person("Carl", "Boettiger", role = c("cre", "aut"),\nemail="cboettig@gmail.com"), person("Scott", "Chamberlain", role =\n"aut"), person("Hilmar", "Lapp", role = "aut"), person("Kseniia",\n"Shumelchyk", role = "aut"), person("Rutger", "Vos", role = "aut"))	https://github.com/ropensci/RNeXML	https://github.com/ropensci/RNeXML/issues	\N	knitr	XML/>= 3.95, plyr/>= 1.8, taxize/>= 0.2.2, reshape2/>=\n1.2.2, httr/>= 0.3, uuid/>= 0.1-1	rrdf/>= 2.0.2, geiger/>= 2.0, phytools/>= 0.3.93, knitr/>= 1.5, rfigshare/>= 0.3.0, knitcitations/>= 1.0.1, testthat/>= 0.10.0, phylobase/>= 0.6.8, rmarkdown/>=\n0.3.3, Sxslt/>= 0.91	2015-05-25 19:35:00 UTC; rstudio	Carl Boettiger [cre, aut],\nScott Chamberlain [aut],\nHilmar Lapp [aut],\nKseniia Shumelchyk [aut],\nRutger Vos [aut]	Carl Boettiger <cboettig@gmail.com>	no	CRAN	2015-05-26 20:07:21	\N	2015-05-27 02:06:32	Package	R/>= 3.0.0, ape/>= 3.1, methods/>= 3.0.0	'classes.R' 'add_basic_meta.R' 'add_characters.R' 'add_meta.R'\n'add_namespaces.R' 'add_trees.R' 'character_classes.R'\n'concatenate_nexml.R' 'get_basic_metadata.R' 'get_characters.R'\n'get_metadata.R' 'get_namespaces.R' 'get_rdf.R' 'get_taxa.R'\n'get_taxa_meta.R' 'get_trees.R' 'internal_get_node_maps.R'\n'internal_isEmpty.R' 'internal_name_by_id.R'\n'internal_nexml_id.R' 'meta.R' 'nexmlTree.R' 'nexml_add.R'\n'nexml_get.R' 'nexml_methods.R' 'nexml_publish.R'\n'nexml_read.R' 'nexml_validate.R' 'nexml_write.R' 'simmap.R'\n'taxize_nexml.R'	\N	\N	\N	\N	\N	http://www.omegahat.org/R,\nhttp://carlboettiger.info/drat	\N	\N	2015-07-09 23:27:06
rnoaa	'NOAA' Weather Data from R	Client for many 'NOAA' data sources including the 'NCDC'\nclimate 'API' at http://www.ncdc.noaa.gov/cdo-web/webservices/v2, with\nfunctions for each of the 'API' 'endpoints': data, data categories, data sets,\ndata types, locations, location categories, and stations. In addition, we\nhave an interface for 'NOAA' sea ice data, the 'NOAA' severe weather inventory,\n'NOAA' Historical Observing 'Metadata' Repository ('HOMR') data,\n'NOAA' storm data via 'IBTrACS', and tornado data via the 'NOAA' storm prediction\ncenter.	0.4.2	MIT + file LICENSE	c(\nperson("Hart", "Edmund", role = "ctb", email = "Edmund.m.hart@gmail.com"),\nperson("Scott", "Chamberlain", role = c("aut","cre"), email = "myrmecocystus@gmail.com"),\nperson("Karthik", "Ram", role = "ctb", email = "karthik.ram@gmail.com"),\nperson("Adam", "Erickson", role = "ctb", email = "adam.erickson@ubc.ca")\n)	https://github.com/ropensci/rnoaa	http://www.github.com/ropensci/rnoaa/issues	true	knitr	methods/*, stats/*, utils/*, httr/>= 1.0.0, lubridate/*, dplyr/*, tidyr/*, ggplot2/*, scales/*, rgdal/*, XML/*, jsonlite/*	testthat/*, roxygen2/*, knitr/*, taxize/*, ncdf/*	2015-07-07 17:19:52 UTC; sacmac	Hart Edmund [ctb],\nScott Chamberlain [aut, cre],\nKarthik Ram [ctb],\nAdam Erickson [ctb]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-07-08 00:02:22	\N	2015-07-08 01:16:24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rplos	Interface to the Search 'API' for 'PLoS' Journals	A programmatic interface to the 'SOLR' based\nsearch 'API' (http://api.plos.org/) provided by the Public\nLibrary of Science journals to search their articles.\nFunctions are included for searching for articles, retrieving\narticles, making plots, doing 'faceted' searches,\n'highlight' searches, and viewing results of 'highlighted'\nsearches in a browser.	0.5.0	MIT + file LICENSE	c(person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"),\nperson("Carl", "Boettiger", role = "aut",\nemail = "cboettig@gmail.com"),\nperson("Karthik", "Ram", role = "aut",\nemail = "karthik.ram@gmail.com"))	https://github.com/ropensci/rplos	https://github.com/ropensci/rplos/issues	true	knitr	methods/*, utils/*, stats/*, httr/*, jsonlite/*, dplyr/*, plyr/*, lubridate/*, reshape2/*, whisker/*, solr/*	XML/*, testthat/*, roxygen2/*, knitr/*	2015-07-01 04:31:29 UTC; sacmac	Scott Chamberlain [aut, cre],\nCarl Boettiger [aut],\nKarthik Ram [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-07-01 05:35:38	\N	2015-07-01 11:30:13	\N	ggplot2/*	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
RSelenium	R bindings for Selenium WebDriver.	The RSelenium package provides a set of R bindings for the<U+000a>Selenium 2.0 WebDriver using the JsonWireProtocol. Selenium automates web<U+000a>browsers (commonly referred to as browsers). Using RSelenium you can<U+000a>automate browsers locally or remotely.	1.3.5	AGPL-3	\N	http://ropensci.github.io/RSelenium	http://github.com/ropensci/RSelenium/issues	yes	knitr	methods/*, caTools/*, tools/*	testthat/*, knitr/*, Rcompression/*	2014-10-26 09:11:18 UTC; john	John Harrison <johndharrison0@gmail.com>	John Harrison <johndharrison0@gmail.com>	no	CRAN	2014-10-26 06:49:26	\N	2014-10-26 11:47:47	Package	R/>= 3.0.0, RCurl/*, RJSONIO/*, XML/*	'errorHandler.R' 'remoteDriver.R' 'selKeys-data.R' 'util.R'<U+000a>'webElement.R' 'zzz.R'	\N	\N	\N	\N	\N	http://www.omegahat.org/R	\N	\N	2015-07-09 23:27:06
rsnps	Get SNP (Single-Nucleotide Polymorphism) Data on the Web	A programmatic interface to various SNP datasets\non the web: openSNP, NBCI's dbSNP database, and Broad Institute SNP\nAnnotation and Proxy Search. Functions are included for searching for\nSNPs for the Broad Institute and NCBI. For OpenSNP, functions are\nincluded for getting SNPs, and data for genotypes, phenotypes,\nannotations, and bulk downloads of data by user.	0.1.6	MIT + file LICENSE	c(\nperson("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"),\nperson("Kevin", "Ushey", role = "aut",\nemail = "kevinushey@gmail.com"))	https://github.com/ropensci/rsnps	https://github.com/ropensci/rsnps/issues	\N	knitr	plyr/*, stringr/*, httr/*, RCurl/*, XML/*, jsonlite/*	roxygen2/*, testthat/*, rjson/*, knitr/*	2015-03-03 16:00:14 UTC; sacmac	Scott Chamberlain [aut, cre],\nKevin Ushey [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-03-03 11:41:56	\N	2015-03-03 17:34:08	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
RStars	Access to the Digital Universe Data set API	Access to the Digital Universe Data set API pulls data on\nexoplants, stars, and galaxies.	1.0	GPL-3	\N	https://github.com/kylehamilton/RStars	https://github.com/kylehamilton/RStars/issues	\N	\N	\N	\N	2014-12-04 01:38:06 UTC; whamilton	William Kyle Hamilton <kyle.hamilton@gmail.com>	William Kyle Hamilton <kyle.hamilton@gmail.com>	no	CRAN	2014-12-04 02:31:21	\N	2014-12-04 08:29:55	Package	R/>= 3.0.3, RJSONIO/*, RCurl/*	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
rvertnet	Search 'Vertnet', a 'Database' of Vertebrate Specimen Records	Retrieve, map and summarize data from the 'VertNet.org' archives.\nFunctions allow searching by many parameters, including 'taxonomic' names,\nplaces, and dates. In addition, there is an interface for conducting spatially\ndelimited searches, and another for requesting large 'datasets' via email.	0.3.0	MIT + file LICENSE	\N	https://github.com/ropensci/rvertnet	https://github.com/ropensci/rvertnet/issues	true	knitr	plyr/*, jsonlite/*, httr/*, dplyr/*, ggplot2/*, maps/*	roxygen2/*, testthat/*, knitr/*	2015-06-26 01:20:02 UTC; sacmac	Scott Chamberlain [aut, cre], Chris Ray [aut], Vijay Barve [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-06-26 04:59:21	\N	2015-06-26 10:55:20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
spocc	Interface to Species Occurrence Data Sources	A programmatic interface to many species occurrence data sources,\nincluding 'GBIF', 'USGS's' 'BISON', 'iNaturalist', Berkeley 'Ecoinformatics'\nEngine 'eBird', and 'AntWeb'. Includes functionality for retrieving\nspecies occurrence data, and combining that data.	0.3.0	MIT + file LICENSE	c(person("Scott", "Chamberlain", role = c("aut", "cre"),\nemail = "myrmecocystus@gmail.com"),\nperson("Karthik", "Ram", role = "aut",\nemail = "karthik.ram@gmail.com"),\nperson("Ted", "Hart", role = "aut",\nemail = "edmund.m.hart@gmail.com"))	https://github.com/ropensci/spocc	https://github.com/ropensci/spocc/issues	true	knitr	utils/*, methods/*, stats/*, rgbif/>= 0.8.4, rbison/>= 0.4.8, ecoengine/>= 1.9.1, rebird/>= 0.1.1, AntWeb/>= 0.7, rvertnet/>= 0.3.0, lubridate/*, httr/*, whisker/*, V8/*, jsonlite/*	roxygen2/*, testthat/*, knitr/*, taxize/*	2015-07-04 14:46:13 UTC; sacmac	Scott Chamberlain [aut, cre],\nKarthik Ram [aut],\nTed Hart [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-07-04 13:59:18	\N	2015-07-04 19:56:34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
taxize	Taxonomic Information from Around the Web	Taxonomic information from around the web. This package\ninteracts with a suite of web 'APIs' for taxonomic tasks, such\nas verifying species names, getting taxonomic hierarchies,\nand verifying name spelling.	0.6.0	MIT + file LICENSE	c(\nperson("Scott", "Chamberlain", role = c("aut", "cre"), email = "myrmecocystus@gmail.com"),\nperson("Eduard", "Szoecs", role = "aut", email = "eduardszoecs@gmail.com"),\nperson("Zachary", "Foster", role = "aut", email = "zacharyfoster1989@gmail.com"),\nperson("Carl", "Boettiger", role = "aut", email = "cboettig@gmail.com"),\nperson("Karthik", "Ram", role = "aut", email = "karthik@ropensci.org"),\nperson("Ignasi", "Bartomeus", role = "aut", email = "nacho.bartomeus@gmail.com"),\nperson("John", "Baumgartner", role = "aut", email = "johnbb@student.unimelb.edu.au")\n)	https://github.com/ropensci/taxize	https://github.com/ropensci/taxize/issues	yes	knitr	XML/>= 3.98.1.1, RCurl/>= 1.6, reshape2/*, stringr/*, plyr/*, httr/>= 0.6.1, jsonlite/*, foreach/*, ape/*, Taxonstand/*, data.table/*, bold/*	testthat/*, roxygen2/*, knitr/*, vegan/*	2015-06-13 15:24:49 UTC; sacmac	Scott Chamberlain [aut, cre],\nEduard Szoecs [aut],\nZachary Foster [aut],\nCarl Boettiger [aut],\nKarthik Ram [aut],\nIgnasi Bartomeus [aut],\nJohn Baumgartner [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-06-13 13:01:22	\N	2015-06-13 19:00:34	\N	R/>= 2.10.0	\N	\N	\N	yes	\N	\N	\N	\N	\N	2015-07-09 23:27:06
traits	Species Trait Data from Around the Web	Species trait data from many different sources, including\nsequence data from 'NCBI', plant trait data from 'BETYdb', invasive species\ndata from the Global Invasive Species Database and 'EOL', 'Traitbank' data\nfrom 'EOL', Coral traits data from http://coraltraits.org, 'nativity' status\n('Flora Europaea' or 'ITIS'), and 'Birdlife' International.	0.1.0	MIT + file LICENSE	c(\nperson("Scott", "Chamberlain", role = c("aut", "cre"), email = "myrmecocystus@gmail.com"),\nperson("Zachary", "Foster", role = "aut", email = "zacharyfoster1989@gmail.com"),\nperson("Ignasi", "Bartomeus", role = "aut", email = "nacho.bartomeus@gmail.com"),\nperson("David", "LeBauer", role = "aut", email = "dlebauer@gmail.com")\n)	https://github.com/ropensci/traits	http://www.github.com/ropensci/traits/issues	true	knitr	XML/*, jsonlite/*, httr/*, dplyr/*, data.table/*, taxize/*	roxygen2/*, knitr/*, testthat/*, plyr/*	2015-06-11 21:05:56 UTC; sacmac	Scott Chamberlain [aut, cre],\nZachary Foster [aut],\nIgnasi Bartomeus [aut],\nDavid LeBauer [aut]	Scott Chamberlain <myrmecocystus@gmail.com>	no	CRAN	2015-06-12 02:02:19	\N	2015-06-12 08:00:36	\N	R/>= 2.10	\N	\N	\N	\N	\N	\N	\N	\N	\N	2015-07-09 23:27:06
USAboundaries	Historical Boundaries of the United States of America, 1629-2000	This package provides spatial objects with the boundaries of\nstates or counties in the United States of America from 1629 to 2000.\nIt provides data from the Atlas of Historical County Boundaries.	0.1.1	CC BY-NC-SA 4.0	c(person("Lincoln", "Mullen", email = "lincoln@lincolnmullen.com",\nrole = c("aut", "cre")), person("Dr. William M. Scholl Center for American\nHistory and Culture, The Newberry Library", role = c("cph")))	https://github.com/ropensci/USAboundaries	https://github.com/ropensci/USAboundaries/issues	true	knitr	assertthat/>= 0.1, dplyr/>= 0.3.0.1, ggplot2/>= 1.0.0, lubridate/>= 1.3.3, maptools/>= 0.8-30, rgeos/>= 0.3-8, sp/>= 1.0.15	knitr/*, mapproj/*, testthat/>= 0.9.1	2014-12-24 00:56:39 UTC; lmullen	Lincoln Mullen [aut, cre],\nDr. William M. Scholl Center for American History and Culture, The\nNewberry Library [cph]	Lincoln Mullen <lincoln@lincolnmullen.com>	no	CRAN	2014-12-24 00:09:30	\N	2014-12-24 06:08:08	Package	R/>= 3.1.1	\N	\N	\N	\N	\N	\N	\N	\N	xz	2015-07-09 23:27:06
webchem	Chemical Information from the Web	Chemical information from around the web. This package interacts with a suite of web APIs for chemical information.	0.0.1	MIT + file LICENSE	\N	https://github.com/EDiLD/webchem	https://github.com/EDiLD/webchem/issues	yes	\N	XML/*, RCurl/*, RJSONIO/*	\N	2015-03-06 11:33:33 UTC; edisz	Eduard Szoecs	Eduard Szoecs <eduardszoecs@gmail.com>	no	CRAN	2015-03-06 11:55:36	\N	2015-03-06 17:50:54	Package	\N	\N	\N	\N	yes	\N	\N	\N	\N	\N	2015-07-09 23:27:06
\.


--
-- Data for Name: cranlogs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cranlogs (name, cran_downloads, collected, inserted) FROM stdin;
alm	8110	2015-07-09 20:23:46	2015-07-09 20:25:25
AntWeb	8024	2015-07-09 20:23:46	2015-07-09 20:25:25
aRxiv	4404	2015-07-09 20:23:47	2015-07-09 20:25:25
binomen	0	2015-07-09 20:23:47	2015-07-09 20:25:25
bmc	0	2015-07-09 20:23:47	2015-07-09 20:25:25
bold	10721	2015-07-09 20:23:47	2015-07-09 20:25:25
cartographer	0	2015-07-09 20:23:47	2015-07-09 20:25:25
chromer	2018	2015-07-09 20:23:48	2015-07-09 20:25:25
ckanr	0	2015-07-09 20:23:48	2015-07-09 20:25:25
clifro	1368	2015-07-09 20:23:48	2015-07-09 20:25:25
csl	0	2015-07-09 20:23:48	2015-07-09 20:25:25
dashboard	2164	2015-07-09 20:23:48	2015-07-09 20:25:25
datapackage	0	2015-07-09 20:23:49	2015-07-09 20:25:25
dependencies	0	2015-07-09 20:23:49	2015-07-09 20:25:25
dvn	6979	2015-07-09 20:23:50	2015-07-09 20:25:25
ecoengine	8741	2015-07-09 20:23:50	2015-07-09 20:25:25
ecoretriever	2684	2015-07-09 20:23:50	2015-07-09 20:25:25
elastic	2316	2015-07-09 20:23:51	2015-07-09 20:25:25
elasticdsl	0	2015-07-09 20:23:51	2015-07-09 20:25:25
elife	0	2015-07-09 20:23:51	2015-07-09 20:25:25
EML	0	2015-07-09 20:23:51	2015-07-09 20:25:25
etseed	0	2015-07-09 20:23:52	2015-07-09 20:25:25
finch	0	2015-07-09 20:23:52	2015-07-09 20:25:25
floras	0	2015-07-09 20:23:52	2015-07-09 20:25:25
fulltext	0	2015-07-09 20:23:52	2015-07-09 20:25:25
gender	14170	2015-07-09 20:23:52	2015-07-09 20:25:25
genderdata	0	2015-07-09 20:23:53	2015-07-09 20:25:25
geojsonio	792	2015-07-09 20:23:53	2015-07-09 20:25:25
geonames	12946	2015-07-09 20:23:53	2015-07-09 20:25:25
ggit	0	2015-07-09 20:23:53	2015-07-09 20:25:25
gigadb	0	2015-07-09 20:23:54	2015-07-09 20:25:25
gistr	4885	2015-07-09 20:23:54	2015-07-09 20:25:25
git2r	89278	2015-07-09 20:23:54	2015-07-09 20:25:25
gitr	0	2015-07-09 20:23:54	2015-07-09 20:25:25
hathi	0	2015-07-09 20:23:54	2015-07-09 20:25:25
historydata	2017	2015-07-09 20:23:55	2015-07-09 20:25:25
ICES	0	2015-07-09 20:23:55	2015-07-09 20:25:25
IEEER	0	2015-07-09 20:23:55	2015-07-09 20:25:25
internetarchive	997	2015-07-09 20:23:55	2015-07-09 20:25:25
jqr	0	2015-07-09 20:23:55	2015-07-09 20:25:25
lawn	415	2015-07-09 20:23:56	2015-07-09 20:25:25
mdextract	0	2015-07-09 20:23:56	2015-07-09 20:25:25
mocker	0	2015-07-09 20:23:56	2015-07-09 20:25:25
musemeta	0	2015-07-09 20:23:56	2015-07-09 20:25:25
neotoma	649	2015-07-09 20:23:56	2015-07-09 20:25:25
nodbi	0	2015-07-09 20:23:56	2015-07-09 20:25:25
opencontext	0	2015-07-09 20:23:57	2015-07-09 20:25:25
ots	0	2015-07-09 20:23:57	2015-07-09 20:25:25
paleobioDB	4067	2015-07-09 20:23:57	2015-07-09 20:25:25
pangaear	0	2015-07-09 20:23:57	2015-07-09 20:25:25
parasiteR	0	2015-07-09 20:23:58	2015-07-09 20:25:25
pleiades	0	2015-07-09 20:23:58	2015-07-09 20:25:25
plotly	0	2015-07-09 20:23:58	2015-07-09 20:25:25
prism	0	2015-07-09 20:23:58	2015-07-09 20:25:25
proj	0	2015-07-09 20:23:58	2015-07-09 20:25:25
rAltmetric	6515	2015-07-09 20:23:59	2015-07-09 20:25:25
rAvis	4203	2015-07-09 20:23:59	2015-07-09 20:25:25
rbefdata	6039	2015-07-09 20:23:59	2015-07-09 20:25:25
rbhl	4439	2015-07-09 20:24:00	2015-07-09 20:25:25
rbison	7295	2015-07-09 20:24:00	2015-07-09 20:25:25
rchie	0	2015-07-09 20:24:00	2015-07-09 20:25:25
rcrossref	2543	2015-07-09 20:24:00	2015-07-09 20:25:25
RCryptsy	2259	2015-07-09 20:24:00	2015-07-09 20:25:25
rDat	0	2015-07-09 20:24:01	2015-07-09 20:25:25
rdatacite	0	2015-07-09 20:24:01	2015-07-09 20:25:25
rdataone	0	2015-07-09 20:24:01	2015-07-09 20:25:25
rdopa	0	2015-07-09 20:24:01	2015-07-09 20:25:25
rdpla	0	2015-07-09 20:24:01	2015-07-09 20:25:25
rdryad	6709	2015-07-09 20:24:02	2015-07-09 20:25:25
rebi	0	2015-07-09 20:24:02	2015-07-09 20:25:25
rebird	8377	2015-07-09 20:24:02	2015-07-09 20:25:25
RedisAPI	0	2015-07-09 20:24:02	2015-07-09 20:25:25
redland-bindings	\N	2015-07-09 20:24:02	2015-07-09 20:25:25
rentrez	8977	2015-07-09 20:24:03	2015-07-09 20:25:25
reol	0	2015-07-09 20:24:03	2015-07-09 20:25:25
rerddap	469	2015-07-09 20:24:03	2015-07-09 20:25:25
reuropeana	0	2015-07-09 20:24:03	2015-07-09 20:25:25
rfigshare	7719	2015-07-09 20:24:03	2015-07-09 20:25:25
rfishbase	7406	2015-07-09 20:24:04	2015-07-09 20:25:25
rfisheries	6252	2015-07-09 20:24:04	2015-07-09 20:25:25
rflybase	0	2015-07-09 20:24:04	2015-07-09 20:25:25
rgauges	4709	2015-07-09 20:24:04	2015-07-09 20:25:25
rgbif	14793	2015-07-09 20:24:04	2015-07-09 20:25:25
rGEM	0	2015-07-09 20:24:04	2015-07-09 20:25:25
rglobi	1681	2015-07-09 20:24:05	2015-07-09 20:25:25
rgpdd	0	2015-07-09 20:24:05	2015-07-09 20:25:25
rhindawi	0	2015-07-09 20:24:05	2015-07-09 20:25:25
rif	0	2015-07-09 20:24:05	2015-07-09 20:25:25
rImpactStory	1384	2015-07-09 20:24:05	2015-07-09 20:25:25
rinat	6599	2015-07-09 20:24:06	2015-07-09 20:25:25
ritis	323	2015-07-09 20:24:06	2015-07-09 20:25:25
RMendeley	3556	2015-07-09 20:24:06	2015-07-09 20:25:25
rmetadata	0	2015-07-09 20:24:06	2015-07-09 20:25:25
RMETAR	306	2015-07-09 20:24:07	2015-07-09 20:25:25
rnbn	2998	2015-07-09 20:24:07	2015-07-09 20:25:25
RNeXML	4735	2015-07-09 20:24:07	2015-07-09 20:25:25
rnoaa	5354	2015-07-09 20:24:07	2015-07-09 20:25:25
rnpn	0	2015-07-09 20:24:07	2015-07-09 20:25:25
rOBIS	0	2015-07-09 20:24:08	2015-07-09 20:25:25
rorcid	0	2015-07-09 20:24:08	2015-07-09 20:25:25
rpensoft	0	2015-07-09 20:24:08	2015-07-09 20:25:25
rplos	10676	2015-07-09 20:24:08	2015-07-09 20:25:25
rpmc	0	2015-07-09 20:24:08	2015-07-09 20:25:25
rpwt	0	2015-07-09 20:24:09	2015-07-09 20:25:25
rrlite	0	2015-07-09 20:24:09	2015-07-09 20:25:25
RSelenium	9182	2015-07-09 20:24:09	2015-07-09 20:25:25
rsnps	5122	2015-07-09 20:24:09	2015-07-09 20:25:25
rspringer	0	2015-07-09 20:24:09	2015-07-09 20:25:25
RStars	1877	2015-07-09 20:24:10	2015-07-09 20:25:25
rvertnet	6724	2015-07-09 20:24:10	2015-07-09 20:25:25
rWBclimate	3741	2015-07-09 20:24:10	2015-07-09 20:25:25
sandbox	0	2015-07-09 20:24:10	2015-07-09 20:25:25
sheetseeR	0	2015-07-09 20:24:10	2015-07-09 20:25:25
sofa	0	2015-07-09 20:24:11	2015-07-09 20:25:25
solr	8591	2015-07-09 20:24:11	2015-07-09 20:25:25
spocc	5303	2015-07-09 20:24:11	2015-07-09 20:25:25
taxize	15288	2015-07-09 20:24:11	2015-07-09 20:25:25
taxizesoap	0	2015-07-09 20:24:12	2015-07-09 20:25:25
testdat	0	2015-07-09 20:24:12	2015-07-09 20:25:25
traits	246	2015-07-09 20:24:12	2015-07-09 20:25:25
treeBASE	0	2015-07-09 20:24:12	2015-07-09 20:25:25
ucipp	0	2015-07-09 20:24:12	2015-07-09 20:25:25
USAboundaries	1876	2015-07-09 20:24:13	2015-07-09 20:25:25
webchem	1076	2015-07-09 20:24:13	2015-07-09 20:25:25
webmockr	0	2015-07-09 20:24:13	2015-07-09 20:25:25
wellknown	0	2015-07-09 20:24:13	2015-07-09 20:25:25
zenodo	0	2015-07-09 20:24:13	2015-07-09 20:25:25
alm	8303	2015-07-28 00:27:11	2015-07-28 00:27:38
AntWeb	8335	2015-07-28 00:27:12	2015-07-28 00:27:38
aRxiv	4638	2015-07-28 00:27:12	2015-07-28 00:27:38
binomen	0	2015-07-28 00:27:12	2015-07-28 00:27:38
bmc	0	2015-07-28 00:27:12	2015-07-28 00:27:38
bold	11411	2015-07-28 00:27:13	2015-07-28 00:27:38
cartographer	0	2015-07-28 00:27:13	2015-07-28 00:27:38
chromer	2160	2015-07-28 00:27:13	2015-07-28 00:27:38
citeulike	0	2015-07-28 00:27:13	2015-07-28 00:27:38
ckanr	0	2015-07-28 00:27:13	2015-07-28 00:27:38
clifro	1481	2015-07-28 00:27:13	2015-07-28 00:27:38
csl	0	2015-07-28 00:27:14	2015-07-28 00:27:38
dashboard	2291	2015-07-28 00:27:14	2015-07-28 00:27:38
datapackage	0	2015-07-28 00:27:14	2015-07-28 00:27:38
dependencies	0	2015-07-28 00:27:14	2015-07-28 00:27:38
dvn	7113	2015-07-28 00:27:15	2015-07-28 00:27:38
ecoengine	9048	2015-07-28 00:27:15	2015-07-28 00:27:38
ecoretriever	2823	2015-07-28 00:27:15	2015-07-28 00:27:38
elastic	2618	2015-07-28 00:27:15	2015-07-28 00:27:38
elasticdsl	0	2015-07-28 00:27:15	2015-07-28 00:27:38
elife	0	2015-07-28 00:27:16	2015-07-28 00:27:38
EML	0	2015-07-28 00:27:16	2015-07-28 00:27:38
etseed	0	2015-07-28 00:27:16	2015-07-28 00:27:38
finch	0	2015-07-28 00:27:16	2015-07-28 00:27:38
floras	0	2015-07-28 00:27:16	2015-07-28 00:27:38
fulltext	0	2015-07-28 00:27:16	2015-07-28 00:27:38
gender	18720	2015-07-28 00:27:17	2015-07-28 00:27:38
genderdata	0	2015-07-28 00:27:17	2015-07-28 00:27:38
geojsonio	976	2015-07-28 00:27:17	2015-07-28 00:27:38
geonames	13225	2015-07-28 00:27:17	2015-07-28 00:27:38
ggit	0	2015-07-28 00:27:18	2015-07-28 00:27:38
gigadb	0	2015-07-28 00:27:19	2015-07-28 00:27:38
gistr	5449	2015-07-28 00:27:19	2015-07-28 00:27:38
git2r	115476	2015-07-28 00:27:19	2015-07-28 00:27:38
gitr	0	2015-07-28 00:27:19	2015-07-28 00:27:38
hathi	0	2015-07-28 00:27:19	2015-07-28 00:27:38
historydata	2139	2015-07-28 00:27:19	2015-07-28 00:27:38
ICES	0	2015-07-28 00:27:20	2015-07-28 00:27:38
IEEER	0	2015-07-28 00:27:20	2015-07-28 00:27:38
internetarchive	1084	2015-07-28 00:27:20	2015-07-28 00:27:38
jqr	0	2015-07-28 00:27:20	2015-07-28 00:27:38
lawn	486	2015-07-28 00:27:20	2015-07-28 00:27:38
mdextract	0	2015-07-28 00:27:21	2015-07-28 00:27:38
mocker	0	2015-07-28 00:27:21	2015-07-28 00:27:38
musemeta	0	2015-07-28 00:27:21	2015-07-28 00:27:38
neotoma	779	2015-07-28 00:27:21	2015-07-28 00:27:38
nodbi	0	2015-07-28 00:27:21	2015-07-28 00:27:38
opencontext	0	2015-07-28 00:27:21	2015-07-28 00:27:38
ots	0	2015-07-28 00:27:22	2015-07-28 00:27:38
paleobioDB	4193	2015-07-28 00:27:22	2015-07-28 00:27:38
pangaear	0	2015-07-28 00:27:22	2015-07-28 00:27:38
parasiteR	0	2015-07-28 00:27:22	2015-07-28 00:27:38
pleiades	0	2015-07-28 00:27:22	2015-07-28 00:27:38
plotly	0	2015-07-28 00:27:23	2015-07-28 00:27:38
prism	0	2015-07-28 00:27:23	2015-07-28 00:27:38
proj	0	2015-07-28 00:27:23	2015-07-28 00:27:38
rAltmetric	6649	2015-07-28 00:27:23	2015-07-28 00:27:38
rAvis	4321	2015-07-28 00:27:24	2015-07-28 00:27:38
rbefdata	6144	2015-07-28 00:27:24	2015-07-28 00:27:38
rbhl	4633	2015-07-28 00:27:24	2015-07-28 00:27:38
rbison	7611	2015-07-28 00:27:24	2015-07-28 00:27:38
rchie	0	2015-07-28 00:27:25	2015-07-28 00:27:38
rcrossref	2762	2015-07-28 00:27:25	2015-07-28 00:27:38
RCryptsy	2383	2015-07-28 00:27:25	2015-07-28 00:27:38
rDat	0	2015-07-28 00:27:25	2015-07-28 00:27:38
rdatacite	0	2015-07-28 00:27:25	2015-07-28 00:27:38
rdataone	0	2015-07-28 00:27:25	2015-07-28 00:27:38
rdopa	0	2015-07-28 00:27:26	2015-07-28 00:27:38
rdpla	0	2015-07-28 00:27:26	2015-07-28 00:27:38
rdryad	6855	2015-07-28 00:27:26	2015-07-28 00:27:38
rebi	0	2015-07-28 00:27:26	2015-07-28 00:27:38
rebird	8743	2015-07-28 00:27:26	2015-07-28 00:27:38
RedisAPI	0	2015-07-28 00:27:27	2015-07-28 00:27:38
redland-bindings	\N	2015-07-28 00:27:27	2015-07-28 00:27:38
rentrez	9240	2015-07-28 00:27:27	2015-07-28 00:27:38
reol	0	2015-07-28 00:27:27	2015-07-28 00:27:38
rerddap	569	2015-07-28 00:27:27	2015-07-28 00:27:38
reuropeana	0	2015-07-28 00:27:28	2015-07-28 00:27:38
rfigshare	7879	2015-07-28 00:27:28	2015-07-28 00:27:38
rfishbase	7544	2015-07-28 00:27:28	2015-07-28 00:27:38
rfisheries	6366	2015-07-28 00:27:28	2015-07-28 00:27:38
rflybase	0	2015-07-28 00:27:28	2015-07-28 00:27:38
rgauges	4819	2015-07-28 00:27:28	2015-07-28 00:27:38
rgbif	15283	2015-07-28 00:27:29	2015-07-28 00:27:38
rGEM	0	2015-07-28 00:27:29	2015-07-28 00:27:38
rglobi	1772	2015-07-28 00:27:29	2015-07-28 00:27:38
rgpdd	0	2015-07-28 00:27:29	2015-07-28 00:27:38
rhindawi	0	2015-07-28 00:27:29	2015-07-28 00:27:38
rif	0	2015-07-28 00:27:30	2015-07-28 00:27:38
rImpactStory	1387	2015-07-28 00:27:30	2015-07-28 00:27:38
rinat	6712	2015-07-28 00:27:30	2015-07-28 00:27:38
ritis	323	2015-07-28 00:27:30	2015-07-28 00:27:38
RMendeley	3572	2015-07-28 00:27:30	2015-07-28 00:27:38
rmetadata	0	2015-07-28 00:27:31	2015-07-28 00:27:38
RMETAR	308	2015-07-28 00:27:31	2015-07-28 00:27:38
rnbn	3104	2015-07-28 00:27:31	2015-07-28 00:27:38
RNeXML	5008	2015-07-28 00:27:31	2015-07-28 00:27:38
rnoaa	5638	2015-07-28 00:27:31	2015-07-28 00:27:38
rnpn	0	2015-07-28 00:27:32	2015-07-28 00:27:38
rOBIS	0	2015-07-28 00:27:32	2015-07-28 00:27:38
rorcid	0	2015-07-28 00:27:32	2015-07-28 00:27:38
rpensoft	0	2015-07-28 00:27:32	2015-07-28 00:27:38
rplos	10986	2015-07-28 00:27:32	2015-07-28 00:27:38
rpmc	0	2015-07-28 00:27:33	2015-07-28 00:27:38
rpwt	0	2015-07-28 00:27:33	2015-07-28 00:27:38
rrlite	0	2015-07-28 00:27:33	2015-07-28 00:27:38
RSelenium	9808	2015-07-28 00:27:33	2015-07-28 00:27:38
rsnps	5248	2015-07-28 00:27:33	2015-07-28 00:27:38
rspringer	0	2015-07-28 00:27:34	2015-07-28 00:27:38
RStars	1999	2015-07-28 00:27:34	2015-07-28 00:27:38
rvertnet	7024	2015-07-28 00:27:34	2015-07-28 00:27:38
rWBclimate	3864	2015-07-28 00:27:34	2015-07-28 00:27:38
sandbox	0	2015-07-28 00:27:34	2015-07-28 00:27:38
sheetseeR	0	2015-07-28 00:27:34	2015-07-28 00:27:38
sofa	0	2015-07-28 00:27:35	2015-07-28 00:27:38
solr	8905	2015-07-28 00:27:35	2015-07-28 00:27:38
spocc	5547	2015-07-28 00:27:35	2015-07-28 00:27:38
taxize	15979	2015-07-28 00:27:36	2015-07-28 00:27:38
taxizesoap	0	2015-07-28 00:27:36	2015-07-28 00:27:38
testdat	0	2015-07-28 00:27:36	2015-07-28 00:27:38
traits	318	2015-07-28 00:27:36	2015-07-28 00:27:38
treeBASE	0	2015-07-28 00:27:36	2015-07-28 00:27:38
ucipp	0	2015-07-28 00:27:36	2015-07-28 00:27:38
USAboundaries	1988	2015-07-28 00:27:37	2015-07-28 00:27:38
webchem	1161	2015-07-28 00:27:37	2015-07-28 00:27:38
webmockr	0	2015-07-28 00:27:37	2015-07-28 00:27:38
wellknown	0	2015-07-28 00:27:37	2015-07-28 00:27:38
zenodo	0	2015-07-28 00:27:38	2015-07-28 00:27:38
\.


--
-- Data for Name: github; Type: TABLE DATA; Schema: public; Owner: -
--

COPY github (id, name, created_at, updated_at, size, language, forks, open_issues, watchers, default_branch, inserted) FROM stdin;
9681032	alm	2013-04-25 20:47:13	2015-04-26 16:21:26	3382	R	3	5	8	master	2015-07-09 19:09:44
14652790	AntWeb	2013-11-23 23:59:28	2014-12-19 23:54:59	623	R	2	0	5	master	2015-07-09 19:09:44
17390037	aRxiv	2014-03-04 04:13:36	2015-04-07 13:47:19	584	R	3	4	12	master	2015-07-09 19:09:44
29441143	binomen	2015-01-18 21:07:18	2015-02-25 23:50:12	308	R	0	2	1	master	2015-07-09 19:09:44
17678580	bmc	2014-03-12 18:39:41	2015-03-30 21:51:51	176	R	0	3	2	master	2015-07-09 19:09:44
1950836	bold	2011-06-25 03:23:46	2015-04-28 20:25:32	6662	R	0	1	4	master	2015-07-09 19:09:44
28362556	cartographer	2014-12-22 22:23:39	2015-06-25 15:26:36	2829	JavaScript	8	14	42	master	2015-07-09 19:09:44
27366977	chromer	2014-12-01 07:01:52	2015-01-13 22:11:06	342	R	0	1	0	master	2015-07-09 19:09:44
3291949	citeulike	2012-01-28 17:19:38	2015-01-04 10:50:07	871	R	1	1	3	master	2015-07-09 19:09:44
26542491	ckanr	2014-11-12 15:32:54	2015-07-07 07:07:35	573	R	6	5	14	master	2015-07-09 19:09:44
19559638	clifro	2014-05-08 03:43:50	2015-06-12 02:31:39	62502	HTML	3	0	9	master	2015-07-09 19:09:44
29930123	csl	2015-01-27 19:10:25	2015-03-16 15:54:10	208	R	0	1	2	master	2015-07-09 19:09:44
27158557	dashboard	2014-11-26 03:51:27	2015-02-14 15:19:31	612	CSS	0	6	8	master	2015-07-09 19:09:44
23672990	datapackage	2014-09-04 17:53:33	2015-05-19 17:52:16	353	R	4	9	10	master	2015-07-09 19:09:44
18312342	dependencies	2014-04-01 00:11:08	2015-03-24 00:23:53	272	R	1	1	7	master	2015-07-09 19:09:44
10590690	dvn	2013-06-09 23:35:18	2015-05-18 14:04:28	712	R	4	6	11	master	2015-07-09 19:09:44
11772332	ecoengine	2013-07-30 18:32:23	2015-05-13 05:43:58	7097	R	1	17	9	master	2015-07-09 19:09:44
18155090	ecoretriever	2014-03-26 21:47:02	2015-05-22 14:09:17	557	R	4	2	4	master	2015-07-09 19:09:44
14388493	elastic	2013-11-14 07:48:08	2015-07-08 15:41:15	1711	R	12	3	48	master	2015-07-09 19:09:44
31174712	elasticdsl	2015-02-22 18:49:54	2015-04-01 15:12:41	196	R	0	3	4	master	2015-07-09 19:09:44
6521807	elife	2012-11-03 16:58:40	2015-06-19 12:51:33	192	R	3	0	7	master	2015-07-09 19:09:44
10894022	EML	2013-06-23 23:20:03	2015-06-04 21:45:09	5421	HTML	7	36	22	master	2015-07-09 19:09:44
30372135	etseed	2015-02-05 18:50:34	2015-04-24 15:23:35	184	R	0	2	5	master	2015-07-09 19:09:44
29216860	finch	2015-01-13 23:25:24	2015-03-16 17:40:10	440	R	0	3	6	master	2015-07-09 19:09:44
2965765	floras	2011-12-12 16:53:32	2015-05-06 10:20:15	252	R	0	1	5	master	2015-07-09 19:09:44
20299174	fulltext	2014-05-29 15:51:10	2015-06-03 16:07:58	4612	R	6	24	15	master	2015-07-09 19:09:44
17000065	gender	2014-02-19 21:45:54	2015-06-18 20:56:14	50234	R	4	4	42	master	2015-07-09 19:09:44
31559475	genderdata	2015-03-02 19:47:19	2015-04-10 14:24:25	21938	R	2	1	0	master	2015-07-09 19:09:44
18337862	geojsonio	2014-04-01 17:20:23	2015-06-14 20:44:33	2535	R	14	11	38	master	2015-07-09 19:09:44
19429689	geonames	2014-05-04 15:42:11	2015-06-09 08:51:34	286	R	0	3	9	master	2015-07-09 19:09:44
24203996	ggit	2014-09-18 20:30:53	2015-04-09 21:23:51	148	R	0	0	3	master	2015-07-09 19:09:44
23121322	gigadb	2014-08-19 18:35:53	2014-09-11 20:14:37	140	R	0	1	2	master	2015-07-09 19:09:44
20020718	gistr	2014-05-21 12:41:23	2015-07-01 18:20:27	1628	R	6	4	38	master	2015-07-09 19:09:44
15494155	git2r	2013-12-28 15:06:53	2015-07-02 12:29:10	8321	C	10	18	64	master	2015-07-09 19:09:44
10986526	gitr	2013-06-27 03:46:24	2014-08-20 18:14:25	184	R	0	14	1	master	2015-07-09 19:09:44
28213160	hathi	2014-12-19 03:49:03	2015-02-16 17:22:29	144	R	0	2	0	master	2015-07-09 19:09:44
24310545	historydata	2014-09-22 01:53:44	2015-06-28 22:01:21	1529	R	8	2	21	master	2015-07-09 19:09:44
14147756	ICES	2013-11-05 16:55:15	2014-12-17 18:12:15	108	\N	0	1	0	master	2015-07-09 19:09:44
25357446	IEEER	2014-10-17 12:36:52	2015-05-26 21:58:23	721	R	2	0	6	master	2015-07-09 19:09:44
30628339	internetarchive	2015-02-11 03:20:06	2015-06-02 17:12:44	712	R	0	2	26	master	2015-07-09 19:09:44
31562506	jqr	2015-03-02 20:51:13	2015-06-16 01:03:27	755	C	1	6	5	master	2015-07-09 19:09:44
31631259	lawn	2015-03-04 01:28:16	2015-06-18 12:05:25	6468	JavaScript	3	6	28	master	2015-07-09 19:09:44
23627306	mdextract	2014-09-03 16:04:10	2015-02-01 16:54:05	458	R	2	7	2	master	2015-07-09 19:09:44
13906147	mocker	2013-10-27 17:18:58	2015-05-31 09:21:39	159	R	1	5	1	master	2015-07-09 19:09:44
26493112	musemeta	2014-11-11 16:18:24	2015-04-26 16:23:33	304	R	2	4	10	master	2015-07-09 19:09:44
7900702	neotoma	2013-01-29 20:41:23	2015-05-28 23:35:57	5265	R	7	22	9	master	2015-07-09 19:09:44
32953695	nodbi	2015-03-26 21:48:45	2015-05-21 02:23:31	261	R	1	8	6	master	2015-07-09 19:09:44
32806036	opencontext	2015-03-24 15:06:19	2015-06-04 20:16:32	200	R	0	3	11	master	2015-07-09 19:09:44
24873232	ots	2014-10-07 01:59:30	2015-07-06 15:50:28	248	R	0	18	6	master	2015-07-09 19:09:44
16210999	paleobioDB	2014-01-24 17:09:05	2015-04-28 19:27:28	19016	R	6	6	12	master	2015-07-09 19:09:44
23585618	pangaear	2014-09-02 16:08:16	2015-03-31 15:20:07	392	R	3	2	2	master	2015-07-09 19:09:44
29489087	parasiteR	2015-01-19 19:59:25	2015-05-04 19:49:08	268	R	0	0	5	master	2015-07-09 19:09:44
22477515	pleiades	2014-07-31 17:02:34	2014-10-30 21:51:25	216	R	0	3	2	master	2015-07-09 19:09:44
14579179	plotly	2013-11-21 05:56:51	2015-07-06 07:52:15	41228	R	47	53	174	master	2015-07-09 19:09:44
18089079	prism	2014-03-25 04:49:41	2015-05-26 22:06:45	855	R	5	9	12	master	2015-07-09 19:09:44
31569489	proj	2015-03-02 23:37:29	2015-06-03 13:39:06	164	R	0	0	1	master	2015-07-09 19:09:44
5990519	rAltmetric	2012-09-28 00:16:41	2015-06-10 06:54:04	1065	R	5	3	9	master	2015-07-09 19:09:44
14112606	rAvis	2013-11-04 14:51:32	2014-12-01 23:37:07	11078	R	0	1	4	master	2015-07-09 19:09:44
2068208	rbhl	2011-07-18 19:21:22	2015-05-22 14:06:53	613	R	0	2	6	master	2015-07-09 19:09:44
9931176	rbison	2013-05-08 07:48:34	2015-07-01 21:05:05	6207	R	1	3	7	master	2015-07-09 19:09:44
31815960	rchie	2015-03-07 15:19:39	2015-07-06 16:29:35	364	JavaScript	0	4	8	master	2015-07-09 19:09:44
13002070	rcrossref	2013-09-21 20:42:30	2015-04-29 08:28:59	945	R	6	5	9	master	2015-07-09 19:09:44
21529818	RCryptsy	2014-07-05 23:12:20	2015-02-17 19:26:56	279	R	1	2	3	master	2015-07-09 19:09:44
16595768	rdat	2014-02-06 22:10:53	2015-06-21 16:47:37	303	R	4	4	29	master	2015-07-09 19:09:44
2521192	rdatacite	2011-10-05 18:38:29	2015-03-10 23:36:43	180	R	1	3	5	master	2015-07-09 19:09:44
24248325	rdataone	2014-09-19 23:10:39	2015-01-13 22:24:57	17231	R	0	0	0	master	2015-07-09 19:09:44
20699475	rdopa	2014-06-10 19:57:29	2015-05-08 10:55:46	1164	R	0	12	4	master	2015-07-09 19:09:44
25886896	rdpla	2014-10-28 19:43:39	2015-02-12 05:16:52	544	R	0	7	6	master	2015-07-09 19:09:44
3504243	rdryad	2012-02-21 13:52:33	2015-02-01 16:52:49	206	R	4	6	11	master	2015-07-09 19:09:44
9358552	rebi	2013-04-10 23:58:12	2015-01-28 13:24:27	567	R	1	0	6	master	2015-07-09 19:09:44
3401528	rebird	2012-02-09 21:35:39	2015-05-22 14:05:55	767	R	3	0	13	master	2015-07-09 19:09:44
33702610	RedisAPI	2015-04-10 01:54:52	2015-07-06 21:47:10	259	R	1	3	3	master	2015-07-09 19:09:44
25373534	redland-bindings	2014-10-17 19:23:12	2015-06-04 14:38:10	4438	R	1	6	3	master	2015-07-09 19:09:44
3418841	rentrez	2012-02-11 23:44:24	2015-07-09 09:14:55	1777	R	9	11	44	master	2015-07-09 19:09:44
16894167	reol	2014-02-16 21:04:32	2015-02-01 16:51:56	602	R	1	2	4	master	2015-07-09 19:09:44
26992679	rerddap	2014-11-22 07:58:32	2015-07-09 10:32:02	448	R	0	2	7	master	2015-07-09 19:09:44
25893846	reuropeana	2014-10-28 22:51:49	2015-02-16 16:42:55	136	R	0	6	0	master	2015-07-09 19:09:44
4652738	rfigshare	2012-06-13 15:34:22	2015-05-18 14:06:44	1573	R	4	13	21	master	2015-07-09 19:09:44
2799822	rfishbase	2011-11-18 01:03:37	2015-06-06 12:48:24	32189	R	8	11	16	master	2015-07-09 19:09:44
2682704	rfisheries	2011-10-31 18:29:04	2015-05-24 08:13:19	1126	R	7	7	11	master	2015-07-09 19:09:44
2744491	rflybase	2011-11-09 21:04:03	2014-08-21 03:08:38	124	R	0	0	3	master	2015-07-09 19:09:44
3020113	rgauges	2011-12-20 14:44:50	2015-03-06 00:45:13	575	R	2	5	6	master	2015-07-09 19:09:44
2273724	rgbif	2011-08-26 11:28:18	2015-05-22 14:08:20	11413	R	13	4	34	master	2015-07-09 19:09:44
26551018	rGEM	2014-11-12 18:53:17	2014-12-10 17:43:36	900	R	0	1	2	master	2015-07-09 19:09:44
19300101	rglobi	2014-04-30 03:49:39	2015-05-05 18:23:05	896	R	2	1	6	master	2015-07-09 19:09:44
12953752	rgpdd	2013-09-19 16:44:52	2015-04-21 22:13:45	3328	R	0	3	2	master	2015-07-09 19:09:44
4833683	rhindawi	2012-06-29 15:11:53	2014-08-16 01:06:07	168	R	0	0	2	master	2015-07-09 19:09:44
30632782	rif	2015-02-11 05:47:18	2015-06-25 05:36:53	151	R	1	2	4	master	2015-07-09 19:09:44
5721773	rImpactStory	2012-09-07 20:01:11	2014-11-23 00:45:12	451	R	4	1	6	master	2015-07-09 19:09:44
13307553	rinat	2013-10-03 19:26:27	2014-09-18 20:45:49	882	R	1	1	1	master	2015-07-09 19:09:44
2693028	ritis	2011-11-02 04:52:30	2014-08-21 03:11:42	202	R	0	0	5	master	2015-07-09 19:09:44
1713205	RMendeley	2011-05-06 20:33:13	2015-07-02 09:18:20	555	R	7	3	39	master	2015-07-09 19:09:44
5661114	rmetadata	2012-09-03 16:09:16	2015-04-03 14:37:45	1039	R	3	8	9	master	2015-07-09 19:09:44
12310284	RMETAR	2013-08-22 23:31:54	2013-08-22 23:31:55	976	C	0	0	0	master	2015-07-09 19:09:44
23397192	rnbn	2014-08-27 16:32:46	2015-01-29 23:28:27	1494	R	3	1	2	master	2015-07-09 19:09:44
11856817	RNeXML	2013-08-03 02:50:25	2015-06-11 00:08:05	8977	R	4	23	8	master	2015-07-09 19:09:44
11267149	rnoaa	2013-07-08 22:31:24	2015-07-09 10:18:15	5187	R	14	12	43	master	2015-07-09 19:09:44
2175238	rnpn	2011-08-08 18:57:41	2015-03-13 17:47:53	518	R	4	5	6	master	2015-07-09 19:09:44
14626875	rOBIS	2013-11-22 19:08:40	2015-05-11 17:25:12	168	R	1	1	4	master	2015-07-09 19:09:44
6517373	rorcid	2012-11-03 07:35:54	2015-07-06 16:09:31	296	R	0	0	7	master	2015-07-09 19:09:44
3866532	rpensoft	2012-03-29 13:55:22	2014-08-16 01:05:11	148	R	0	0	1	master	2015-07-09 19:09:44
1834988	rplos	2011-06-02 01:06:42	2015-07-09 16:48:19	3910	R	80	0	120	master	2015-07-09 19:09:44
5247691	rpmc	2012-07-31 15:26:44	2014-08-21 03:14:12	136	R	1	0	1	master	2015-07-09 19:09:44
24162871	rpwt	2014-09-17 21:21:39	2014-09-17 23:11:17	136	R	0	0	0	master	2015-07-09 19:09:44
31707598	rrlite	2015-03-05 09:59:42	2015-05-06 01:08:17	252	R	3	4	6	master	2015-07-09 19:09:44
5954357	RSelenium	2012-09-25 18:17:25	2015-07-01 09:02:15	36167	HTML	10	9	51	master	2015-07-09 19:09:44
3213870	rsnps	2012-01-19 00:19:21	2015-05-08 03:55:06	607	R	4	5	12	master	2015-07-09 19:09:44
1848211	rspringer	2011-06-04 21:10:29	2015-02-06 05:42:44	134	R	1	2	5	master	2015-07-09 19:09:44
27500861	RStars	2014-12-03 18:16:53	2015-04-04 00:32:10	290	R	2	0	6	master	2015-07-09 19:09:44
2356600	rvertnet	2011-09-09 16:30:41	2015-03-23 17:29:23	1065	R	3	1	4	master	2015-07-09 19:09:44
8597444	rWBclimate	2013-03-06 06:31:40	2015-07-08 04:38:34	8342	R	3	10	21	master	2015-07-09 19:09:44
3413587	sandbox	2012-02-11 05:12:41	2013-12-07 05:59:09	316	R	0	1	7	master	2015-07-09 19:09:44
17531104	sheetseeR	2014-03-07 23:58:44	2014-12-03 17:51:38	104	R	1	1	4	master	2015-07-09 19:09:44
9566868	sofa	2013-04-20 16:22:31	2015-04-27 21:43:59	947	R	3	11	11	master	2015-07-09 19:09:44
14702339	solr	2013-11-26 00:04:37	2015-06-19 09:58:49	1124	R	9	9	28	master	2015-07-09 19:09:44
12623134	spocc	2013-09-05 16:46:13	2015-07-07 19:13:24	4486	R	11	7	24	master	2015-07-09 19:09:44
1771790	taxize	2011-05-19 15:05:33	2015-07-09 10:01:12	27267	R	16	41	55	master	2015-07-09 19:09:44
26970659	taxizesoap	2014-11-21 17:39:47	2015-06-11 14:15:12	1913	R	2	7	5	master	2015-07-09 19:09:44
13042811	testdat	2013-09-23 17:56:00	2015-06-16 15:13:49	1079	R	16	17	93	master	2015-07-09 19:09:44
18611775	traits	2014-04-09 20:21:13	2015-06-26 14:01:01	4636	R	4	8	10	master	2015-07-09 19:09:44
2799825	treeBASE	2011-11-18 01:04:00	2015-02-01 16:54:23	33804	TeX	1	4	6	master	2015-07-09 19:09:44
21171645	ucipp	2014-06-24 16:15:36	2015-02-01 16:56:19	144	\N	0	0	1	master	2015-07-09 19:09:44
25009759	USAboundaries	2014-10-09 21:41:11	2015-06-18 10:30:02	6880	R	3	7	20	master	2015-07-09 19:09:44
31718339	webchem	2015-03-05 14:41:50	2015-05-01 14:04:50	516	R	3	6	6	master	2015-07-09 19:09:44
26685722	webmockr	2014-11-15 16:29:29	2014-11-15 16:29:29	100	\N	0	1	0	master	2015-07-09 19:09:44
29632266	wellknown	2015-01-22 00:19:18	2015-04-27 13:44:27	464	R	0	5	3	master	2015-07-09 19:09:44
17605392	zenodo	2014-03-10 19:23:50	2015-05-19 22:57:12	176	R	2	16	4	master	2015-07-09 19:09:44
\.


--
-- Data for Name: repos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY repos (name, repo_type, maintainer, email, status, installable, build_vignettes, category, on_cran, cran_archived, url, root, fork, description, route_github_travis, route_appveyor) FROM stdin;
alm	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	altmetrics	t	f	https://github.com/ropensci/alm	\N	f	R wrapper to the almetrics API platform developed by PLoS  API -other publishers have built on this and work out of the box: CrossRef, Copernicus Publishers, and the Public Knowledge Project (PKP)	ropensci/alm	sckott/alm
AntWeb	package	Karthik Ram	karthik.ram@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/AntWeb	\N	f	Access data from the world's largest ant database. Maintained and developed by the California Academy of Science	ropensci/AntWeb	karthik/AntWeb
aRxiv	package	Karl Broman	kbroman@biostat.wisc.edu	good	t	t	literature	t	f	https://github.com/ropensci/aRxiv	\N	f	Access to the aRxiv preprint repository	ropensci/aRxiv	karthik/aRxiv
binomen	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	taxonomy,biology	f	\N	https://github.com/ropensci/binomen	\N	f	Taxonomic name classes and parsing methods	ropensci/binomen	\N
bmc	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	literature	f	\N	https://github.com/ropensci/bmc	\N	f	An R interface to Biomed Central (BMC) search API and full text XML	ropensci/bmc	sckott/bmc
bold	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/bold	\N	f	R client for BOLD Systems (Barcode Of Life Database).	ropensci/bold	sckott/bold
cartographer	package	Lincoln Mullen	lincoln@lincolnmullen.com	good	t	t	maps	f	\N	https://github.com/ropensci/cartographer	\N	f	A wrapper around d3-carto-map and the d3.js visualization library to create interactive maps at the R console and in R documents.	ropensci/cartographer	\N
chromer	package	Matthew Pennell	mwpennell@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/chromer	\N	f	package for interacting with the chromosome counts database (CCDB) at http://ccdb.tau.ac.il	ropensci/chromer	karthik/chromer
citeulike	package	Scott Chamberlain	myrmecocystus@gmail.com	deprecated	t	t	altmetrics	f	\N	https://github.com/ropensci/citeulike	\N	f	R interface to CiteULike	ropensci/citeulike	\N
ckanr	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	infrastructure,databases	f	\N	https://github.com/ropensci/ckanr	\N	f	R client for CKAN RESTful API	ropensci/ckanr	sckott/ckanr
clifro	package	Blake Seers	blake.seers@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/clifro	\N	f	An R client for New Zealand's National Climate Database	ropensci/clifro	\N
csl	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	literature	f	\N	https://github.com/ropensci/csl	\N	f	Parse CSL Styles	ropensci/csl	\N
dashboard	package	Karthik Ram	karthik.ram@gmail.com	good	t	t	biology	f	\N	https://github.com/ropensci/dashboard	\N	f	A R package dashboard generator	ropensci/dashboard	\N
datapackage	package	Matthew Jones	jones@nceas.ucsb.edu	good	t	t	infrastructure	f	\N	https://github.com/ropensci/datapackage	\N	f	An R package to handle data packages	ropensci/datapackage	\N
dependencies	package	Gavin Simpson	ucfagls@gmail.com	hiatus	t	t	infrastructure	f	\N	https://github.com/ropensci/dependencies	\N	f	\N	ropensci/dependencies	\N
dvn	package	Thomas J. Leeper	thosjleeper@gmail.com	good	t	t	publication	t	f	https://github.com/ropensci/dvn	\N	f	Programmatic interface to the DataVerse Network.	ropensci/dvn	\N
ecoengine	package	Karthik Ram	karthik.ram@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/ecoengine	\N	f	Retrieve 3+ MM records, checklists and photos from Berkeley's ecoengine	ropensci/ecoengine	karthik/ecoengine
ecoretriever	package	Karthik Ram	karthik.ram@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/ecoretriever	\N	f	R client wrapping the Python Ecoretriever software.	ropensci/ecoretriever	\N
elastic	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	infrastructure,databases	t	f	https://github.com/ropensci/elastic	\N	f	An R client for Elasticsearch In early development	ropensci/elastic	sckott/elastic
elasticdsl	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	databases	f	\N	https://github.com/ropensci/elasticdsl	\N	f	Elasticsearch DSL	ropensci/elasticdsl	sckott/elasticdsl
elife	package	Scott Chamberlain	myrmecocystus@gmail.com	deprecated	t	t	literature	f	\N	https://github.com/ropensci/elife	\N	f	R interface to the eLife API	ropensci/elife	\N
EML	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	publication	f	\N	https://github.com/ropensci/EML	\N	f	An R package for reading, writing, integrating and publishing data using the Ecological Metadata Language (EML) format.	ropensci/EML	\N
etseed	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	databases	f	\N	https://github.com/ropensci/etseed	\N	f	R client to interact with the etcd key-value data store	ropensci/etseed	sckott/etseed
finch	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	ecology	f	\N	https://github.com/ropensci/finch	\N	f	Parse and create Darwin Core Simple and Archive Files	ropensci/finch	sckott/finch
floras	package	Scott Chamberlain	myrmecocystus@gmail.com	hiatus	t	t	biology	f	\N	https://github.com/ropensci/floras	\N	f	Web page scraping for eFloras, including the Flora of North America	ropensci/floras	\N
fulltext	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	literature	f	\N	https://github.com/ropensci/fulltext	\N	f	An high level R interface to many different sources for full text (or nearly) scholarly texts, including PLOS, PMC, PeerJ, eLife, arXiv, and many more	ropensci/fulltext	sckott/fulltext
gender	package	Lincoln Mullen	lincoln@lincolnmullen.com	good	t	t	history	t	f	https://github.com/ropensci/gender	\N	f	gender is an R package to encode gender based on names and dates of birth	ropensci/gender	\N
genderdata	package	Lincoln Mullen	lincoln@lincolnmullen.com	good	t	t	history	f	\N	https://github.com/ropensci/genderdata	\N	t	Historical data sets for the study of gender	ropensci/genderdata	\N
geojsonio	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	visualization	t	f	https://github.com/ropensci/geojsonio	\N	f	A package to convert many data formats to geoJSON or Bostock's topoJSON	ropensci/geojsonio	\N
geonames	package	Barry Rowlingson	b.rowlingson@gmail.com	good	t	t	infrastructure	t	f	https://github.com/ropensci/geonames	\N	f	Grab data from the GeoNames geographical database which covers all countries and contains over eight million placenames	ropensci/geonames	\N
ggit	package	Karthik Ram	karthik.ram@gmail.com	good	t	t	reproducibility	f	\N	https://github.com/ropensci/ggit	\N	f	Git visualization tools for git2r	ropensci/ggit	\N
gigadb	package	Karthik Ram	karthik.ram@gmail.com	hiatus	t	t	literature	f	\N	https://github.com/ropensci/gigadb	\N	f	\N	ropensci/gigadb	\N
gistr	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	reproducibility	t	f	https://github.com/ropensci/gistr	\N	f	gistr is a light interface to GitHub's gists for R	ropensci/gistr	sckott/gistr
git2r	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/git2r	\N	f	Git bindings from R	ropensci/git2r	karthik/git2r
gitr	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	reproducibility	t	f	https://github.com/ropensci/gitr	\N	f	git/github from R	ropensci/gitr	\N
hathi	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	literature,history	f	\N	https://github.com/ropensci/hathi	\N	f	An R client for HathiTrust API	ropensci/hathi	\N
historydata	package	Lincoln Mullen	lincoln@lincolnmullen.com	good	t	t	history	t	f	https://github.com/ropensci/historydata	\N	f	An R package with datasets of interest to historians. It is primarily intended for pedagogic purposes in teaching historians how to use R	ropensci/historydata	\N
ICES	package	Karthik Ram	karthik.ram@gmail.com	hiatus	f	t	biology	f	\N	https://github.com/ropensci/ICES	\N	f	R interface to the ICES DATA PORTAL	ropensci/ICES	\N
IEEER	package	Saul Wiggin	saulwiggin@googlemail.com	good	t	t	literature	f	\N	https://github.com/ropensci/IEEER	\N	f	Interface to the IEEE Xplore Gateway	ropensci/IEEER	karthik/IEEER
internetarchive	package	Lincoln Mullen	lincoln@lincolnmullen.com	good	t	t	history,literature	t	f	https://github.com/ropensci/internetarchive	\N	f	An API Client for the Internet Archive	ropensci/internetarchive	\N
jqr	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	utilities	f	\N	https://github.com/ropensci/jqr	\N	f	An R client for jq	ropensci/jqr	\N
lawn	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	maps	t	f	https://github.com/ropensci/lawn	\N	f	R Client for turf.js for Geospatial Analysis	ropensci/lawn	sckott/lawn
mdextract	package	Edmund Hart	edmund.m.hart@gmail.com	hiatus	t	t	biology	f	\N	https://github.com/ropensci/mdextract	\N	f	package to extract metadata from data	ropensci/mdextract	\N
mocker	package	Scott Chamberlain	myrmecocystus@gmail.com	deprecated	t	t	infrastructure	f	\N	https://github.com/ropensci/mocker	\N	f	Cache API calls to the web	ropensci/mocker	\N
musemeta	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	history	f	\N	https://github.com/ropensci/musemeta	\N	f	R Client for Scraping Museum Metadata, including The Metropolitan Museum of Art, the Canadian Science & Technology Museum Corporation, the National Gallery of Art, and the Getty Museum, and more to come	ropensci/musemeta	sckott/musemeta
neotoma	package	Simon Goring	goring@wisc.edu	good	t	t	biology	t	f	https://github.com/ropensci/neotoma	\N	f	Search for sites and download data for use in analytical workflows of paleoecological research using the Neotoma Paleoecological Database	ropensci/neotoma	karthik/neotoma
nodbi	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	databases	f	\N	https://github.com/ropensci/nodbi	\N	f	Simplified document database manipulation and analysis	ropensci/nodbi	\N
opencontext	package	Ben Marwick	bmarwick@uw.edu	good	t	t	archeology	f	\N	https://github.com/ropensci/opencontext	\N	f	API Client for the Open Context Archeological Database	ropensci/opencontext	\N
ots	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	f	\N	https://github.com/ropensci/ots	\N	f	ocean time series datasets	ropensci/ots	sckott/ots
paleobioDB	package	Sara Varela	svarela@paleobiogeography.org	good	t	t	biology	t	f	https://github.com/ropensci/paleobioDB	\N	f	Access data from the Paleobiology Database, a warehouse of paleobiology database	ropensci/paleobioDB	\N
pangaear	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	f	\N	https://github.com/ropensci/pangaear	\N	f	An R client to interact with the Pangaea database.  In early development	ropensci/pangaear	sckott/pangaear
parasiteR	package	Tad Dallas	tdallas@uga.edu	good	t	t	biology,ecology	f	\N	https://github.com/ropensci/parasiteR	\N	f	Parasite occurrence records from the London Natural History Museum's Host-Parasite database	ropensci/parasiteR	\N
pleiades	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	archeology	f	\N	https://github.com/ropensci/pleiades	\N	f	Search for and retrieve metadata and spatial location data on archeological places and names from Pleiades.	ropensci/pleiades	\N
plotly	package	Chris Parmer	chris@plot.ly	good	t	t	visualization	f	\N	https://github.com/ropensci/plotly	\N	f	Programmatic interface to the Plot.ly API -construct plots with ggplot2 and push to Plot.ly for an interactive plot with a few lines of code	ropensci/plotly	\N
prism	package	Edmund Hart	edmund.m.hart@gmail.com	good	f	f	biology	f	\N	https://github.com/ropensci/prism	\N	f	Download data from the Oregon PRISM climate data project http://www.prism.oregonstate.edu/	ropensci/prism	sckott/prism
proj	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	maps	f	\N	https://github.com/ropensci/proj	\N	f	R Client for proj4js	ropensci/proj	sckott/proj
rAltmetric	package	Karthik Ram	karthik.ram@gmail.com	good	t	t	altmetrics	t	f	https://github.com/ropensci/rAltmetric	\N	f	Programmatic interface to article-evel metrics data from Altmetric.com	ropensci/rAltmetric	karthik/raltmetric
rAvis	package	Sara Varela	svarela@paleobiogeography.org	good	t	t	biology	t	f	https://github.com/ropensci/rAvis	\N	f	Download occurrence data for bird species, and associated metadata from ProyectoAvis, a citizen science bird project in Spain.	ropensci/rAvis	\N
rbefdata	package	Claas-Thido Pfaff	claas-thido.pfaff@idiv-biodiversity.de	good	t	t	biology	t	\N	https://github.com/ropensci/rbefdata	rbefdata	t	Connects to instances of BEFdata portals for collaborative data management (e.g BEF-hina and FUNdiv)	ropensci/rbefdata	\N
rbhl	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rbhl	\N	f	Access full text and metadata on scanned and OCR text for biodiversity literature from Biodiversity Heritage Library	ropensci/rbhl	sckott/rbhl
rbison	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rbison	\N	f	R client for USGS's BISON (Biodiversity Information Serving Our Nation).	ropensci/rbison	sckott/rbison
rchie	package	Noam Ross	noam.ross@gmail.com	good	t	t	literature	f	\N	https://github.com/ropensci/rchie	\N	f	A Parser for ArchieML	ropensci/rchie	\N
rcrossref	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rcrossref	\N	f	An R interface to Crossref metadata search API	ropensci/rcrossref	sckott/rcrossref
RCryptsy	package	William Kyle Hamilton	kyle.hamilton@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/RCryptsy	\N	f	Basic Public API for the Crypto-Currency exchange Cryptsy	ropensci/RCryptsy	\N
rDat	package	Karthik Ram	karthik.ram@gmail.com	hiatus	t	t	infrastructure,databases	f	\N	https://github.com/ropensci/rDat	\N	f	\N	ropensci/rDat	\N
rdatacite	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	f	\N	https://github.com/ropensci/rdatacite	\N	f	Wrapper to DataCite metadata	ropensci/rdatacite	\N
rdataone	package	Matthew Jones	jones@nceas.ucsb.edu	hiatus	f	t	biology	f	\N	https://github.com/ropensci/rdataone	\N	t	R package for reading and writing data at DataONE data repositories	ropensci/rdataone	\N
rdopa	package	Joona Lehtomaki	joona.lehtomaki@gmail.com	good	t	t	ecology	f	\N	https://github.com/ropensci/rdopa	\N	f	R client to Joint Research Centre's DOPA REST API	ropensci/rdopa	\N
rdpla	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	history	f	\N	https://github.com/ropensci/rdpla	\N	f	An R client to interact with Digital Public Library of America (DPLA) metadata	ropensci/rdpla	\N
rdryad	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rdryad	\N	f	Push data to and get data from Dryad a repository of data associated with published scholarly papers. Development pending upcoming API changes.	ropensci/rdryad	\N
rebi	package	Najko Jahn	najko.jahn@uni-bielefeld.de	good	t	t	literature	f	\N	https://github.com/ropensci/rebi	\N	t	Access to the European PubMed Central database of papers and metadata	ropensci/rebi	\N
rebird	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rebird	\N	f	Search and acquire occurrence records of bird sightings collated in the eBird database	ropensci/rebird	sckott/rebird
RedisAPI	package	Rich FitzJohn	rich.fitzjohn@gmail.com	good	t	f	databases	f	\N	https://github.com/ropensci/RedisAPI	\N	f	Wrapper For Redis API	ropensci/RedisAPI	\N
redland-bindings	package	Matthew Jones	jones@nceas.ucsb.edu	good	t	t	biology,infrastructure,databases	f	\N	https://github.com/ropensci/redland-bindings	R/redland	t	Redland librdf language bindings	ropensci/redland-bindings	\N
rentrez	package	David Winter	david.winter@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rentrez	\N	f	rentrez provides functions that work with the NCBI eutils to search or download data from various NCBI databases	ropensci/rentrez	sckott/rentrez
reol	package	Barb Banbury	darwinthesun@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/reol	\N	f	R client to the Encyclopedia of Life a website and database of data/images/descriptions of species.	ropensci/reol	\N
rerddap	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology,infrastructure,databases	t	f	https://github.com/ropensci/rerddap	\N	f	R client for working with ERDDAP servers	ropensci/rerddap	sckott/rerddap
reuropeana	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	history	f	\N	https://github.com/ropensci/reuropeana	\N	f	An R client to interact with Europeana metadata	ropensci/reuropeana	\N
rfigshare	package	Carl Boettiger	cboettig at gmail.com	good	t	t	literature,databases	t	f	https://github.com/ropensci/rfigshare	\N	f	Push data, figures, and text to, and search and retrieve data from, Figshare from R	ropensci/rfigshare	\N
rfishbase	package	Carl Boettiger	cboettig@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rfishbase	\N	f	Access any fish data from Fishbase.org, including occurrence records, habitat data, and more	ropensci/rfishbase	\N
rfisheries	package	Karthik Ram	karthik.ram@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rfisheries	\N	f	Search and retrieve data from the OpenFisheries.org, currently providing access to global capture fishing landings from the Food and Agriculture Organization (FAO) of the United Nations	ropensci/rfisheries	karthik/rfisheries
rflybase	package	Scott Chamberlain	myrmecocystus@gmail.com	deprecated	t	t	biology	f	\N	https://github.com/ropensci/rflybase	\N	f	A wrapper to FlyBase data	ropensci/rflybase	\N
rgauges	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	analytics	t	f	https://github.com/ropensci/rgauges	\N	f	Interface to Gaug.es API	ropensci/rgauges	\N
rgbif	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rgbif	\N	f	Access more than 400 million species occurrence records from across the globe in one place, from the Global Biodiversity Information Facility	ropensci/rgbif	sckott/rgbif
rGEM	package	Abaghan Ghahraman	abaghan@gmail.com	good	t	t	economics	f	\N	https://github.com/ropensci/rGEM	\N	f	A wrapper around GEM data	ropensci/rGEM	\N
rglobi	package	Jorrit Poelen	jhpoelen+rglobi@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rglobi	\N	f	R library to access species interaction data of http://globalbioticinteractions.org	ropensci/rglobi	\N
rgpdd	package	Carl Boettiger	cboettig@gmail.com	hiatus	t	t	biology	f	\N	https://github.com/ropensci/rgpdd	\N	f	Interface to the Global Population Dynamics Database, http://www3.imperial.ac.uk/cpb/databases/gpdd	ropensci/rgpdd	\N
rhindawi	package	Scott Chamberlain	myrmecocystus@gmail.com	deprecated	t	t	literature	f	\N	https://github.com/ropensci/rhindawi	\N	f	R interface to the Hindawi Journals metadata and corpus	ropensci/rhindawi	\N
rif	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	neuroscience	f	\N	https://github.com/ropensci/rif	\N	f	Client for Neuroscience Information Framework APIs	ropensci/rif	\N
rImpactStory	package	Karthik Ram	karthik.ram@gmail.com	deprecated	t	t	altmetrics	f	\N	https://github.com/ropensci/rImpactStory	\N	f	Programmatic interface to ImpactStory	ropensci/rImpactStory	\N
rinat	package	Edmund Hart	edmund.m.hart@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rinat	\N	f	A programmatic interface to the API provided by iNaturalist.	ropensci/rinat	sckott/rinat
ritis	package	Scott Chamberlain	myrmecocystus@gmail.com	deprecated	t	t	biology	f	\N	https://github.com/ropensci/ritis	\N	f	Wrapper to the Integrated Taxonomic Information Service (ITIS) API	ropensci/ritis	\N
RMendeley	package	Carl Boettiger	cboettig@gmail.com	good	f	t	literature	t	t	https://github.com/ropensci/RMendeley	\N	f	This package is now deprecated. Programmatic interface to the Mendeley network -push up data to Mendeley as well as search and retrieve data from your private data and public Mendeley records. Updates pending upcoming API changes.	ropensci/RMendeley	\N
rmetadata	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	literature	f	\N	https://github.com/ropensci/rmetadata	\N	f	A high level R interface to many different scholarly metadata sources, which will include Crossref, any OAI-MH provider, Digital Public Library of America, Hathi Trust, Europeana, and more	ropensci/rmetadata	sckott/rmetadata
RMETAR	package	Jan Wijffels	jwijffels@bnosac.be	good	f	t	biology	t	t	https://github.com/ropensci/RMETAR	pkg	t	A METAR decoder for R users, connecting to mdsplib (METAR Decoder Software Package Library - http://mdsplib.sourceforge.net/)	ropensci/RMETAR	\N
rnbn	package	Tom August	tomaug@ceh.ac.uk	good	t	t	biology	t	f	https://github.com/ropensci/rnbn	\N	t	Access to the United Kingdom's National Biodiversity Network data.	ropensci/rnbn	sckott/rnbn
RNeXML	package	Carl Boettiger	cboettig@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/RNeXML	\N	f	Semantically rich NeXML I/O in R -next generation XML for Phylogenetic data.	ropensci/RNeXML	\N
rnoaa	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rnoaa	\N	f	Access climate data from NOAA, including temperature and precipitation, as well as sea ice cover data, and extreme weather events	ropensci/rnoaa	sckott/rnoaa
rnpn	package	Scott Chamberlain	myrmecocystus@gmail.com	hiatus	t	t	biology	f	\N	https://github.com/ropensci/rnpn	\N	f	Access phenological data from US National Phenology Network for plants and animals	ropensci/rnpn	sckott/rnpn
rOBIS	package	Kate Crosby	kate.crosby@gmail.com	hiatus	t	t	biology	f	\N	https://github.com/ropensci/rOBIS	\N	f	R interface to the Ocean Biogeographic Information System	ropensci/rOBIS	\N
rorcid	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	literature	f	\N	https://github.com/ropensci/rorcid	\N	f	A programmatic interface the Orcid.org	ropensci/rorcid	sckott/rorcid
rpensoft	package	Scott Chamberlain	myrmecocystus@gmail.com	deprecated	t	t	literature	f	\N	https://github.com/ropensci/rpensoft	\N	f	Access to Pensoft journals full text and metadata. Not in active development.	ropensci/rpensoft	\N
rplos	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	literature	t	f	https://github.com/ropensci/rplos	\N	f	Connects to the full-ext API of the Public Library of Science (PLOS). They provide a powerful search engine by exposing Solr search endpoints	ropensci/rplos	sckott/rplos
rpmc	package	Scott Chamberlain	myrmecocystus@gmail.com	deprecated	t	t	literature	f	\N	https://github.com/ropensci/rpmc	\N	f	R interface to PubMed Central article metadata.	ropensci/rpmc	\N
rpwt	package	Scott Chamberlain	myrmecocystus@gmail.com	hiatus	t	t	publication,literature	f	\N	https://github.com/ropensci/rpwt	\N	f	Pensoft Writing Tool R client	ropensci/rpwt	\N
rrlite	package	Rich FitzJohn	rich.fitzjohn@gmail.com	good	t	t	databases	f	\N	https://github.com/ropensci/rrlite	\N	f	R Bindings to rlite	ropensci/rrlite	\N
RSelenium	package	John Harrison	johndharrison0@gmail.com	good	t	t	infrastructure	t	f	https://github.com/ropensci/RSelenium	\N	f	An R client for Selenium Remote WebDriver	ropensci/RSelenium	\N
rsnps	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rsnps	\N	f	Search and retrieve Single Nucleotide Polymorphism data from openSNP, a repository of direct-o-ustomer genetic test results	ropensci/rsnps	sckott/rsnps
rspringer	package	Scott Chamberlain	myrmecocystus@gmail.com	deprecated	f	t	literature	f	\N	https://github.com/ropensci/rspringer	\N	f	Full-ext access to Springer journals. Development pending upcoming API changes.	ropensci/rspringer	\N
RStars	package	William Kyle Hamilton	kyle.hamilton@gmail.com	good	t	t	astronomy	t	f	https://github.com/ropensci/RStars	\N	f	Access to the Digital Universe Data set	ropensci/RStars	\N
rvertnet	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rvertnet	\N	f	Access to specimen records for vertebrates across many museums though VertNet	ropensci/rvertnet	sckott/rvertnet
rWBclimate	package	Edmund Hart	edmund.m.hart@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/rWBclimate	\N	f	Programmatic interface to the World Bank climate data used in the World Bank climate knowledge portal.	ropensci/rWBclimate	sckott/rWBclimate
sandbox	package	Scott Chamberlain	myrmecocystus@gmail.com	deprecated	t	t	biology	f	\N	https://github.com/ropensci/sandbox	\N	f	Interface to many altmetrics data services.	ropensci/sandbox	\N
sheetseeR	package	Karthik Ram	karthik.ram@gmail.com	hiatus	t	t	biology	f	\N	https://github.com/ropensci/sheetseeR	\N	f	A quick and easy interface to Google Docs + SheetSee.js	ropensci/sheetseeR	\N
sofa	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	databases	f	\N	https://github.com/ropensci/sofa	\N	f	Easy R Connector to CouchDB	ropensci/sofa	\N
solr	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	infrastructure,databases	t	f	https://github.com/ropensci/solr	\N	f	An R client for Apache Solr	ropensci/solr	sckott/solr
spocc	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/spocc	\N	f	Collect and map species occurrence data from GBIF, iNaturalist, Ecoengine, AntWeb, eBird, and USGS's BISON.	ropensci/spocc	sckott/spocc
taxize	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/taxize	\N	f	Get taxonomic identifiers from many different databases; taxonomic synonyms; taxonomic hierarchies; retrieve common names, and more. Access to a dozen different sources	ropensci/taxize	sckott/taxize
taxizesoap	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	f	\N	https://github.com/ropensci/taxizesoap	\N	f	taxize but for SOAP data sources	ropensci/taxizesoap	\N
testdat	package	Karthik Ram	karthik.ram@gmail.com	good	t	t	infrastructure	f	\N	https://github.com/ropensci/testdat	\N	f	A test suite to ensure that tabular data are correctly formatted	ropensci/testdat	\N
traits	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	biology	f	\N	https://github.com/ropensci/traits	\N	f	A high level R package to acquire species trait data from many sources, including Polytraits, BETTYdb, NCBI, Phylomatic, and more.	ropensci/traits	\N
treeBASE	package	Carl Boettiger	cboettig@gmail.com	good	t	t	biology	t	f	https://github.com/ropensci/treeBASE	\N	t	Programmatic interface to Treebase -a database of phylogenetic trees	ropensci/treeBASE	sckott/treeBASE
ucipp	package	Luis Paulo F. Garcia	lpfgarcia@gmail.com	hiatus	t	t	computer science	f	\N	https://github.com/ropensci/ucipp	\N	f	\N	ropensci/ucipp	\N
USAboundaries	package	Lincoln Mullen	lincoln@lincolnmullen.com	good	t	t	history	t	f	https://github.com/ropensci/USAboundaries	\N	f	Historical boundaries of the United States. Map the United States (or the colonies that became the United States) on any date from 1629 to 2000. Contains both county and state/territory level polygons.	ropensci/USAboundaries	\N
webchem	package	Eduard Szoecs	eduardszoecs@gmail.com	good	t	t	chemistry	t	f	https://github.com/ropensci/webchem	\N	f	Chemical Information from the Web	ropensci/webchem	EDiLD/webchem
webmockr	package	Scott Chamberlain	myrmecocystus@gmail.com	hiatus	f	t	infrastructure	f	\N	https://github.com/ropensci/webmockr	\N	f	\N	ropensci/webmockr	\N
wellknown	package	Scott Chamberlain	myrmecocystus@gmail.com	good	t	t	maps	f	\N	https://github.com/ropensci/wellknown	\N	f	Convert Between WKT to GeoJSON	ropensci/wellknown	sckott/wellknown
zenodo	package	Karthik Ram	karthik.ram@gmail.com	good	t	t	literature	f	\N	https://github.com/ropensci/zenodo	\N	f	Deposit data (or any research object) into Zenodo	ropensci/zenodo	\N
\.


--
-- Data for Name: travis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY travis (name, repository_id, commit_id, number, pull_request, pull_request_number, pull_request_title, state, started_at, finished_at, duration, job_ids, language, os, inserted) FROM stdin;
\.


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM sacmac;
GRANT ALL ON SCHEMA public TO sacmac;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

