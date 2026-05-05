-- Online bookstore
create database online_bookstore;
use online_bookstore;
/* Create a table Books with columns: 
o    BookID → INTEGER, PRIMARY KEY 
o    Title → VARCHAR(100), NOT NULL 
o    Author → VARCHAR(50), NOT NULL 
o    ISBN → VARCHAR(20), UNIQUE 
o    Price → DECIMAL(8,2), CHECK(Price > 0) */
create table books(
	BookID int primary key,
	Title varchar(100) not null ,
	Author varchar(50) not null,
	ISBN varchar(20) unique,
	price decimal(8,2) check(price>0)
);
/* Create a table Orders with columns: 
o    OrderID → INTEGER, PRIMARY KEY 
o    BookID → INTEGER, FOREIGN KEY REFERENCES Books(BookID) 
o    OrderDate → DATE, NOT NULL 
o    Quantity → INTEGER, CHECK(Quantity > 0) */
create table orders(
	OrderID int primary key,
	BookID int,
	OrderDate date not null,
	quantity int check(quantity>0),
    foreign key(BookID) references books(BookID)
);
/* ALTER TABLE – Add UNIQUE Constraint 
Scenario: 
The bookstore wants to make sure ISBN is unique for every book.*/
alter table books drop constraint ISBN;
alter table books add constraint ISBN_UNIQUE unique(ISBN);
/*Question 3: INSERT, RETRIEVE & UPDATE with Constraints 
Task: 
•    Insert at least 5 records into the Books table, respecting all constraints. 
•    Retrieve all records to verify entries. 
•    Update the Price or Quantity for a specific record while maintaining the CHECK constraints. */
insert into orders values(100,1,'2026-09-01',2),
						(101,2,'2026-12-28',1),
                        (102,4,'2026-02-28',4);
insert into books(BookID, Title, Author, ISBN, price)
	values(1,'The Wings of Fire','APJ Kalam','ISB1298Z989',199.67),
		  (2,'The Lord of The Rings','ABC','ISB3598Z989',238.67),
          (3,'The Success','Mithran','ISB1271Z989',99.67),
          (4,'My Lost GirlFriend','AP Sam','ISB12y87989',799.67),
          (5,'3 Idiots','Willam','ISB1298Z589',299.67);
set SQL_safe_updates=0;
update  books set price=price+(price*0.1);
select * from books;
select * from orders;
/* Question 4: DELETE vs TRUNCATE 
Scenario: 
The bookstore wants to manage orders by removing some rows or clearing all data. 
Task: 
•    Use DELETE with a WHERE clause to remove specific rows from Orders table. 
•    Use TRUNCATE to remove all rows while keeping table structure intact. 
*/
delete from orders where quantity <2;
select * from orders;
/* Error Code: 1701. Cannot truncate a table referenced in a foreign key constraint (`online_bookstore`.`orders`, CONSTRAINT `orders_ibfk_1`)
truncate books;

alter table orders drop constraint orders_ibfk_1;
alter table orders add constraint orders_fk foreign key(BookID) references books(BookID) on delete cascade;
truncate books;
*/
truncate orders;
select * from orders;
-- to see the constraints 
show create table books;