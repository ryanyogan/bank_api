FROM elixir:1.9.1-alpine AS build

ENV MIX_ENV=prod

WORKDIR /usr/local/bank_api

RUN apk update \
  && apk upgrade --no-cache \
  && apk add --no-cache \
  nodejs-npm \
  alpine-sdk \
  openssl-dev \
  && mix local.rebar --force \
  && mix local.hex --force

COPY . .

RUN mix do deps.get, deps.compile, compile

RUN mkdir -p /opt/release \
  && mix release \
  && mv _build/${MIX_ENV}/rel/bank_api /opt/release

FROM erlang:22-alpine AS runtime

RUN apk update \
  && apk upgrade --no-cache \
  && apk add --no-cache gcc

WORKDIR /usr/local/bank_api

COPY --from=build /opt/release/bank_api .

CMD ["bin/bank_api", "start"]

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD nc -vz -w 2 localhost 4000 || exit 1

# docker run -it -d --rm \
# -e READSTORE_URL=ecto://postgres:postgres@readstore/bank_api_readstore_prod \
# -e EVENTSTORE_URL=ecto://postgres:postgres@eventstore/bank_api_eventstore_prod \
# -e RELEASE_COOKIE=foo \
# -e SECRET_KEY_BASE=foo \
# -e SERVICE_NAME=bank_api \
# -e APP_HOST=localhost \
# -e PORT=4000 \
# --network bank-api-net \
# --publish 4000:4000 \
# bank_api:latest

