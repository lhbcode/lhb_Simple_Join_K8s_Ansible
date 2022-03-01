terraform {
    backend "s3" { # 강의는 
      bucket         = "terraform-lhb-apse2-tfstate" # s3 bucket 이름
      key            = "dev/k8s/terraform.tfstate" # s3 내에서 저장되는 경로를 의미합니다.
      region         = "ap-southeast-2"  
      encrypt        = true
      dynamodb_table = "terraform-lhb-lock"
    }
}