SELECT cname, amt FROM customers, orders WHERE customers.cnum=orders.cnum AND amt = (SELECT MAX(amt) FROM orders);
