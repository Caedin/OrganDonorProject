using OrganDonorSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OrganDonorSystem.ViewModels
{
    public class MedicalPersonnelInfoViewModel
    {
          public int medicalPersonnelId { get; set; }
          public string userName { get; set; }  
          public string medicalFacility { get; set; }
          public string contactEmail { get; set; }
          public string phoneNumber { get; set; }
          public bool validatedUser { get; set; }
          public System.DateTime create_time { get; set; }
          public int State_StateID { get; set; }
          public int City_CityID { get; set; }
    }
}