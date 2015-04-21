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
        public Donor theDonor { get; set; }
        public void setSingleDonorWithID(int ID)
        {
            this.theDonor = (from Donor in OrganDonorSystemDatabase.Donors
                          where Donor.DonorID == ID
                          select Donor).Single();
            
        }
    }
}