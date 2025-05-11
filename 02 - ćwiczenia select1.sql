-- ćw.1 Pobierz wszystkie zamówienia złożone w 2021 roku, posortowane malejąco według daty zamówienia.
select
	order_id
	,order_date
from orders
where order_date between date('2021-01-01') and ('2021-12-31')
order by 2 desc;



-- ćw.2 Policz, ile różnych miast znajduje się w bazie zamówień.
select 
	count(distinct(delivery_city)) as nr_of_cities
from orders;



-- ćw.3 Oblicz łączną liczbę zwrotów oraz ich średnią wartość (zaokrągloną do 2 miejsc po przecinku).
select 
	sum(order_return) nr_of_returns
	,round(avg(order_return),2) average_nr_of_returns
from orders;



-- ćw.4 Znajdź datę najwcześniejszego i najpóźniejszego zamówienia.
select
	min(order_date)    as first_orders
	,max(order_date)    as last_orders
from orders



-- ćw.5 ile było zamówień w 2020 roku do każdego stanu
select
	delivery_state
	,count(order_id)
from orders
where shipping_date between date('2020-01-01') and date('2020-12-31')
group by 1
order by 2 desc;



-- ćw.6 Policz, ile zamówień zostało wysłanych w poszczególnych trybach wysyłki.
select 
	shipping_mode
	,count(order_id)	as nr_of_orders
from orders
group by 1
order by 2 asc;

-- ćw. 7 Znajdź miasta, w których liczba zamówień przekroczyła 10.
select 
	delivery_city
	,count(order_id) as nr_of_orders
from orders
group by 1
having count(order_id) > 10
order by 2;

-- ćw.8 Pobierz zamówienia z Teksasu lub Kalifornii, które mają więcej niż 20 zwrotów.
select 
	delivery_state
	,order_id
	,order_return
from orders
where (delivery_state = 'Texas' or delivery_state = 'California') 
and order_return > 20
order by 3;

-- ćw.9 Pobierz 5 najnowszych zamówień.
select 
	order_date
	,order_id
from orders 
order by 1 desc
limit 5;


