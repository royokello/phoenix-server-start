#!/bin/bash

# Initial setup
mix deps.get --only prod
mix compile

# Load environment variables from secrets.csv
while IFS=, read -r key value
do
  export "$key=$value"
done < secrets.csv

# Compile assets
mix assets.deploy

# Custom tasks (like DB migrations)
mix ecto.migrate

# Finally run the server
elixir --erl "-detached" -S mix phx.server
