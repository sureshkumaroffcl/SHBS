using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SeminarHallBookingSystem.SHBS.SHBS_Admin
{
    public partial class AvailableSeminarHallAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                this.BindGrid();


            }
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
        protected string FormatImageUrl(string HallImage)
        {

            if (HallImage != null && HallImage.Length > 0)

                return ("~/" + HallImage);

            else return null;

        }
    }
}