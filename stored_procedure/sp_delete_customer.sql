
--FK -> cascade delete

create or alter proc SP_DeleteCustomer
@customerId int
as begin 
delete customerTbl where customer_id=@customerId
end