ECS 36B Fall 2023	Homework #1 (0%)	

This assignment is related to C (not C++) and Unix tools such as Make –

[online resources for tar and make (and it is important for you to learn the concept of separate compilation]
https://www.interserver.net/tips/kb/use-tar-command-linux-examples/ 
https://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/ 
https://hackingcpp.com/cpp/lang/separate_compilation.html

Part 1: split a large file into fixed-size pieces and re-join them

As common file/database size is getting much larger these days, it is handy to be able to break them into small pieces for the purpose of storage or internet transfer, and then to heal them back together to the original form whenever needed. For this homework assignment, we will build such tools (also to apply what you might have learned from ecs36a) --

(Programs) myHeal and myBreak are two utility programs for separating a giant file into smaller-sized chunks and re-assembling the chunks back to their original.

myBreak: the myBreak program will separate the source file, typically very large file size, into fixed-size chunks (for example, 1 MB a piece). You have the freedom to design how you like to separate them (of course, your own myHeal program will put them back correctly), but the program must take the following arguments:

usage: ./myBreak <source> <prefix> <chunk size (K)>

Here is an example --

(base) MBP:myBreakHeal sfwu$ ls -l toID_sorted_Lall_LIS.xls
-rw-r--r--  1 sfwu  staff  710779752 Sep 30 12:15 toID_sorted_Lall_LIS.xls

(base) MBP:myBreakHeal sfwu$ ./myBreak toID_sorted_Lall_LIS.xls myPrefix 65536
 starting myPrefix.00000000000000000000000000000000
 starting myPrefix.00000000000000000000000000000001
 starting myPrefix.00000000000000000000000000000002
 starting myPrefix.00000000000000000000000000000003
 starting myPrefix.00000000000000000000000000000004
 starting myPrefix.00000000000000000000000000000005
 starting myPrefix.00000000000000000000000000000006
 starting myPrefix.00000000000000000000000000000007
 starting myPrefix.00000000000000000000000000000008
 starting myPrefix.00000000000000000000000000000009
 starting myPrefix.00000000000000000000000000000010
done... [11] chunks produced for toID_sorted_Lall_LIS.xls

While you can design and implement your own version of myBreak program, the source code of a reference implementation of myBreak.c will be provided.

myHeal: the myHeal program will re-generate the original file broken by the myBreak program. For error handling, the program needs to detect if any chunk is missing and also the chunk size of incorrect.

Here is the example --

(base) MBP:myBreakHeal sfwu$ ./myheal source_toID.csv myPrefix 65536 11
 putting myPrefix.00000000000000000000000000000000
 putting myPrefix.00000000000000000000000000000001
 putting myPrefix.00000000000000000000000000000002
 putting myPrefix.00000000000000000000000000000003
 putting myPrefix.00000000000000000000000000000004
 putting myPrefix.00000000000000000000000000000005
 putting myPrefix.00000000000000000000000000000006
 putting myPrefix.00000000000000000000000000000007
 putting myPrefix.00000000000000000000000000000008
 putting myPrefix.00000000000000000000000000000009
 putting myPrefix.00000000000000000000000000000010
done... [11] chunks produced for source_toID.csv

(base) MBP:myBreakHeal sfwu$ ls -l source_toID.csv
-rw-r--r--  1 sfwu  staff  710779752 Sep 30 13:46 source_toID.csv

(base) MBP:myBreakHeal sfwu$ diff toID_sorted_Lall_LIS.xls source_toID.csv
(base) MBP:myBreakHeal sfwu$

Please note that the diff program is used to compare the original file and the healed version, and there is no difference which means the heal process was correctly done.
https://www.geeksforgeeks.org/diff-command-linux-examples/

Your myHeal program should also handle the following exceptions
(1) Chunk missing detected
(2) Chunk size mismatched (except the last one)
