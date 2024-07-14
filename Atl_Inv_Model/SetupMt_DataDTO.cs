using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Atl_Inv_Model
{
    public class SetupMt_DataDTO
    {


        public int SetupMT_Id { get; set; }

        [Required(ErrorMessage = "Please fill up SetupMT_Data")]
        public string? SetupMT_Data { get; set; }

        public string? AddedBy { get; set; }

        public DateTime? AddedDate { get; set; }

        public string? UpdatedBy { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public string? Remarks { get; set; }
    }
}



