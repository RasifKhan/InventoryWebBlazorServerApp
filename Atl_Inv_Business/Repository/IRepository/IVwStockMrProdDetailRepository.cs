using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IVwStockMrProdDetailRepository
    {
        public Task<VwStockMrProdDetailDTO> Get(int StockId);
        public Task<IEnumerable<VwStockMrProdDetailDTO>> GetAll();
    }
}
