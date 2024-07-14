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
    public class SetupDt_DataRepository : ISetupDt_DataRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;
        public SetupDt_DataRepository(IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }
        public async Task<SetupDt_DataDTO> Create(SetupDt_DataDTO objDTO, string UserId)
        {
            var obj = _mapper.Map<SetupDt_DataDTO, SetupDt_Data>(objDTO);
            var addedObj = _db.SetupDt_Datas.Add(obj);
            obj.AddedDate = DateTime.Now;
            obj.UpdatedDate = null;
            obj.AddedBy = UserId;
            obj.UpdatedBy = null;
            obj.Remarks = null;
            await _db.SaveChangesAsync();
            return _mapper.Map<SetupDt_Data, SetupDt_DataDTO>(addedObj.Entity);
        }

        public async Task<int> Delete(int SetupDT_Id)
        {
            var obj = await _db.SetupDt_Datas.FirstOrDefaultAsync(u => u.SetupDT_Id == SetupDT_Id);
            if (obj != null)
            {
                _db.SetupDt_Datas.Remove(obj);
                return await _db.SaveChangesAsync();
            }
            return 0;
        }
        public async Task<SetupDt_DataDTO> Get(int SetupDT_Id)
        {
            var obj = await _db.SetupDt_Datas.FirstOrDefaultAsync(u => u.SetupDT_Id == SetupDT_Id);
            if (obj != null)
            {
                return _mapper.Map<SetupDt_Data, SetupDt_DataDTO>(obj);
            }
            return new SetupDt_DataDTO();
        }

        public async Task<IEnumerable<SetupDt_DataDTO>> GetAll()
        {
            //return _mapper.Map<IEnumerable<SetupDt_Data>, IEnumerable<SetupDt_DataDTO>>(_db.SetupDt_Datas);
            return _mapper.Map<IEnumerable<SetupDt_Data>, IEnumerable<SetupDt_DataDTO>>(_db.SetupDt_Datas.Include(u => u.SetupMt_Data));
        }


        public async Task<SetupDt_DataDTO> Update(SetupDt_DataDTO objDTO, string UserId)
        {
            var objFromDb = await _db.SetupDt_Datas.FirstOrDefaultAsync(u => u.SetupDT_Id == objDTO.SetupDT_Id);
            if (objFromDb != null)
            {
                objFromDb.SetupDT_Data = objDTO.SetupDT_Data;
                objFromDb.SetupMT_Id = objDTO.SetupMT_Id;
                objFromDb.UpdatedDate = DateTime.Now;
                objFromDb.UpdatedBy = UserId;
                _db.SetupDt_Datas.Update(objFromDb);
                await _db.SaveChangesAsync();
                return _mapper.Map<SetupDt_Data, SetupDt_DataDTO>(objFromDb);
            }
            return objDTO;
        }

    }
}
