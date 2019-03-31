# Cranesofwrights

**_Cranesoftwrights tooling for the generation of [OASIS UBL-2.x](http://docs.oasis-open.org/ubl/cs01-UBL-2.2/UBL-2.2.html) artefact distribution packages._**

This repository contains the Cranesoftwrights tools plus a set of configuration files and the ant build file for the generation of the artefacts in a sequenced pipeline. The resources available from this repository were provided by the author of the tools, **[Ken Holman](http://www.cranesoftwrights.com/)**. 

## SEMBU-UBLer v-0.1 (Pre-award)

In this repository, the original Ken's distribution has been slightly modified to produce a kind of "container" with (practically) all the needed dependencies. Thus, by pulling this repository, one should be able to execute the generation of all the artefacts whithout having to install anything else except a Java JDK VM, [aspell](http://aspell.net/) and [soffice](http://www.openoffice.org/download/index.html).

In this version we have focused only in the generation of the _Pre-award_ artefacts. 

### Requirements for this version: 

1. A Linux distribution, this version was created using [Ubuntu 18.10 Bionic Beaver](https://wiki.ubuntu.com/BionicBeaver/ReleaseNotes), but any Linux could be used,
2. A JDK VM, this version was created with [OpenJDK-11-jdk](https://openjdk.java.net/projects/jdk/11/).

### Next steps:

**I. Technical aspects**

1. Provide `\*.bat` scritps for windows,
2. Include aspell into the distribution,
3. Include soffice into the distribution,
4. Include an Open JDK VM into the distribution,
5. Create a Docker image.

**II. Business aspects**

* Focus on the generation of the post-award stage.

### Running the generation of the Pre-award artefacts

1. Pull the repository,
2. Open a terminal,
3. Go to the folder `artefacts`,
4. Run the command `./go.sh`.
