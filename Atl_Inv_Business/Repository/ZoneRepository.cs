
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
    public class ZoneRepository : IZoneRepository
    {
        private readonly IMapper _mapper;
        private readonly ApplicationDbContext _db;

        public ZoneRepository(IMapper mapper, ApplicationDbContext db)
        {
            _mapper = mapper;
            _db = db;
        }

        public async Task<ZoneDTO> Create(ZoneDTO objDTO)
        {
            var obj = _mapper.Map<ZoneDTO, Zone>(objDTO);
            var addedObj = _db.Zones.Add(obj);
            obj.AddedDate = DateTime.Now;
            obj.UpdatedDate = null;
            obj.AddedBy = null;
            obj.UpdatedBy = null;
            // obj.TrackZoneId =null;
            await _db.SaveChangesAsync();
            return _mapper.Map<Zone, ZoneDTO>(addedObj.Entity);
        }

        public async Task<int> Delete(int Id)
        {
            //
            var obj = await _db.Zones.FirstOrDefaultAsync(u => u.ZoneId == Id);
            if (obj != null)
            {
                _db.Zones.Remove(obj);
                return await _db.SaveChangesAsync();
            }
            return 0;
        }

        public async Task<ZoneDTO> Get(int ZoneId)
        {
            var obj = await _db.Zones.FirstOrDefaultAsync(u => u.ZoneId == ZoneId);
            if (obj != null)
            {
                return _mapper.Map<Zone, ZoneDTO>(obj);
            }
            return new ZoneDTO();
        }
        public async Task<IEnumerable<ZoneDTO>> GetAll()
        {
            //return _mapper.Map<IEnumerable<Zone>, IEnumerable<ZoneDTO>>(_db.Zones);
            return _mapper.Map<IEnumerable<Zone>, IEnumerable<ZoneDTO>>(_db.Zones.Include(u => u.SetupDt_Data));
        }

        public async Task<ZoneDTO> Update(ZoneDTO objDTO)
        {
            var objFromDb = await _db.Zones.FirstOrDefaultAsync(u => u.ZoneId == objDTO.ZoneId);
            if (objFromDb != null)
            {
                objFromDb.ZoneName = objDTO.ZoneName;
                objFromDb.UpdatedDate = DateTime.Now;
                objFromDb.TerritorySetupDT_Id = objDTO.TerritorySetupDT_Id;
                _db.Zones.Update(objFromDb);
                await _db.SaveChangesAsync();
                return _mapper.Map<Zone, ZoneDTO>(objFromDb);
            }
            return objDTO;
        }



        //public async Task<int> GetCountForZoneTrack(string TrackZoneId)
        //{
        //    return await _db.Zones.CountAsync(z => z.TrackZoneId == z.TrackZoneId);
        //}
        public async Task<int> GetCountForZoneTrack(string TrackZoneId)
        {
            DateTime currentDate = DateTime.Now.Date;
            return await _db.Zones.CountAsync(z => z.TrackZoneId.StartsWith($"ZO-{currentDate.ToString("yyMMdd")}") && z.TrackZoneId != TrackZoneId);
        }

    }
}

