path=/home/sanika/Sanika/CSE_205/Spring_2019/Homework_1/grading/testing

test_43(){

	inputFile=$1
	sed -i '/package/d' 'H01_43.java'

	coproc java H01_43

		# input to java file
	echo $inputFile >&${COPROC[1]}

	expectedFile=$inputFile.txt

	echo "input File name: "$inputFile
	echo "Expected output file name: "$expectedFile
	sleep 2

	res=$(find . -name $expectedFile | wc -l)

	if [ $res == 1 ]
		then
			echo "FILE FOUND"
			outputFile=$expectedFile
		else
			echo "File not found"
			echo "generated txt files"
			ls -l |grep txt
			echo "Enter file to read"
			read outputFile
		fi
	
		echo "outputFile:" $outputFile

		# call python script to check if files are same
		python fileCheck.py $inputFile $outputFile

		# comment this if dont wanna open output files.
		gedit $outputFile

}



# export CLASSPATH=/home/sanika/Sanika/CSE_205/Spring_2019/Homework_1/grading/junit4.12

# ex 3.1

echo ""
echo "-------------3.1-------------------"

tester_java='Tester.java'

echo $tester_java		
cp -r $path/H01_31/* .
cp -r $path/tester/* .

chmod 777 *

# subl /home/sanika/Sanika/CSE_205/Spring_2019/Homework_1/grading/testing/tester/Tester.java

sed -i "s/^\s*\/\/\(@CUT:\)\(31\)/\/*\1\2*\//" ${tester_java}

sed -i '/package/d' 'H01_31.java'

javac -classpath ${CLASSPATH}  H01_31_junit.java H01_31.java Tester.java

chmod 777 *.class
java -classpath ${CLASSPATH} Tester 3.1
	

sed -i "s/^\s*\/\*\(@CUT:31\)\*\//\/\/\1/" ${tester_java}

# ex 3.4

echo ""
echo "-----------------3.4----------------------"

cp -r $path/H01_34/* .
# cp -r /home/sanika/Sanika/CSE_205/Spring_2019/Homework_1/grading/testing/tester/* .



sed -i "s/^\s*\/\/\(@CUT:\)\(34\)/\/*\1\2*\//" ${tester_java}

sed -i '/package/d' 'H01_34.java'

# subl /home/sanika/Sanika/CSE_205/Spring_2019/Homework_1/grading/testing/tester/Tester.java

javac -classpath ${CLASSPATH} Tester.java H01_34_junit.java H01_34.java
chmod 777 *
java -classpath ${CLASSPATH} Tester 3.4


sed -i "s/^\s*\/\*\(@CUT:34\)\*\//\/\/\1/" ${tester_java}



# ex 3.5

echo ""
echo "------------3.5-----------------"

cp -r $path/H01_35/* .
# cp -r /home/sanika/Sanika/CSE_205/Spring_2019/Homework_1/grading/testing/tester/* .

sed -i "s/^\s*\/\/\(@CUT:\)\(35\)/\/*\1\2*\//" ${tester_java}

sed -i '/package/d' 'H01_35.java'

# subl /home/sanika/Sanika/CSE_205/Spring_2019/Homework_1/grading/testing/tester/Tester.java

javac -classpath ${CLASSPATH} Tester.java H01_35_junit.java H01_35.java
chmod 777 *
java -classpath ${CLASSPATH} Tester 3.5

sed -i "s/^\s*\/\*\(@CUT:35\)\*\//\/\/\1/" ${tester_java}



# ex 4.3
# cd /home/sanika/Sanika/CSE_205/Spring_2019/Homework_1/grading/te



echo ""
echo "\n-----------4.3------------------\n"

cp $path/H01_43/* .
	
javac H01_43.java
inputFile='H01_43.java'
test_43 $inputFile 
inputFile='testcase1.java'
test_43 $inputFile 
inputFile='testcase2.java'
test_43 $inputFile 
inputFile='testcase3.java'
test_43 $inputFile 



# ex 6.5

echo ""
echo "-----------------6.5---------"
sed -i '/package/d' 'H01_65.java'

cp  $path/H01_65/H01_65_test.java .
javac H01_65_test.java H01_65.java
chmod 777 *
java H01_65_test -p

