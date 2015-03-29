using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    //test class for dummy data
    public class UserHomeViewModel
    {   
        //donor data
        public int numberOfDonors { get; set; }
        public List<int> Donors { get; set; }
        public List<string> OriginalIDs { get; set; }
        public List<string> PhoneNumbers { get; set; }

        //rep data
        public int numberOfRecipients { get; set; }
        public List<int> RecipientsIDs { get; set; }

        //organ data
        public int numberOfOrgans { get; set; }
        public List<int> OrganIDs { get; set; }
    }
}