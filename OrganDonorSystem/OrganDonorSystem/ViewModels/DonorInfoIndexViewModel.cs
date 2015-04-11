using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrganDonorSystem.ViewModels
{
    public class DonorInfoIndexViewModel
    {

        public int donorID { get; set; }
        public long age { get; set; }
        public string gender { get; set; }
        public string phone { get; set; }
        public DateTime registration { get; set; }
        public int MedicalPersonnelID { get; set; }
    }
}