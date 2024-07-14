using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data.view;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IVwExistingStockProdRepository
    {
       //   public Task<VwExistingStockProdDTO> Get(int StockId);
        public Task<IEnumerable<VwExistingStockProdDTO>> GetAll();
    }
}
