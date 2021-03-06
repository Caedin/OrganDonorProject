﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    public class BloodTypeViewModel
    {
        OrganDonorSystemEntities OrganDonorSystemDB = new OrganDonorSystemEntities();

        public List<BloodType> theBloodTypes { get; set; }
        public List<SelectListItem> listBloodTypes { get; set; }
        public BloodTypeViewModel()
        {
            this.listBloodTypes = new List<SelectListItem>();
            theBloodTypes = (from BloodType in OrganDonorSystemDB.BloodTypes
                         select BloodType).ToList();
            for (int i = 0; i < theBloodTypes.Count(); i++)
           {
               SelectListItem temp = new SelectListItem { Text = theBloodTypes[i].bloodTypeName, Value = theBloodTypes[i].bloodTypeID.ToString() };
               listBloodTypes.Add(temp);
           }
        }
    }
}