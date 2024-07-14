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
    public class ContactPersonInfoSetupRepository : IContactPersonInfoSetupRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;
        public ContactPersonInfoSetupRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        
        public async Task<ContactPersonInfoSetupDTO> Create(ContactPersonInfoSetupDTO objDTO)
        {
            var obj = _mapper.Map<ContactPersonInfoSetupDTO, ContactPersonInfoSetup>(objDTO);
            var addedObj = _db.ContactPersonInfosSetup.Add(obj);

            await _db.SaveChangesAsync();
            return _mapper.Map<ContactPersonInfoSetup, ContactPersonInfoSetupDTO>(addedObj.Entity);
        }


        //16hello 


        public async Task<ContactPersonInfoSetupDTO> Get(int ContactPersonId)
        {
            var obj = await _db.ContactPersonInfosSetup.FirstOrDefaultAsync(u => u.ContactPersonId == ContactPersonId);
            if (obj != null)
            {
                return _mapper.Map<ContactPersonInfoSetup, ContactPersonInfoSetupDTO>(obj);
            }
            return new ContactPersonInfoSetupDTO();
        }




        public async Task<IEnumerable<ContactPersonInfoSetupDTO>> GetAll()
        {
            return _mapper.Map<IEnumerable<ContactPersonInfoSetup>, IEnumerable<ContactPersonInfoSetupDTO>>(_db.ContactPersonInfosSetup);
        }



        
    }
}
