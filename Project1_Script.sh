# rm *.text
#!/bin/bash

# CHANGE THE PATH

path1="/home/sanika/Sanika/CSE_205/Spring_2019/Project_1/cse205-p01-grader/testcases/testcase"
print "testcase 8 -  file not found"
javac Main.java
java Main
for i in  {1..7}
	do
	path=$path1$i/*
	# echo $path
	cp -r $path .
	java Main
	echo $i
	# remove the q flag to see the detailed output of diff
	diff -w -i -q correct.txt p01-runs.txt

	# this is to open the files in the editor to compare it manually, in case it shows different through the command
	subl correct.txt p01-runs.txt

	
	# sleep 10s
	done
print "testcase 9 - write permission"
chmod -w p01-runs.txt
java Main
# rm *.txt
	