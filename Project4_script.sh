
count=$(ls -1 *.java | wc -l)
# path="/home/sanika/Sanika/CSE_205/Project_4/cse205-p03-grader"
# echo $count

if [ $count -ge 20 ]
then
	echo "20 files are present"
else

	echo "Some file is missing"
fi

echo "Compiling..."
flag=0

for filename in *.java; do
   	
   	echo $filename
   	sed -i '/package/d' $filename
   	javac $filename

done