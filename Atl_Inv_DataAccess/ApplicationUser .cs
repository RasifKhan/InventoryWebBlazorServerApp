using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;

namespace Atl_Inv_DataAccess;

public partial class ApplicationUser: IdentityUser
{
   // public string Discriminator { get; set; } = null!;
    public string? Name { get; set; }
}
