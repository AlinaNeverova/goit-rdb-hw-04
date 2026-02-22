-- p3

USE mydb;

select 
    o.*,
    c.*,
    e.*,
    sh.*,
    od.*,
    p.*,
    cat.*,
    s.*
from orders o
inner join customers c on c.id = o.customer_id
inner join employees e on e.employee_id = o.employee_id
inner join shippers sh on sh.id = o.shipper_id
inner join order_details od on od.order_id = o.id
inner join products p on od.product_id = p.id
inner join categories cat on p.category_id = cat.id
inner join suppliers s on p.supplier_id = s.id


-- p4

-- Визначте, скільки рядків ви отримали (за допомогою оператора COUNT).

USE mydb;

select 
count(*)
from orders o
inner join customers c on c.id = o.customer_id
inner join employees e on e.employee_id = o.employee_id
inner join shippers sh on sh.id = o.shipper_id
inner join order_details od on od.order_id = o.id
inner join products p on od.product_id = p.id
inner join categories cat on p.category_id = cat.id
inner join suppliers s on p.supplier_id = s.id


-- Змініть декілька операторів INNER на LEFT чи RIGHT. 

USE mydb;

select 
count(*)
from orders o
inner join customers c on c.id = o.customer_id
left join employees e on e.employee_id = o.employee_id
right join shippers sh on sh.id = o.shipper_id
inner join order_details od on od.order_id = o.id
left join products p on od.product_id = p.id
right join categories cat on p.category_id = cat.id
inner join suppliers s on p.supplier_id = s.id


-- оберіть тільки ті рядки, де employee_id > 3 та ≤ 10.

USE mydb;

select 
    o.*,
    c.*,
    e.*,
    sh.*,
    od.*,
    p.*,
    cat.*,
    s.*
from orders o
inner join customers c on c.id = o.customer_id
inner join employees e on e.employee_id = o.employee_id
inner join shippers sh on sh.id = o.shipper_id
inner join order_details od on od.order_id = o.id
inner join products p on od.product_id = p.id
inner join categories cat on p.category_id = cat.id
inner join suppliers s on p.supplier_id = s.id
WHERE o.employee_id > 3 and o.employee_id <= 10


/* Згрупуйте за іменем категорії, порахуйте кількість рядків у групі, 
середню кількість товару (кількість товару знаходиться в order_details.quantity) */

USE mydb;

select 
    cat.name as category_name, 
    count(*) as row_cnt,
    avg(od.quantity) as avg_prod_cnt
from orders o
inner join customers c on c.id = o.customer_id
inner join employees e on e.employee_id = o.employee_id
inner join shippers sh on sh.id = o.shipper_id
inner join order_details od on od.order_id = o.id
inner join products p on od.product_id = p.id
inner join categories cat on p.category_id = cat.id
inner join suppliers s on p.supplier_id = s.id
group by 1


-- Відфільтруйте рядки, де середня кількість товару більша за 21.

USE mydb;

select 
	cat.name as category_name, 
	count(*) as row_cnt,
	avg(od.quantity) as avg_prod_cnt
from orders o
inner join customers c on c.id = o.customer_id
inner join employees e on e.employee_id = o.employee_id
inner join shippers sh on sh.id = o.shipper_id
inner join order_details od on od.order_id = o.id
inner join products p on od.product_id = p.id
inner join categories cat on p.category_id = cat.id
inner join suppliers s on p.supplier_id = s.id
group by 1
having avg_prod_cnt > 21


-- Відсортуйте рядки за спаданням кількості рядків.

USE mydb;

select 
	cat.name as category_name, 
	count(*) as row_cnt,
	avg(od.quantity) as avg_prod_cnt
from orders o
inner join customers c on c.id = o.customer_id
inner join employees e on e.employee_id = o.employee_id
inner join shippers sh on sh.id = o.shipper_id
inner join order_details od on od.order_id = o.id
inner join products p on od.product_id = p.id
inner join categories cat on p.category_id = cat.id
inner join suppliers s on p.supplier_id = s.id
group by 1
having avg_prod_cnt > 21
order by row_cnt desc


-- Виведіть на екран (оберіть) чотири рядки з пропущеним першим рядком.

USE mydb;

select 
	cat.name as category_name, 
	count(*) as row_cnt,
	avg(od.quantity) as avg_prod_cnt
from orders o
inner join customers c on c.id = o.customer_id
inner join employees e on e.employee_id = o.employee_id
inner join shippers sh on sh.id = o.shipper_id
inner join order_details od on od.order_id = o.id
inner join products p on od.product_id = p.id
inner join categories cat on p.category_id = cat.id
inner join suppliers s on p.supplier_id = s.id
group by 1
having avg_prod_cnt > 21
order by row_cnt desc
limit 4 offset 1