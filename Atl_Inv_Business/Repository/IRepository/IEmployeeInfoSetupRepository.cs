using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IEmployeeInfoSetupRepository
    {
        public Task<EmployeeInfoSetupDTO> Create(EmployeeInfoSetupDTO objDTO);
        public Task<EmployeeInfoSetupDTO> Get(int EmpId);
     //  public Task<CompanyInfoSetupDTO> Update(CompanyInfoSetupDTO objDTO);
     // public Task<int> Delete(int CompanyId);
       public Task<IEnumerable<EmployeeInfoSetupDTO>> GetAll();
    }
}
