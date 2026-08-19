<!-- foundation:identity -->
# probe-fb75d3

A one-page guestbook where visitors type a short message and see the wall of messages, newest first.

- Site: https://probe-fb75d3.api.holode.xyz
- Support: support@probe-fb75d3.api.holode.xyz
<!-- /foundation:identity -->

## What this is

A one-page guestbook where visitors type a short message and see the wall of messages, newest first.

## Main features

- **Post a message** — Visitor types a short message (name + text) on the single page and submits it
- **View the wall** — The page shows all messages, newest first, with no login required

## Core entities

- Message

## Run locally

```bash
bundle install
bin/rails db:prepare
bin/dev
```

Requires Ruby, PostgreSQL, and the usual Rails toolchain. See `bin/setup` if present.

## Demo

A handful of sample guestbook entries (a few names and short notes) so the wall looks alive on first load.

## Deploy notes

Production `config.hosts` is derived from `domain` in `config/foundation.yml`. Keep that value aligned with the real host or every request will 403.
