SELECT * FROM orders outer WHERE outer.amt > (SELECT AVG(amt) FROM orders inner WHERE outer.cnum=inner.cnum);
