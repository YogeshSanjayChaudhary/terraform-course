terraform {
   backend "s3" {
      bucket = "terraform-state-1177"
      key    = "terraform/demo4"
   }
}
