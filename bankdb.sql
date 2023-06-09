USE [BankDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountTbl]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTbl](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[account_number] [nvarchar](50) NOT NULL,
	[account_type_id] [int] NOT NULL,
	[account_balance] [decimal](18, 2) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_AccountTbl] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[accountTypeTable]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accountTypeTable](
	[account_type_id] [int] IDENTITY(1,1) NOT NULL,
	[account_type_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_accountTypeTable] PRIMARY KEY CLUSTERED 
(
	[account_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customerTbl]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerTbl](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](50) NOT NULL,
	[customer_lastname] [nvarchar](50) NOT NULL,
	[customer_address] [nvarchar](100) NULL,
	[customer_email] [nvarchar](50) NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_customerTbl] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[moneyTransferTbl]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[moneyTransferTbl](
	[transfer_id] [int] IDENTITY(1,1) NOT NULL,
	[sender_number] [nvarchar](11) NOT NULL,
	[recipient_number] [nvarchar](11) NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_moneyTransferTbl] PRIMARY KEY CLUSTERED 
(
	[transfer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionsTbl]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionsTbl](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[transaction_type_id] [int] NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_transactionsTbl] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionTypeTbl]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionTypeTbl](
	[transaction_type_id] [int] IDENTITY(1,1) NOT NULL,
	[transaction_type_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_transactionTypeTbl] PRIMARY KEY CLUSTERED 
(
	[transaction_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountTbl] ADD  CONSTRAINT [DF_AccountTbl_account_balance]  DEFAULT ((0)) FOR [account_balance]
GO
ALTER TABLE [dbo].[moneyTransferTbl] ADD  CONSTRAINT [DF_moneyTransferTbl_amount]  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[transactionsTbl] ADD  CONSTRAINT [DF_transactionsTbl_amount]  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[AccountTbl]  WITH CHECK ADD  CONSTRAINT [FK_AccountTbl_accountTypeTable] FOREIGN KEY([account_type_id])
REFERENCES [dbo].[accountTypeTable] ([account_type_id])
GO
ALTER TABLE [dbo].[AccountTbl] CHECK CONSTRAINT [FK_AccountTbl_accountTypeTable]
GO
ALTER TABLE [dbo].[AccountTbl]  WITH CHECK ADD  CONSTRAINT [FK_AccountTbl_customerTbl] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customerTbl] ([customer_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccountTbl] CHECK CONSTRAINT [FK_AccountTbl_customerTbl]
GO
ALTER TABLE [dbo].[transactionsTbl]  WITH CHECK ADD  CONSTRAINT [FK_transactionsTbl_AccountTbl] FOREIGN KEY([account_id])
REFERENCES [dbo].[AccountTbl] ([account_id])
GO
ALTER TABLE [dbo].[transactionsTbl] CHECK CONSTRAINT [FK_transactionsTbl_AccountTbl]
GO
ALTER TABLE [dbo].[transactionsTbl]  WITH CHECK ADD  CONSTRAINT [FK_transactionsTbl_transactionTypeTbl] FOREIGN KEY([transaction_type_id])
REFERENCES [dbo].[transactionTypeTbl] ([transaction_type_id])
GO
ALTER TABLE [dbo].[transactionsTbl] CHECK CONSTRAINT [FK_transactionsTbl_transactionTypeTbl]
GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerList]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[SP_CustomerList]
as begin
select * from customerTbl
end
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteAccount]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   proc [dbo].[SP_DeleteAccount]
@accountId int
as begin 
delete AccountTbl where account_id=@accountId
end
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCustomer]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--FK -> cascade delete

create   proc [dbo].[SP_DeleteCustomer]
@customerId int
as begin 
delete customerTbl where customer_id=@customerId
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetByNameCustomer]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create   proc [dbo].[SP_GetByNameCustomer]
@name nvarchar(50)
as 
begin
select * from customerTbl where customer_name like '%'+@name+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertAccount]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[SP_InsertAccount]
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
 RAISERROR ('Kayıt bulunamadı!', 16, 1)
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomer]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   proc [dbo].[SP_InsertCustomer]
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

GO
/****** Object:  StoredProcedure [dbo].[SP_SortDatetime]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   proc  [dbo].[SP_SortDatetime] 
as
begin
select * from customerTbl  
order by convert(datetime,created_at) desc
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Transaction]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   proc [dbo].[SP_Transaction]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCustomer]    Script Date: 3.05.2023 18:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create    proc [dbo].[SP_UpdateCustomer]
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
GO
