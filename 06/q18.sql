SELECT snum, sname FROM salespeople s WHERE 1<(SELECT COUNT(*) FROM customers c WHERE s.snum=c.snum);
