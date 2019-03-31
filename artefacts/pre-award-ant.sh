if [ "$3" == "" ]
then 
echo Missing stage, dateZ and date arguments \(optional -Dskip=yes\)
exit
fi

echo Building package...
java -Dant.home=./bin/ant -classpath ./lib/saxon-6.5.5.jar:./bin/ant/lib/ant-launcher.jar:./lib/saxon9he.jar:. org.apache.tools.ant.launch.Launcher -buildfile ./produceUBLschemas.xml -Ddir=./util/ -Dutilitydir=./util/ -Dworkdir=./work/ "-Dpackage=2.3" -DUBLversion=2.3 -DUBLprevVersion=2.2 -Drawdir=pre-award-raw-20181027-1910z -Dstage=$1 -Dversion=$2 -Ddatetimelocal=$3 $4

if [ "$?" != "0" ]; then exit ; fi
b
b
