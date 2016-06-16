# Converted with pg2mysql-1.9
# Converted on Wed, 11 Nov 2015 21:14:26 -0500
# Lightbox Technologies Inc. http://www.lightbox.ca

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone="+00:00";

CREATE TABLE appveyor (
    projectid int(11),
    accountid int(11),
    accountname varchar(50),
    name varchar(50),
    repositoryname varchar(50),
    repositorybranch varchar(50),
    created timestamp,
    updated timestamp,
    buildid int(11),
    buildnumber int(11),
    version varchar(50),
    message text,
    branch varchar(50),
    commitid varchar(100),
    committername varchar(100),
    `status` varchar(50),
    finished timestamp,
    inserted timestamp
) TYPE=MyISAM;

CREATE TABLE cran (
    package text,
    title text,
    description text,
    version text,
    license text,
    authors_r text,
    url text,
    bugreports text,
    lazydata text,
    vignettebuilder text,
    imports text,
    suggests text,
    packaged text,
    author text,
    maintainer text,
    needscompilation text,
    repository text,
    crandb_file_date timestamp,
    releases text,
    date_publication timestamp,
    `type` text,
    depends text,
    pkg_collate text,
    systemrequirements text,
    enhances text,
    lazyload text,
    copyright text,
    biarch text,
    additional_repositories text,
    encoding text,
    lazydatacompression text,
    inserted timestamp
) TYPE=MyISAM;

CREATE TABLE cranlogs (
    name varchar(50) NOT NULL,
    cran_downloads int(11),
    collected timestamp,
    inserted timestamp
) TYPE=MyISAM;

CREATE TABLE github (
    id int(11),
    name varchar(150),
    created_at timestamp,
    updated_at timestamp,
    size int(11),
    language varchar(20),
    forks smallint,
    open_issues smallint,
    watchers smallint,
    default_branch varchar(50),
    inserted timestamp
) TYPE=MyISAM;

CREATE TABLE repos (
    name varchar(50) NOT NULL,
    `type` varchar(50) NOT NULL,
    maintainer varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    `status` varchar(50) NOT NULL,
    installable bool NOT NULL,
    build_vignettes bool NOT NULL,
    category varchar(50) NOT NULL,
    on_cran bool NOT NULL,
    cran_archived bool,
    url varchar(50) NOT NULL,
    root varchar(50),
    fork bool NOT NULL,
    description text,
    route_github_travis varchar(50),
    route_appveyor varchar(50)
) TYPE=MyISAM;

CREATE TABLE travis (
    name varchar(50),
    repository_id int(11),
    commit_id int(11),
    number varchar(50),
    pull_request bool,
    pull_request_number varchar(50),
    pull_request_title text,
    state varchar(50),
    started_at timestamp,
    finished_at timestamp,
    duration smallint,
    job_ids varchar(50),
    language varchar(50),
    os varchar(50),
    inserted timestamp
) TYPE=MyISAM;

