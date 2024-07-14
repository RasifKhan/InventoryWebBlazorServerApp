using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Atl_Inv_DataAccess;
public partial class ContactPersonInfoSetup
{
    [Key]
    public int ContactPersonId { get; set; }
    public string? ContPersonName { get; set; }
}
