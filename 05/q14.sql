SELECT onum, cname, orders.cnum, orders.snum FROM orders, customers, salespeople WHERE salespeople.snum=orders.snum AND customers.cnum=orders.cnum AND salespeople.city <> customers.city;
