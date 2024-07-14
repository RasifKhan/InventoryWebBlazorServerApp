using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface ICompInfoSetupRepository
    {
        public Task<CompanyInfoSetupDTO> Create(CompanyInfoSetupDTO objDTO);
        public Task<CompanyInfoSetupDTO> Get(int CompanyId);
     //  public Task<CompanyInfoSetupDTO> Update(CompanyInfoSetupDTO objDTO);
     // public Task<int> Delete(int CompanyId);
      public Task<IEnumerable<CompanyInfoSetupDTO>> GetAll();
    }
}
