#!/usr/bin/bash


# 1. Define Variables

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <organization>/<workspace> <TFE Address>"
  exit 0
fi

ORG_NAME="$(cut -d'/' -f1 <<<"$1")"
WORKSPACE_NAME="$(cut -d'/' -f2 <<<"$1")"
TFE_SERVER="$2"

# 2. Look Up the Workspace ID

WORKSPACE_ID=($(curl -Ss \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  https://$TFE_SERVER/api/v2/organizations/$ORG_NAME/workspaces/$WORKSPACE_NAME \
  | jq -r '.data.id'))

# 3. Look Up the Run ID

RUN_ID=($(curl -Ss \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  https://$TFE_SERVER/api/v2/workspaces/$WORKSPACE_ID/runs \
  | jq -r '.data[0].id' ))



# 4. Get Initian Run Status

RUN_STATUS=($(curl -Ss \
  --header "Authorization: Bearer $TOKEN" \
  https://$TFE_SERVER/api/v2/runs/$RUN_ID \
  | jq -r '.data.attributes.status' ))

echo "Terraform Enterprise deployment log: https://$TFE_SERVER/app/$ORG_NAME/workspaces/$WORKSPACE_NAME/runs/$RUN_ID"
echo "Run Status is: $RUN_STATUS"

# 5. Get Run status loop until deployment completed

while [[ $RUN_STATUS != "applied" && $RUN_STATUS != "canceled" && $RUN_STATUS != "errored"  && $RUN_STATUS != "discarded" ]]; do
	echo "Run Status is: $RUN_STATUS"
	sleep 5
        RUN_STATUS=($(curl -Ss \
	  --header "Authorization: Bearer $TOKEN" \
	  https://$TFE_SERVER/api/v2/runs/$RUN_ID \
	  | jq -r '.data.attributes.status' ))
done

echo "Final Deployment Status is: $RUN_STATUS"
if [ $RUN_STATUS != "applied" ]
then
	exit 2
fi

