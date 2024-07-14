using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using AutoMapper;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository
{
    public class AspNetUserRoleRepository : IAspNetUserRoleRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;

        public AspNetUserRoleRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        //public Task<AspNetUserRoleDTO> Create(AspNetUserRoleDTO objDTO)
        //{
        //    throw new NotImplementedException();
        //}


        //public async Task<int> RoleAssignToUserSP(string UserId, string RoleId)
        //{
        //    var result = await _db.Database
        //    .ExecuteSqlRawAsync($"SP_RoleAssignToUser {UserId},{RoleId}");
        //    return result;
        //}



        public async Task<int> RoleAssignToUserSP(string UserId, string RoleId)
        {
            var result = await _db.Database
                .ExecuteSqlInterpolatedAsync($"EXEC SP_RoleAssignToUser {UserId}, {RoleId}");
            return result;
        }




        //public async Task RoleAssignToUserSP(Guid userId, Guid roleId)
        //{
        //    var parameters = new[]
        //    {
        //         new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = userId },
        //         new SqlParameter("@RoleId", SqlDbType.UniqueIdentifier) { Value = roleId }
        //    };

        //    await _db.Database.ExecuteSqlRawAsync("EXEC SP_RoleAssignToUser @UserId, @RoleId", parameters);
        //}





        //public async Task<int> RoleAssignToUserSP(string userId, string roleId)
        //{
        //    // Define the SQL command with parameter placeholders
        //    var sql = "EXEC SP_RoleAssignToUser @UserId, @RoleId";

        //    // Log the SQL command for debugging
        //    Console.WriteLine($"Executing SQL: {sql} with UserId: {userId}, RoleId: {roleId}");

        //    // Execute the SQL command with parameters
        //    var result = await _db.Database.ExecuteSqlRawAsync(
        //        sql,
        //        new SqlParameter("@UserId", userId),
        //        new SqlParameter("@RoleId", roleId)
        //    );

        //    return result;
        //}




        //public async Task<int> RoleAssignToUserSP(string UserId, string RoleId)
        //{
        //    var result = await _db.Database
        //        .ExecuteSqlRawAsync($"EXEC SP_RoleAssignToUser @UserId = {UserId}, @RoleId = {RoleId}");
        //    return result;
        //}

        //public async Task<AspNetUserRoleDTO> Create(AspNetUserRoleDTO objDTO)
        //{
        //    var obj = _mapper.Map<AspNetUserRoleDTO, AspNetUserRole>(objDTO);
        //    var addedObj = _db.AspNetUserRoles.Add(obj);
        //    await _db.SaveChangesAsync();
        //    return _mapper.Map<AspNetUserRole, AspNetUserRoleDTO>(addedObj.Entity);
        //}
    }
}
