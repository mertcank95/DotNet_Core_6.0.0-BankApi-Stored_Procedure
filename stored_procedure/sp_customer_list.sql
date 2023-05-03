


create or alter proc SP_CustomerList
as begin
select account.account_number,accountType.account_type_name,customer_name,customer_lastname,
customer_address,customer_email from customerTbl customer
inner join AccountTbl account on account.customer_id=customer.customer_id
inner join accountTypeTable accountType on accountType.account_type_id=account.account_type_id
end
