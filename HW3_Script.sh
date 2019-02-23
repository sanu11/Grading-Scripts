

cp /home/sanika/Sanika/CSE_205/Spring_2019/Homework_3/testing/H03_31/H03_31_junit.java .
cp /home/sanika/Sanika/CSE_205/Spring_2019/Homework_3/testing/H03_32/H03_32_junit.java .
cp /home/sanika/Sanika/CSE_205/Spring_2019/Homework_3/testing/H03_35/H03_35_junit.java .
cp /home/sanika/Sanika/CSE_205/Spring_2019/Homework_3/testing/H03_41/H03_41_junit.java .
cp /home/sanika/Sanika/CSE_205/Spring_2019/Homework_3/testing/H03_57/H03_57_junit.java .
cp /home/sanika/Sanika/CSE_205/Spring_2019/Homework_3/testing/H03_61/H03_61_junit.java .



subl H03_31.java
subl H03_32.java
subl H03_35.java
subl H03_41.java
subl H03_57.java
subl Point.java

javac -cp  .:/usr/share/java/junit4-4.12.jar H03_31_junit.java
javac -cp  .:/usr/share/java/junit4-4.12.jar H03_32_junit.java
javac -cp  .:/usr/share/java/junit4-4.12.jar H03_35_junit.java
javac -cp  .:/usr/share/java/junit4-4.12.jar H03_41_junit.java
javac -cp  .:/usr/share/java/junit4-4.12.jar H03_57_junit.java
javac -cp  .:/usr/share/java/junit4-4.12.jar H03_61_junit.java



filename=H03_31.java
javac $filename
sed -i '/package/d' $filename

java -cp  .:/usr/share/java/junit4-4.12.jar org.junit.runner.JUnitCore H03_31_junit



filename=H03_32.java
javac $filename
sed -i '/package/d' $filename

java -cp  .:/usr/share/java/junit4-4.12.jar org.junit.runner.JUnitCore H03_32_junit


filename=H03_35.java
javac $filename
sed -i '/package/d' $filename

java -cp  .:/usr/share/java/junit4-4.12.jar org.junit.runner.JUnitCore H03_35_junit



filename=H03_41.java
javac $filename
sed -i '/package/d' $filename

java -cp  .:/usr/share/java/junit4-4.12.jar org.junit.runner.JUnitCore H03_41_junit



filename=H03_57.java
javac $filename
sed -i '/package/d' $filename


java -cp  .:/usr/share/java/junit4-4.12.jar org.junit.runner.JUnitCore H03_57_junit




filename=Point.java
javac $filename
sed -i '/package/d' $filename

java -cp  .:/usr/share/java/junit4-4.12.jar org.junit.runner.JUnitCore H03_61_junit
