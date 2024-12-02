#1. Create a table called employees with the following structure
use world;
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name varchar(50) NOT NULL,
    age INT CHECK (age >= 18),
    email varchar(100) UNIQUE,
    salary DECIMAL DEFAULT 30000
);

#2.Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
#examples of common types of constraints.
#Ans. Constrains rules out the possiblity of errors and makes sure data is in vaild form and reliable. It also helps prevent the duplicacy of data
#examples - not null, unique, primary key

#3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
#Ans. Not null constraint is applied to ensure that a the column always contains a value and cannot be null.
# No Primary Key cannot contain null value and it is the unique identifier in the table. 

#4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
# Steps and example - 
# adding a constraint

alter table employees add constraint emp_cs unique(email);  

#removing constraints

alter table employees drop constraint emp_cs;

#5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.
#Ans. If we try to attempt to insert data that it violates constraints the output will throw and error and will not accept the invalid value.
#Example - 
insert into employees values
(1, "Rahul", 16, "rahul@xyz", 40000);
#The above query throws an error saying check constraint is violated

#6. You created a products table without constraints as follows:
#The product_id should be a primary keyQ
#The price should have a default value of 50.00

CREATE TABLE products (

    product_id INT,

    product_name VARCHAR(50),

    price DECIMAL(10, 2));
    
alter table products add constraint primary key(product_id);
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;

#7 Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

select * from students;
select * from classes;
select class_id, student_name, class_name from students inner join classes
on classes.class_id = students.class_id;

#8 Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order

SELECT order_id,Customers.customer_name,product_name
FROM Products
INNER JOIN Orders ON Products.order_id = Orders.order_id
LEFT JOIN Customers ON orders.customer_id = customers.customer_id;

#9 Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

SELECT p.product_name, SUM(s.amount) total_sales
FROM sales
INNER JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;

#10 Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.

select order_id, customer_name, quantity
from orders
inner join customers on orders.customer_id =  customers.customer_id
inner join order_details on orders.order_id = order_details.order_id;

#List all details of actors
use mavenmovies;
select * from actor;

#List all customer information from DB
select * from customer;

#List different countries.
select country from country;

#Display all active customers.
select * from customer
where active = 1;

#List of all rental IDs for customer with ID 1.
select rental_id from rental
where staff_id = 1;

#Display all the films whose rental duration is greater than 5 .
select title from film
where rental_duration > 5;

# List the total number of films whose replacement cost is greater than $15 and less than $20.
select count(*) as Count from film
where replacement_cost between 15 and 20;

 #Display the count of unique first names of actors.
 select count(distinct(first_name)) as unique_count
 from actor;
 
 #Display the first 10 records from the customer table .
 Select * from customer
 upper limit 10;
 
 # Display the first 3 records from the customer table whose first name starts with ‘b’.
 select * from customer
 where first_name like 'b%'
 limit 3;
 
 #Display the names of the first 5 movies which are rated as ‘G’.
 select title from film
 where rating = 'G'
 limit 5;
 
 #Find all customers whose first name starts with "a".
 select * from customer
 where first_name like 'a%' ;
 
 #Find all customers whose first name ends with "a".
 select * from customer
 where first_name like '%a' ;
 
 #Display the list of first 4 cities which start and end with ‘a
 select * from city
 where city like 'a%' and city like '%a'
 limit 4;
 
 #Find all customers whose first name have "NI" in any position.
 select * from customer
 where first_name like '%NI%';
 
 #Find all customers whose first name have "r" in the second position .
 select * from customer
 where first_name like '_r%';
 
 # Find all customers whose first name starts with "a" and are at least 5 characters in length.
 select * from customer
 where first_name like 'a%' and
 length(first_name >=5);
 
 #Find all customers whose first name starts with "a" and ends with "o".
 select * from customer
 where first_name like 'a%o';
 
 #Get the films with pg and pg-13 rating using IN operator.
 select * from film
 where rating in('pg', 'pg-13');
 
 #Get the films with length between 50 to 100 using between operator.
 select * from film
 where length between 50 and 100;
 
 #Get the top 50 actors using limit operator.
 select * from actor
 limit 50;
 
 #Get the distinct film ids from inventory table.
 select distinct film_id from inventory;
 
#Retrieve the total number of rentals made in the Sakila database.
#Hint: Use the COUNT() function.
use sakila;
select count(*) as Total_count from rental;

#Find the average rental duration (in days) of movies rented from the Sakila database.
#Hint: Utilize the AVG() function.
select avg(rental_duration) as avg_days from film;

#Display the first name and last name of customers in uppercase.
#Hint: Use the UPPER () function.
select upper(first_name), upper(last_name)
from customer;

#Extract the month from the rental date and display it alongside the rental ID.
#Hint: Employ the MONTH() function.
select rental_id, month(rental_date) as rental_month
from rental;

#Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
#Hint: Use COUNT () in conjunction with GROUP BY.
select customer_id, COUNT(rental_id) as rental_count
from rental
group by customer_id;

#Find the total revenue generated by each store.
#Hint: Combine SUM() and GROUP BY.
select s.store_id, SUM(py.amount) AS total_revenue
from payment py
join staff st on py.staff_id = st.staff_id
join store s on st.store_id = s.store_id
group by s.store_id;


#Determine the total number of rentals for each category of movies.
#Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY
select c.category_id, COUNT(r.rental_id) as total_rentals
from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by c.category_id;

#Find the average rental rate of movies in each language.
#Hint: JOIN film and language tables, then use AVG () and GROUP BY.
select name as language, avg(rental_rate) as average_rental_rate
from film f
join language l on f.language_id = l.language_id
group by name;

#Display the title of the movie, customer s first name, and last name who rented it.
#Hint: Use JOIN between the film, inventory, rental, and customer tables.
select title, first_name, last_name
from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
join customer c on r.customer_id = c.customer_id;

#Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
#Hint: Use JOIN between the film actor, film, and actor tables
select first_name, last_name
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
where f.title = 'Gone with the Wind';

#Retrieve the customer names along with the total amount they've spent on rentals.
#Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
select first_name, last_name, sum(amount) as total_spent
from customer cs
join payment py on cs.customer_id = py.customer_id
join rental r on py.rental_id = r.rental_id
group by cs.customer_id, cs.first_name, cs.last_name;

#Display the top 5 rented movies along with the number of times they've been rented.
#Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
select f.title, count(r.rental_id) as rental_count
from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.film_id
order by rental_count desc
limit 5;

#Rank the customers based on the total amount they've spent on rentals.
select first_name, last_name, sum(amount) as Total_amount, dense_rank() over (order by sum(amount) desc) as rank_
from customer c
join payment p on c.customer_id = p.customer_id
group by first_name, last_name
order by rank_;

#Determine the average rental duration for each film, considering films with similar lengths.
select f.title, floor(f.length / 10) * 10 as length_range, avg(f.rental_duration) as avg_rental_duration
from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by length_range, f.title
order by length_range, f.title;

# Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, count(r.rental_id) as total,
avg(count(r.rental_id)) over () as avg_rentals, count(r.rental_id) - avg(count(r.rental_id)) over () as difference
from customer c
join rental r on c.customer_id = r.customer_id
group by c.customer_id, c.first_name, c.last_name
order by difference desc;

#Find the monthly revenue trend for the entire rental store over time.
select year(p.payment_date) as year, month(p.payment_date) as month, sum(p.amount) as total_revenue
from payment p
group by year(p.payment_date), month(p.payment_date)
order by year(p.payment_date), month(p.payment_date);


# Identify the customers whose total spending on rentals falls within the top 20% of all customers
with customer_spending as (
    select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, sum(p.amount) as total_spending,
	percent_rank() over (order by sum(p.amount) desc) as spending
    from customer c
    join rental r on c.customer_id = r.customer_id
    join payment p on r.rental_id = p.rental_id
    group by c.customer_id, c.first_name, c.last_name
)
select customer_id, customer_name, total_spending
from customer_spending
where spending <= 0.2
order by total_spending desc;

# Calculate the running total of rentals per category, ordered by rental count.
select c.name as category_name, f.title as film_title, count(r.rental_id) as rental_count,
sum(count(r.rental_id)) over (partition by c.category_id order by count(r.rental_id) desc) as running_total
from category c
join film_category fc on c.category_id = fc.category_id
join film f on fc.film_id = f.film_id
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by c.category_id, c.name, f.title
order by c.category_id, rental_count desc;

#Find the films that have been rented less than the average rental count for their respective categories.
with category_rentals as (
    select c.category_id, c.name as category_name, f.title as film_title, count(r.rental_id) as rental_count,
    avg(count(r.rental_id)) over (partition by c.category_id) as avg_count
    from category c
    join film_category fc on c.category_id = fc.category_id
    join film f on fc.film_id = f.film_id
    join inventory i on f.film_id = i.film_id
    join rental r on i.inventory_id = r.inventory_id
    group by c.category_id, c.name, f.title
)
select category_name, film_title, rental_count, avg_count
from category_rentals
where rental_count < avg_count
order by category_name, rental_count;

#Identify the top 5 months with the highest revenue and display the revenue generated in each month.
select year(p.payment_date) as year, month(p.payment_date) as month, sum(p.amount) as total_revenue
from payment p
group by year(p.payment_date), month(p.payment_date)
order by total_revenue desc
limit 5;

#Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
#Ans. Atomicity states that a single cell cannot hold multiple values. It must hold only a single-valued attribute. Lets take customer table 
#if the email column in the customer table contains multiple email addresses for some customers it violates 1NF
# To Normalize - Split the email addresses into individual rows using a new table that associates multiple emails with a single customer.

#Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.

#Ans. Lets take film_actor table as it satisfies 2NF because - 
# 1.It is already in 1NF (all columns have atomic values, and rows are unique).
# 2.Every non-key column must depend on the entire primary key, not just part of it.
#Lets take rental table for example as it violated 2NF because - The column store_id depends on inventory_id, not on the primary key rental_id.
#This creates a partial dependency, breaking 2NF.
# How to fix - 
# 1.Split the rental table into:
# A table for rental details.
# A new table to map inventory_id to store_id.
# 2.When you need the store_id for a rental, you’ll join the rental table with the inventory_store table:

# Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.
#Ans. Payment table in Sakiila violates 3NF because there is a transitive dependency:
#Customer_name depends on customer_id, which in turn depends on the primary key payment_id.
#This violates 3NF because customer_name is indirectly dependent on payment_id through customer_id.
#By removing the transitive dependency the tables will satisfy 3NF

#. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF
#Ans. Lets take customer table - 
#1.Ensure atomic fields:
#Split address into street_address and other relevant components (if applicable).
#2.Establish a primary key:
#Use customer_id as the unique identifier for each record.
#3.Remove partial dependencies:
#Create separate tables for address, city, and country.
#4.Link Tables with Foreign Keys:
#Keep address_id and city_id in the customer table to maintain relationships.

#Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.
with film_language_info as (
    select f.title as film_title, l.name as language_name, f.rental_rate
    from film f
    inner join language l on f.language_id = l.language_id)
select film_title,language_name,rental_rate
from film_language_info;
    
#Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.    
with customer_revenue as (
    select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, sum(p.amount) as total_revenue
    from customer c
    inner join payment p on c.customer_id = p.customer_id
    group by c.customer_id, c.first_name, c.last_name)
select customer_id,customer_name, total_revenue
from customer_revenue
order by total_revenue desc;
    
#Utilize a CTE with a window function to rank films based on their rental duration from the film table.
with film_ranks as (
    select title,rental_duration, dense_rank() over (order by rental_duration desc) as rank_
    from film)
select rank_,title,rental_duration
from film_ranks
order by rank_;

#Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details
with frequent_customers as (
    select r.customer_id, count(r.rental_id) as rental_count
    from rental r
    group by r.customer_id having count(r.rental_id) > 2)
select c.customer_id, concat(c.first_name, ' ', c.last_name) as customer_name, c.email, c.active, fc.rental_count
from frequent_customers fc
inner join customer c on fc.customer_id = c.customer_id;

#Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
with actor_pairs as (
    select fa1.actor_id as actor1_id, fa2.actor_id as actor2_id, fa1.film_id
    from film_actor fa1
    join film_actor fa2 on fa1.film_id = fa2.film_id and fa1.actor_id < fa2.actor_id)
select ap.actor1_id, ap.actor2_id, f.title as film_title
from actor_pairs ap
join film f on ap.film_id = f.film_id
order by ap.actor1_id, ap.actor2_id;


    






 
 













