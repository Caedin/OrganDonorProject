using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    public class DonorInfoIndexViewModel
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        public int donorID { get; set; }
        public long age { get; set; }
        public string gender { get; set; }
        public string phone { get; set; }
        public DateTime registration { get; set; }
        public int MedicalPersonnelID { get; set; }
        public void setSingleDonorFromID(int ID)
        {
            donorID = ID;

            age = (from Donor in OrganDonorSystemDatabase.Donors
                       where Donor.DonorID == ID
                       select Donor.age).Single();

            gender = (from Donor in OrganDonorSystemDatabase.Donors
                          where Donor.DonorID == ID
                          select Donor.gender).Single();

            phone = (from Donor in OrganDonorSystemDatabase.Donors
                         where Donor.DonorID == ID
                         select Donor.phoneNumber).Single();
            registration = (from Donor in OrganDonorSystemDatabase.Donors
                                where Donor.DonorID == ID
                                select Donor.registrationDate).Single();

            MedicalPersonnelID = (from Donor in OrganDonorSystemDatabase.Donors
                                   where Donor.DonorID == ID
                                   select Donor.medicalPersonnelId).Single();

        }
    }
}