


create or alter proc SP_GetByNameCustomer
@name nvarchar(50)
as 
begin
select * from customerTbl where customer_name like '%'+@name+'%'
end