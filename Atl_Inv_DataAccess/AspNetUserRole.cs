using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_DataAccess;

public partial class AspNetUserRole
{

    [Key]

    //[Required(ErrorMessage = "UUID is required.")]
    //[RegularExpression(@"^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$",
    //                       ErrorMessage = "Invalid UUID format.")]
    public String UserId { get; set; }

    //[Required(ErrorMessage = "UUID is required.")]
    //[RegularExpression(@"^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$",
    //                      ErrorMessage = "Invalid UUID format.")]
    public String RoleId { get; set; }



    //[Key]
    //public Guid UserId { get; set; }

    //public Guid RoleId { get; set; }

}
