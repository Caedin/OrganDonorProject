using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    public class RecipientInfoIndexViewModel
    {
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        public int recipientID { get; set; }
        public string severity { get; set; }
        public string organNeeded { get; set; }
        public long age { get; set; }
        public string gender { get; set; }
        public string bloodType { get; set; }
        public string phone { get; set; }
        public DateTime registration { get; set; }
        public int MedicalPersonnelID { get; set; }
        public void setRecipientWithID(int rID)
        {
            recipientID = rID;
            age = (from Recipient in OrganDonorSystemDatabase.Recipients
                   where Recipient.recipentID == rID
                   select Recipient.age).Single();

            gender = (from Recipient in OrganDonorSystemDatabase.Recipients
                      where Recipient.recipentID == rID
                      select Recipient.gender).Single();

            bloodType = (from Recipient in OrganDonorSystemDatabase.Recipients
                         join BloodTypes in OrganDonorSystemDatabase.BloodTypes on Recipient.bloodTypeBloodTypeID equals BloodTypes.bloodTypeID
                         where Recipient.recipentID == rID
                         select BloodTypes.bloodTypeName).Single();

            organNeeded = (from Recipient in OrganDonorSystemDatabase.Recipients
                           join OrgansType in OrganDonorSystemDatabase.OrganTypes on Recipient.organTypeOrganTypeID equals OrgansType.organTypeID
                           where Recipient.recipentID == rID
                           select OrgansType.organName).Single();

            severity = (from Recipient in OrganDonorSystemDatabase.Recipients
                        where Recipient.recipentID == rID
                        select Recipient.severity).Single();

            registration = (from Recipient in OrganDonorSystemDatabase.Recipients
                            where Recipient.recipentID == rID
                            select Recipient.dateRegistered).Single();

            MedicalPersonnelID = (from Recipient in OrganDonorSystemDatabase.Recipients
                                  where Recipient.recipentID == rID
                                  select Recipient.medicalPersonnelID).Single();
        }
    }
}