SELECT snum, MAX(amt) FROM orders GROUP BY snum ORDER BY snum;
