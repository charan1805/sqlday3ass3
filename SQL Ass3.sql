CREATE DATABASE PracticeExerciseDb;
USE PracticeExerciseDb;

-----------------------------SECTION-1----------------------------------------
create table CompanyInfo
(CId int primary key,
CName nvarchar(50) not null)
insert into CompanyInfo values(1,'SamSung'),(2,'HP'),(3,'Apple'),(4,'Dell'),(5,'Toshiba'),(6,'Redmi')
select * from CompanyInfo

create table ProductInfo
(PId int primary key,
PName nvarchar(50) not null,
PPrice float ,
PMDate date ,
CId int foreign key references CompanyInfo)
select * from ProductInfo
insert into ProductInfo values(101,'Laptop','55000.90','12/12/2023',1),(102,'Laptop','35000.90','12/12/2012',2),
(103,'Mobile','15000.90','12/03/2012',2),(104,'Laptop','13500.90','12/12/2012',3),
(105,'Mobile','65000.90','12/12/2012',3),(106,'Laptop','35000.90','12/12/2012',5),
(107,'Mobile','35000.90','12/01/2012',5),(108,'Earpod','1000.90','12/01/2022',3),(109,'Laptop','85000.90','12/12/2021',6),(110,'Mobile','55000.90','12/12/2020',1)

select  CName , PName,PPrice ,PId,PMDate 
from CompanyInfo 
join ProductInfo on ProductInfo.CId = CompanyInfo.CId 

SELECT PName, CName
FROM ProductInfo 
JOIN CompanyInfo ON ProductInfo.CId = CompanyInfo.CId

SELECT CName, PName
FROM CompanyInfo 
CROSS JOIN ProductInfo 

-----------------------SECTION-2-----------------------------------------

create table product(
PId int primary key,
PQ int not null,
PPrice float not null,
Discount float)

insert into product values(1,5,'2590','2')
insert into product values(2,10,'6309.90','5')
insert into product values (3,7,'1128.89','10')



create function DiscountValue
(@PPrice float,@Discount float)
returns float
as
begin
return (select @PPrice - (@PPrice * @Discount / 100))
end

--details with price after discount
select PId , PPrice, Discount, dbo.DiscountValue(PPrice,Discount) as 'PriceAfterDiscount' from Product 