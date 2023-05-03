using Entities.Contracts;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    public class Account : IEntity
    {
        public int account_id { get; set; }
        public int customer_id { get; set; }
        public string? account_number { get; set; }
        public int account_type_id { get; set; }
        public decimal account_balance { get; set; }
        public DateTime created_at { get; set; }
    }
}
