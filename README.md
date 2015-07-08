rOpenSci API
============

rOpenSci API...

## Authentication

Some routes require authentication. Using basic auth now. Required username and password stored in `ROAPI_USER` and `ROAPI_PWD` env vars. Client side username:pwd passed in via headers, like `user:pwd`.

## Quickstart

Clone repo

```
git clone git@github.com:ropensci/roapi.git
cd roapi
```

Start server

```
thin start
```

## Routes

### Heartbeat

```
http 'localhost:3000/heartbeat'
```

```
{
    "routes": [
        "/docs (GET)",
        "/heartbeat (GET)",
        "/repos (GET)",
        "/repos/:repo_name: (GET) (POST, PUT, DELETE [auth])"
    ]
}
```
