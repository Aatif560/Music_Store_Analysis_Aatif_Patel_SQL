/*Q1: Who is the senior most employee based on job title ?*/

select * from employee order by levels desc limit 1;

/*Mohan Madan is the senior most employee.*/

/*Q2: Which countries has the most Invoice?*/


select count(billing_country) as c,
	billing_country from invoice group by billing_country
	order by c desc;

/*USA has the most invioce.*/

/*Q3: What are the top 3 values of total Invoice?*/

select total from invoice order by total desc limit 3;

/*23.8 , 19.8 ,18.8 has the top values.*/

/*Q4: Which city has the best customers? We would like to throw a promotional music 
Festival in the city we made the most money. Write a query that returns one city 
that has the highest sum of invioce total. Return both the city name & sum of all 
invoice totals. */

select sum(total) as invoice_total , billing_city
from invoice
group by billing_city
order by invoice_total desc limit 1;

/*Prague has the best customers.*/

/*Q4: Who is the best customer?*/

select  customer.customer_id, customer.first_name,customer.last_name,
	sum(invoice.total) as total 
	from customer
	join invoice on customer.customer_id = invoice.customer_id
	group by customer.customer_id
	order by total desc limit 1;

/*R. Madhav is the best customer.*/

/*Q5: Write a query to return the email ,first name , last name & genre 
of all rock music listeners?*/

select distinct email ,first_name,last_name
from customer 
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
	select track_id from track
	join genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
order by email;









