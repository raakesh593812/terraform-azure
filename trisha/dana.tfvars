resource_group = "webappRG1"
#tags={ Environment = "sandbox", Dept = "engineering" ,owner = "Rakesh" }
vnetrgname = "corp-vnet-01"
location = "eastus"
subnetname = ["app","database","shared"]
nsg_name = ["app","db","shared"]
hostname = "webapp-win-vm01"
pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/DXze0EH/aS0zfv/krU6Vu+tS7AyvLpi6v+p5/wlOJj72qE9bbyYQ4EF2Kl8CznLLEdq77kQSQPgdTzbV1vLi/sKmXbnPr3dok41kB64U9A6rUV9Y9O8SuRxcfZNzvsSUy/dFcs3vgB8QsQJoItV6ZSiJfcTreOpGjxsxxN7L4PUYEK6klvN0i0RExS6x4892S2iGlf2swNumk0zznINbFaJf6iVj4nRYLFP6h1BJN7RDsi3UlulY1J4P++NYBzBqCnusvb4fBxS/EfifExYFpMWiN+CLze2C504mxhnAikcQv8G2DRYTAa+ISdKhBzr4xB/o0jTr9XfjCF0HPhsX testadmin@devopsansibelvm01"
snprefix = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
route_hop_type = ["internet","none","Virtual network"]
routeprefix = ["10.0.1.0/22","10.0.2.0/30","10.0.3.0/22"]