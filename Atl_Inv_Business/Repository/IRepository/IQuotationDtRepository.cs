using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IQuotationDtRepository
    {

        public Task<QuotationDtDTO> Create(QuotationDtDTO objDTO,string UserId);
        public Task<QuotationDtDTO> Update(QuotationDtDTO objDTO, string UserId);
        public Task<IEnumerable<QuotationDtDTO>> GetAll(int? id = null);

        public Task<IEnumerable<QuotationDtDTO>> GetAll2(int? id = null);

        public  Task<decimal> GetNetTotalSum(int quotationId);

        public Task<decimal> GetGrandTotalSum(int quotationId);

        public Task<QuotationDtDTO> Get(int QuotationDtId);

        //   public Task<CategoryDTO> Get(int Id);

        //  public Task<IEnumerable<QuotationDtDTO>> GetAll();

        //   public Task<QuotationDtDTO> Get(int QuotationDtId);

        //  public Task<IEnumerable<QuotationDtDTO>> GetAll();
        public Task<int> Delete(int Id);
    }
}
