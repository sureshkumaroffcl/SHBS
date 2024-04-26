using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data;

namespace SeminarHallBookingSystem.SHBS.SHBS_Admin
{
    public partial class SeminarHallReportAd1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = Connection.GetConnection();
            con.Open();

            SqlDataAdapter adp = new SqlDataAdapter("SELECT [HallId],[HallName],[HallType],[BlockName] ,[Description],[DateCreated],[DateChanged],[HallImage]FROM [SeminarHallBookingSystem].[dbo].[tblHallDetails]", con);

            DataSet ds2 = new DataSet();

            adp.Fill(ds2, "tblHallDetails");

            con.Close();

            ReportDocument rpt = new ReportDocument();

            rpt.Load(Server.MapPath("SeminarHallReportAd.rpt"));


            //string imagePath = new Uri(Server.MapPath("~/HallImages/")).AbsoluteUri;
            // parameter = new ReportParameter("ImagePath", imagePath);

            //rpt.SetDataSource(ds2.Tables[1]);

            CrystalReportViewer2.ReportSource = rpt;
            CrystalReportViewer2.RefreshReport();

            rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "SeminarHallReportAd");

        }
    }
}