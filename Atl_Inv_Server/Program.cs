
using Atl_Inv_Business.Repository;
using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Server.Data;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Syncfusion.Blazor;
using Atl_Inv_Server.Service.IService;
using Atl_Inv_Server.Service;
using Atl_Inv_Model;

// Register Syncfusion license
Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("MzA4ODQyMEAzMjM0MmUzMDJlMzBYMFJPekk4a1JYSjVwVCtPdFYzU3BuTUZtd2FFbURTeER6dkN1cUVpQzBnPQ==");

var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddSyncfusionBlazor();
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();


builder.Services.AddControllers(); // Add support for controllers

// Register DbContext with SQL Server connection string
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("MyDbConnection")));

// Identity configuration
builder.Services.AddIdentity<IdentityUser, IdentityRole>()
    .AddDefaultTokenProviders()
    .AddDefaultUI()
    .AddEntityFrameworkStores<ApplicationDbContext>();

// Register repositories
builder.Services.AddScoped<IZoneRepository, ZoneRepository>();
builder.Services.AddScoped<IContactPersonInfoSetupRepository, ContactPersonInfoSetupRepository>();
builder.Services.AddScoped<ICompInfoSetupRepository, CompInfoSetupRepository>();
builder.Services.AddScoped<ISetupMt_DataRepository, SetupMt_DataRepository>();
builder.Services.AddScoped<ISetupDt_DataRepository, SetupDt_DataRepository>();
builder.Services.AddScoped<IQuotationDtRepository, QuotationDtRepository>();
builder.Services.AddScoped<IProductInfoSetupRepository, ProductInfoSetupRepository>();
builder.Services.AddScoped<IQuotationMTRepository, QuotationMTRepository>();
builder.Services.AddScoped<IEmployeeInfoSetupRepository, EmployeeInfoSetupRepository>();
builder.Services.AddScoped<IWorkOrderRepository, WorkOrderRepository>();
builder.Services.AddScoped<IStockMtRepository, StockMtRepository>();
builder.Services.AddScoped<IStockDtRepository, StockDtRepository>();
builder.Services.AddScoped<IVwStockMrProdDetailRepository, VwStockMrProdDetailRepository>();
builder.Services.AddScoped<IChallanMtRepository, ChallanMtRepository>();
builder.Services.AddScoped<IVwWorkOrderProdDetailRepository, VwWorkOrderProdDetailRepository>();
builder.Services.AddScoped<IVwExistingStockProdRepository, VwExistingStockProdRepository>();
builder.Services.AddScoped<IChallanDtRepository, ChallanDtRepository>();
builder.Services.AddScoped<IReportRepository, ReportRepository>();
builder.Services.AddScoped<IAspNetUserRoleRepository, AspNetUserRoleRepository>();

// Register services
builder.Services.AddHttpContextAccessor();
builder.Services.AddScoped<IUserServiceRepository, UserServiceRepository>();
builder.Services.AddScoped<IFileUpload, FileUpload>();

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

// Add the WeatherForecastService as a singleton
builder.Services.AddSingleton<WeatherForecastService>();

var app = builder.Build();

// Configure the HTTP request pipeline
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

// Add authentication and authorization middleware
app.UseAuthentication();
app.UseAuthorization();

// Map Blazor Hub, fallback page, and controllers
app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.MapControllers(); // Ensure this is present

app.Run();




//using Atl_Inv_Business.Repository;
//using Atl_Inv_Business.Repository.IRepository;
//using Atl_Inv_DataAccess.Data;
//using Atl_Inv_Server.Data;
//using Microsoft.AspNetCore.Components;
//using Microsoft.AspNetCore.Components.Web;
//using Microsoft.EntityFrameworkCore;
//using Microsoft.AspNetCore.Identity;
//using Syncfusion.Blazor;
//using Atl_Inv_Server.Service.IService;
//using Atl_Inv_Server.Service;
//using Atl_Inv_Model;

//// Register Syncfusion license
//Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("MzA4ODQyMEAzMjM0MmUzMDJlMzBYMFJPekk4a1JYSjVwVCtPdFYzU3BuTUZtd2FFbURTeER6dkN1cUVpQzBnPQ==");

//var builder = WebApplication.CreateBuilder(args);

//// Add services to the container
//builder.Services.AddSyncfusionBlazor();
//builder.Services.AddRazorPages();
//builder.Services.AddServerSideBlazor();
//builder.Services.AddControllers(); // Add support for controllers



//// Register DbContext with SQL Server connection string
//builder.Services.AddDbContext<ApplicationDbContext>(options =>
//    options.UseSqlServer(builder.Configuration.GetConnectionString("MyDbConnection")));

//// Identity configuration
//builder.Services.AddIdentity<IdentityUser, IdentityRole>()
//    .AddDefaultTokenProviders()
//    .AddDefaultUI()
//    .AddEntityFrameworkStores<ApplicationDbContext>();

//// Register repositories
//builder.Services.AddScoped<IZoneRepository, ZoneRepository>();
//builder.Services.AddScoped<IContactPersonInfoSetupRepository, ContactPersonInfoSetupRepository>();
//builder.Services.AddScoped<ICompInfoSetupRepository, CompInfoSetupRepository>();
//builder.Services.AddScoped<ISetupMt_DataRepository, SetupMt_DataRepository>();
//builder.Services.AddScoped<ISetupDt_DataRepository, SetupDt_DataRepository>();
//builder.Services.AddScoped<IQuotationDtRepository, QuotationDtRepository>();
//builder.Services.AddScoped<IProductInfoSetupRepository, ProductInfoSetupRepository>();
//builder.Services.AddScoped<IQuotationMTRepository, QuotationMTRepository>();
//builder.Services.AddScoped<IEmployeeInfoSetupRepository, EmployeeInfoSetupRepository>();
//builder.Services.AddScoped<IWorkOrderRepository, WorkOrderRepository>();
//builder.Services.AddScoped<IStockMtRepository, StockMtRepository>();
//builder.Services.AddScoped<IStockDtRepository, StockDtRepository>();
//builder.Services.AddScoped<IVwStockMrProdDetailRepository, VwStockMrProdDetailRepository>();
//builder.Services.AddScoped<IChallanMtRepository, ChallanMtRepository>();
//builder.Services.AddScoped<IVwWorkOrderProdDetailRepository, VwWorkOrderProdDetailRepository>();
//builder.Services.AddScoped<IVwExistingStockProdRepository, VwExistingStockProdRepository>();
//builder.Services.AddScoped<IChallanDtRepository, ChallanDtRepository>();
//builder.Services.AddScoped<IReportRepository, ReportRepository>();
//builder.Services.AddScoped<IAspNetUserRoleRepository, AspNetUserRoleRepository>();

//// Register services
//builder.Services.AddHttpContextAccessor();
//builder.Services.AddScoped<IUserServiceRepository, UserServiceRepository>();
//builder.Services.AddScoped<IFileUpload, FileUpload>();
//builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

//// Add the WeatherForecastService as a singleton
//builder.Services.AddSingleton<WeatherForecastService>();

//var app = builder.Build();

//// Configure the HTTP request pipeline
//if (!app.Environment.IsDevelopment())
//{
//    app.UseExceptionHandler("/Error");
//    app.UseHsts();
//}

//app.UseHttpsRedirection();
//app.UseStaticFiles();

//app.UseRouting();

//// Add authentication and authorization middleware
//app.UseAuthentication();
//app.UseAuthorization();

//// Map Blazor Hub, fallback page, and controllers
//app.MapBlazorHub();
//app.MapFallbackToPage("/_Host");
//app.MapControllers(); // Map the controllers to handle API routes

//app.Run();








//using Atl_Inv_Business.Repository;
//using Atl_Inv_Business.Repository.IRepository;
//using Atl_Inv_DataAccess.Data;
//using Atl_Inv_Server.Data;
//using Microsoft.AspNetCore.Components;
//using Microsoft.AspNetCore.Components.Web;
//using Microsoft.EntityFrameworkCore;
//using Microsoft.AspNetCore.Identity;
//using Syncfusion.Blazor;
//using Atl_Inv_Server.Service.IService;
//using Atl_Inv_Server.Service;
//using Atl_Inv_Model;

//// Syncfusion license registration
//Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("MzA4ODQyMEAzMjM0MmUzMDJlMzBYMFJPekk4a1JYSjVwVCtPdFYzU3BuTUZtd2FFbURTeER6dkN1cUVpQzBnPQ==");

//var builder = WebApplication.CreateBuilder(args);

//// Add services to the container
//builder.Services.AddSyncfusionBlazor();
//builder.Services.AddRazorPages();
//builder.Services.AddServerSideBlazor();
//builder.Services.AddSingleton<WeatherForecastService>();

//// Add Entity Framework DbContext
//builder.Services.AddDbContext<ApplicationDbContext>(options =>
//    options.UseSqlServer(builder.Configuration.GetConnectionString("MyDbConnection")));

//// Add Identity
//builder.Services.AddIdentity<IdentityUser, IdentityRole>()
//    .AddDefaultTokenProviders()
//    .AddDefaultUI()
//    .AddEntityFrameworkStores<ApplicationDbContext>();

//// Add scoped repositories
//builder.Services.AddScoped<IZoneRepository, ZoneRepository>();
//builder.Services.AddScoped<IContactPersonInfoSetupRepository, ContactPersonInfoSetupRepository>();
//builder.Services.AddScoped<ICompInfoSetupRepository, CompInfoSetupRepository>();
//builder.Services.AddScoped<ISetupMt_DataRepository, SetupMt_DataRepository>();
//builder.Services.AddScoped<ISetupDt_DataRepository, SetupDt_DataRepository>();
//builder.Services.AddScoped<IQuotationDtRepository, QuotationDtRepository>();
//builder.Services.AddScoped<IProductInfoSetupRepository, ProductInfoSetupRepository>();
//builder.Services.AddScoped<IQuotationMTRepository, QuotationMTRepository>();
//builder.Services.AddScoped<IEmployeeInfoSetupRepository, EmployeeInfoSetupRepository>();
//builder.Services.AddScoped<IWorkOrderRepository, WorkOrderRepository>();
//builder.Services.AddScoped<IStockMtRepository, StockMtRepository>();
//builder.Services.AddScoped<IStockDtRepository, StockDtRepository>();
//builder.Services.AddScoped<IVwStockMrProdDetailRepository, VwStockMrProdDetailRepository>();
//builder.Services.AddScoped<IChallanMtRepository, ChallanMtRepository>();
//builder.Services.AddScoped<IVwWorkOrderProdDetailRepository, VwWorkOrderProdDetailRepository>();
//builder.Services.AddScoped<IVwExistingStockProdRepository, VwExistingStockProdRepository>();
//builder.Services.AddScoped<IChallanDtRepository, ChallanDtRepository>();
//builder.Services.AddScoped<IReportRepository, ReportRepository>();
//builder.Services.AddScoped<IAspNetUserRoleRepository, AspNetUserRoleRepository>();
//builder.Services.AddScoped<IUserServiceRepository, UserServiceRepository>();
//builder.Services.AddScoped<IFileUpload, FileUpload>();

//// Add AutoMapper
//builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());




//builder.Services.AddCors(options =>
//{
//    options.AddPolicy("CorsPolicy", builder =>
//    {
//        builder.AllowAnyOrigin()
//               .AllowAnyMethod()
//               .AllowAnyHeader();
//    });
//});


//var app = builder.Build();








//app.UseHttpsRedirection();
//app.UseStaticFiles();
//app.UseRouting();
//app.UseAuthentication();
//app.UseAuthorization();

//// Map Blazor hub and fallback
//app.MapBlazorHub();
//app.MapFallbackToPage("/_Host");

//// Map controllers for API endpoints
//app.MapControllers();

//app.Run();



































//using Atl_Inv_Business.Repository;
//using Atl_Inv_Business.Repository.IRepository;
//using Atl_Inv_DataAccess.Data;
//using Atl_Inv_Server.Data;
//using Microsoft.AspNetCore.Components;
//using Microsoft.AspNetCore.Components.Web;
//using Microsoft.EntityFrameworkCore;
//using Microsoft.AspNetCore.Identity;
//using Syncfusion.Blazor;
//using Atl_Inv_Server.Service.IService;
//using Atl_Inv_Server.Service;
//using Atl_Inv_Model;

////New version key for 24...
//Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("MzA4ODQyMEAzMjM0MmUzMDJlMzBYMFJPekk4a1JYSjVwVCtPdFYzU3BuTUZtd2FFbURTeER6dkN1cUVpQzBnPQ ==");
////old version key for 23.1.41
////Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("Mjc3MjQ2M0AzMjMzMmUzMDJlMzBJTWVKNnhLSzBqbUgzeEdCYnkxclRSWGRWSU9iYll3OXlYT2FKNDhRZkk4PQ ==");
//var builder = WebApplication.CreateBuilder(args);
//// Add services to the container.
//builder.Services.AddSyncfusionBlazor();
//builder.Services.AddRazorPages();
//builder.Services.AddServerSideBlazor();
//builder.Services.AddSingleton<WeatherForecastService>();

//builder.Services.AddDbContext<ApplicationDbContext>(options =>
//options.UseSqlServer(builder.Configuration.GetConnectionString("MyDbConnection")));
////builder.Services.AddDefaultIdentity<IdentityUser>()
////    .AddEntityFrameworkStores<ApplicationDbContext>();
//builder.Services.AddIdentity<IdentityUser, IdentityRole>().AddDefaultTokenProviders().AddDefaultUI()
//    .AddEntityFrameworkStores<ApplicationDbContext>();





//builder.Services.AddScoped<IZoneRepository, ZoneRepository>();
//builder.Services.AddScoped<IContactPersonInfoSetupRepository, ContactPersonInfoSetupRepository>();
//builder.Services.AddScoped<ICompInfoSetupRepository, CompInfoSetupRepository>();



//builder.Services.AddScoped<ISetupMt_DataRepository, SetupMt_DataRepository>();
//builder.Services.AddScoped<ISetupDt_DataRepository, SetupDt_DataRepository>();
//builder.Services.AddScoped<IQuotationDtRepository, QuotationDtRepository>();
//builder.Services.AddScoped<IProductInfoSetupRepository, ProductInfoSetupRepository>();
//builder.Services.AddScoped<IQuotationMTRepository, QuotationMTRepository>();
//builder.Services.AddScoped<IEmployeeInfoSetupRepository, EmployeeInfoSetupRepository>();
//builder.Services.AddScoped<IWorkOrderRepository, WorkOrderRepository>();
//builder.Services.AddScoped<IStockMtRepository, StockMtRepository>();
//builder.Services.AddScoped<IStockDtRepository, StockDtRepository>();
//builder.Services.AddScoped<IVwStockMrProdDetailRepository, VwStockMrProdDetailRepository>();
//builder.Services.AddScoped<IChallanMtRepository, ChallanMtRepository>();
//builder.Services.AddScoped<IVwWorkOrderProdDetailRepository, VwWorkOrderProdDetailRepository>();
//builder.Services.AddScoped<IVwExistingStockProdRepository, VwExistingStockProdRepository>();
//builder.Services.AddScoped<IChallanDtRepository, ChallanDtRepository>();

//builder.Services.AddScoped<IReportRepository, ReportRepository>();






//builder.Services.AddScoped<IAspNetUserRoleRepository, AspNetUserRoleRepository>();



//builder.Services.AddHttpContextAccessor();
//builder.Services.AddScoped<IUserServiceRepository, UserServiceRepository>();




//builder.Services.AddScoped<IFileUpload, FileUpload>();
//builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());



//var app = builder.Build();
//// Configure the HTTP request pipeline.

//if (!app.Environment.IsDevelopment())
//{
//    app.UseExceptionHandler("/Error");
//    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
//    app.UseHsts();
//}
//app.UseHttpsRedirection();
//app.UseStaticFiles();
//app.UseRouting();
//app.UseAuthentication();
//app.UseAuthorization();






//app.MapBlazorHub();
//app.MapFallbackToPage("/_Host");

//app.Run();

