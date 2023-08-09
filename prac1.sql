use swiggy;
/*1. Find the customers who have never ordered.
2. Which restaurant has got the most number of orders?
3. Average Price/dish
4. Which restaurant has done the most amount of orders?
5. Which food item has been ordered the most across all restaurants?
6. Find the food item under each restaurant whose amount is the highest.*/
select * from orders;
select * from users;
select * from order_details;
select * from restaurants;
select * from swiggy_complete_data;
select  name from users   where user_id not in(select user_id from orders);

select r_name,count(r_id) as a from swiggy_complete_data GROUP BY r_name order by a desc;

select f_name,count(f_id),amount as b from swiggy_complete_data GROUP BY f_name,amount order by b;

 select r_name,count(r_id)  as a from swiggy_complete_data  order by max(a);
select f_name, count(*) as Total
from swiggy_complete_data
where f_name is not null
group by f_name
order by Total desc;


select r_name, f_name, amount,
first_value(f_name) over(partition by r_name order by amount desc) as Food_Item_Amount
from swiggy_complete_data;



