#!/bin/bash
mix deps.get --only prod
mix compile
mix assets.deploy
mix phx.server
