using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrganDonorSystem.ViewModels
{
    //test class for dummy data
    public class UserHomeViewModel
    {
        public int numberOfDonors { get; set; }
        public List<int> DonorsIDs { get; set; }
        public int numberOfRecipients { get; set; }
        public List<int> RecipientsIDs { get; set; }
        public int numberOfOrgans { get; set; }
        public List<int> OrganIDs { get; set; }
    }
}