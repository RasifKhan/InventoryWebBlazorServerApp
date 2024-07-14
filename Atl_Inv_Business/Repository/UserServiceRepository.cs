
using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace Atl_Inv_Business.Repository
{
    public class UserServiceRepository : IUserServiceRepository
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly UserManager<IdentityUser> _userManager;


        public UserServiceRepository(IHttpContextAccessor httpContextAccessor, UserManager<IdentityUser> userManager)
        {
            _httpContextAccessor = httpContextAccessor;
            _userManager = userManager;
        }

        public async Task<IdentityUser> GetCurrentUserAsync()
        {
            var user = _httpContextAccessor.HttpContext?.User;
            return user == null ? null : await _userManager.GetUserAsync(user);
        }
    }
}

