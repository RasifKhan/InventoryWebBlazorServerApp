using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.Design;
namespace Atl_Inv_Model;

public partial class QuotationDtDTO
{
    public int QuotationDtId { get; set; }
    public int? QuotationId { get; set; }
    public virtual QuotationMTDTO? QuotationMT { get; set; }
    public string? QuotationNo { get; set; }



    [Range(1, int.MaxValue, ErrorMessage = "Product is required")]
    public int ProductId { get; set; }
    public virtual ProductInfoSetupDTO? ProductInfoSetup { get; set; }


    public string? ProductName => ProductInfoSetup?.ProductName;
    /* 
    Note about the ProductName property : This property added to pull ProductName from "public virtual ProductInfoSetupDTO? ProductInfoSetup { get; set; }".
    And point to be noted this is especially created for Syncfusion DataGrid dropdown,
    while loading QuotationDt form for the very first time the form laods with data in grig
    but it loads value(id) in dropdown(ProductName) instead of text(name). To fix this problem this property(ProductName) is created.
    */
    //public int Quantity { get; set; } = 1;

    private int? _quantity;
    public int Quantity
    {
        get => _quantity ?? 1;
        set => _quantity = value;
    }

    [Range(1, int.MaxValue, ErrorMessage = "Price is required")]
    public decimal UnitPrice { get; set; }=0.00M;
    public decimal? TotalPrice => UnitPrice * Quantity;
    public decimal VatPercent { get; set; } = 0.00M;

    
    //public decimal? VatPercent
    //{
    //    get => VatPercent ?? 0;
    //    set => VatPercent = value;
    //}
    // public decimal VatAmount { get; set; }


    public decimal? VatAmount => ((UnitPrice * Quantity) * VatPercent) / 100;


    public decimal TaxPercent { get; set; } = 0.00M;
    public decimal? TaxAmount => ((UnitPrice * Quantity) * TaxPercent) / 100;

    public decimal AtiPercent { get; set; } = 0.00M;
    public decimal? AtiAmount => ((UnitPrice * Quantity) * AtiPercent) / 100;

    public decimal OtherPercent { get; set; }=0.00M;
    public decimal? OtherAmount => ((UnitPrice * Quantity) * OtherPercent) / 100;

 //   public string? OtherRemarks { get; set; }
    public string OtherRemarks { get; set; } = "N/A";



    public string? AddedBy { get; set; }

    public DateTime? AddedDate { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedDate { get; set; }



  //  public bool IsNew { get; set; }
}



