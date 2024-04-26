using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SeminarHallBookingSystem.SHBS.SHBS_User
{
    public partial class BookedSeminarHallUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                this.BindGrid();

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
    }
}