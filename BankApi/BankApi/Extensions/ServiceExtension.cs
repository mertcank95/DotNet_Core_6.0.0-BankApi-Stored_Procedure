using Microsoft.EntityFrameworkCore;
using Repositories;

namespace BankApi.Extensions
{
   static public class ServiceExtension
    {
       public static void ConfigureSqlContext(this IServiceCollection services
          , IConfiguration configuration) =>
          services.AddDbContext<RepositoryContext>(options =>
              options.UseSqlServer(configuration.GetConnectionString("sqlConnection")));//IoC

        public static void ConfigureResponseCaching(this IServiceCollection services)
            => services.AddResponseCaching();

    }
}
