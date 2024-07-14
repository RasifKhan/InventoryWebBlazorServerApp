using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Atl_Inv_Model;

public partial class CompanyInfoSetupDTO
{
   
    public int CompanyId { get; set; }

    [Required(ErrorMessage = "Please fill up Company Name")]
    public string? CompanyName { get; set; }
}
