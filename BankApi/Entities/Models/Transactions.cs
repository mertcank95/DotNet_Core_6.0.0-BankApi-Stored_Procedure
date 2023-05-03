using Entities.Contracts;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Models
{
    public class Transactions : IEntity
    {
        public int transaction_id { get; set; }
        public int accound_id { get; set; }
        public int transaction_type_id { get; set; }
        public decimal amount { get; set; }
        public DateTime created_at { get; set; }
    }
}
