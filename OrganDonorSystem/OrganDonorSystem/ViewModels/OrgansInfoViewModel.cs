using OrganDonorSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OrganDonorSystem.ViewModels
{
    public class OrgansInfoViewModel
    {
        public int OrganID { get; set; }
        public string OriginalID { get; set; }
        public int organType_organTypeID { get; set; }
        public int BloodType_BloodTypeID { get; set; }
        public System.DateTime? dateAqcuired { get; set; }
        public System.DateTime? expirationDate { get; set; }
        public int MedicalPersonnelID { get; set; }
        public bool available { get; set; }
        public int Recipient_RecipientID { get; set; }
    }
}