using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;

namespace SeminarHallBookingSystem.SHBS.SHBS_User
{
    public partial class BookingSeminarHallUs : System.Web.UI.Page
    {
        int varBookingId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                ddlSession.SelectedIndex = 0;
                ddlBookingStatus.SelectedIndex = 0;
                this.BindGrid();
                ResetRecords();



            }
        }

        protected string FormatImageUrl(string EventImage)
        {

            if (EventImage != null && EventImage.Length > 0)

                return ("~/" + EventImage);

            else return null;


        }


        private void BindGrid()
        {

            string SqlQuery = "SELECT * FROM tblBookingDetails";

            using (SqlConnection con = Connection.GetConnection())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(SqlQuery, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);



                        gvBookedHallDetails.DataSource = dt;
                        gvBookedHallDetails.DataBind();

                    }
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection con = Connection.GetConnection();
            con.Open();



            var SqlQuery = "";

            string filename = Path.GetFileName(fuEventImg.PostedFile.FileName);
            fuEventImg.SaveAs(Server.MapPath("~/EventImages/" + filename));



            SqlDataAdapter sda = new SqlDataAdapter(@"select * from [tblBookingDetails] Where [BookingId] = '" + varBookingId + "' AND [HallId] = '" + Convert.ToInt32(ddlHallId.SelectedValue.ToString()) + "'", con);

            DataSet ds = new DataSet();
            sda.Fill(ds);


            if (ds.Tables[0].Rows.Count > 0)
            {

                SqlQuery = @"UPDATE [SeminarHallBookingSystem].[dbo].[tblBookingDetails]
                SET

       [DepartmentName] = '" + this.txtDeptName.Text + "',[StaffIncharge] = '" + this.txtStaffIncharge.Text + "', [EventName] = '" + this.txtEventName.Text + "',[DateFromTime] = '" + DateTime.Now.AddDays(1).ToString("MM/dd/yyyy hh:mm tt") + "',[DateEndTime] = '" + DateTime.Now.AddDays(1).ToString("MM/dd/yyyy hh:mm tt") + "',[Session] = '" + ddlSession.SelectedItem.ToString() + "' ,[Description] = '" + this.txtDescription.Text + "',[DateCreated] ='" + DateTime.Now.ToString("dd-MM-yyyy hh:mm tt") + "', [DateChanged] = '" + DateTime.Now.ToString("dd-MM-yyyy hh:mm tt") + "'),[BookingStatus] = '" + ddlBookingStatus.SelectedItem.ToString() + "' ,[EventImage] ='" + "EventImages/" + filename + "' WHERE [BookingId] = '" + varBookingId + "' ";


                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Data Successfully Updated');", true);
            }

            else if (IfBookingIdExists(con, varBookingId.ToString()) == 0)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Record exists');", true);

            }




            else
            {
                SqlQuery = @"INSERT INTO [SeminarHallBookingSystem].[dbo].[tblBookingDetails]
           ([BookingId]
           ,[HallId]
           ,[DepartmentName]
           ,[StaffIncharge]
           ,[EventName]
           ,[DateFromTime]
           ,[DateEndTime]
           ,[Session]
           ,[Description]
           ,[DateCreated]
           ,[DateChanged]
           ,[BookingStatus]
           ,[EventImage])
     VALUES
    
          ('" + varBookingId + "','" + Convert.ToInt32(ddlHallId.SelectedValue.ToString()) + "','" + this.txtDeptName.Text + "','" + this.txtStaffIncharge.Text + "','" + this.txtEventName.Text + "','" + DateTime.Now.AddDays(6).ToString("MM/dd/yyyy hh:mm tt") + "' ,'" + DateTime.Now.AddDays(6).ToString("MM/dd/yyyy hh:mm tt") + "', '" + ddlSession.SelectedItem.ToString() + "','" + this.txtDescription.Text + "','" + DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") + "','" + DateTime.Now.AddDays(1).ToString("MM/dd/yyyy hh:mm tt") + "','" + ddlBookingStatus.SelectedItem.ToString() + "','" + "EventImages/" + filename + "')";


                // DateTime.Now.ToString("MM/dd/yyyy hh:mm tt")

                SqlCommand cmd = new SqlCommand(SqlQuery, con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Record saved');", true);
            }

            con.Close();



            this.BindGrid();
            ResetRecords();




        }


        private int IfBookingIdExists(SqlConnection con, string BookingId)
        {
            //string BookingId = @"SELECT [BookingId] AS ('BOOK' + RIGHT(('000000000' + BookingId)), 3) + 'FAK')";

            SqlDataAdapter sda = new SqlDataAdapter("SELECT ISNULL  (MAX(BookingId),0) +1  AS BookingId FROM tblBookingDetails", con);

            //UserID AS 'UID' + RIGHT('00000000' + CAST(ID AS VARCHAR(8)), 8) PERSISTED, 

            // Cust + RIGHT('00000000' + id, your-fixed-needed-length) 

            // [InvoiceNo] AS ('AS' + RIGHT(('000000000' + CAST(idfield AS varchar(9))), 9) + 'FAK')


            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                varBookingId = dt.Rows[0].Field<int>("BookingId");

                return varBookingId;

            }
            else
            {
                return 0;
            }
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetRecords();
        }
        private void ResetRecords()
        {
            //txtBookingId.Text = string.Empty;

            ddlHallId.SelectedIndex = 0;
            txtDeptName.Text = string.Empty;
            txtStaffIncharge.Text = string.Empty;
            txtEventName.Text = string.Empty;
            txtDateFromTime.Text = string.Empty;
            txtDateEndTime.Text = string.Empty;

            ddlSession.SelectedIndex = 0;

            txtDescription.Text = string.Empty;
            txtDateCreated.Text = string.Empty;
            txtDateChanged.Text = string.Empty;
            ddlBookingStatus.SelectedIndex = 0;
            string fuUploadImg = string.Empty;


            btnSave.Text = "Save";

        }

        protected void gvBookedHallDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);

            btnSave.Text = "Update";


            //txtBookingId.Text = gvBookedHallDetails.SelectedRow.Cells[1].Text;

            ddlHallId.SelectedIndex = ddlHallId.Items.IndexOf(ddlHallId.Items.FindByText(gvBookedHallDetails.SelectedRow.Cells[2].Text.Trim()));

            txtDeptName.Text = gvBookedHallDetails.SelectedRow.Cells[3].Text;
            txtStaffIncharge.Text = gvBookedHallDetails.SelectedRow.Cells[4].Text;
            txtEventName.Text = gvBookedHallDetails.SelectedRow.Cells[5].Text;


            txtDateFromTime.Text = gvBookedHallDetails.SelectedRow.Cells[6].Text;

            txtDateEndTime.Text = gvBookedHallDetails.SelectedRow.Cells[7].Text;


            ddlSession.SelectedIndex = ddlSession.Items.IndexOf(ddlSession.Items.FindByText(gvBookedHallDetails.SelectedRow.Cells[8].Text.Trim()));

            //ddlHallType.SelectedItem.Value = gvBookedHallDetails.SelectedRow.Cells[4].Text;



            txtDescription.Text = gvBookedHallDetails.SelectedRow.Cells[9].Text;



            txtDateCreated.Text = gvBookedHallDetails.SelectedRow.Cells[10].Text;

            txtDateChanged.Text = gvBookedHallDetails.SelectedRow.Cells[11].Text;

            ddlBookingStatus.SelectedIndex = ddlBookingStatus.Items.IndexOf(ddlBookingStatus.Items.FindByText(gvBookedHallDetails.SelectedRow.Cells[12].Text.Trim()));



            //fileName = gvBookedHallDetails.SelectedRow.Cells[13].Text;

            this.BindGrid();
        }
    }
}