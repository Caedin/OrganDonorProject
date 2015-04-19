using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using OrganDonorSystem.Models;

namespace OrganDonorSystem.ViewModels
{
    public class ReportsViewModel
    {
        public List<AvailableOrgans> availableOrgans { get; set; }
        public List<Matched> matchedList { get; set; }

               
    }
}

public class AvailableOrgans
{
    public int organID { get; set; }
    public string bloodTypeID { get; set; }
    public DateTime exp { get; set; }
}

public class Matched
{
    public int organID { get; set; }
    public int recipientID { get; set; }
    public string organType { get; set; }
    public DateTime dateMatched { get; set; }
    public int transID { get; set; }
}