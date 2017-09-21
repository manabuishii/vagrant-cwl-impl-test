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

# Execute hello world sample

```
cd workflows/workflows/hello/
cwltool hello.cwl
cat response.txt
```

expected result

```
Hello World
```
