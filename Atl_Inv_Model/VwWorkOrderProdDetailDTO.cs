using System;
using System.Collections.Generic;
namespace Atl_Inv_Model;
public partial class VwWorkOrderProdDetailDTO
{
        public int WorkOrderId { get; set; }
        public string? WorkOrderNo { get; set; }
        public int ProductId { get; set; }
        public string? ProductName { get; set; }
        public int? QuotationQty { get; set; }
        public int? AvailableQty { get; set; }
        public int? ShortQty { get; set; }
        public int ChallanId { get; set; }
        public int AddedQty { get; set; }
        public int AllChallanProdQty { get; set; }
}
