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
        
        public UserHomeViewModel()
        {
            //getting logged in infromation
            loggedIn = CurrentlyLoggedIn.getUserID();
        }
        public int loggedIn { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }

        //donor data
        public int numberOfDonors { get; set; }
        public List<int> Donors { get; set; }
        public List<string> OriginalIDs { get; set; }
        public List<string> PhoneNumbers { get; set; }

        //rep data
        public int numberOfRecipients { get; set; }
        public List<int> RecipientsIDs { get; set; }
        public List<string> RepcipientOriginalIDs { get; set; }
        public List<DateTime> DatesRegistered { get; set; }

        //organ data
        public int numberOfOrgans { get; set; }
        public List<int> OrganIDs { get; set; }
        public List<string> OrganOriginalIDs { get; set; }

        public string addStringPadding(int neededLength, string inputString)
        {
            while (inputString.Length < neededLength)
            {
                inputString = '0' + inputString;
            }

            return inputString;
        }
    }
}