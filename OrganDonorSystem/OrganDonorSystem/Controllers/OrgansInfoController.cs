using OrganDonorSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.Controllers
{
    public class OrgansInfoController : Controller
    {
        //
        // GET: /OrganInfo/
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();

        public ActionResult Index()
        {
            int number;
            string convertMe = Request.QueryString["dID"];
            bool result = Int32.TryParse( convertMe, out number);
            int dID = number;
            var viewModel = new OrgansInfoViewModel
            {

                OrganID = dID,
                OriginalID = (from Organs in OrganDonorSystemDatabase.Organs
                              where Organs.OrganID == dID
                              select Organs.OriginalID).Single(),

                organType_organTypeID = (from Organs in OrganDonorSystemDatabase.Organs
                                         where Organs.OrganID == dID
                                         select Organs.organType_organtypeID).Single(),

                BloodType_BloodTypeID = (from Organs in OrganDonorSystemDatabase.Organs
                                         where Organs.OrganID == dID
                                         select Organs.BloodType_BloodTypeID).Single(),

                dateAqcuired = (from Organs in OrganDonorSystemDatabase.Organs
                                where Organs.OrganID == dID
                                select Organs.dateAqcuired).Single(),

                expirationDate = (from Organs in OrganDonorSystemDatabase.Organs
                                  where Organs.OrganID == dID
                                  select Organs.expirationDate).Single(),

                MedicalPersonnelID = (from Organs in OrganDonorSystemDatabase.Organs
                                      where Organs.OrganID == dID
                                      select Organs.MedicalPersonnelID).Single(),

                available = (from Organs in OrganDonorSystemDatabase.Organs
                             where Organs.OrganID == dID
                             select Organs.available).Single(),

                Recipient_RecipientID = (from Organs in OrganDonorSystemDatabase.Organs
                                         where Organs.OrganID == dID
                                         select Organs.Recipient_RecipientID).Single()

            };
            return View(viewModel);
        }

    }
}
