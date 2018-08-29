SELECT snum, MAX(amt) FROM orders GROUP BY snum HAVING MAX(amt) > 3000 ORDER BY snum;
