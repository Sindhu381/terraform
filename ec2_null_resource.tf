resource "null_resource" "filecopy" {
  count= 1
 provisioner "file" {
    source      = "Script.sh"
    destination = "/tmp/Script.sh"

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("aws2key.pem")}"
      host = "${element(aws_instance.public-servers.*.public_ip,count.index)}"
    }
  }
    provisioner "remote-exec"{
     inline=[
      "chmod +x /tmp/Script.sh",
      "sudo /tmp/Script.sh",
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo server nginx start",
      "sudo echo \"<h1>Deployed via Terraform</h1>\" | sudo tee /var/www/html/index.html"
      ]
    
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("aws2key.pem")}"
      host = "${element(aws_instance.public-servers.*.public_ip,count.index)}"
    }
    }
}
        
        