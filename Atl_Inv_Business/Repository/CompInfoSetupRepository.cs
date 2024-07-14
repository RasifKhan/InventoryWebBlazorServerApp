using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository
{
    public class CompInfoSetupRepository : ICompInfoSetupRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;
        public CompInfoSetupRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }
        public async Task<CompanyInfoSetupDTO> Create(CompanyInfoSetupDTO objDTO)
        {
            var obj = _mapper.Map<CompanyInfoSetupDTO, CompanyInfoSetup>(objDTO);
            var addedObj = _db.CompanyInfosSetup.Add(obj);
          
            await _db.SaveChangesAsync();
            return _mapper.Map<CompanyInfoSetup, CompanyInfoSetupDTO>(addedObj.Entity);
        }
        public async Task<CompanyInfoSetupDTO> Get(int CompanyId)
        {
            var obj = await _db.CompanyInfosSetup.FirstOrDefaultAsync(u => u.CompanyId == CompanyId);
            if (obj != null)
            {
                return _mapper.Map<CompanyInfoSetup, CompanyInfoSetupDTO>(obj);
            }
            return new CompanyInfoSetupDTO();
        }
        public async Task<IEnumerable<CompanyInfoSetupDTO>> GetAll()
        {
            return _mapper.Map<IEnumerable<CompanyInfoSetup>, IEnumerable<CompanyInfoSetupDTO>>(_db.CompanyInfosSetup);
        }
    }
}
