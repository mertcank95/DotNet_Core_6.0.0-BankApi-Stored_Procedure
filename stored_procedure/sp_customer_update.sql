

create or alter  proc SP_UpdateCustomer
@customerId int,
@customerName nvarchar(50),
@customerLastName nvarchar(50),
@customerAddress nvarchar(100),
@customerEmail nvarchar(50)
as begin
update customerTbl 
set
customer_name = @customerName,
customer_lastname = @customerLastName,
customer_address = @customerAddress,
customer_email = @customerEmail
where customer_id = @customerId
END