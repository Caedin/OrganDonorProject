using OrganDonorSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    public class OrgansInfoViewModel
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        public int OrganID { get; set; }
        public string OriginalID { get; set; }
        //no longer needed since implementation of organTypeName and BloodTypeName
        //public int organType_organTypeID { get; set; }
        //public int BloodType_BloodTypeID { get; set; }
        public System.DateTime? dateAqcuired { get; set; }
        public System.DateTime? expirationDate { get; set; }
        public int MedicalPersonnelID { get; set; }
        public bool available { get; set; }
        public int? Recipient_RecipientID { get; set; }
        public string organTypeName { get; set; }
        public string bloodTypeName { get; set; }
        public void setSingleOrganWithID(int dID)
        {

                OrganID = dID;

                MedicalPersonnelID = (from Organs in OrganDonorSystemDatabase.Organs
                                      where Organs.OrganID == dID
                                      select Organs.MedicalPersonnelID).Single();

                OriginalID = (from Organs in OrganDonorSystemDatabase.Organs
                              where Organs.OrganID == dID
                              select Organs.OriginalID).Single();

                organTypeName = (from Organs in OrganDonorSystemDatabase.Organs
                                 join OrgansType in OrganDonorSystemDatabase.OrganTypes on Organs.organType_organtypeID equals OrgansType.organTypeID
                                 where Organs.OrganID == dID
                                 select OrgansType.organName).Single();

                bloodTypeName = (from Organs in OrganDonorSystemDatabase.Organs
                                 join BloodTypes in OrganDonorSystemDatabase.BloodTypes on Organs.BloodType_BloodTypeID equals BloodTypes.bloodTypeID
                                 where Organs.OrganID == dID
                                 select BloodTypes.bloodTypeName).Single();

                dateAqcuired = (from Organs in OrganDonorSystemDatabase.Organs
                                where Organs.OrganID == dID
                                select Organs.dateAqcuired).Single();

                expirationDate = (from Organs in OrganDonorSystemDatabase.Organs
                                  where Organs.OrganID == dID
                                  select Organs.expirationDate).Single();


                available = (from Organs in OrganDonorSystemDatabase.Organs
                             where Organs.OrganID == dID
                             select Organs.available).Single();

                Recipient_RecipientID = (from Organs in OrganDonorSystemDatabase.Organs
                                         where Organs.OrganID == dID
                                         select Organs.Recipient_RecipientID).Single();

            }
    }
}