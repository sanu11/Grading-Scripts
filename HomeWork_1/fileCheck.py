import sys
from itertools import izip

file1 = sys.argv[1]
file2 = sys.argv[2]
print file1,file2
count  = 1
it=0
it2=0
totalLines=0
cnt=0
# fp = open(file1, 'r')
# with open(file1) as fp:  
#    line = fp.readline()
#    print line
#    cnt +=1

lines = [line.rstrip('\n') for line in open(file1)]

print "total lines in input file:",len(lines)

cnt = len(lines)

with open(file1) as textfile1, open(file2) as textfile2: 
    for x, y in izip(textfile1, textfile2):
		l=y.split(']',1)
		indexFromFile =  l[0].split('[')[0]
		expectedIndex =  '%03d' % count
		# print expectedIndex,indexFromFile

		if(count==1 and int(indexFromFile)==000):
			count=0
		if(int(indexFromFile)==int(expectedIndex)):
			it+=1
		count+=1
		# print x.strip() 
		# print l[1].strip()
		if(x.strip()==l[1].strip()):
			it2+=1
		else:
			print "Lines differ:"
			print x.strip()
			print l[1].strip()

if(it==cnt and it2 == cnt):
	print "FILE MATCHED, TESTCASE PASSED"
else:
	print "TESTCASE FAILED"
print "Total Lines in input file",cnt	
print "Line numbers correct",it
print "Lines matched:",it2