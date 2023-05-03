using Entities.DataTransferObject;
using Entities.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

using Repositories;
using Services.Contracts;


namespace Services
{
    public class CustomerManager : ICustomerManager
    {
        private readonly RepositoryContext _repository;

        public CustomerManager(RepositoryContext repository)
        {
            _repository = repository;
        }


        public async Task<List<Customer>> GetCustomerListAsync()
        {
            return await _repository.Customers.FromSqlRaw<Customer>("SP_CustomerList").ToListAsync();

        }

        public async Task<int> InsertCustomerAsync(CustomerDto customer)
        {
           
            
            SqlParameter[] parameter =
            {
                new SqlParameter("@customerName", customer.CustomerName),
                new SqlParameter("@customerLastName", customer.CustomerLastName),
                new SqlParameter("@customerAddress", customer.CustomerAddress),
                new SqlParameter("@customerEmail", customer.CustomerEmail)

            };

            var result = await Task.Run(() => _repository.Database
           .ExecuteSqlRawAsync(@"exec SP_InsertCustomer @customerName, @customerLastName, 
                @customerAddress, @customerEmail", parameter.ToArray()));

            return result;
        }


        public async Task<int> DeleteCustomerAsync(int Id)
        {
            return await Task.Run(() => _repository.Database
            .ExecuteSqlInterpolatedAsync($"SP_DeleteCustomer {Id}"));
        }

        public async Task<int> UpdateCustomerAsync(Customer customer)
        {

            SqlParameter[] parameter =
            {
                new SqlParameter("@customerId", customer.customer_id),
                new SqlParameter("@customerName", customer.customer_name),
                new SqlParameter("@customerLastName", customer.customer_lastname),
                new SqlParameter("@customerAddress", customer.customer_address),
                new SqlParameter("@customerEmail", customer.customer_email)

            };

            var result = await Task.Run(() => _repository.Database
           .ExecuteSqlRawAsync(@"exec SP_UpdateCustomer  @customerId, @customerName, @customerLastName, 
                @customerAddress, @customerEmail", parameter.ToArray()));

            return result;
        }

        public async Task<List<Customer>> GetByNameCustomerAsync(string name)
        {
            var param = new SqlParameter("@name", name);

            var customers = await Task.Run(() => _repository.Customers
                          .FromSqlRaw(@"exec SP_GetByNameCustomer @name", param).ToListAsync());
            return customers;

        }

        public async Task<List<Customer>> GetByDateTimeCustomerAsync()
        {
            return await _repository.Customers.FromSqlRaw<Customer>("SP_SortDatetime").ToListAsync();

        }
    }
}
