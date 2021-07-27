provider "google" {
 credentials = file("credentials.json")
 project     = "devops-course-project-318514"
 region      = "us-west1"
}



 resource "google_compute_instance" "test" {
 name         = "apache-machine"
 machine_type = "f1-micro"
 zone         = "us-west1-a"

 tags = ["http-server", "https-server"]

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }


 network_interface {
   network = "default"

   access_config {
   }
 }

  metadata_startup_script =  file("install-apache.sh")

  metadata = {
    ssh-keys = "anastasia:${file("google-key.pub")}"
  }

}


