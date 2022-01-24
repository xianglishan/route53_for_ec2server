#!bin/bash

DOMAIN_NAME="**************.com"
SUB_NAME="*****"
IP_ADDRESS=`curl -s inet-ip.info`
HOSTED_ZONE_ID="**************"

BATCH_JSON='{
        "Comment":"UPSERT arecort",
        "Changes":[{
                "Action":"UPSERT",
                "ResourceRecordSet":{
                        "Name":"'${SUB_NAME}'.'${DOMAIN_NAME}'",
                        "Type":"A",
                        "TTL":300,
                        "ResourceRecords":[{"Value":"'${IP_ADDRESS}'"}]
                }
        }]
}'

aws route53 change-resource-record-sets --hosted-zone-id "${HOSTED_ZONE_ID}" --change-batch "${BATCH_JSON}"
