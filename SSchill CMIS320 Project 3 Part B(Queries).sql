/* Retrieve all of Customers Info */
SELECT Customer_ID AS ACCOUNT_NUMBER, First_name, Last_name, Street, City, Zip
FROM CUSTOMER ORDER BY Customer_ID;


/*Retrieve all videos rented in the last 30 days and sort in chronological order*/ 

select* From Movie, Inventory, Rental
Where Movie.Movie_ID = Inventory.Movie_ID and Inventory.Serial# = Rental.Serial#;

select m.title, r.rental_date
  from movie m
  join inventory i
    on m.movie_id = i.movie_id
  join rental r
    on i.serial# = r.serial#
 where r.rental_date >= to_char(trunc(sysdate) - 30, 'YYYY-MM-DD')
 order by r.rental_date;
 
 /*List of Distributors and their information in order by name*/
 
SELECT * FROM Distributor
order by Name;

/*Update customer name*/

Update Customer
Set Last_Name = 'Bologne'
where Customer_ID = 'TM5078464';

/*Delete Customer from database */
Delete from Rental
where Customer_ID = 'MR4501070';

Delete from Customer
where Customer_ID = 'MR4501070';

/*I'm unsure how to use the rollback function in this scenario*/
