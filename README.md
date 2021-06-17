# What does this do?
This packer build creates a new vagrant box using existing debian9 template boxes.
It includes a lot of nice dev tools such as zsh, nvim configs, preinstalled ansible/golang, etc

# Basic Steps
"make help" will show a list of options, and you'll probably be able to figure it out from there.
1. edit Makefile customization vars as you see fit (mainly changing the box name if you dont want it to be "maidebian9")
2. run "make debug_vars" to make sure everything looks ok
3. run "make validate" to see if the template is valid (will return nothing if it is)
4. run "make build" to build the new vagrant box. This will take 5-10 minutes.
5. run "make add" to add the successfully built vagrant box to your vagrant so that Vagrantfile can access it

Congrats! just make a new vagrantfile with the newly added box and you are good to go!

