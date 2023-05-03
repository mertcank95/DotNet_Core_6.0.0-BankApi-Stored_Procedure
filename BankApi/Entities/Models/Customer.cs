using Entities.Contracts;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    public class Customer : IEntity
    {
        [Key]
        public int customer_id { get; set; }
        public string? customer_name { get; set; }
        public string? customer_lastname { get; set; }
        public string? customer_address { get; set; }
        public string? customer_email { get; set; }
        public DateTime created_at { get; set; }
    }
}
