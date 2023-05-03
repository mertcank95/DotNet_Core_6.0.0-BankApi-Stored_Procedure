using Entities.DataTransferObject;
using Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Services;
using Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentation.Controllers
{
    [ApiController]
    [Route("api/customer")]
    public class CustomerController : ControllerBase
    {

        private readonly ICustomerManager _customerManager;

        public CustomerController(ICustomerManager customerManager)
        {
            _customerManager = customerManager;
        }
        [ResponseCache(Duration = 60)]
        [HttpGet]
        public async Task<List<Customer>> Get()
        {
            return await _customerManager.GetCustomerListAsync();
        }

        [HttpPost]
        public async Task<int> InsertCustomer([FromBody] CustomerDto customer)
        {
            return await _customerManager.InsertCustomerAsync(customer);
        }

        [HttpDelete("{id:int}")]
        public async Task<int> DeleteCustomer([FromRoute(Name = "id")] int id)
        {
            return await _customerManager.DeleteCustomerAsync(id);
        }

        [HttpPut]
        public async Task<int> UpdateCustomer([FromBody] Customer customer)
        {
            return await _customerManager.UpdateCustomerAsync(customer);
        }

        [HttpGet("getname")]
        public async Task<List<Customer>> CustomerByName(string name)
        {
            return await _customerManager.GetByNameCustomerAsync(name);
        }


        [HttpGet("getsort")]
        public async Task<List<Customer>> CustomerBySort()
        {
            return await _customerManager.GetByDateTimeCustomerAsync();
        }


    }
}
