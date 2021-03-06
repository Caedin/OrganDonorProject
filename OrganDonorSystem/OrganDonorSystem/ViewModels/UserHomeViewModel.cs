﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    //test class for dummy data
    public class UserHomeViewModel
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();

       
        public int? loggedIn { get; set; }
        public string userName { get; set; }

        public int numberOfDonors { get; set; }
          

        //rep data
        public int numberOfRecipients { get; set; }
        public List<int> RecipientsIDs { get; set; }
        public List<string> RepcipientOriginalIDs { get; set; }
        public List<DateTime> DatesRegistered { get; set; }

        //organ data
        public int numberOfOrgans { get; set; }
        public List<int> OrganIDs { get; set; }
        public List<string> OrganOriginalIDs { get; set; }
        public List<Organ> theOrgans {get;set;}

        

        //test objects
        public int Donor_IDs { get; set; }
        public string Original_IDs { get; set; }
        public string Phone_Numbers { get; set; }
        public List<DonorData> theDonors { get; set; }

        //City, State
        public string city { get; set; }
        public string state { get; set; }
        public string instName { get; set; }
        public int numberOfStars { get; set; }


        public UserHomeViewModel(String userID)
        {
            //getting logged in infromation
            int number;
            bool result = Int32.TryParse(userID, out number);
            loggedIn = number;



            if (loggedIn != null)
            {
                Medical_Personnel currentUser = (from Medical_Personnel in OrganDonorSystemDB.Medical_Personnel
                                                 where Medical_Personnel.medicalPersonnelId == loggedIn
                                                 select Medical_Personnel).Single();

                userName = currentUser.userName;
                instName = currentUser.medicalFacility;

                city = currentUser.City.city1;
                state = currentUser.State.state1;
                numberOfStars = (from Award in OrganDonorSystemDB.Awards
                                 where Award.medicalPersonnelID == loggedIn
                                 select Award.awardType).Single();

                numberOfDonors = (from Donor in OrganDonorSystemDB.Donors
                                  where Donor.medicalPersonnelId == loggedIn
                                  select Donor.DonorID).Count();
                numberOfRecipients = (from Recipient in OrganDonorSystemDB.Recipients
                                      where Recipient.medicalPersonnelID == loggedIn
                                      select Recipient.recipentID).Count();

                numberOfOrgans = (from Organ in OrganDonorSystemDB.Organs
                                  where Organ.MedicalPersonnelID == loggedIn
                                  select Organ.OrganID).Count();

            }
        }

        public string addStringPadding(int neededLength, string inputString)
        {
            while (inputString.Length < neededLength)
            {
                inputString = '0' + inputString;
            }

            return inputString;
        }

        public void setDonorsFromMedicalID(int ID)
        {
            theDonors = (from Donor in OrganDonorSystemDB.Donors
                         where Donor.medicalPersonnelId == ID
                         select new DonorData
                         {
                             Donors = Donor.DonorID,
                             OriginalIDs = Donor.originalID,
                             PhoneNumbers = Donor.phoneNumber
                         }).ToList();
        }
        public void setOrganFromMedicalID(int ID)
        {
            theOrgans = (from Organ in OrganDonorSystemDB.Organs
                         where Organ.MedicalPersonnelID == ID
                         select Organ).ToList();
        }
    }
}