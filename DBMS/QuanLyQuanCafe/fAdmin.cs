using QuanLyQuanCafe.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyQuanCafe
{
    public partial class fAdmin : Form
    {
        public fAdmin()
        {
            InitializeComponent();
            
        }
        //void LoadFoodList()
        //{
        //    string query = " select * from Food";

        //    dtgvFood.DataSource = DataProvider.Instance.ExcecuteQuery(query);

        //}
        //void LoadAccountList()
        //{

        //    string query = "exec dbo.USP_GetAccountByUserName @userName";
           
        //    dtgvAccount.DataSource = DataProvider.Instance.ExcecuteQuery(query, new object[] { "Staff" });

        //}
    }
}
