LOAD DATA
INFILE 'loader1.dat'
INTO TABLE lab2a
FIELDS TERMINATED BY ','
(i, s, d DATE "dd-mon-yyyy")
