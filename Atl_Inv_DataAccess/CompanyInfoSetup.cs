using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
namespace Atl_Inv_DataAccess;

public partial class CompanyInfoSetup  
{
    [Key]
    public int CompanyId { get; set; }

    public string? CompanyName { get; set; }
}
