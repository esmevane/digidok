# Digidok

An example of an automatic [terraforming][terraform] of a [Digital Ocean][do] droplet running [dokku][dokku], which is capable of deploying [sinatra][sinatra] using [git][git].

## Deploying it

**Requirements**: [Digital Ocean token][do-token], [git][git], [terraform][terraform], [fig][fig], [docker][docker], [ruby][ruby]
* Clone [the repo][home-repo]
* Download and [install terraform][terraform-install]
* Create a `terraform.tfvars` from `terraform.tfvars.sample` and place your Digital Ocean token in it.
* Run `bundle install`
* Run `terraform apply -var-file terraform.tfvars`
* Visit the resulting Digital Ocean IP and place the contents from `cat ~/.ssh/id_rsa.pub` in the public key text area.
* Make sure to log on to the droplet as root, and replace the default password (you should have the temporary credentials in your email).
* Run `cat ~/.ssh/id_rsa.pub | ssh root@[your droplet id] "sudo sshcommand acl-add dokku [your intended username]"`
* Run `git remote add [remote name] dokku@[your droplet id]:[your app name]`
* Run `git push [remote name] master`
* Access the miniature app on the returned url!

[terraform]: http://www.terraform.io/
[do]: https://www.digitalocean.com/
[dokku]: https://github.com/progrium/dokku
[docker]: https://docker.com/
[fig]: http://www.fig.sh/
[sinatra]: http://www.sinatrarb.com/
[git]: http://git-scm.com/
[ruby]: https://www.ruby-lang.org/en/
[terraform-install]: http://www.terraform.io/downloads.html
[home-repo]: https://github.com/esmevane/digidok
[do-token]: https://www.digitalocean.com/community/tutorials/how-to-use-the-digitalocean-api-v2
