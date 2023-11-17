using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using WebApiRest.Utilities;
using WebApiRest.Hubs;

var builder = WebApplication.CreateBuilder(args);

var settings = builder.Configuration.GetSection("settings").Get<Settings>();

//CORS
var misReglasCors = "ReglasCors";
builder.Services.AddCors(option =>
    option.AddPolicy(name: misReglasCors,
    builder =>
    {
        builder.WithOrigins(settings.Origin) // => Este tambien acepta una lista de strings
            .WithMethods("GET", "POST", "PUT", "DELETE")
            .AllowAnyHeader();

        //.WithHeaders("Authorization") // Permitir el encabezado Authorization
        //.AllowCredentials();
    })
);

//JWT
var keyBytes = Encoding.UTF8.GetBytes(settings.SecretKey);
builder.Services.AddAuthentication(config =>
{
    config.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    config.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(config =>
{
    config.RequireHttpsMetadata = settings.HttpsClient; // es para https
    config.SaveToken = false;
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

//SIGNALR
builder.Services.AddSignalR();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

//Crear una nueva carpeta llamada wwwroot
//Guardar una nueva imagen default.png => propiedades => Copiar en el directorio de salida => Copiar siempre
//Recuperar imagenes del wwwroot/Content
app.UseStaticFiles();

//CORS
app.UseCors(misReglasCors);

//JWT
app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

//SIGNALR
app.MapHub<BroadcastHub>("/broadcastHub");

app.Run();
