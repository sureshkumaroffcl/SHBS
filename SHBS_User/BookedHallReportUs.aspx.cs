using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;

namespace SeminarHallBookingSystem.SHBS.SHBS_User
{
    public partial class BookedHallReportUs1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = Connection.GetConnection();
            con.Open();

            SqlDataAdapter adp = new SqlDataAdapter("SELECT [BookingId]  ,[HallId] ,[DepartmentName] ,[StaffIncharge] ,[EventName] ,[DateFromTime] ,[DateEndTime],[Session],[Description],[DateCreated],[DateChanged]  ,[BookingStatus] ,[EventImage] FROM [SeminarHallBookingSystem].[dbo].[tblBookingDetails]", con);

            DataSet ds = new DataSet();

            adp.Fill(ds, "tblBookingDetails");

            con.Close();
            
            ReportDocument rpt = new ReportDocument();

            rpt.Load(Server.MapPath("BookedHallReportUs.rpt"));

           //rpt.SetDataSource(ds.Tables[1]);

            CrystalReportViewer1.ReportSource = rpt;
            //CrystalReportViewer1.RefreshReport();

            rpt.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "BookedHallReportUs");

           

            //objrpt.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "ProductsReport");
            //rpt.Load(Server.MapPath("BookedHallReportUs.rpt"));
            //
      
            //rpt.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "ProductsReport");
          
        }
    }
}