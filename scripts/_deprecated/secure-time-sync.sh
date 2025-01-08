#!/bin/bash

# Securely syncs the time to the correct UTC time.
#
# This script connects to a variety of websites and extracts the current UTC time
# from the http headers. The website is randomly selected from a pool of 
# choosen websites.
#
# Debugging information can be gotten by starting the script with the DEBUG_TS=1 environment variable.

# Exits if the script isn't running as root
if [[ "$(id -u)" -ne 0 ]]; then
  echo "ERROR: This program need to be run as root."
  exit 1
fi

# Select a random website out of the pool.
select_pool() {
  # Tor website.
  POOL[1]="https://www.torproject.org"

  # Tails website.
  POOL[2]="https://tails.boum.org"

  # PrivacyGuides website.
  POOL[3]="https://privacyguides.org"

  # DuckDuckGo.
  POOL[4]="https://duckduckgo.com"

  # EFF.
  POOL[5]="https://www.eff.org"

  # The last one doesn't get selected. Without the following line, POOL[5] would never be selected.
  POOL[6]=""
  
  rand=$((RANDOM % ${#POOL[@]}))
  SELECTED_POOL="${POOL[$rand]}"

  # If nothing was selected, run select_pool again.
  if [ "${SELECTED_POOL}" = "" ]; then
    select_pool
  fi
}

select_pool

# Protects against https downgrade attacks.
SECURE_CURL="curl -SI --tlsv1.2 --proto =https"

if ! ${SECURE_CURL} -s "${SELECTED_POOL}" &>/dev/null; then
  echo "ERROR: Could not connect to the website."
  exit 1
fi

# Extract the current time from the http header when connecting to one of the websites in the pool.
NEW_TIME=$(${SECURE_CURL} "${SELECTED_POOL}" 2>&1 | grep -i "Date" | sed -e 's/Date: //' | sed -e 's/date: //')

# Output the extracted time and selected pool for debugging.
if [ "${DEBUG_TS}" = "1" ]; then
  echo "${SELECTED_POOL}"
  echo "${NEW_TIME}"
fi

# Set the time to the value we just extracted.
date -s "${NEW_TIME}"
