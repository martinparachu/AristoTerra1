##### enable the Google Cloud APIs
gcloud services enable compute.googleapis.com
gcloud services enable servicenetworking.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable container.googleapis.com

##### create a service account 
gcloud iam service-accounts create terraform-milan-svc-acc

##### check projects & srv account already created
gcloud projects list
gcloud iam service-accounts list

##### grant the necessary roles for our service account
gcloud projects add-iam-policy-binding green-wares-270812 --member serviceAccount:terraform-milan-svc-acc@green-wares-270812.iam.gserviceaccount.com --role roles/container.admin
gcloud projects add-iam-policy-binding green-wares-270812 --member serviceAccount:terraform-milan-svc-acc@green-wares-270812.iam.gserviceaccount.com --role roles/compute.admin
gcloud projects add-iam-policy-binding green-wares-270812 --member serviceAccount:terraform-milan-svc-acc@green-wares-270812.iam.gserviceaccount.com --role roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding green-wares-270812 --member serviceAccount:terraform-milan-svc-acc@green-wares-270812.iam.gserviceaccount.com --role roles/resourcemanager.projectIamAdmin

##### download a key file
gcloud iam service-accounts keys create milan-gcp-test-account.json --iam-account=terraform-milan-svc-acc@green-wares-270812.iam.gserviceaccount.com

##### create a bucket for terraform in GCP
gsutil mb -p green-wares-270812 -c regional -l us-east1 gs://milan-gcp-terra-bucket/
gsutil versioning set on gs://milan-gcp-terra-bucket/
gsutil iam ch serviceAccount:terraform-milan-svc-acc@green-wares-270812.iam.gserviceaccount.com:legacyBucketWriter gs://milan-gcp-terra-bucket/








