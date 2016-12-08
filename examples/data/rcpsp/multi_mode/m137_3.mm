************************************************************************
file with basedata            : cm137_.bas
initial value random generator: 1954599124
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  18
horizon                       :  117
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     16      0       39       13       39
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        1          2           5   8
   3        1          3           5   7  10
   4        1          2           6  13
   5        1          2           9  14
   6        1          3           7   9  11
   7        1          3          12  15  16
   8        1          1          11
   9        1          2          16  17
  10        1          2          11  14
  11        1          2          12  15
  12        1          1          17
  13        1          3          14  15  17
  14        1          1          16
  15        1          1          18
  16        1          1          18
  17        1          1          18
  18        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1    10      10    6    2    3
  3      1     7       5    1    6    5
  4      1     9       3    5    6    7
  5      1    10       2    3    5    7
  6      1     9       9    9    2    4
  7      1     1       5    2    3    8
  8      1     9       7    9    3    4
  9      1    10       5    6    4    7
 10      1     6       7    5    9    6
 11      1     1       5    3   10    4
 12      1     9       2    3    1    6
 13      1     7       7    7    2    5
 14      1     7       3    2    4    9
 15      1    10       3    3    4    9
 16      1     9       5    7    9    4
 17      1     3       9    8    2    7
 18      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   16   15   72   95
************************************************************************