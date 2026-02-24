# cp_web_report

Checkpoint database daily report

# Install

- Place this at the same directory:

* https://github.com/rggassner/cptapi_get_domains

- Install java and maven

```
apt install default-jre maven
```

- Place the repo in the same directory
  
* https://github.com/CheckPoint-APIs-Team/cp-mgmt-api-java-sdk

You might need to change the files mgmt_api_lib/pom.xml and samples/clone_host/pom.xml replacing 1.7 to 1.8 in the lines with source and target tags.


- Install with

```
  mvn clean install
```
Follow the instructions on:

* https://github.com/CheckPointSW/ShowPolicyPackage

