rOpenSci API
============

rOpenSci API

## API status

Repo at <https://github.com/ropensci/roapistatus> and page at <https://ropensci.github.io/roapistatus/>

## Authentication

All or nearly all routes that read data do not require authentication.

Some routes require authentication. Using basic auth now. Required username and password stored in `ROAPI_USER` and `ROAPI_PWD` env vars. Client side username:pwd passed in via headers, like `user:pwd`.

## Quickstart

Clone repo

```
git clone git@github.com:ropensci/roapi.git
cd roapi
```

Bundle up

```
bundle install
```

Start server

```
unicorn
```
