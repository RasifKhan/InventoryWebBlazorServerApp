using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Atl_Inv_Model;

public partial class EmployeeInfoSetupDTO
{
    public int EmpId { get; set; }

    public string? EmpNo { get; set; }

    [Required(ErrorMessage = "Please fill up Employee Name")]
    public string? EmpName { get; set; }
}
