using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Atl_Inv_DataAccess;

public partial class EmployeeInfoSetup
{
    [Key]
    public int EmpId { get; set; }

    public string? EmpNo { get; set; }

    public string? EmpName { get; set; }
}
