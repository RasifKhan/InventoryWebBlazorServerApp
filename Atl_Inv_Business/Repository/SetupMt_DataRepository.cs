using Atl_Inv_Business.Repository.IRepository;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_Model;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Atl_Inv_Business.Repository
{
    public class SetupMt_DataRepository : ISetupMt_DataRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;



        public SetupMt_DataRepository( IMapper mapper,ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }



        public  async Task<SetupMt_DataDTO> Create(SetupMt_DataDTO objDTO,string UserId)
        {
            var obj = _mapper.Map<SetupMt_DataDTO, SetupMt_Data>(objDTO);
            var addedObj = _db.SetupMt_Datas.Add(obj);
            obj.AddedDate = DateTime.Now;
            obj.UpdatedDate = null;
            obj.AddedBy = UserId;
            obj.UpdatedBy = null;
            obj.Remarks = null;

            await _db.SaveChangesAsync();
            return _mapper.Map<SetupMt_Data, SetupMt_DataDTO>(addedObj.Entity);
        }
        public async Task<int> Delete(int SetupMT_Id)
        {
       
            var obj = await _db.SetupMt_Datas.FirstOrDefaultAsync(u => u.SetupMT_Id == SetupMT_Id);
            if (obj != null)
            {
                _db.SetupMt_Datas.Remove(obj);
                return await _db.SaveChangesAsync();
            }
            return 0;
        }

        public async Task<SetupMt_DataDTO> Get(int SetupMT_Id)
        {
            var obj = await _db.SetupMt_Datas.FirstOrDefaultAsync(u => u.SetupMT_Id == SetupMT_Id);
            if (obj != null)
            {
                return _mapper.Map<SetupMt_Data, SetupMt_DataDTO>(obj);
            }
            return new SetupMt_DataDTO();
        }



        public async Task<IEnumerable<SetupMt_DataDTO>> GetAll()
        {
            return _mapper.Map<IEnumerable<SetupMt_Data>, IEnumerable<SetupMt_DataDTO>>(_db.SetupMt_Datas);
        }

        public async Task<SetupMt_DataDTO> Update(SetupMt_DataDTO objDTO, string UserId)
        {
            var objFromDb = await _db.SetupMt_Datas.FirstOrDefaultAsync(u => u.SetupMT_Id == objDTO.SetupMT_Id);
            if (objFromDb != null)
            {
                objFromDb.SetupMT_Data = objDTO.SetupMT_Data;
                objFromDb.UpdatedDate = DateTime.Now;
                objFromDb.UpdatedBy = UserId;
                _db.SetupMt_Datas.Update(objFromDb);
                await _db.SaveChangesAsync();
                return _mapper.Map<SetupMt_Data, SetupMt_DataDTO>(objFromDb);
            }
            return objDTO;
        }
    }
}
