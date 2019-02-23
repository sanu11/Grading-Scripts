
count=$(ls -1 *.java | wc -l)
path="/home/sanika/Sanika/CSE_205/Spring_2019/Project_3/cse205-p03-grader/cse205-p03-grader"
# echo $count

if [ $count -ge 8 ]
then
	echo "8 files are present"
else

	echo "Some file is missing"
fi

echo "Compiling..."
flag=0

for filename in *.java; do
   	
   	echo $filename
   	sed -i '/package/d' $filename
 

done
for filename in *.java; do

javac $filename
done

echo "SWR 17:: Examine the method Searcher.search() and verify that it implements either the iterative or the recursive binary
search algorithm. If it implements linear search then the test case fails. Failure: score -= 1"


subl Searcher.java


subl Sorter.java

echo "SWR 10:: Here should be four non-constructor methods named:
partition(), quickSort(), sort(), and swap(). The test case fails is the student did not implement the quick sort
algorithm. Failure: score -= 1"



echo "SWR 2:: Verify that all of the frame components are displayed in roughly the correct location and that all of the textfields
and buttons are viewable. Failure: -0.25"
echo "SWR 3:: Check for String in title bar. Failure: -0.25"
echo "SWR 4 :: try exiting using close button in title bar. If not -0.25"

java "Main"

echo "SWR 6::Dialog is displayed -  gradebook database could not be opened for reading. Failure: score -= 0.25"
echo "SWR:: 6 if not centered within the frame. Failure: score -= 0.25"
echo "SWR 6:: Close the dialog. Failure: -0.25"

rm -r *.dat
java Main

testFile="/testing/gradebook-sorted.dat"
cp $path$testFile .
mv gradebook-sorted.dat gradebook.dat

chmod 444 gradebook.dat


echo ""

echo "SWR 7:: Verify that a message dialog appears informing the user that the gradebook database could not be opened for
writing. Failure: score -= 0.25"
echo "SWR 7:: Verify the program closes. Failure: score -= 0.25"

echo ""
chmod 664 gradebook.dat

testFile="/testing/gradebook-unsorted.dat"
cp $path$testFile .
mv gradebook-unsorted.dat gradebook.dat

java Main



echo "SWR 8 :: Verify that all of the text fields are empty. Failure: score -= 0.25"


echo "checking for sorted file.."

java Main

echo "SWR 10:: "
if  sort -c gradebook.dat > /dev/null 
  then
     echo "gradebook.dat sorted already"
  else
  	echo "deduct 1 point"
fi

echo ""

rm gradebook.dat

testFile="/testing/gradebook-sorted.dat"
cp $path$testFile .
mv gradebook-sorted.dat gradebook.dat

echo ""

java Main


echo "SWR 11-14:: Search Simpson. Verify that the textfields display the proper information for this student. Failure: score -= -0.25"
echo "SWR 15-16 :: Delete the text in the Student Name field. 3. Verify that a message dialog is displayed asking the user to enter a student's name. Failure: score -= 0.25."
echo "Verify that the textfields are cleared. Failure: score -= 0.25."



echo "SWR 18:: Enter Foo. Not found diaglog. Else -0.25"

echo "SWR 20-21. Enter Muntz. Set scores to to 100, 100, 100. Check gradebook.dat.Scores shouldnt change. if changed -0.25."

echo "SWR 26 :: Now scores should be updated after exiting. Else -0.25"

echo ""
java Main
subl gradebook.dat

echo "SWR 23/26::Enter fields, clear fields -0.25, score shouldnt be updated in file: -0.25 "


echo "SWR 24 :: click clear. nothing should happen. Failure -0.25"

echo "SWR 25/26::Exit should save scores: -1"

echo ""
java Main

subl gradebook.dat


# echo "SWR 5::Existing user info should be displayed: -0.25"
# echo "SWR 8::Modify it and write to file, check file for updation: -1"
# echo "SWR 6::Empty string dialog: -1"
# echo "SWR 7::Non existing user dialog: -1"
# echo "SWR 9::Clicking Save on empty fields shouldnt terminate:-1 "
# echo "Fields not cleared: -1"
# echo "File updated: -1"

# java Main

# gedit "gradebook.dat" &
# echo "Check for file updations"




