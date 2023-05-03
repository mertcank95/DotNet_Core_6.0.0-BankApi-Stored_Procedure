

create or alter proc SP_InsertCustomer
@customerName nvarchar(50),
@customerLastName nvarchar(50),
@customerAddress nvarchar(100),
@customerEmail nvarchar(50)
as begin
insert into customerTbl 
(customer_name,customer_lastname,customer_address,customer_email,created_at)
values
(@customerName,@customerLastName,@customerAddress,@customerEmail,GETDATE())
END

EXEC SP_InsertCustomer 'MERTCAN','kiratli','ankara/turkey','kiratli@gmail.com'

select * from customerTbl