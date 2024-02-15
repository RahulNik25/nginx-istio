#!/bin/bash

uri=$1
uris=()

# Generate 100 URIs
for ((i=1; i<=100; i++)); do
    uris+=("$uri")
done

# Define a function to perform the web request
perform_request() {
    uri=$1
    curl -s "$uri" > /dev/null
}

# Iterate over the URIs and perform requests in parallel
for uri in "${uris[@]}"; do
    perform_request "$uri" &
done
