#!/bin/bash


# -------------------- Sectino 4 --------------------
Folder1_1="H02_45"
Folder1_2="h02_45"

Folder2_1="H02_51"
Folder2_2="h02_51"

#  since unzip when executed second time asks for replacement
coproc unzip "*.zip"

# input to unzip command
echo "All" >&${COPROC[1]}


folderExists=0
echo "SECTION 4"
echo ""
if [ -d "$Folder1_1" ]
	then
		Folder1=$Folder1_1
		folderExists=1
		echo "Folder Exists ",  $Folder1
elif [ -d "$Folder1_2" ]
	then
		Folder1=$Folder1_2
		folderExists=1
		echo "Folder Exists ",  $Folder1
fi


if [ $folderExists == 1 ]
then
	cd $Folder1
	count=$(ls | grep *.java  |wc -l)
	if [ count==10 ]
	then
		echo "10 files are present"
	fi
	echo "Compiling..."
	flag=0
	for filename in *.java; do
	   	
	   	echo $filename
	   	sed -i '/package/d' $filename
	    
	    if [ $filename == "Bee.java" ] || [ $filename == "bee.java" ] || [ $filename == "Frog.java" ] ||[ $filename == "frog.java" ] ||[ $filename == "Amphibian.java" ] || [ $filename == "amphibian.java" ]
	   	then
	   		gedit $filename &
	   		sleep 1
	   	fi
	   	
	   	if [ $filename == "Main.java" ]
	   	then
	   		flag=1
	   		gedit $filename &
	   		sleep 1
	   	fi

	   	if [ $filename == "main.java" ]
	   	then
	   		gedit $filename &
	   		flag=0
	   		sleep 1
	   	fi
	   	javac $filename 
	   count+=1
	done
	echo ""
	echo "Running Main.java"
	echo ""
	echo "OUTPUT:"
	echo ""
	if [ $flag==1 ]
	then
		java "Main"
	else
		 java "main"
		fi

else
	echo "Folder h02_45 or H02_45 doesnt exists"
fi
# -----------------SECTION 5 -----------------

folderExists=0
echo ""
echo "SECTION 5"
echo ""

cd ..
if [ -d "$Folder2_1" ]
	then
		echo "hi"
		Folder2=$Folder2_1
		folderExists=1
		echo "Folder Exists ",  $Folder2
elif [ -d "$Folder2_2" ]
	then
		Folder2=$Folder2_2
		folderExists=1
		echo "Folder Exists ",  $Folder2
fi


if [ $folderExists == 1 ]
then	
	echo ""
	echo "SECTION 5"
	echo "Running View.java..."
	echo ""
	cd $Folder2
	sed -i '/package/d' "View.java"
	javac View.java
	javac Main.java
	java Main
	gedit View.java
else 
	echo "H02_51 or h02_51 doesnt exist"
fi

# cd ..
# path=$(pwd)
# echo $path
# mv $path /home/sanika/Sanika/CSE_205/Homework_2/DONE/