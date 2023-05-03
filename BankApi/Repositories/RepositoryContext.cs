using Entities.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;



namespace Repositories
{
    public class RepositoryContext : IdentityDbContext
    {
        
        public RepositoryContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<Customer> Customers { get; set; }

    }
}
