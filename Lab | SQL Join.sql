	#1 List number of films per category.
select c.name as "category", count(film_id) as "number of films" from sakila.category as c
join sakila.film_category as fc
on c.category_id = fc.category_id
group by c.name
order by count(film_id) desc;
    
    #2 Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from sakila.staff as s 
join sakila.address as a
on s.address_id = a.address_id;
    
	#3 Display the total amount rung up by each staff member in August of 2005.
select s.first_name, sum(amount) from sakila.payment as p
join sakila.staff as s
on p.staff_id = s.staff_id
where (payment_date between "2005-07-31" and "2005-08-31")
group by s.first_name;
    
	#4 List each film and the number of actors who are listed for that film.
select title, count(a.actor_id) as "number_of_actors" from sakila.film as f
join sakila.film_actor as fa
on f.film_id = fa.film_id
join sakila.actor as a
on fa.actor_id = a.actor_id
group by title;

	#5 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select first_name, last_name, sum(amount) as "tolat paid" from sakila.customer as c
join sakila.payment as p
on c.customer_id = p.customer_id
group by first_name, last_name
order by last_name;