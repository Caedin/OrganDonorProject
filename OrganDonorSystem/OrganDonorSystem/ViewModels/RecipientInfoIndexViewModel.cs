﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrganDonorSystem.ViewModels
{
    public class RecipientInfoIndexViewModel
    {
        public int recipientID { get; set; }
        public string severity { get; set; }
        public Int32 organNeeded { get; set; }
        public long age { get; set; }
        public string gender { get; set; }
        public Int32 bloodType { get; set; }
        public string phone { get; set; }
        public DateTime registration { get; set; }

    }
}