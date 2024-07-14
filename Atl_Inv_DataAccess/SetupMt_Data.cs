using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Atl_Inv_DataAccess;

public partial class SetupMt_Data
{
    [Key]
    public int SetupMT_Id { get; set; }

    public string? SetupMT_Data { get; set; }

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }

    public string? Remarks { get; set; }

    public virtual ICollection<SetupDt_Data> SetupDt_Data { get; set; } = new List<SetupDt_Data>();
}
