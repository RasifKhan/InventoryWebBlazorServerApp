using Atl_Inv_Common;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Server.Service.IService;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace Atl_Inv_Server.Service
{
    public class DbInitializer : IDbInitializer
    {

        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ApplicationDbContext _db;

        public DbInitializer(UserManager<IdentityUser> userManager,
                             RoleManager<IdentityRole> roleManager,
                             ApplicationDbContext db)
        {
            _db = db;
            _userManager = userManager;
            _roleManager = roleManager;
        }
        public void Initialize()
        {
            try
            {
                //if (_db.Database.GetPendingMigrations().Count() > 0)
                //{
                //    _db.Database.Migrate();
                //}


                if (!_roleManager.RoleExistsAsync(SD.Role_Admin).GetAwaiter().GetResult())
                {
                    // await _roleManager.CreateAsync(new IdentityRole(SD.Role_Admin));
                    _roleManager.CreateAsync(new IdentityRole(SD.Role_Admin)).GetAwaiter().GetResult();
                    _roleManager.CreateAsync(new IdentityRole(SD.Role_Customer)).GetAwaiter().GetResult();
                }
                else
                {
                    return;
                }
                IdentityUser user = new()
                {
                    UserName = "ecommerceasiantech@gmail.com",
                    Email = "ecommerceasiantech@gmail.com",
                    EmailConfirmed = true
                };
                _userManager.CreateAsync(user, "1234@Atl").GetAwaiter().GetResult();
                _userManager.AddToRoleAsync(user, SD.Role_Admin).GetAwaiter().GetResult();
            }
            catch (Exception ex)
            {

            }
        }
    }
}
