if [ "$3" == "" ]
then 
echo Missing stage, dateZ and date arguments \(optional -Dskip=yes\)
exit
fi

echo Building package...
java -Dant.home=/Users/admin/p/apache/ant -classpath /Users/admin/p/xml/xslt/saxon/saxon.jar:/Users/admin/p/apache/ant/lib/ant-launcher.jar:/Users/admin/p/xml/xslt/saxon9he/saxon9he.jar:. org.apache.tools.ant.launch.Launcher -buildfile produceUBLSchemas.xml -Ddir=/Users/admin/t/ -Dutilitydir=/Users/admin/t/ -Dworkdir=/Users/admin/t/work/ "-Dpackage=BusParty 2.3 Test" -DUBLversion=2.3-BusParty -DUBLprevVersion=2.2 -Drawdir=bp-raw-20190323-0130z -Dstage=$1 -Dversion=$2 -Ddatetimelocal=$3 $4

if [ "$?" != "0" ]; then exit ; fi
b
b
