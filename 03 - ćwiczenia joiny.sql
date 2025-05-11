-- ćw 1 INNER JOIN  Pobierz listę wszystkich zamówień (orders) wraz z nazwami klientów (customers).

select
	o.order_id
	,o.customer_id
	,c.customer_name 
from orders o
inner join customers c on o.customer_id = c.customer_id 
order by 1 
limit 10

-- ćw 2 LEFT JOIN Pobierz wszystkie zamówienia (orders), a jeśli były zwrócone, pokaż również ich status (order_returns).
select
	o.order_id 			as total_order
	,o.customer_id		as customer
	,o.shipping_date
	,or2.order_id 		as returned_order
from orders o left join order_returns or2 on o.order_id = or2.order_id 
where shipping_date between date('2020-01-01') and date('2022-12-31')


-- ćw 3 RIGHT JOIN Pobierz wszystkie produkty (products), a jeśli należą do jakiejś grupy (product_groups), pokaż jej nazwę.
select
	p.product_id 
	,p.product_name
	,pr.group_id 
	,pr.product_group
from products p right join product_groups pr on p.group_id = pr.group_id


-- ćw 4 CROSS JOIN  Stwórz kombinacje wszystkich zamówień (orders) i ocen (order_ratings), aby zobaczyć każdą możliwą parę.
select
	o.order_id 
	,r.rating
from orders o 
cross join order_ratings r

-- ćw 5 NATURAL JOIN Połącz produkty (products) z grupami produktów (product_groups) używając NATURAL JOIN.
select 
	p.product_id
	,g.group_id 
	,g.product_group
	,g.category 
from products p
natural join product_groups g

-- ćw 6 UNION Połącz listę zamówień (orders) oraz zwrotów (order_returns), pokazując, które zamówienia są aktywne, a które zwrócone.
select 
	order_id
	,'Active' as status
from orders
union
select 
	order_id
	, 'Returned' as status 
from order_returns


-- ćw 7 UNION ALL  Pobierz pełną listę zamówień i zwrotów, uwzględniając zarówno zamówienia, które nie mają zwrotów, jak i zwroty bez zamówień.















