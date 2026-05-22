#!/bin/bash

# Configuration
source .env
echo $API_TOKEN
echo $ZONE_NAME
echo $RECORD_NAME
echo $TTL

# 1. Get current public IP
if [[ -n "$1" ]]; then
  CURRENT_IP=$1
else
  CURRENT_IP=$(curl -s https://api.ipify.org/)
fi
echo "Current IP: ${CURRENT_IP}"
# Can't bother carrying on with no IP can we?
if [[ -z "$CURRENT_IP" ]]; then
  exit 1
fi

# 2. Get Zone ID
ZONE_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$ZONE_NAME" \
  -H "Authorization: Bearer $API_TOKEN" | jq -r '.result[0].id')
echo "Zone ID: ${ZONE_ID}"

# 3. Get DNS Record ID
RECORD_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records?name=$RECORD_NAME&type=A" \
  -H "X-Auth-Key: $API_KEY" \
  -H "X-Auth-Email: $API_EMAIL" \
  -H "Authorization: Bearer $API_TOKEN" | jq -r '.result[0].id')
echo "Record ID: ${RECORD_ID}"

# 4. Get current IP in Cloudflare
CF_IP=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
  -H "X-Auth-Key: $API_KEY" \
  -H "X-Auth-Email: $API_EMAIL" \
  -H "Authorization: Bearer $API_TOKEN" | jq -r '.result.content')
echo "CF IP: ${CF_IP}"

# 5. Update if different
if [ "$CURRENT_IP" != "$CF_IP" ]; then
  RESULT=$(curl -s -X PATCH "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
    -H "X-Auth-Key: $API_KEY" \
    -H "X-Auth-Email: $API_EMAIL" \
    -H "Authorization: Bearer $API_TOKEN" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"A\",\"name\":\"$RECORD_NAME\",\"content\":\"$CURRENT_IP\",\"ttl\":$TTL}" | jq -r '.success')

  echo "Result success: ${RESULT}"
  echo "Updated DNS record to $CURRENT_IP"
else
  echo "IP is already up to date: $CURRENT_IP"
fi
