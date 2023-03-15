DIR=$(pwd)
cat << EOF > "$DIR/backend.tf"
terraform {
  backend "gcs" {
    bucket  = "`gcloud alpha storage ls| grep "terraform-" | awk -F "/" '{print $3}'`"
    prefix  = "/stage`pwd`"
  }
}
EOF
cat "$DIR/backend.tf"
