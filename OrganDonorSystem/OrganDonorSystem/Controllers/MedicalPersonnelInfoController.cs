using OrganDonorSystem.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.Models;
namespace OrganDonorSystem.Controllers
{
    public class MedicalPersonnelInfoController : Controller
    {
        //
        // GET: /MedicalPersonnelInfo/
        OrganDonorSystemEntities OrganDonorSystemDatabase = new OrganDonorSystemEntities();
        public ActionResult Index()
        {
            //getting logged in userID and insuring some one is logged in
            int? loggedIN = CurrentlyLoggedIn.getUserID();
            if (loggedIN == null) { return RedirectToAction("", ""); }

            int number;
            string convertMe = Request.QueryString["dID"];
            bool result = Int32.TryParse( convertMe, out number);
            int dID = number;

            var viewModel = new MedicalPersonnelInfoViewModel
            { 
                medicalPersonnelId = dID,
                
                userName = (from Medical_Personnel in OrganDonorSystemDatabase.Medical_Personnel
                        where Medical_Personnel.medicalPersonnelId == dID
                        select Medical_Personnel.userName).Single(),        
                
                medicalFacility =(from Medical_Personnel in OrganDonorSystemDatabase.Medical_Personnel
                        where Medical_Personnel.medicalPersonnelId == dID
                        select Medical_Personnel.medicalFacility).Single(),
                
                contactEmail = (from Medical_Personnel in OrganDonorSystemDatabase.Medical_Personnel
                        where Medical_Personnel.medicalPersonnelId == dID
                        select Medical_Personnel.contactEmail).Single(),
                
                phoneNumber = (from Medical_Personnel in OrganDonorSystemDatabase.Medical_Personnel
                        where Medical_Personnel.medicalPersonnelId == dID
                        select Medical_Personnel.phoneNumber).Single(),
                
                validatedUser = (from Medical_Personnel in OrganDonorSystemDatabase.Medical_Personnel
                        where Medical_Personnel.medicalPersonnelId == dID
                        select Medical_Personnel.validatedUser).Single(),
                        
                create_time = (from Medical_Personnel in OrganDonorSystemDatabase.Medical_Personnel
                        where Medical_Personnel.medicalPersonnelId == dID
                        select Medical_Personnel.create_time).Single(),
                
                State_StateID = (from Medical_Personnel in OrganDonorSystemDatabase.Medical_Personnel
                        where Medical_Personnel.medicalPersonnelId == dID
                        select Medical_Personnel.State_StateID).Single(),
                
                City_CityID = (from Medical_Personnel in OrganDonorSystemDatabase.Medical_Personnel
                               where Medical_Personnel.medicalPersonnelId == dID
                               select Medical_Personnel.City_CityID).Single(),
            };
            return View(viewModel);
        }

    }
}
