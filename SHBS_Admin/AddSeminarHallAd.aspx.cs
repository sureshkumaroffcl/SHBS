using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace SeminarHallBookingSystem.SHBS.SHBS_Admin
{
    public partial class AddSeminarHallAd : System.Web.UI.Page
    {
        int varHallId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                ddlHallType.SelectedIndex = 0;
                this.BindGrid();
                ResetRecords();



            }
        }


        protected string FormatImageUrl(string HallImage)
        {

            if (HallImage != null && HallImage.Length > 0)

                return ("~/" + HallImage);

            else return null;

        }

        private void BindGrid()
        {

            string SqlQuery = "SELECT * FROM tblHallDetails";
            using (SqlConnection con = Connection.GetConnection())
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(SqlQuery, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);



                        gvHallDetails.DataSource = dt;
                        gvHallDetails.DataBind();

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

            string filename = Path.GetFileName(fuUploadImg.PostedFile.FileName);
            fuUploadImg.SaveAs(Server.MapPath("~/HallImages/" + filename));



            SqlDataAdapter sda = new SqlDataAdapter(@"select * from [tblHallDetails] Where [HallId] = '" + varHallId + "' AND [HallName] = '" + this.txtHallName.Text + "'", con);

            DataSet ds = new DataSet();
            sda.Fill(ds);


            if (ds.Tables[0].Rows.Count > 0)
            {

                SqlQuery = @"UPDATE [SeminarHallBookingSystem].[dbo].[tblHallDetails] 
                SET

       [HallName] = '" + this.txtHallName.Text + "', [HallType] = '" + this.ddlHallType.SelectedItem.ToString() + "' , [BlockName] ='" + this.txtBlockName.Text + "',[Description] = '" + this.txtDescription.Text + "',[DateCreated] ='" + DateTime.Now.ToString("dd-MM-yyyy hh:mm tt") + "', [DateChanged] = '" + DateTime.Now.ToString("dd-MM-yyyy hh:mm tt") + "'),[HallImage] ='" + "HallImages/" + filename + "' WHERE [HallId] = '" + varHallId + "' ";


                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Data Successfully Updated');", true);
            }

            else if (IfHallIdExists(con, varHallId.ToString()) == 0)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Record exists');", true);

            }




            else
            {
                SqlQuery = @"INSERT INTO [SeminarHallBookingSystem].[dbo].[tblHallDetails]
           ([HallId]
           ,[HallName]
           ,[HallType]
           ,[BlockName]
           ,[Description]
           ,[DateCreated]
           ,[DateChanged]
           ,[HallImage])
     VALUES
    
          ('" + varHallId + "','" + this.txtHallName.Text + "','" + this.ddlHallType.SelectedItem.ToString() + "','" + this.txtBlockName.Text + "','" + this.txtDescription.Text + "','" + DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") + "','" + DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") + "','" + "HallImages/" + filename + "')";


                // DateTime.Now.ToString("MM/dd/yyyy hh:mm tt")

                SqlCommand cmd = new SqlCommand(SqlQuery, con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Record saved');", true);
            }

            con.Close();



            this.BindGrid();
            ResetRecords();




        }

        private int IfHallIdExists(SqlConnection con, string HallId)
        {
            SqlDataAdapter sda = new SqlDataAdapter("SELECT ISNULL (max(HallId),0) +1 AS HallId FROM tblHallDetails", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                varHallId = dt.Rows[0].Field<int>("HallId");
                return varHallId;

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
            //txtHallId.Text = string.Empty;

            txtHallName.Text = string.Empty;
            ddlHallType.SelectedIndex = 0;
            txtBlockName.Text = string.Empty;

            txtDescription.Text = string.Empty;
            txtDateCreated.Text = string.Empty;
            txtDateChanged.Text = string.Empty;
            string fuUploadImg = string.Empty;


            btnSave.Text = "Save";

        }

        protected void gvHallDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#exampleModal3').modal('show')", true);

            btnSave.Text = "Update";


            //txtHallId.Text = gvHallDetails.SelectedRow.Cells[1].Text;

            txtHallName.Text = gvHallDetails.SelectedRow.Cells[2].Text;

            ddlHallType.SelectedIndex = ddlHallType.Items.IndexOf(ddlHallType.Items.FindByText(gvHallDetails.SelectedRow.Cells[3].Text.Trim()));
            //ddlHallType.SelectedItem.Value = gvHallDetails.SelectedRow.Cells[4].Text;

            txtBlockName.Text = gvHallDetails.SelectedRow.Cells[4].Text;

            txtDescription.Text = gvHallDetails.SelectedRow.Cells[5].Text;



            txtDateCreated.Text = gvHallDetails.SelectedRow.Cells[6].Text;

            txtDateChanged.Text = gvHallDetails.SelectedRow.Cells[7].Text;


            //fileName = gvHallDetails.SelectedRow.Cells[8].Text;

            this.BindGrid();

        }
    }
}