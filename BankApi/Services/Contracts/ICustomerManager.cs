using Entities.DataTransferObject;
using Entities.Models;

namespace Services.Contracts
{
    public interface ICustomerManager
    {
        public Task<List<Customer>> GetCustomerListAsync();
        public Task<int> InsertCustomerAsync(CustomerDto customer);
        public Task<int> UpdateCustomerAsync(Customer customer);
        public Task<int> DeleteCustomerAsync(int Id);
        public Task<List<Customer>> GetByNameCustomerAsync(string name);
        public Task<List<Customer>> GetByDateTimeCustomerAsync();


    }
}
