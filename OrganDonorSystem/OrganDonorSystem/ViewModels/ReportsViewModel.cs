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
        public List<RecipientsWaiting> recipientsWaiting { get; set; }
        public string result1  { get; set; }
        public string result2  { get; set; }
        public string result3{ get; set; }
        public DateTime difference { get; set; }
         


       }



}


public class AvailableOrgans
{
    public int organID { get; set; }
    public string bloodTypeID { get; set; }
    public DateTime exp { get; set; }
    public string city { get; set; }
    public string state { get; set; }
    public DateTime regDate { get; set; }
}


public class RecipientsWaiting
{
    public int recepID { get; set; }
    public string severity { get; set; }
    public long age { get; set; }
    public string gender { get; set; }
    public DateTime waitTime { get; set; }
    
}


public class Matched
{
    public int organID { get; set; }
    public int recipientID { get; set; }
    public string organType { get; set; }
    public DateTime dateMatched { get; set; }
    public int transID { get; set; }
}