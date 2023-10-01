using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using WebApiRest.Utilities;

var builder = WebApplication.CreateBuilder(args);

//CORS
var origins = builder.Configuration.GetSection("AllowedHosts").Get<string>();
var misReglasCors = "ReglasCors";
builder.Services.AddCors(option =>
    option.AddPolicy(name: misReglasCors,
    builder =>
    { 
        builder.WithOrigins(origins.Split(";")) // => Este tambien acepta una lista de strings
        .WithMethods("GET","POST","PUT","DELETE")
        .AllowAnyHeader();
    })
);

//JWT
builder.Configuration.AddJsonFile("appsettings.json");
var settings = builder.Configuration.GetSection("settings").Get<Settings>();
var keyBytes = Encoding.UTF8.GetBytes(settings.SecretKey);
builder.Services.AddAuthentication(config =>
{
    config.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    config.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(config =>
{
    config.RequireHttpsMetadata = false; // es para https
    config.SaveToken = true;
    config.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(keyBytes),
        ValidateIssuer = false,
        ValidateAudience = false
    };
});

// Add services to the container.
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//CORS
app.UseCors(misReglasCors);

//JWT
app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

app.Run();
