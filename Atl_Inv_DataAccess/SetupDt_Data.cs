using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atl_Inv_DataAccess;

public partial class SetupDt_Data
{
    [Key]
    public int SetupDT_Id { get; set; }

    public string? SetupDT_Data { get; set; }
    public string? Remarks { get; set; }

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }


    public int SetupMT_Id { get; set; }


    [ForeignKey("SetupMT_Id")]
    public virtual SetupMt_Data SetupMt_Data { get; set; }

    //  public SetupMt_DataDTO SetupMt_Data { get; set; }

}









//using System;
//using System.Collections.Generic;
//using System.ComponentModel.DataAnnotations;
//using System.ComponentModel.DataAnnotations.Schema;

//namespace Atl_Inv_DataAccess;

//public partial class SetupDt_Data
//{
//    [Key]
//    public int SetupDT_Id { get; set; }

//    public string? SetupDT_Data { get; set; }
//    public string? Remarks { get; set; }

//    public int? AddedBy { get; set; }

//    public DateTime? AddedDate { get; set; }

//    public int? UpdatedBy { get; set; }

//    public DateTime? UpdatedDate { get; set; }


//    public int SetupMT_Id { get; set; }

//    [ForeignKey("SetupMT_Id")]
//    public virtual SetupMt_Data? SetupMt_Data { get; set; }



//    public SetupMt_DataDTO SetupMt_Data { get; set; }

//}
