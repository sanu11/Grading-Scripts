# rm *.text
#!/bin/bash

count=$(ls -1 *.java | wc -l)
path="/home/sanika/Sanika/CSE_205/Spring_2019/Project_2/cse205-p02-grader"
# echo $count

if [ $count -ge 6	]
then
	echo "6 files are present"
else

	echo "Some file is missing"
	exit 1
fi
echo "Compiling..."

flag=0
for filename in *.java; do
   	
   	echo $filename
   	sed -i '/package/d' $filename
   	# javac $filename
   	# if [ $filename == "Main.java" ] || [ $filename == "OnCampusStudent.java" ] || [ $filename == "OnlineStudent.java" ] ||[ $filename == "Student.java" ]
   	# then
   	# 	gedit $filename &
   	# fi
done
javac Main.java


# testcase 1\
rm p02-students.txt
echo ""
echo "INST:Testcase 1 - input file not found"
echo ""
java Main


# testcase 2
echo "INST:Testcase 2 - output file not found"
echo ""
cp $path/swr2-3/p02-students.txt .
cat <<< "abc" > p02-tuition.txt
chmod 444 p02-tuition.txt
java Main
rm -f *.txt

echo "INST:Testcase 3"
cp $path/swr2-3/p02*.txt .
java Main
ls -l -1 *.txt
# echo "Input newly created output file and check for its size" 
filename="p02-tuition.txt"

echo "comparing files"
sed -i '/^$/d' $filename
symbolic=1
indices=1
if diff -i -q -Z $filename "p02-tuition-soln.txt" > /dev/null; 
then
    echo "Passed";
else
   echo "Failed";    
   echo "comparing symbolic"
   if diff -i -q -w p02-tuition-soln.txt $filename >/dev/null;
   then
      echo "Passed";
      symbolic=0
   else
      echo "Failed"
   fi

   echo "checking whitespace mismatch"
   cp $path/swr2-3/indices-soln.txt .
   
   awk '{for (i=1; i<=NF; i++) print index($0, $i)}' < $filename > "indices.txt"
   if diff -q "indices-soln.txt" "indices.txt" >/dev/null; then
      echo "Passed"
      indices=0
      if [ $symbolic == 0 ]
      then
         echo "DONE grading"
      fi
   fi


   if [ $indices == 1 ]
   then
      echo "deduct 2 pts: indices differ"
   fi

   if  [ $symbolic == 1 ]
   echo "checking further since symbolic is true"
   then
      diff -y p02-tuition-soln.txt p02-tuition.txt
      echo "sorting students"
      if  sort -c p02-tuition.txt > /dev/null 
      then
         echo "sorted already"
      else
         echo "Check manually in above output if its id wise sorted? coz this gives wrong ans sometimes.."
         echo "deduct 1 point if not sorted"
         echo "Sorting..." 
         sort -no "p02-tuition.txt" "p02-tuition.txt"

         if diff -i -q -Z $filename "p02-tuition-soln.txt" > /dev/null; 
         then
          echo "Passed";
          exit 1
         fi
         diff -y p02-tuition-soln.txt p02-tuition.txt
      
      fi
      
   # compare files manually
      
      echo "compare the output above..."
      echo "Tuition amount output with $ symbol?"
      echo "deduct 1 pt"
      # sed -i's/\$//' p02-tuition.txt
      # diff -y p02-tuition-soln.txt p02-tuition.txt
      echo "no 2 digits after decimal point for tution?"
      echo "deduct 1 pt"
      echo "student ids mismatch?"
      echo "deduct 1 pt"
      echo "last name column mismatch?"
      echo "deduct 1 pt"
      echo "first name column mismatch?"
      echo "deduct 1 pt"
      echo "Tuition column mismatch?"
      echo "deduct 3 pt"
      
      fi

fi
