# vagrant-cwl-impl-test

# Setup vagrant machine

clone this repository

```
vagrant up
```

# Execute

Login

```
vagrant ssh
```

# Execute hello world sample by cwltool

```
cd workflows/workflows/hello/
cwltool hello.cwl
cat response.txt
```

expected result

```
Hello World
```

# Execute hello world sample by rabix-1.0.1

```
cd ~/rabix-cli-1.0.1
./rabix --no-container ~/workflows/workflows/hello/hello.cwl examples/dna2protein/inputs.json
```

execution result

```
[2017-09-21 13:41:50.200] [INFO] Job root.step0 has started
[2017-09-21 13:41:50.240] [INFO] Local execution (no container) has started
[2017-09-21 13:41:50.267] [INFO] Running command line: echo 'Hello World' > /home/vagrant/rabix-cli-1.0.1/examples/dna2protein/hello-2017-09-21-134145.791/root/step0/response.txt
[2017-09-21 13:41:52.684] [INFO] Job root.step0 has completed
{
  "response" : {
    "basename" : "response.txt",
    "checksum" : "sha1$648a6a6ffffdaa0badb23b8baf90b6168dd16b3a",
    "class" : "File",
    "contents" : null,
    "dirname" : "/home/vagrant/rabix-cli-1.0.1/examples/dna2protein/hello-2017-09-21-134145.791/root/step0",
    "format" : null,
    "location" : "/home/vagrant/rabix-cli-1.0.1/examples/dna2protein/hello-2017-09-21-134145.791/root/step0/response.txt",
    "metadata" : null,
    "nameext" : ".txt",
    "nameroot" : "response",
    "path" : "/home/vagrant/rabix-cli-1.0.1/examples/dna2protein/hello-2017-09-21-134145.791/root/step0/response.txt",
    "secondaryFiles" : [ ],
    "size" : 12
  }
}
```

check result

```
cat `find . | grep response.txt$`
```

expected result

```
Hello World
```
