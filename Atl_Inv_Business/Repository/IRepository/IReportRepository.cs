using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IReportRepository
    {
        Task<IEnumerable<ProductInfoSetupDTO>> GetProductReport(string productName);

        Task<IEnumerable<QuotationDtDTO>> GetQuotationReport(string quotationNo);
    }
}
