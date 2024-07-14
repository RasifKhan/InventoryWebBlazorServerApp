using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IAspNetUserRoleRepository
    {
        // public Task<AspNetUserRoleDTO> Create(AspNetUserRoleDTO objDTO);


        //SP_RoleAssignToUser
        public Task<int> RoleAssignToUserSP(string UserId, string RoleId);

        //public Task<int> RoleAssignToUserSP(Guid UserId, Guid RoleId);

        //Task RoleAssignToUserSP(Guid userId, Guid roleId);

    }
}
