using Atl_Inv_DataAccess;
using Atl_Inv_Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Model
{
    public class SetupDt_DataDTO
    {
        public int SetupDT_Id { get; set; }
        [Required]
        public string SetupDT_Data { get; set; }
        public string? Remarks { get; set; }

        public string? AddedBy { get; set; }

        public DateTime? AddedDate { get; set; }

        public string? UpdatedBy { get; set; }

        public DateTime? UpdatedDate { get; set; }


        [Range(1, int.MaxValue, ErrorMessage = "Please Select the Master Data")]
        public int SetupMT_Id { get; set; }

        public virtual SetupMt_DataDTO? SetupMt_Data { get; set; }
    }
}






