# Q1 Find the product that has been ordered the most times.

select p.pid, p.name, COUNT(*) AS times_ordered
from Product p
join OrderItem oi
using(pid)
join Contain c
using(itemid)
group by p.pid, p.name
order by times_ordered DESC
limit 1;


#Q2 Find all the orders that were placed for products that are sold by stores in the city of Toronto.

select p.pid,p.name, city 
from product as p
join store as s
using(sid)
where s.city='toronto';

#Q3 Find all the details of the buyers who have a phone number that starts with the contact number 91.
select *
from Users 
join Buyer 
using(userid)
where phoneNumber LIKE '91%';

#Q4 Display the address, starttime and endtime of the service points in the same city as that of  userid 5
SELECT sp.streetaddr AS address,
       sp.startTime,
       sp.endTime
FROM ServicePoint sp
WHERE sp.city = (
    SELECT city
    FROM Address
    WHERE userid = 5
);

#Q5 Display the total quantity of products from store with storeid 8 in the shopping cart

select p.name ,SUM(sc.quantity) AS total_quantity
from Save_to_Shopping_Cart sc
join Product p
using(pid)
where p.sid = 8
group by p.name;

#Q6 Update the payment state of orders to unpaid which were created after year 2017 and with a total amount greater than 50.

update Orders
set paymentState = 'Unpaid'
where creationTime >= '2018-01-01' and totalAmount > 50;
  
#Q7 Update the name and contact phone number of the address where the province is Quebec and city is Montreal.

update Address
set name = 'peter parker', contactPhoneNumber = '495-472-7274'
where province = 'Quebec' and city = 'Montreal';

#Q8 Delete the store which opened before year 2017
delete from Store
where startTime < '2017-01-01';

#Q9 Create a report of all products whose price is above average price using subquery.

select pid,name,brand,type,price
from Product
where price > (select avg(price) from Product);

#Q10 Create a view of all product sales in 201
CREATE VIEW Product_Sales_2016 AS
SELECT p.pid, p.name AS product_name,
	SUM(c.quantity) AS total_quantity_sold,
	SUM(oi.price * c.quantity) AS total_sales
FROM Orders o
JOIN Contain c
    ON o.orderNumber = c.orderNumber
JOIN OrderItem oi
    ON c.itemid = oi.itemid
JOIN Product p
    ON oi.pid = p.pid
WHERE YEAR(o.creationTime) = 2016
GROUP BY p.pid, p.name;

SELECT *
FROM Product_Sales_2016;

#Q11 Retrieve all credit card payments and their associated order information

select *
from Payment p
join CreditCard cc
on p.creditcardNumber = cc.cardNumber
JOIN Orders o
on p.orderNumber = o.orderNumber;

#Q12 Retrieve all stores and their associated managers
SELECT s.sid,
       s.name AS store_name,
       u.userid AS manager_id,
       u.name AS manager_name
FROM Store s
LEFT JOIN Manage m
    ON s.sid = m.sid
LEFT JOIN Seller se
    ON m.userid = se.userid
LEFT JOIN Users u
    ON se.userid = u.userid;
    
#Q13 Query the total quantity of products from store with storeid 8 in the shopping cart using a subquery.

SELECT SUM(quantity) AS total_quantity
FROM Save_to_Shopping_Cart
WHERE pid IN (
    SELECT pid
    FROM Product
    WHERE sid = 8
);
#Q14 Find all sellers who manage more than one store
select u.userid, u.name AS seller_name, COUNT(m.sid) AS stores_managed
from Seller as s
join Users as u
using(userid)
join Manage m
using(userid)
group by u.userid, u.name
having COUNT(m.sid) > 1;

#Q15 Retrieve the names of buyers who have made at least one order and have also left a comment on a product.

select distinct u.userid, u.name 
from buyer as b
join Users as u
using(userid)
join comments as c
using(userid);

# 1 . Display product name, brand, type, and price.
select name,brand,type,price
from product;
  
# 2.Find all products manufactured by Asus.
select name,brand,type,price
from product
where brand='asus';

# 3.Display products whose price is greater than 500.
select name,brand,type,price
from product
where price>500;


# 4.Display the five most expensive products.
select name,brand, type,price
from product
order by price desc
limit 5;

#5.Find users who are both buyers and sellers.
select userid,name,phoneNumber
from users
join seller
using(userid);

#6.Find the maximum and minimum product prices.
select name,price
from product
where price =(select max(price) from product)

union all

select name,price
from product
where price =(select min(price) from product);

#Q7. Display products whose price is between 500 and 2000.
select name,price
from product
where price between 500 and 2000;
 

#8. Count the number of products available under each brand.
select brand, count(amount) AS products_available
from Product
group by brand;

#9.Find the average product price for each brand.
select brand,avg(price) as avg_price_per_brand
from product
group by brand;

# 10 Find the total stock quantity available for each brand.
select brand,sum(amount) as quantity
from product
group by brand;

#11 Display product categories along with the number of products in each category.
select type,count(*) as No_products
from product
group by type;

#12Find brands having more than 10 products.
select brand,count(*) as products 
from product
group by brand
having products>10;

#13 Find the brand with the highest average product price.
select brand , avg(price) as highest_avg_price
from product
group by brand
order by highest_avg_price desc
limit 1;


#14 Display all users who are registered as buyers.
select name,phoneNumber
from users
right join buyer
using(userid);

#15 Display all users who are registered as sellers.
select name,phoneNumber
from users
right join seller
using(userid); 


#16 Display product names along with customer ratings and review comments.
select pid,name,grade,content
from comments	
join product
using(pid);

#17 Find the average rating received by each product.
select name,avg(grade) as Avg_Rating
from comments
join product
using(pid)
group by name;

#18 Find products that have never received any customer reviews.
select name,content
from product
left join comments as c
using(pid)
where c.pid is null;


#19 Find products whose price is greater than the overall average product price.
select name,price
from product
where price >(select avg(price) from product);

#20 Display each order number along with the products included in that order and their quantities.
SELECT o.orderNumber, p.name, c.quantity
FROM Orders o
JOIN Contain c USING(orderNumber)
JOIN OrderItem oi USING(itemid)
JOIN Product p USING(pid);



#21Find the total quantity of products sold for each product.
select name,sum(quantity) as total_quantity
from orderitem
join contain
using(itemid)
join product
using(pid)
group by name;

#22 Rank all products within each brand based on their prices, from highest to lowest, using DENSE_RANK().
select pid,name,price,
dense_rank() over( 
partition by brand
order by price desc) as price_rank
from product;


#23 Find the top three most expensive products in each brand using window functions.
with ranked_products as (
select pid,name,brand,price,
dense_rank() over( 
partition by brand 
order by price desc) as price_rank
from product)
select *
from ranked_products
where price_rank<=3;
 

#24 Find the percentage contribution of each brand to the total number of products.
select brand,COUNT(*) AS total_products,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
from Product
group by brand;

#25 Identify products whose prices are higher than the average price of their respective product categories.
select name,type,price
from product as p
where price >(select avg(price) from product where type = p.type);

#26 Find the most reviewed product using the Comments table.
select name,count(*) total_reviews
from product
join comments
using(pid)
group by name
order by total_reviews desc
limit 1;



#27 Calculate the total order value for each payment status and display the percentage contribution of each status to the overall order value. 
select paymentState,SUM(totalAmount) AS total_order_value,
    ROUND(
        SUM(totalAmount) * 100.0 /
        SUM(SUM(totalAmount)) OVER (),
        2
    ) AS percentage
from Orders
group by paymentState;

#28 Find orders containing products from more than one brand.
select
    c.ordernumber,
    count(distinct p.brand) as total_brands
from contain c
join orderitem oi using(itemid)
join product p using(pid)
group by c.ordernumber
having count(distinct p.brand) > 1;

#29 Find the store with the highest total inventory value.
select s.sid, s.name,
       sum(p.price * p.amount) as inventory_value
from store s
join product p using(sid)
group by s.sid, s.name
order by inventory_value desc
limit 1;

#30 Using a CTE, calculate the average product price for each brand and display only brands whose average price is above the overall average product price.
with brand_avg as (
    select brand, avg(price) as avg_brand_price
    from product
    group by brand
)
select *
from brand_avg
where avg_brand_price > (
    select avg(price) from product
);


#31 Find the total revenue generated by each product category.
select p.type,
       sum(oi.price * c.quantity) as total_revenue
from product p
join orderitem oi using(pid)
join contain c using(itemid)
group by p.type;

#32 Find the total number of products available in each color.
select color, count(*) as total_products
from product
group by color;

#33 Find the highest-priced product under each brand.
select brand, name, price
from product p
where price = (
    select max(price)
    from product
    where brand = p.brand
);

#34 Display all products along with their review counts, including products without reviews.
select p.pid, p.name,
       count(c.pid) as review_count
from product p
left join comments c using(pid)
group by p.pid, p.name;

#35 Display each order with its products and payment status.
select o.ordernumber, p.name,
       c.quantity, o.paymentstate
from orders o
join contain c using(ordernumber)
join orderitem oi using(itemid)
join product p using(pid);

#36 Display buyers who have saved at least one product in their shopping cart.
select distinct u.userid, u.name
from users u
join buyer b using(userid)
join save_to_shopping_cart sc using(userid);

#37 Find the second most expensive product in each category.
with ranked_products as (
    select pid, name, type, price,
           dense_rank() over (
               partition by type
               order by price desc
           ) as price_rank
    from product
)
select *
from ranked_products
where price_rank = 2;

#38 Find customers whose total quantity of cart items is greater than the average cart quantity per buyer.
with buyer_cart as (
    select userid, sum(quantity) as total_cart_quantity
    from save_to_shopping_cart
    group by userid
)
select u.userid, u.name, bc.total_cart_quantity
from buyer_cart bc
join users u using(userid)
where bc.total_cart_quantity > (
    select avg(total_cart_quantity)
    from buyer_cart
);

#39 Display each order with its total number of items and calculated order value.
select o.ordernumber,
       sum(c.quantity) as total_items,
       sum(oi.price * c.quantity) as order_value
from orders o
join contain c using(ordernumber)
join orderitem oi using(itemid)
group by o.ordernumber;

#40 Find buyers who have reviewed products from at least two different brands.
select u.userid, u.name,
       count(distinct p.brand) as total_brands
from users u
join comments c using(userid)
join product p using(pid)
group by u.userid, u.name
having count(distinct p.brand) >= 2;

#41 Find stores whose total inventory value is greater than the average inventory value of all stores.
with store_inventory as (
    select s.sid, s.name,
           coalesce(sum(p.price * p.amount), 0) as inventory_value
    from store s
    left join product p using(sid)
    group by s.sid, s.name
)
select *
from store_inventory
where inventory_value > (
    select avg(inventory_value)
    from store_inventory
);

#42 Display payment details with the buyer's name, bank name, and payment date.
select pa.ordernumber, u.name,
       bc.bank, pa.paytime
from payment pa
join creditcard cc
    on pa.creditcardnumber = cc.cardnumber
join users u
    on cc.userid = u.userid
join bankcard bc
    on cc.cardnumber = bc.cardnumber;

#43 Calculate the number of days taken to deliver each order.
select o.ordernumber,
       o.creationtime,
       d.timedelivered,
       datediff(d.timedelivered, o.creationtime) as delivery_days
from orders o
join deliver_to d using(ordernumber);

#44 Calculate monthly revenue using order-item creation dates.
SELECT
    YEAR(oi.creationTime) AS sales_year,
    MONTH(oi.creationTime) AS sales_month,
    SUM(oi.price * c.quantity) AS monthly_revenue
FROM OrderItem oi
JOIN Contain c ON oi.itemid = c.itemid
GROUP BY YEAR(oi.creationTime), MONTH(oi.creationTime)
ORDER BY sales_year, sales_month;


#45 Calculate cumulative revenue over time, based on order dates.
with daily_revenue as (
    select o.creationtime,
           sum(oi.price * c.quantity) as revenue
    from orders o
    join contain c using(ordernumber)
    join orderitem oi using(itemid)
    group by o.creationtime
)
select creationtime, revenue,
       sum(revenue) over (
           order by creationtime
       ) as cumulative_revenue
from daily_revenue
order by creationtime;

#46 Find the highest-revenue product in each category using a CTE and window function
with product_revenue as (
    select p.pid, p.name, p.type,
           sum(oi.price * c.quantity) as total_revenue
    from product p
    join orderitem oi using(pid)
    join contain c using(itemid)
    group by p.pid, p.name, p.type
),
ranked_products as (
    select *,
           dense_rank() over (
               partition by type
               order by total_revenue desc
           ) as revenue_rank
    from product_revenue
)
select *
from ranked_products
where revenue_rank = 1;

#47 Find each brand's highest-priced product and display its rank using window function
with ranked_products as (
    select pid, name, brand, price,
           dense_rank() over (
               partition by brand
               order by price desc
           ) as price_rank
    from product
)
select *
from ranked_products
where price_rank = 1;

#48 Find the total revenue generated by each product.
select p.pid, p.name,
       sum(oi.price * c.quantity) as total_revenue
from product p
join orderitem oi using(pid)
join contain c using(itemid)
group by p.pid, p.name;

#49 Calculate total inventory value for each store and display stores with inventory value above 50,000.
select s.sid, s.name,
       sum(p.price * p.amount) as inventory_value
from store s
join product p using(sid)
group by s.sid, s.name
having sum(p.price * p.amount) > 50000;

#50 Create a comprehensive product performance report.
with sales as (
    select oi.pid,
           sum(c.quantity) as total_sold,
           sum(oi.price * c.quantity) as total_revenue
    from orderitem oi
    join contain c using(itemid)
    group by oi.pid
),
reviews as (
    select pid,
           count(*) as total_reviews,
           round(avg(grade), 2) as average_rating
    from comments
    group by pid
)
select p.pid, p.name, p.brand, p.type,
       p.price,
       p.amount as available_stock,
       coalesce(s.total_sold, 0) as total_sold,
       coalesce(s.total_revenue, 0) as total_revenue,
       coalesce(r.total_reviews, 0) as total_reviews,
       r.average_rating
from product p
left join sales s using(pid)
left join reviews r using(pid);