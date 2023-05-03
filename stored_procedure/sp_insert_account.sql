create or alter proc SP_InsertAccount
@customerId int,
@account_type_id int,
@accountBalance decimal(18,2) =0
as begin
IF EXISTS(SELECT 1 FROM customerTbl WHERE customer_id = @customerId)
	and 
	EXISTS(SELECT 1 FROM accountTypeTable WHERE account_type_id = @account_type_id)
    BEGIN
insert into AccountTbl 
(customer_id,account_number,account_type_id,account_balance,created_at)
values
(@customerId,NEWID(),@account_type_id,@accountBalance,GETDATE())
END
ELSE 
BEGIN
 RAISERROR ('Kayýt bulunamadý!', 16, 1)
END
END
