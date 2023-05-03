using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.DataTransferObject
{
    public class CustomerDto
    {
        public string? CustomerName { get; set; }
        public string? CustomerLastName { get; set; }
        public string? CustomerAddress { get; set; }
        public string? CustomerEmail { get; set; }

    }
}
