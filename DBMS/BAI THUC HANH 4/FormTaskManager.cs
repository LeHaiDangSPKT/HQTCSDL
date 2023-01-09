using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Media.Imaging;
using System.Text.RegularExpressions;

namespace BAI_THUC_HANH_2
{
    public partial class FormTaskManager : Form
    {
        private int STT;
        private DrawNote drawNote;
        private Graphics graphics = null;
        // private int ID;   
        private bool flag = false;
        private DateTime timeMin;

        public FormTaskManager()
        {
            InitializeComponent();
            
        }

        private void thoátToolStripMenuItem_Click(object sender, EventArgs e)
        {     
            this.Close();
        }

        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void splitContainer1_Panel1_Paint_1(object sender, PaintEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void splitContainer2_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnAddEvent_Click(object sender, EventArgs e)
        {
            //helpProvider1.SetHelpString(txtTitle, "Nhap HoTen sinh vien");
            //helpProvider1.SetHelpString(rtxtMoTa, "Nhap Mota sinh vien");

            XuLy();

            if (KiemTraDuLieu())
            {
                NhapDuLieu();
                timerNote.Start();
                MessageBox.Show("Saved");
                resetData();
            }
        }
        public void NhapDuLieu()
        {
            ListViewItem eVent = new ListViewItem(this.STT.ToString());
            eVent.SubItems.Add(new ListViewItem.ListViewSubItem(eVent, this.txtID.Text));
            eVent.SubItems.Add(new ListViewItem.ListViewSubItem(eVent, this.txtTitle.Text));
            eVent.SubItems.Add(new ListViewItem.ListViewSubItem(eVent, this.rtxtMoTa.Text));
            eVent.SubItems.Add(new ListViewItem.ListViewSubItem(eVent, this.datefrom.Value.ToString()));
            eVent.SubItems.Add(new ListViewItem.ListViewSubItem(eVent, this.dateTo.Value.ToString()));
            eVent.SubItems.Add(new ListViewItem.ListViewSubItem(eVent, this.txtKhoa.Text));
            this.listEvent.Items.Add(eVent);
            Bitmap bmp = new Bitmap(this.pictureBox1.ClientSize.Width, this.pictureBox1.ClientSize.Height);
            this.pictureBox1.DrawToBitmap(bmp, this.pictureBox1.ClientRectangle);
            bmp.Save(String.Format("{0}.jpg", this.STT));
            this.STT += 1;
            graphics = null;
        }
        public void resetData()
        {
            this.pictureBox1.CreateGraphics().Clear(Color.Pink);
            this.txtID.Clear();
            this.txtTitle.Clear();
            this.rtxtMoTa.Clear();
            this.datefrom.Refresh();
            this.dateTo.Refresh();
            this.txtKhoa.Clear();
        }

        private void FormTaskManager_Load(object sender, EventArgs e)
        {    
            STT = 1;
            drawNote = new DrawNote();
            helpProvider1.SetHelpString(txtTitle, "Nhap HoTen sinh vien");
            helpProvider1.SetHelpString(rtxtMoTa, "Nhap Mota sinh vien");
            helpProvider1.SetHelpString(txtID, "Nhap MSSV");
            helpProvider1.SetHelpString(txtKhoa, "Nhap khoa sinh vien dang hoc");
            helpProvider1.SetHelpString(datefrom, "Nhap ngay bat dau khoa hoc");
            helpProvider1.SetHelpString(dateTo, "Nhap ngay ket thuc khoa hoc");
            helpProvider1.SetHelpString(txtGhiChu, "ve ghi chu lai");
        }

        #region Vẽ ghi chú
        private void pictureBox1_MouseUp(object sender, MouseEventArgs e)
        {
            drawNote.isDraw = false;
        }

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            drawNote.isDraw = true;
            drawNote.X = e.X;
            drawNote.Y = e.Y;
        }
        
        private void pictureBox1_MouseMove(object sender, MouseEventArgs e)
        {
         
            if (drawNote.isDraw)
            {
                if (graphics == null)
                {
                    graphics = pictureBox1.CreateGraphics();
                    Bitmap bmp = new Bitmap(pictureBox1.ClientSize.Width, pictureBox1.ClientSize.Height);
                    pictureBox1.Image = bmp;
                    graphics = Graphics.FromImage(bmp);
                    graphics.Clear(Color.Pink);
                    
                }

                graphics.DrawLine(drawNote.pen, drawNote.X, drawNote.Y, e.X, e.Y);

                graphics.Flush();
                graphics.Save();
                pictureBox1.Refresh();

                drawNote.X = e.X;
                drawNote.Y = e.Y;

            }
            
        }
        #endregion

        #region LoadLichSu
        private void listEvent_Click(object sender, EventArgs e)
        {
            this.txtID.Text = this.listEvent.SelectedItems[0].SubItems[1].Text.Trim();
            this.txtTitle.Text = this.listEvent.SelectedItems[0].SubItems[2].Text.Trim();
            this.rtxtMoTa.Text = this.listEvent.SelectedItems[0].SubItems[3].Text.Trim();
            this.datefrom.Value = DateTime.Parse(this.listEvent.SelectedItems[0].SubItems[4].Text.Trim());
            this.dateTo.Value = DateTime.Parse(this.listEvent.SelectedItems[0].SubItems[5].Text.Trim());
            this.txtKhoa.Text = this.listEvent.SelectedItems[0].SubItems[6].Text.Trim();
            //toolStripLabel2.Text = this.txtTitle.Text;
            using (FileStream stream = new FileStream(String.Format("{0}.jpg", this.listEvent.SelectedItems[0].SubItems[0].Text.Trim()), FileMode.Open, FileAccess.Read))
            {
                pictureBox1.Image = Image.FromStream(stream);
            }
            flag = true;
            graphics = null;

        }
        #endregion

        #region Chỉnh Sửa sự kiện
        private void btnEditEvent_Click(object sender, EventArgs e)
        {
            if (flag == true)
            {
                XuLy();
                if (KiemTraDuLieu())
                {
                    this.listEvent.SelectedItems[0].SubItems[1].Text = this.txtID.Text.Trim();
                    this.listEvent.SelectedItems[0].SubItems[2].Text = this.txtTitle.Text.Trim();
                    this.listEvent.SelectedItems[0].SubItems[3].Text = this.rtxtMoTa.Text.Trim();
                    this.listEvent.SelectedItems[0].SubItems[4].Text = this.datefrom.Text.ToString();
                    this.listEvent.SelectedItems[0].SubItems[5].Text = this.dateTo.Text.ToString();
                    this.listEvent.SelectedItems[0].SubItems[6].Text = this.txtKhoa.Text.Trim();
                    Bitmap bmp = new Bitmap(this.pictureBox1.ClientSize.Width, this.pictureBox1.ClientSize.Height);
                    this.pictureBox1.DrawToBitmap(bmp, this.pictureBox1.ClientRectangle);
                    bmp.Save(String.Format("{0}.jpg", this.listEvent.SelectedItems[0].SubItems[0].Text.Trim()));
                    MessageBox.Show("Saved");
                    resetData();
                }
            }
            flag = false;
        }
        #endregion

        private void btnNewNote_Click(object sender, EventArgs e)
        {
            
            this.pictureBox1.CreateGraphics().Clear(Color.Pink);
            graphics = null;

        }

        private void btnEraseEvent_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn chắc chắn xóa?", "DELETE", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) == DialogResult.OK)
                {
                    listEvent.Items.RemoveAt(listEvent.SelectedIndices[0]);
                    MessageBox.Show("Xóa thành công");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Cần chọn STT Sinh Viên xóa?", "WARRING", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
            }
        }

        private void dateTo_ValueChanged(object sender, EventArgs e)
        {

        }

       
        private void tạoSựKiênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Phần mềm quản lý sinh viên _ Trần Thị Lệ Xuân _ 18133066");
        }
 
        private void pictureBox1_Resize(object sender, EventArgs e)
        {
            if (graphics == null) return;
            graphics.Dispose();
            this.pictureBox1.CreateGraphics().Clear(Color.Pink);
            Bitmap bmp = new Bitmap(this.pictureBox1.ClientSize.Width, this.pictureBox1.ClientSize.Height, this.pictureBox1.CreateGraphics());
        }

        #region TaoMoi
        private void CreatToolStripMenuItem_Click(object sender, EventArgs e)
        {
            resetData();
            Bitmap bmp = new Bitmap(this.pictureBox1.ClientSize.Width, this.pictureBox1.ClientSize.Height, this.pictureBox1.CreateGraphics());
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            resetData();
            Bitmap bmp = new Bitmap(this.pictureBox1.ClientSize.Width, this.pictureBox1.ClientSize.Height, this.pictureBox1.CreateGraphics());
        }
        #endregion

        private void toolStrip2_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void toolStripComboBox1_Click(object sender, EventArgs e)
        {
            
        }

        #region Sự kiện tiếp theo
        private void timerNote_Tick(object sender, EventArgs e)
        {

            timeMin = new DateTime(2200, 2, 20, 20, 20, 20);
            DateTime timePick = new DateTime();
            int n = 0;
            bool flag2 = false;
            for (n = 0; n < listEvent.Items.Count; n++)
            {
                timePick = DateTime.Parse(this.listEvent.Items[n].SubItems[4].Text);
                if (timePick >= DateTime.Now)
                {

                    if (timePick < timeMin)
                    {
                        this.toolStripLabel2.Text = this.listEvent.Items[n].SubItems[2].Text;
                        timeMin = timePick;
                        flag2 = true;
                    }

                }
            }
            if (flag2 == false)
                this.toolStripLabel2.Text = "chưa có sự kiện tiếp theo";
            TimeSpan t = timeMin - DateTime.Now;
            int x = 0;
            switch (toolStripComboBox1.Text)
            {
                case "Day":
                    x = t.Days;
                    break;
                case "Hour":
                    x = t.Hours + t.Days * 24;
                    break;
                case "Minutes":
                    x = t.Minutes + t.Hours * 60 + t.Days * 60 * 24;
                    break;
            }

            if (x < 100)
            {
                LoadingtoolStripProgressBar1.Value = x;
            }
            else
                LoadingtoolStripProgressBar1.Value = 100;


        }
        #endregion

        private void toolStripComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
           
        }

        private void txtTitle_Validating(object sender, CancelEventArgs e)
        {
            
        }
        private bool KiemTraDuLieu()
        {
            bool ok = true;
            if (txtTitle.Text == "") 
            {
                ok = false;
                errorProvider1.SetError(txtTitle, "Nhập họ và tên sinh viên");
            }

            if(rtxtMoTa.Text == "")
            {
                ok = false;
                errorProvider2.SetError(rtxtMoTa, "Nhập miêu tả");
            }

            if (txtID.Text == "")
            {
                ok = false;
                errorProvider3.SetError(txtID, "Nhập MSSV");
            }

            if (txtKhoa.Text == "")
            {
                ok = false;
                errorProvider4.SetError(txtKhoa, "Nhập khoa");
            }

            if (datefrom.Value <= System.DateTime.Now)
            {
                ok = false;
                errorProvider5.SetError(datefrom, "Nhập lại ngày bắt đầu");
            }

            if (dateTo.Value <= System.DateTime.Now || dateTo.Value <= datefrom.Value )
            {
                ok = false;
                errorProvider6.SetError(dateTo, "Nhập lại ngày kết thúc");
            }

            return ok;
                 
        }
        private void XuLy()
        {
            errorProvider1.SetError(txtTitle, "");
            errorProvider2.SetError(rtxtMoTa, "");
            errorProvider3.SetError(txtID, "");
            errorProvider4.SetError(txtKhoa, "");
            errorProvider5.SetError(datefrom, "");
            errorProvider6.SetError(dateTo, "");
        }
  
        private void rtxtMoTa_TextChanged(object sender, EventArgs e)
        {
            
        }

    }
    public class DrawNote
    {
        public int X { set; get; }
        public int Y { set; get; }
        public Color color { set; get; }
        public Pen pen { set; get; }
        public bool isDraw { set; get; }
        public DrawNote ()
        {
            isDraw = false;
            color = Color.White;
            pen = new Pen(color,2);
        }

    }
}
