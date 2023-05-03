

create or alter proc SP_DeleteAccount
@accountId int
as begin 
delete AccountTbl where account_id=@accountId
end