

create or alter proc  SP_SortDatetime 
as
begin
select * from customerTbl  
order by convert(datetime,created_at) desc
end