FROM elixir:1.12.3
WORKDIR /Back

COPY . .

RUN mix local.hex --force
RUN mix deps.get
# Install the Phoenix framework itself
RUN mix deps.update mime
RUN mix deps.compile mime
RUN mix local.rebar --force
RUN mix archive.install hex phx_new

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

CMD /wait && mix ecto.setup && mix phx.server