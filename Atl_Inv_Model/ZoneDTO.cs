using Atl_Inv_DataAccess;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Atl_Inv_Model
{
    public class ZoneDTO
    {
        //public int ZoneId { get; set; }

        //[Required(ErrorMessage = "Please Enter The Name of Zone.")]
        //public string? ZoneName { get; set; }

        //public int? AddedBy { get; set; }

        //public int? UpdatedBy { get; set; }

        //public DateTime? AddedDate { get; set; }

        //public DateTime? UpdatedDate { get; set; }

        //public string? Remarks { get; set; }

        ////public virtual ICollection<CompanyInfo> CompanyInfos { get; set; } = new List<CompanyInfo>();
   


        public int ZoneId { get; set; }


        [Required(ErrorMessage = "Please Enter The Name of Zone.")]
        public string? ZoneName { get; set; }

        public int? AddedBy { get; set; }

        public int? UpdatedBy { get; set; }

        public DateTime? AddedDate { get; set; }

        public string? TrackZoneId { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public string? Remarks { get; set; }



        [Range(1, int.MaxValue, ErrorMessage = "Please Select a Territory")]
        public int TerritorySetupDT_Id { get; set; }

        public virtual SetupDt_DataDTO SetupDt_Data { get; set; }

        // public virtual ICollection<CompanyInfo> CompanyInfos { get; set; } = new List<CompanyInfo>();
    }
}
