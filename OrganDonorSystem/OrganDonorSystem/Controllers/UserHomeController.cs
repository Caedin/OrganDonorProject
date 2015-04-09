﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.ViewModels;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.Controllers
{
    public class UserHomeController : Controller
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();
        //
        // GET: /UserHome/
        public ActionResult Index()
        {
            //getting logged in userID
            int loggedIN = CurrentlyLoggedIn.getUserID();


            //Getting Data Count from database and passing number of donors,reps and organs into View
            var viewModel = new UserHomeViewModel
            {
                
                numberOfDonors = (from Donor in OrganDonorSystemDB.Donors
                                  where Donor.medicalPersonnelId == loggedIN
                                     select Donor.DonorID).Count(),
                numberOfRecipients = (from Recipient in OrganDonorSystemDB.Recipients
                                      where Recipient.medicalPersonnelID == loggedIN
                                     select Recipient.recipentID).Count(),

                numberOfOrgans = (from Organ in OrganDonorSystemDB.Organs
                                  where Organ.MedicalPersonnelID == loggedIN
                                  select Organ.OrganID).Count(),
            };

            return View(viewModel);
        }

        //
        // GET: /UserHome/UserHomeDonors
        public ActionResult UserHomeDonors()
        {
            //getting logged in userID
            int loggedIN = CurrentlyLoggedIn.getUserID();



            //test code for merging all queries into one
            var viewModel = new UserHomeViewModel
           {
               numberOfDonors = (from Donor in OrganDonorSystemDB.Donors
                                 where Donor.medicalPersonnelId == loggedIN
                                 select Donor.DonorID).Count(),

               theDonors = (from Donor in OrganDonorSystemDB.Donors
                            where Donor.medicalPersonnelId == loggedIN
                            select new DonorData
                            {
                                Donors = Donor.DonorID,
                                OriginalIDs = Donor.originalID,
                                PhoneNumbers = Donor.phoneNumber
                            }).ToList()
           };

            /*  OLD CODE
            //Getting Data from database and passing number of donors,reps and organs into View
            var viewModel = new UserHomeViewModel
            {
                numberOfDonors = (from Donor in OrganDonorSystemDB.Donors
                                  where Donor.medicalPersonnelId == loggedIN
                                select Donor.DonorID).Count(),

                Donors = (from Donor in OrganDonorSystemDB.Donors
                          where Donor.medicalPersonnelId == loggedIN
                           select Donor.DonorID).ToList(),

                OriginalIDs = (from Donor in OrganDonorSystemDB.Donors
                               where Donor.medicalPersonnelId == loggedIN
                                select Donor.originalID).ToList(),

                PhoneNumbers = (from Donor in OrganDonorSystemDB.Donors
                                where Donor.medicalPersonnelId == loggedIN
                                select Donor.phoneNumber).ToList(),
            };     */


            return View(viewModel);
        }

        //
        // GET: /UserHome/UserHomeRecipients
        public ActionResult UserHomeRecipients()
        {
            //getting logged in userID
            int loggedIN = CurrentlyLoggedIn.getUserID();

            //Getting Data from database and passing number of donors,reps and organs into View
            var viewModel = new UserHomeViewModel
            {
                numberOfRecipients = (from Recipient in OrganDonorSystemDB.Recipients
                                      where Recipient.medicalPersonnelID == loggedIN
                                      select Recipient.recipentID).Count(),

                RecipientsIDs = (from Recipient in OrganDonorSystemDB.Recipients
                                 where Recipient.medicalPersonnelID == loggedIN
                                 select Recipient.recipentID).ToList(),

                RepcipientOriginalIDs = (from Recipient in OrganDonorSystemDB.Recipients
                                         where Recipient.medicalPersonnelID == loggedIN
                                         select Recipient.orignialID).ToList(),

                DatesRegistered = (from Recipient in OrganDonorSystemDB.Recipients
                                   where Recipient.medicalPersonnelID == loggedIN
                                   select Recipient.dateRegistered).ToList(),
            };

            return View(viewModel);
           
        }

        //
        // GET: /UserHome/UserHomeOrgans
        public ActionResult UserHomeOrgans()
        {
            //getting logged in userID
            int loggedIN = CurrentlyLoggedIn.getUserID();

            //Getting Data from database and passing number of donors,reps and organs into View
            var viewModel = new UserHomeViewModel
            {
                numberOfOrgans = (from Organ in OrganDonorSystemDB.Organs
                                  where Organ.MedicalPersonnelID == loggedIN
                                  select Organ.OrganID).Count(),

                OrganIDs = (from Organ in OrganDonorSystemDB.Organs
                            where Organ.MedicalPersonnelID == loggedIN
                            select Organ.OrganID).ToList(),

                OrganOriginalIDs = (from Organ in OrganDonorSystemDB.Organs
                                    where Organ.MedicalPersonnelID == loggedIN
                                    select Organ.OriginalID).ToList(),
            };

            return View(viewModel);
        }

        public ActionResult UserHomeAddRecipients(Recipient r)
        {
            if (r.orignialID == null) { return View(); }

            //getting logged in userID
            int loggedIN = CurrentlyLoggedIn.getUserID();
            r.medicalPersonnelID = loggedIN;

            try
            {
                if (ModelState.IsValid)
                {
                    OrganDonorSystemDB.Recipients.AddObject(r);
                    OrganDonorSystemDB.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                return View();
            }

            return View();
        }

        public ActionResult UserHomeAddOrgans(Organ r)
        {
            if (r.OriginalID == null) { return View(); }

            //getting logged in userID
            int loggedIN = CurrentlyLoggedIn.getUserID();
            r.MedicalPersonnelID = loggedIN;

            try
            {
                if (ModelState.IsValid)
                {
                    OrganDonorSystemDB.Organs.AddObject(r);
                    OrganDonorSystemDB.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                return View();
            }

            return View();
        }

        public ActionResult UserHomeAddDonors(Donor r)
        {
            if (r.originalID == null) { return View(); }

            //getting logged in userID
            int loggedIN = CurrentlyLoggedIn.getUserID();
            r.medicalPersonnelId = loggedIN;

            try
            {
                if (ModelState.IsValid)
                {
                    OrganDonorSystemDB.Donors.AddObject(r);
                    OrganDonorSystemDB.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                return View();
            }

            return View();
        }
          
    }
}
