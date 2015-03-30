using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrganDonorSystem.ViewModels
{
    public class RecipientInfoIndexViewModel
    {
        public int recipientID { get; set; }
        public string severity { get; set; }
        public string organNeeded { get; set; }
        public int age { get; set; }
        public string gender { get; set; }
        public string bloodType { get; set; }
        public string phone { get; set; }
        //public DateTime registration { get; set; }

    }
}