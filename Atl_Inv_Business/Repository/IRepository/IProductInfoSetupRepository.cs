using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IProductInfoSetupRepository
    {
        //  public Task<ProductInfoSetupDTO> Create(ProductInfoSetup objDTO);

        //   public Task<ProductInfoSetupDTO> Update(ProductInfoSetupDTO objDTO);
        //   public Task<int> Delete(int ProductId);

        public Task<ProductInfoSetupDTO> Create(ProductInfoSetupDTO objDTO,string UserId);
        public Task<ProductInfoSetupDTO> Get(int ProductId);
        public Task<int> Delete(int Id);
        public Task<IEnumerable<ProductInfoSetupDTO>> GetAll();

        public Task<ProductInfoSetupDTO> Update(ProductInfoSetupDTO objDTO, string UserId);


    }
}
