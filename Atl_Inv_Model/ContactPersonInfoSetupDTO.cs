using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
namespace Atl_Inv_Model;


public partial class ContactPersonInfoSetupDTO
{
    public int ContactPersonId { get; set; }
    [Required(ErrorMessage = "Please Select Contact Person Name")]
    public string? ContPersonName { get; set; }
}














