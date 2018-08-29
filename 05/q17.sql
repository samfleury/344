SELECT * FROM orders WHERE onum IN (SELECT onum FROM orders, salespeople WHERE salespeople.snum=orders.snum AND city = 'London');
