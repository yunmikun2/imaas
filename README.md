# IMaaS example

Using imagemagick as a service with arc_ecto in Elixir/Phoenix.

## Running

You most possibly need to replace `onlyhome` with `localhost` (or with
the host you are gonna deploy it to) in `.env`. Also, you are gonna
need docker-compose. Run 'docker-compose up --build -d' and then you
can go to `http://localhost:18081/posts` and play a little.

## Architecture

  - `imagemagick` service provides imagemagick as a service.

  - `gocaas` provides an executable client for IMaaS -- it requires
    `CONVERTER_URL` env var to imagemagick service. You don't realy
    need it if you use something adequate (not arc).

  - `imaas` is a siple Elixir/Phoenix application that stores "posts" with
    images.

  - `imaas_client` is a frontend for `imaas` (implemented as another Elixir/Phoenix
    application, yeah).

  - `caas_client` is another executable client for IMaaS implemented
    as escript. It didn't work with arc though because of some
    troubles with `System.cmd/2` running an escript in OTP-release
    mode.
