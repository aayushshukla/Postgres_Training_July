select categories.category_name,products.product_name,products.units_in_stock
from products join categories on 
products.product_id = categories.category_id;


select categories.category_name,products.product_name,products.units_in_stock,
suppliers.company_name,suppliers.country,suppliers.phone
from products join categories on 
products.product_id = categories.category_id
inner join suppliers on 
products.supplier_id = suppliers.supplier_id;


select customers.contact_title, customers.contact_name, orders.order_date
from orders inner join customers on 
orders.customer_id = customers.customer_id;

--left join  returns all rows from left table and rows from other table 
-- where joined condition is satisfied 
-- if no records found in right table it will return null
