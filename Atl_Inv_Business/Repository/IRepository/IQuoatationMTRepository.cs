using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IQuotationMTRepository
    {

        public Task<QuotationMTDTO> Create(QuotationMTDTO objDTO ,string UserId);
        public Task<QuotationMTDTO> Update(QuotationMTDTO objDTO, string UserId);

        public Task<QuotationMTDTO> Get(int QuotationId);

        public Task<IEnumerable<QuotationMTDTO>> GetAll();

        public Task<int> Delete(int QuotationId);

        public Task<int> GetCountForQuotationNo(string quotationNo);
        
        public Task<int> GetMaxQuotationId();

        public Task<decimal> UpdateNetGrandTotal(int QuotationId, decimal newNetTotal, decimal newGrandTotal);

        Task<int> UpdateQuotationStatus(int QuotationId);
    }
}
