Steps in preparing the schema artefacts for UBL

Preparing tools

 - these Crane-{name}-{date} packages are identified by the ${dir} directory
   in produceUBLSchemas.xml and the timestamps found at the start of that file
   https://cranesoftwrights.github.io/resources/ubl/#gc2obdndr
   https://cranesoftwrights.github.io/resources/ubl/#ods2obdgc
   https://cranesoftwrights.github.io/resources/ubl/#gc2odsxml
   https://cranesoftwrights.github.io/resources/ubl/#codess   (cva-gc-xsl)
   https://cranesoftwrights.github.io/resources/ubl/#cva2sch
 - these utilities have to on the execution path
   aspell   (found at http://aspell.net ) 
   soffice  (found at http://www.openoffice.org )

Preparing schema production
 - establish the parameters of the build:
   UBL version identifier: ${UBLversion}
                           2.3
                           2.3-Pre-award
                           2.3-TSC
                           2.3-BusParty
   UBL release stage: ${stage}
                      csd01wd00
                      preaward02
                      tsc05
                      bp00
   UBL previous version: ${UBLprevVersion}
                         2.2
   UBL previous stage: ${UBLprevStage}
                       csd01wdxx

 - prepare raw directory: ${rawdir}
                          r23-20190301/
                          pre-award-raw-20181027-1910z/
                          tsc-raw-20181029-1850z/
                          bp-raw-20190323-0130z/
   - filenames in xsd/common/
   - namespaces and filenames inside files in xsd/common 
   - namespaces in val/order*.xml
   - DTQ XSLT filename in val/validate.*
   - filenames in val/test.*

 - prepare the skeleton ODS file SkeletonDisplayEditSubset2.3.ods 
      SkeletonDisplayEditSubset${UBLversion}.ods 

 - prepare the model name massaging information for the UBL version:
      massageModelName-2.3-Pre-award.xml
      massageModelName-2.3-BusParty.xml
      massageModelName-2.3-TSC.xml
      massageModelName-2.3.xml

 - prepare shell invocation file with appropriate parameter definitions:
       ./preawardProduceUBL23Schemas.sh
       ./tscProduceUBL23Schemas.sh
       ./bpProduceUBL23Schemas.sh
       ./ublProduce23Schemas.sh

Schema production:

 - prepare 2 shell files specific to the version but not the stage
     UBL-DefaultDTQ-${UBLversion}-shell.sch
      - edit for name of pattern file
      - 
     UBL-${UBLversion}-CVA-Skeleton.cva
 - prepare 4 configuration files specific to the version and the stage:
     ident-UBL-${UBLversion}-${stage}.ods
     ident-UBL-Signature-${UBLversion}-${stage}.xml
     config-UBL-${UBLversion}-${stage}.xml
     config-UBL-signature-${UBLversion}-${stage}.xml
   - entities for the date and version information
   - in configuration file update the comment with the release information
   - remember to edit test and final namespace URI strings
   - comments making reference to any subcommittees

 - edit comments of the 9 stock supplementary schema files common/UBL-*
   to reflect the identical release comment from the configuration file
 
 - save the 3 ODS models from Google: UBL-Signature-Google-${UBLversion}.ods
                                      UBL-Library-Google-${UBLversion}.ods
                                      UBL-Documents-Google-${UBLversion}.ods
   - a copy of the signature ODS file is acceptable as there are no changes

 - trash the target stage directory:  trash ${stage}
                                      trash csd01wd00
                                      trash preaward02
                                      trash tsc05
                                      trash bp00

 - prepare a test release of the package: ${stage}     - approx 16-18 minutes 
    sh preawardProduceUBL23Schemas.sh {stage} test now
    sh tscProduceUBL23Schemas.sh {stage} test now
    sh bpProduceUBL23Schemas.sh {stage} test now
    sh ublProduce23Schemas.sh {stage} {CCYYMMDD-HHMMz} {CCYYMMDD-HHMM}
    - this process creates the XML serializations of the CCTS models:
      - UBL-Entities-${UBLversion}.gc
      - UBL-Signature-Entities-${UBLversion}.gc

 - check the integrity of the model from the check report:
    open ./check-ubl-${UBLversion}-${stage}-ubl-${UBLprevVersion}.html
    - if it works the first time tried, check that the ODS file was touched
    open ./check-ubl-${UBLversion}-${stage}-ubl-${UBLversion}-${prevStage}.html
    - ignore the mislabeled version numbers

  - when a new English word is added to the model that is not in the
    system's English dictionary, add the word to the aspellDictUBL.txt file

  - search for any question marks in GC file signalling incomplete work
    grep Value.*\? UBL-*-2.3*.gc

  - prepare final stage artefacts
    - WARNING: at one point there is the parallel execution of two separate
               artefact generation paths; during this time, error messages
               from both paths get intermingled in the output report; this can
               lead to misleading interpretations of the errors because they
               appear to apply to the "other" process running in parallel; one
               way to diagnose the issue is to comment out the <parallel>
               start tag and end tag and let the process re-run serially
    - NOTE: this takes about 15-18 minutes on a 16Gb 2.8 GHz Intel Core i7
    
    trash ${stage}                    # ensure no interim files from abends

  - revisions are created and then stored in Kavi as a revision to the base
    
    ./preawardProduceUBL23Schemas.sh {stage} {CCYYMMDD-HHMMz} {CCYYMMDD-HHMM}
https://www.oasis-open.org/apps/org/workgroup/ubl/document.php?document_id=64164
https://www.oasis-open.org/committees/document.php?document_id=64164
    ./tscProduceUBL23Schemas.sh {stage} {CCYYMMDD-HHMMz} {CCYYMMDD-HHMM}
https://www.oasis-open.org/apps/org/workgroup/ubl/document.php?document_id=64169
https://www.oasis-open.org/committees/document.php?document_id=64169
    ./ublProduce23Schemas.sh {stage} {CCYYMMDD-HHMMz} {CCYYMMDD-HHMM}
https://www.oasis-open.org/apps/org/workgroup/ubl/document.php?document_id=64924
https://www.oasis-open.org/committees/document.php?document_id=64924


