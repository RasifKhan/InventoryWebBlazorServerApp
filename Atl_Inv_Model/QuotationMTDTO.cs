using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace Atl_Inv_Model;

public partial class QuotationMTDTO
{
   
    public int QuotationId { get; set; }

    public string? QuotationNo { get; set; }


    [Range(1, int.MaxValue, ErrorMessage = "Please Select Project Type")]
    public int ProjectTypeId_Stdt { get; set; }
    public virtual SetupDt_DataDTO? SetupDt_Data { get; set; }
    public decimal? NetTotal { get; set; } = 0.00M;
    public decimal? GrandTotal { get; set; } = 0.00M;
    public decimal? Discount { get; set; } = 0.00M;
    public decimal? DiscountedTotal { get; set; } = 0.00M;
    public string? Subject { get; set; }
    public string? ProjectName { get; set; }



    [Range(1, int.MaxValue, ErrorMessage = "Please Select Company")]
    public int CompanyId { get; set; }
    public virtual CompanyInfoSetupDTO? CompanyInfoSetup { get; set; }



    [Range(1, int.MaxValue, ErrorMessage = "Please Select Contact Person")]
    public int ContactPersonId { get; set; }
    public virtual ContactPersonInfoSetupDTO? ContactPersonInfoSetup { get; set; }
    public DateTime? ToDate { get; set; }
    public DateTime? ValidityDate { get; set; }

    [Range(1, int.MaxValue, ErrorMessage = "Please Select Currency")]
    public int Currency_Stdt { get; set; }
    public virtual SetupDt_DataDTO? SetupDt_Data_Currency { get; set; }

    [Range(1, int.MaxValue, ErrorMessage = "Please Select To Client Designation")]
    public int ToClientDesigId_Stdt { get; set; }
    public virtual SetupDt_DataDTO? SetupDt_Data_ToClientDesig { get; set; }


    [Range(1, int.MaxValue, ErrorMessage = "Please Select To Status")]
    public int QuotationStatus_Stdt { get; set; }
    public virtual SetupDt_DataDTO? SetupDt_Data_QuotationStatus { get; set; }



    [Range(1, int.MaxValue, ErrorMessage = "Please Select SignedBy")]
    public int SignedById { get; set; }
    public virtual EmployeeInfoSetupDTO? EmployeeInfoSetup { get; set; }
    public ICollection<QuotationDtDTO> QuotationsDt { get; set; }

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }
}
