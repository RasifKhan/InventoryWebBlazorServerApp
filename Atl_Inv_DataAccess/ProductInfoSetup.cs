using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Atl_Inv_DataAccess.Data;

public partial class ProductInfoSetup
{
    [Key]
    public int ProductId { get; set; }

    public string? ProductName { get; set; }

    public string? Description { get; set; }

    public string? ImmageUrl { get; set; }

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }

}
