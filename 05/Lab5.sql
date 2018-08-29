SELECT snum, MAX(amt) FROM orders GROUP BY snum ORDER BY snum;
SELECT snum, MAX(amt) FROM orders GROUP BY snum HAVING MAX(amt) > 3000 ORDER BY snum;
SELECT fname, lname, salary FROM employee ORDER BY salary, lname;
SELECT onum, cname, orders.cnum, orders.snum FROM orders, customers, salespeople WHERE salespeople.snum=orders.snum AND customers.cnum=orders.cnum AND salespeople.city <> customers.city;
SELECT cname, amt FROM customers, orders WHERE customers.cnum=orders.cnum AND amt = (SELECT MAX(amt) FROM orders);
SELECT * FROM orders WHERE amt > (SELECT AVG(amt) FROM orders WHERE odate = TO_DATE('03-10-1990','DD-MM-YYYY'));
SELECT * FROM orders WHERE onum IN (SELECT onum FROM orders, salespeople WHERE salespeople.snum=orders.snum AND city = 'London');
