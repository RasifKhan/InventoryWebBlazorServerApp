using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository
{
    public class EmployeeInfoSetupRepository : IEmployeeInfoSetupRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;
        public EmployeeInfoSetupRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        public async Task<EmployeeInfoSetupDTO> Create(EmployeeInfoSetupDTO objDTO)
        {
            var obj = _mapper.Map<EmployeeInfoSetupDTO, EmployeeInfoSetup>(objDTO);
            var addedObj = _db.EmployeeInfosSetup.Add(obj);

            await _db.SaveChangesAsync();
            return _mapper.Map<EmployeeInfoSetup, EmployeeInfoSetupDTO>(addedObj.Entity);
        }
        public async Task<EmployeeInfoSetupDTO> Get(int EmpId)
        {
            var obj = await _db.EmployeeInfosSetup.FirstOrDefaultAsync(u => u.EmpId == EmpId);
            if (obj != null)
            {
                return _mapper.Map<EmployeeInfoSetup, EmployeeInfoSetupDTO>(obj);
            }
            return new EmployeeInfoSetupDTO();
        }


        public async Task<IEnumerable<EmployeeInfoSetupDTO>> GetAll()
        {
            return _mapper.Map<IEnumerable<EmployeeInfoSetup>, IEnumerable<EmployeeInfoSetupDTO>>(_db.EmployeeInfosSetup);
        }
    }
}
