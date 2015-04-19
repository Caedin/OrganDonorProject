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
            //getting logged in userID and insuring some one is logged in
            if (Session["UserName"] == null) { return RedirectToAction("", ""); }

            int number;
            string convertMe = Request.QueryString["dID"];
            bool result = Int32.TryParse( convertMe, out number);
            int dID = number;
            var viewModel = new OrgansInfoViewModel
            {

                OrganID = dID,

                MedicalPersonnelID = (from Organs in OrganDonorSystemDatabase.Organs
                                      where Organs.OrganID == dID
                                      select Organs.MedicalPersonnelID).Single(),

                OriginalID = (from Organs in OrganDonorSystemDatabase.Organs
                              where Organs.OrganID == dID
                              select Organs.OriginalID).Single(),

                organTypeName = (from Organs in OrganDonorSystemDatabase.Organs
                                 join OrgansType in OrganDonorSystemDatabase.OrganTypes on Organs.organType_organtypeID equals OrgansType.organTypeID
                                 where Organs.OrganID == dID
                                 select OrgansType.organName).Single(),

                bloodTypeName = (from Organs in OrganDonorSystemDatabase.Organs
                                 join BloodTypes in OrganDonorSystemDatabase.BloodTypes on Organs.BloodType_BloodTypeID equals BloodTypes.bloodTypeID
                                 where Organs.OrganID == dID
                                 select BloodTypes.bloodTypeName).Single(),

                dateAqcuired = (from Organs in OrganDonorSystemDatabase.Organs
                                where Organs.OrganID == dID
                                select Organs.dateAqcuired).Single(),

                expirationDate = (from Organs in OrganDonorSystemDatabase.Organs
                                  where Organs.OrganID == dID
                                  select Organs.expirationDate).Single(),


                available = (from Organs in OrganDonorSystemDatabase.Organs
                             where Organs.OrganID == dID
                             select Organs.available).Single(),

                Recipient_RecipientID = (from Organs in OrganDonorSystemDatabase.Organs
                                         where Organs.OrganID == dID
                                         select Organs.Recipient_RecipientID).Single()

            };

            //checks to see if user is trying to access data that is not theirs, if so sends them back to userHome
            if (viewModel.MedicalPersonnelID != Int32.Parse(Session["UserName"].ToString())) { return RedirectToAction("Index", "UserHome"); }

            return View(viewModel);
        }
    }
}
