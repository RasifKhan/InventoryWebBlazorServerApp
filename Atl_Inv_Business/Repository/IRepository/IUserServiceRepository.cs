using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IUserServiceRepository
    {

       public Task<IdentityUser> GetCurrentUserAsync();
    }
}
