//using System;
//using System.Collections.Generic;
//using System.ComponentModel.DataAnnotations;
//namespace Atl_Inv_Model;




//public partial class WorkOrderDTO
//{
//    public int WorkOrderId { get; set; }
//    public string? WorkOrderNo { get; set; }



//    [Range(1, int.MaxValue, ErrorMessage = "Please Select Quotation No")]
//    public int QuotationId { get; set; }
//    public virtual QuotationMTDTO? QuotationMT { get; set; }
//    public DateTime? WorkOrderDate { get; set; }
//    public DateTime? Deadline { get; set; }



//    public string? Details { get; set; }
//    public string? Currency { get; set; }
//    public decimal? QuotationNetTotal { get; set; }
//    public decimal QuotationGrandTotal { get; set; }
//    private decimal _workOrderAmount;


//    public decimal WorkOrderAmount
//    {
//        get => _workOrderAmount != default(decimal) ? _workOrderAmount : QuotationGrandTotal;
//        set => _workOrderAmount = value;
//    }
//    public string? Remarks { get; set; }
//}


using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
public partial class WorkOrderDTO : IValidatableObject
{
    public int WorkOrderId { get; set; }
    public string? WorkOrderNo { get; set; }
    [Range(1, int.MaxValue, ErrorMessage = "Please Select Quotation No")]
    public int QuotationId { get; set; }
    public virtual QuotationMTDTO? QuotationMT { get; set; }
    public DateTime? WorkOrderDate { get; set; }
    public DateTime? Deadline { get; set; }
    public string? Details { get; set; }
    public string? Currency { get; set; }
    public decimal? QuotationNetTotal { get; set; }
    public decimal QuotationGrandTotal { get; set; }
    private decimal _workOrderAmount;

    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }

    public string? ChallanStatus { get; set; }
    public string? Remarks { get; set; }
    [Range(1, int.MaxValue, ErrorMessage = "Please Enter WorkOrder Amount")]

    //public decimal WorkOrderAmount
    //{
    //    get => _workOrderAmount != default(decimal) ? _workOrderAmount : QuotationGrandTotal;
    //    set => _workOrderAmount = value;
    //}
    public decimal WorkOrderAmount
    {
        get => _workOrderAmount != default(decimal) ? _workOrderAmount : QuotationGrandTotal;
        // set => _workOrderAmount = value != default(decimal) ? value : 0.00M;
        set => _workOrderAmount = Math.Round(value, 2);
    }

    
    //public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    //{
    //    if (WorkOrderAmount < QuotationNetTotal)
    //    {
    //        yield return new ValidationResult("Work order amount cannot be less than quotation net total.");
    //    }
    //}


    public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
    {
        if (QuotationNetTotal.HasValue && WorkOrderAmount < QuotationNetTotal.Value)
        {
            yield return new ValidationResult("Work order amount cannot be less than quotation net total.");
        }
    }
}




