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


  // deploy gen one function
  gcloud functions deploy scoreParser --runtime python310 --trigger-"bucket=gs://gedtsolo.appspot.com" --allow-unauthenticated
  
  gcloud functions deploy signUp \
  --runtime python310 \
  --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/messages/{pushId}"
  

  gcloud functions deploy signUp \
  --runtime python310 \
  --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/messages/{pushId}"

  gcloud functions deploy signUp \
  --runtime python310 \
  --trigger-event "providers/cloud.firestore/eventTypes/document.write" \
  --trigger-resource "projects/gedtsolo/databases/(default)/documents/scores/{pushId}" \
  --set-env-vars username=rhunte@theguyanatrust.org,password=Subzero@winter79,token=MGFmMDY0ZTdmNDRhMTllNWNhM2ZkNmJhYjFjMTRiYjg6MzE5YmMzYmI5ZWVlOWNjZjA1NDYxMGViNzlkOTM1NGY=


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

 https://github.com/sekR4/FastAPI-on-Google-Cloud-Run

 

 