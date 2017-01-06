PoC trying out the Java-driver for Nomad by Hashicorp.

# Steps

* Start virtual machine
```
vagrant up
```

* Install java8
```
vagrant ssh
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```

* Start www-server serving jar-files to nomad
```
vagrant ssh
cd /vagrant
./www-server.sh
```

* build example webappp  (also copies jar to www-dir)
```
./build.sh
```

* Start nomad agent (server and client, dev-mode)
```
sudo nomad agent -dev
# or for custom config
sudo nomad agent -dev -config server_client_config.hcl
```

* schedule the job [java.nomad](java.nomad) (uses the java-driver)
```
nomad plan java.nomad
nomad run java.nomad
```

* logs can be found in
```
/var/lib/nomad/  ... /webservices/alloc/logs/
```

...
