SELECT cname, amt FROM customers, orders WHERE (amt BETWEEN 1500 AND 5000) AND customers.cnum=orders.cnum;
