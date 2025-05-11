-- ćw1 Znajdź top 3 miasta, które miały najwięcej zamówień, ale tylko jeśli ich średnia liczba zwrotów na zamówienie przekracza 20.
select
	delivery_city
	,count(order_id) as total_orders
	,round(avg(order_return),2) as avg_orders
from orders
group by 1
having avg(order_return) > 20
order by 2 desc
limit 3

-- ćw.2 Policz, ile dni średnio trwało dostarczenie zamówienia w każdym stanie i posortuj malejąco.
select 
	delivery_state
	,round(avg(DATEDIFF(shipping_date, order_date)),2) as avg_delivery_duration
from orders
group by 1
order by 2 desc

-- ćw.3 Znajdź top 5 klientów (customer_id), którzy złożyli najwięcej zamówień, i podaj ich liczbę.
select
	customer_id
	,count(order_id) as total_orders
from orders
group by 1
order by 2 desc 
limit 5

-- ćw.4 Oblicz, jaki procent zamówień w każdym trybie wysyłki został zwrócony i posortuj malejąco według tego wskaźnika.
select 
	shipping_mode
	,round((sum(order_return) * 100 / count(order_id)),2) as return_rate
from orders 
group by 1
order by 2 desc

-- ćw.5 
select
	year(order_date) as year_of_order
	,count(order_id) as nr_of_orders
	,LAG(count(order_id)) over (order by year(order_date)) as previous_year_orders
from orders
group by 1
order by 1




