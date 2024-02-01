#!/bin/bash

# Initial setup
mix deps.get --only prod
mix compile

# Compile assets
mix assets.deploy

# Custom tasks (like DB migrations)
mix ecto.migrate

# Finally run the server
elixir --erl "-detached" -S mix phx.server
