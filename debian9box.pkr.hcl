# OUTPUT = "./output-debian9/package.box"
# build by running "make run"
# use "make add" to add the vagrant box locally after building successfully
source "vagrant" "debian9" {
  source_path = "bento/debian-9"
  provider = "virtualbox"
  communicator = "ssh"
  add_force = true
  skip_add = true
}

build {
  name = "maidebian9" 
  sources = [
    "source.vagrant.debian9"
  ]
  # install ansible in VM
  provisioner "shell" {
    script = "${path.root}/scripts/ansible.sh"
  }
  # provision tools and services using ansible ran on the VM itself
  provisioner "ansible-local" {
    playbook_dir    = "${path.root}/ansible/"
    playbook_file  = "${path.root}/ansible/debian9-box.yml"
    galaxy_file    = "${path.root}/ansible/requirements.yml"
  }

}
