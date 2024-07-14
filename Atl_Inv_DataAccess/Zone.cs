using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_DataAccess;

public partial class Zone
{
    [Key]
    public int ZoneId { get; set; }

    public string? ZoneName { get; set; }

    public int? AddedBy { get; set; }

    public int? UpdatedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public DateTime? UpdatedDate { get; set; }

    public string? Remarks { get; set; }

    public string? TrackZoneId { get; set; }


    public int? TerritorySetupDT_Id { get; set; }

    [ForeignKey("TerritorySetupDT_Id")]
    public virtual SetupDt_Data SetupDt_Data { get; set; }


  //  public virtual ICollection<CompanyInfo> CompanyInfos { get; set; } = new List<CompanyInfo>();
}
