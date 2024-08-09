gcloud functions deploy python-finalize-function \
--gen1 \
--runtime=python310 \
--source=. \
--entry-point=scoreParser \
--trigger-event-filters="type=google.cloud.storage.object.v1.finalized" \
--trigger-event-filters="bucket=gs://gedtsolo.appspot.com"


PROJECT_ID=$(gcloud config get-value project)
PROJECT_NUMBER=$(gcloud projects list --filter="project_id:$PROJECT_ID" --format='value(project_number)')

SERVICE_ACCOUNT=$(gsutil kms serviceaccount -p $PROJECT_NUMBER)

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member serviceAccount:$SERVICE_ACCOUNT \
  --role roles/pubsub.publisher


  gsutil mb -l us-central1 gs://gedtsolo.appspot.com/scores



  gcloud functions deploy scoreParser \
  --runtime python310 \
  --trigger-"bucket=gs://gedtsolo.appspot.com" \
  --allow-unauthenticated \
  --docker-registry=artifact-registry

  
  
  gcloud functions deploy signUp \
  --runtime python310 \
  --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/messages/{pushId}"
  

  # gcloud functions deploy signUp \
  # --runtime python310 \
  # --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  # --trigger-resource "projects/gedtsolo/databases/(default)/documents/messages/{pushId}"

  #deploy signup function
  gcloud functions deploy signUp \
  --runtime python310 \
  --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/loanTest/{pushId}" \
  --docker-registry=artifact-registry \
  --set-env-vars username=rhunte@theguyanatrust.org,password=Subzero@winter79,token=MDY3NDNiMTJiNzBiM2U4MWFhMzhhMjk2NWEzYzlhYjg6MzgyMDA1ZjU0ODMzNWJmZjVkYmE5YWUyZDg4MjNhOWI=


  gcloud functions deploy forward \
  --gen2 \
  --runtime python310 \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/invoices/{pushId}" \
  --allow-unauthenticated \
  --set-env-vars username=rhunte@theguyanatrust.org,password=Subzero@winter79,token=MDJlM2EzMDYwZGMzMDMwOTJlZDQ1OTY3ZjdmMzI0MWM6MDJhMjkxNTIyYTg2YmU5ZTQ5NjkxZDQyNjEzYmRjYmI=

gcloud functions deploy forward \
--gen2 \
--runtime=python310 \
--source=. \
--entry-point=forward \
--trigger-event-filters=type=google.cloud.firestore.document.v1.written \
--trigger-event-filters=database='(default)' \
--trigger-event-filters-path-pattern=document='invoices/{invoice_id}' \
--allow-unauthenticated \
--set-env-vars username=rhunte@theguyanatrust.org,password=Subzero@winter79,token=MDY3NDNiMTJiNzBiM2U4MWFhMzhhMjk2NWEzYzlhYjg6MzgyMDA1ZjU0ODMzNWJmZjVkYmE5YWUyZDg4MjNhOWI=



gcloud functions deploy forward\
  --runtime python310 \
  --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/invoices/{invoiceID}" \
  --set-env-vars username=rhunte@theguyanatrust.org,password=Subzero@winter79,token=MDJlM2EzMDYwZGMzMDMwOTJlZDQ1OTY3ZjdmMzI0MWM6MDJhMjkxNTIyYTg2YmU5ZTQ5NjkxZDQyNjEzYmRjYmI= \
  --docker-registry=artifact-registry

gcloud functions deploy nda\
  --runtime python310 \
  --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/nda/{ndaID}" \
  --set-env-vars username=rhunte@theguyanatrust.org,password=Subzero@winter79,token=MmQwMTcxMTBiOWUzYmEwMDBmNjk2MjM1MTEzMDkwZjc6NTZkNTFhZTE4MTY1YWNlZDY0NWRhMjJmN2Y1N2FjOTA=,authToken="Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnZWR0IiwiaWF0IjoxNzAzNjA0MDU4LCJleHAiOjE3OTgyMTIwNTgsImF1ZCI6ImludGVybmFsIiwic3ViIjoiZm9yIG15IGV5ZXMgb25seSIsIkdpdmVuTmFtZSI6IlJheW9uIiwiU3VybmFtZSI6Ikh1bnRlIiwiRW1haWwiOiJyaHVudGVAdGhlZ3V5YW5hdHJ1c3Qub3JnIiwiUm9sZSI6WyJEZXZlbG9wZXIiLCJEZXZlbG9wZXIgQWRtaW4iXX0.T0mBjpeWNL_l1rCGrVe0-V_ko1x486Ze75S0kDfB2hM"


  gcloud functions deploy awardee\
  --runtime python310 \
  --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/awardees/{awardeeID}" \
  --set-env-vars username=rhunte@theguyanatrust.org,password=Subzero@winter79,token=MDJlM2EzMDYwZGMzMDMwOTJlZDQ1OTY3ZjdmMzI0MWM6MDJhMjkxNTIyYTg2YmU5ZTQ5NjkxZDQyNjEzYmRjYmI=


gcloud functions deploy payments\
  --runtime python310 \
  --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/payments/{paymentData}" \
  --docker-registry=artifact-registry \
  --set-env-vars authToken="Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnZWR0IiwiaWF0IjoxNzAzNjA0MDU4LCJleHAiOjE3OTgyMTIwNTgsImF1ZCI6ImludGVybmFsIiwic3ViIjoiZm9yIG15IGV5ZXMgb25seSIsIkdpdmVuTmFtZSI6IlJheW9uIiwiU3VybmFtZSI6Ikh1bnRlIiwiRW1haWwiOiJyaHVudGVAdGhlZ3V5YW5hdHJ1c3Qub3JnIiwiUm9sZSI6WyJEZXZlbG9wZXIiLCJEZXZlbG9wZXIgQWRtaW4iXX0.T0mBjpeWNL_l1rCGrVe0-V_ko1x486Ze75S0kDfB2hM"


gcloud functions deploy bulkMessages\
  --runtime python310 \
  --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/bulkMessages/{messageData}" \
  --docker-registry=artifact-registry \
   --set-env-vars authToken="Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnZWR0IiwiaWF0IjoxNzAzNjA0MDU4LCJleHAiOjE3OTgyMTIwNTgsImF1ZCI6ImludGVybmFsIiwic3ViIjoiZm9yIG15IGV5ZXMgb25seSIsIkdpdmVuTmFtZSI6IlJheW9uIiwiU3VybmFtZSI6Ikh1bnRlIiwiRW1haWwiOiJyaHVudGVAdGhlZ3V5YW5hdHJ1c3Qub3JnIiwiUm9sZSI6WyJEZXZlbG9wZXIiLCJEZXZlbG9wZXIgQWRtaW4iXX0.T0mBjpeWNL_l1rCGrVe0-V_ko1x486Ze75S0kDfB2hM"



#cloud function version 2
gcloud functions deploy latePayment \
--gen2 \
--runtime=python310 \
--source=. \
--entry-point=latePayment \
--allow-unauthenticated \
--timeout=3600 \
--trigger-http \
--set-env-vars authToken="Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnZWR0IiwiaWF0IjoxNzAzNjA0MDU4LCJleHAiOjE3OTgyMTIwNTgsImF1ZCI6ImludGVybmFsIiwic3ViIjoiZm9yIG15IGV5ZXMgb25seSIsIkdpdmVuTmFtZSI6IlJheW9uIiwiU3VybmFtZSI6Ikh1bnRlIiwiRW1haWwiOiJyaHVudGVAdGhlZ3V5YW5hdHJ1c3Qub3JnIiwiUm9sZSI6WyJEZXZlbG9wZXIiLCJEZXZlbG9wZXIgQWRtaW4iXX0.T0mBjpeWNL_l1rCGrVe0-V_ko1x486Ze75S0kDfB2hM"



#cloud function version 2
gcloud functions deploy mmgHeadless \
--gen2 \
--runtime=python310 \
--source=. \
--entry-point=mmg \
--allow-unauthenticated \
--timeout=3600 \
--trigger-http \
--memory=2024MB \
--set-env-vars authToken="Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnZWR0IiwiaWF0IjoxNzAzNjA0MDU4LCJleHAiOjE3OTgyMTIwNTgsImF1ZCI6ImludGVybmFsIiwic3ViIjoiZm9yIG15IGV5ZXMgb25seSIsIkdpdmVuTmFtZSI6IlJheW9uIiwiU3VybmFtZSI6Ikh1bnRlIiwiRW1haWwiOiJyaHVudGVAdGhlZ3V5YW5hdHJ1c3Qub3JnIiwiUm9sZSI6WyJEZXZlbG9wZXIiLCJEZXZlbG9wZXIgQWRtaW4iXX0.T0mBjpeWNL_l1rCGrVe0-V_ko1x486Ze75S0kDfB2hM"




gcloud functions deploy addPayments \
--gen2 \
--trigger-event-filters="type=google.cloud.storage.object.v1.finalized" \
--trigger-event-filters="bucket=gedtsolo.appspot.com" \
--allow-unauthenticated \
--trigger-location=us \
--runtime=python310 \
--source=. \
--entry-point=addPayments \
--timeout=300 \
--memory=256MB


gcloud functions deploy process_payment_request_file \
--gen2 \
--trigger-event-filters="type=google.cloud.storage.object.v1.finalized" \
--trigger-event-filters="bucket=gedtsolo.appspot.com" \
--allow-unauthenticated \
--trigger-location=us \
--runtime=python310 \
--source=. \
--entry-point=process_payment_request_file \
--timeout=300 \
--memory=512MB

# Deploy the Cloud Function Gen 2
gcloud builds submit --tag gcr.io/gedtsolo/firestore-to-bigquery

gcloud run deploy export-firestore-to-bigquery \
  --image gcr.io/gedtsolo/firestore-to-bigquery \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --set-env-vars GOOGLE_APPLICATION_CREDENTIALS=./gedtsolo-firebase-adminsdk-6g2o7-f3acc83579.json

  curl -X POST https://export-firestore-to-bigquery-czi25bfe7a-uc.a.run.app \
  -H "Content-Type: application/json" \
  -d '{"collection_name": "nda", "bigquery_path": "gedtsolo.fire_dump.nda"}'

gcloud functions deploy score_parser \
--gen2 \
--runtime=python310 \
--entry-point=score_parser \
--trigger-event-filters="type=google.cloud.storage.object.v1.finalized" \
--trigger-event-filters="bucket=gedtsolo.appspot.com\scores" \
--source=. \
--allow-unauthenticated \
--trigger-location=us \
--timeout=300 \
--memory=256MB



bck-i-search: deploy_


  curl localhost:5003 \
  -X POST \
  -H "Content-Type: application/json" \
  -H "ce-id: 123451234512345" \
  -H "ce-specversion: 1.0" \
  -H "ce-time: 2020-01-02T12:34:56.789Z" \
  -H "ce-type: google.cloud.pubsub.topic.v1.messagePublished" \
  -H "ce-source: //pubsub.googleapis.com/projects/MY-PROJECT/topics/MY-TOPIC" \
  -d '{
        "message": {
          "name": "this tile",
          "data": "d29ybGQ=",
          "attributes": {
             "attr1":"attr1-value"
          }
        },
        "subscription": "projects/MY-PROJECT/subscriptions/MY-SUB"
      }'
    
    # run locally 
    functions-framework --target=scoreParser --signature-type=event --debug --port=5003
    functions-framework --target=signUp --signature-type=event --debug --port=5003 
    functions-framework --target=nda --signature-type=event --debug --port=5003 
    functions-framework --target=awardee --signature-type=event --debug --port=5003 
    functions-framework --target=forward --signature-type=event --debug --port=5003 
    functions-framework --target=payments --signature-type=event --debug --port=5003 
    functions-framework --target=bulkMessages --signature-type=event --debug --port=5003 
    functions-framework --target=latePayment --signature-type=event --debug --port=5003
    functions-framework --target=headless --signature-type=event --debug --port=5003
    functions-framework --target=addPayments --signature-type=event --debug --port=5003

    functions-framework --target=process_payment_request_file --signature-type=event --debug --port=5003

    functions-framework --target=export_firestore_to_bigquery --signature-type=event --debug --port=5003


     curl localhost:5003 \
  -X POST \
  -H "Content-Type: application/json" \
  -H "ce-id: 123451234512345" \
  -H "ce-specversion: 1.0" \
  -H "ce-time: 2020-01-02T12:34:56.789Z" \
  -H "ce-type: google.cloud.pubsub.topic.v1.messagePublished" \
  -H "ce-source: //pubsub.googleapis.com/projects/MY-PROJECT/topics/MY-TOPIC" \
  -d '{
        "message": {
            "bucket": "gedtsolo.appspot.com",
  "contentDisposition": "inline; filename*=utf-8''1677266488328.csv",
  "contentType": "text/csv",
  "name": "scores/1677266488328.csv",
  "size": "2108"
        },
        "subscription": "projects/MY-PROJECT/subscriptions/MY-SUB"
      }'


curl -X POST \
https://api-eval.signnow.com/document \
-H 'Authorization: Bearer {{MWNlOWIyNjQwNzhiODI1NDNkOTY5Y2RkNDRjMDI2MGY6YWY2ZjM4MWU5NzU0ZjI5YjFjNDY3NGM2ODFmNGQ1MjA}}' \
-H 'content-type: multipart/form-data' \
-F file=@GEDT_Master.pdf

curl --request POST \
  --url https://api-eval.signnow.com/oauth2/token \
  --header 'Authorization: Basic {{Y2ZjMjAwY2NiZTFhYzZkOWU2NDMzYTdkOWVkZDBkNzM6MGRhN2Q4ZWRhY2I5OTIxMzhjM2M5MWI2ZDUwNjE4ZTE=}}' \
  --header 'Content-Type: multipart/form-data' \
  --header 'Content-type: ' \
  --form username= \
  --form password= \
  --form grant_type=password \
  --form scope= \
  --form refresh_token= \
  --form code= \
  --form expiration_time=



curl -X POST \
https://api-eval.signnow.com/document/{{1234}}/invite \
-H 'Authorization: Bearer {{Y2ZjMjAwY2NiZTFhYzZkOWU2NDMzYTdkOWVkZDBkNzM6MGRhN2Q4ZWRhY2I5OTIxMzhjM2M5MWI2ZDUwNjE4ZTE=}}' \
-H 'Content-Type: application/json' \
-d '{
"from":"sender@signnow.com",
"to":"signer.email@signnow.com"
}'


# container build / local run
 docker build --tag helloworld:python .
 docker run --rm -p 9090:8080 -e PORT=8080 helloworld:python
 docker run --rm -p 3001:3001 -e PORT=3001 helloworld:python

 # cloud run deploy
 gcloud run deploy
 gcloud run deploy --source .
 gcloud config set run/region us-central1

 https://github.com/sekR4/FastAPI-on-Google-Cloud-code tempOriginCriterionRun

 

 # cloud run local run
 uvicorn main:app --host 0.0.0.0 --port 8000  --workers 1 --reload
 


export SO_KIT_GL_REGISTRY_URL="registry.gitlab.com"
export SO_KIT_GL_REGISTRY_TOKEN_NAME="ask-for-token-name"
export SO_KIT_GL_REGISTRY_TOKEN_VALUE="ask-for-token-value"

docker login $SO_KIT_GL_REGISTRY_URL \
    -u $SO_KIT_GL_REGISTRY_TOKEN_NAME \
    --password-stdin<<<$SO_KIT_GL_REGISTRY_TOKEN_VALUE

docker run \
    -h 127.0.0.1 \
    -p 7170:7170 \
    --rm --name tradesphere-ms \
    registry.gitlab.com/strategyobject/sokit/sokit-registry/tradesphere/tradesphere-ms:1.0.12

docker run \
    -h 127.0.0.1 \
    -p 7170:7170 \
    --rm --name tradesphere-ms \
    registry.gitlab.com/strategyobject/sokit/sokit-registry/tradesphere/tradesphere-ms:1.0.10

// get task names
jq '[.[] | select(.["Deliverable name"]=="UPLOAD UPDATED BUDGET FOR RECOVERABLE GRANT FUNDS") | {TaskName: .["Task name"], DeliverableName: .["Deliverable name"]}] | unique_by(.TaskName)' raw_dump.json
jq '[.[] | select(.["Deliverable name"] | test("^INTERNATIONAL BANK TRANSFER PAYMENT REQUEST.*")) | {TaskName: .["Task name"], DeliverableName: .["Deliverable name"]}] | unique_by(.TaskName)' raw_dump.json
