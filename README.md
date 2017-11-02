# vagrant-cwl-impl-test

# This machine has following CWL implementation

| Name          | Version            | GitHub                                                                                                                                                                                                                                                    |
|:------------- | ------------------ |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| cwotool       | 1.0.20170928192020 | [common-workflow-language/cwltool: Common Workflow Language reference implementation](https://github.com/common-workflow-language/cwltool)                                                                                                                |
| cwlref-runner |                |                                                                                                                                                                                                                                                           |
| cwl-runner    |                 |                                                                                                                                                                                                                                                           |
| toil (cwltoil)          | 3.11.0             | [BD2KGenomics/toil: A scalable, efficient, cross-platform and easy-to-use workflow engine in pure Python](https://github.com/BD2KGenomics/toil "BD2KGenomics/toil: A scalable, efficient, cross-platform and easy-to-use workflow engine in pure Python") |
| rabix         | 1.0.1              | [rabix/bunny: Reproducible Analyses for Bioinformatics - Java](https://github.com/rabix/bunny)                                                                                                                                                            |

## cwl-runner

alias ?

When I Install
1. cwltool
2. cwfref-runner
3. cwl-runner
4. toil (cwltoil)

cwl-runner looks like overwriting by (cwl)toil version.

TODO: investigate or search about `cwl-runner`

# Setup vagrant machine

clone this repository

```
vagrant up
```

# Test Machine Environment by serverspec

```
rake spec
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

# Execute hello world sample by cwftoil

```
cd workflows/workflows/hello/
cwltoil --defaultMemory 512M hello.cwl
cat response.txt
```

expected result

```
Hello World
```

## Default Minimum Required Memory

When I run 1GB memory virtual machine.

cwltoil seems to need 2147483648 (int max?) bytes memory.
This slightly greater than 2GB.

There is following error, with `hello.cwl`

```
AssertionError: The job CWLWorkflow is requesting 2147483648 bytes of memory, more than the maximum of 1040605184 this batch system was configured with.
```

So minimum memory set to 512MB

```
cwltoil --defaultMemory 512M hello.cwl
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

## specify result directory by rabix

`-b` option

```
mkdir result
./rabix --no-container -b ./result ~/workflows/workflows/hello/hello.cwl examples/dna2protein/inputs.json
cat `find result | grep response.txt$`
```


### message when execute without input file

I can not find any option no input file

workflow does not execute.

```
./rabix  ~/workflows/workflows/hello/hello.cwl
```

message

```
Inputs for selected tool are:
```
