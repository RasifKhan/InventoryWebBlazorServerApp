using Atl_Inv_DataAccess;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Atl_Inv_Model;

public partial class AspNetUserRoleDTO
{

    //[Required(ErrorMessage = "UUID is required.")]
    //[RegularExpression(@"^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$",
    //                      ErrorMessage = "Invalid UUID format.")]
    public string UserId { get; set; }



    //[Required(ErrorMessage = "UUID is required.")]
    //[RegularExpression(@"^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$",
    //                       ErrorMessage = "Invalid UUID format.")]
    public String RoleId { get; set; }



    //public Guid UserId { get; set; }

    //public Guid RoleId { get; set; }



}
