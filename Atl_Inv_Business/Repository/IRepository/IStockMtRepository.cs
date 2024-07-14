using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IStockMtRepository
    {

        public Task<StockMtDTO> Create(StockMtDTO objDTO,string UserId);
        public Task<StockMtDTO> Update(StockMtDTO objDTO, string UserId);

        public Task<StockMtDTO> Get(int StockId);

        public Task<IEnumerable<StockMtDTO>> GetAll();

        public Task<int> Delete(int StockId);

        public Task<int> GetCountMaterialReceiptNote(string MaterialReceiptNote);
        public Task<int> GetCountMRNChallanNo(string MRNChallanNo);
        public Task<int> GetMaxStockId();


    }
}
