

create or alter proc SP_Transaction
@accountId int,
@transactionTypeId int,
@amountOfMoney decimal(18,2)
as begin
declare @amount decimal(18,2)
set @amount=(select account_balance from AccountTbl )
if(@transactionTypeId = 1)
begin
update AccountTbl set account_balance=(account_balance+@amountOfMoney) where account_id = @accountId
end
else begin 
if( @amount >= @amountOfMoney)
begin
update AccountTbl set account_balance=(account_balance-@amountOfMoney) where account_id = @accountId
end
end
end

select * from transactionsTbl