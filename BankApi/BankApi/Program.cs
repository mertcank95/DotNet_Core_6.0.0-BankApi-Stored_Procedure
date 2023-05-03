using BankApi.Extensions;
using Microsoft.AspNetCore.Mvc;
using Services;
using Services.Contracts;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddScoped<ICustomerManager, CustomerManager>();


builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddControllers(config =>
{
    config.CacheProfiles.Add("5mins", new CacheProfile() { Duration = 300 });
}).AddApplicationPart(typeof(Presentation.AssemblyReference).Assembly);

builder.Services.ConfigureSqlContext(builder.Configuration);

builder.Services.ConfigureResponseCaching();

var app = builder.Build();


if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseResponseCaching();
app.UseAuthorization();

app.MapControllers();

app.Run();
