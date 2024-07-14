using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Business.Repository.IRepository
{
    public interface IZoneRepository
    {
        //public Task<CategoryDTO> Create(CategoryDTO objDTO);
        //public Task<CategoryDTO> Update(CategoryDTO objDTO);
        //public Task<int> Delete(int Id);
        //public Task<CategoryDTO> Get(int Id);
        //public Task<IEnumerable<CategoryDTO>> GetAll();
        public Task<ZoneDTO> Create(ZoneDTO objDTO);
        public Task<ZoneDTO> Get(int ZoneId);
        public Task<ZoneDTO> Update(ZoneDTO objDTO);

        public Task<int> GetCountForZoneTrack(string zoneTrackValue);
        public Task<int> Delete(int Id);

        public Task<IEnumerable<ZoneDTO>> GetAll();
    }
}
