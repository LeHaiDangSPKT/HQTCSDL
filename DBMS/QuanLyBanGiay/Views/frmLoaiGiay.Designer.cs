namespace QuanLyBanGiay.Views
{
    partial class frmLoaiGiay
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmLoaiGiay));
            this.groupBoxThongTinLoaiGiay = new System.Windows.Forms.GroupBox();
            this.lvThongTinLoaiGiay = new System.Windows.Forms.ListView();
            this.colID = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.coltenLoaiGiay = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.colKhuyenMai = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.txtSearchLoaiGiay = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnSuaHangGiay = new System.Windows.Forms.Button();
            this.btnThemHangGiay = new System.Windows.Forms.Button();
            this.groupBoxThongTinChiTietLoaiGiay = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtTenLoaiGiay = new System.Windows.Forms.TextBox();
            this.txtIdLoaiGiay = new System.Windows.Forms.TextBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.txtStatus = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.colStatus = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.groupBoxThongTinLoaiGiay.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBoxThongTinChiTietLoaiGiay.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBoxThongTinLoaiGiay
            // 
            this.groupBoxThongTinLoaiGiay.BackColor = System.Drawing.Color.Transparent;
            this.groupBoxThongTinLoaiGiay.Controls.Add(this.lvThongTinLoaiGiay);
            this.groupBoxThongTinLoaiGiay.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBoxThongTinLoaiGiay.Location = new System.Drawing.Point(12, 38);
            this.groupBoxThongTinLoaiGiay.Name = "groupBoxThongTinLoaiGiay";
            this.groupBoxThongTinLoaiGiay.Size = new System.Drawing.Size(410, 272);
            this.groupBoxThongTinLoaiGiay.TabIndex = 1;
            this.groupBoxThongTinLoaiGiay.TabStop = false;
            this.groupBoxThongTinLoaiGiay.Text = "Thông Tin Loại Giày";
            // 
            // lvThongTinLoaiGiay
            // 
            this.lvThongTinLoaiGiay.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.colID,
            this.coltenLoaiGiay,
            this.colKhuyenMai,
            this.colStatus});
            this.lvThongTinLoaiGiay.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lvThongTinLoaiGiay.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lvThongTinLoaiGiay.HideSelection = false;
            this.lvThongTinLoaiGiay.Location = new System.Drawing.Point(3, 16);
            this.lvThongTinLoaiGiay.Name = "lvThongTinLoaiGiay";
            this.lvThongTinLoaiGiay.Size = new System.Drawing.Size(404, 253);
            this.lvThongTinLoaiGiay.TabIndex = 0;
            this.lvThongTinLoaiGiay.UseCompatibleStateImageBehavior = false;
            this.lvThongTinLoaiGiay.View = System.Windows.Forms.View.Details;
            // 
            // colID
            // 
            this.colID.Text = "ID";
            // 
            // coltenLoaiGiay
            // 
            this.coltenLoaiGiay.Text = "Tên Loại Giày";
            this.coltenLoaiGiay.Width = 166;
            // 
            // colKhuyenMai
            // 
            this.colKhuyenMai.Text = "Khuyến Mãi";
            this.colKhuyenMai.Width = 90;
            // 
            // txtSearchLoaiGiay
            // 
            this.txtSearchLoaiGiay.Location = new System.Drawing.Point(240, 12);
            this.txtSearchLoaiGiay.Name = "txtSearchLoaiGiay";
            this.txtSearchLoaiGiay.Size = new System.Drawing.Size(179, 20);
            this.txtSearchLoaiGiay.TabIndex = 7;
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.btnSuaHangGiay);
            this.groupBox1.Controls.Add(this.btnThemHangGiay);
            this.groupBox1.Location = new System.Drawing.Point(9, 451);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(410, 56);
            this.groupBox1.TabIndex = 9;
            this.groupBox1.TabStop = false;
            // 
            // btnSuaHangGiay
            // 
            this.btnSuaHangGiay.Location = new System.Drawing.Point(310, 13);
            this.btnSuaHangGiay.Name = "btnSuaHangGiay";
            this.btnSuaHangGiay.Size = new System.Drawing.Size(97, 37);
            this.btnSuaHangGiay.TabIndex = 5;
            this.btnSuaHangGiay.Text = "Sửa";
            this.btnSuaHangGiay.UseVisualStyleBackColor = true;
            // 
            // btnThemHangGiay
            // 
            this.btnThemHangGiay.Location = new System.Drawing.Point(197, 13);
            this.btnThemHangGiay.Name = "btnThemHangGiay";
            this.btnThemHangGiay.Size = new System.Drawing.Size(97, 37);
            this.btnThemHangGiay.TabIndex = 3;
            this.btnThemHangGiay.Text = "Thêm";
            this.btnThemHangGiay.UseVisualStyleBackColor = true;
            // 
            // groupBoxThongTinChiTietLoaiGiay
            // 
            this.groupBoxThongTinChiTietLoaiGiay.BackColor = System.Drawing.Color.Transparent;
            this.groupBoxThongTinChiTietLoaiGiay.Controls.Add(this.txtStatus);
            this.groupBoxThongTinChiTietLoaiGiay.Controls.Add(this.label10);
            this.groupBoxThongTinChiTietLoaiGiay.Controls.Add(this.label3);
            this.groupBoxThongTinChiTietLoaiGiay.Controls.Add(this.textBox1);
            this.groupBoxThongTinChiTietLoaiGiay.Controls.Add(this.label1);
            this.groupBoxThongTinChiTietLoaiGiay.Controls.Add(this.label2);
            this.groupBoxThongTinChiTietLoaiGiay.Controls.Add(this.txtTenLoaiGiay);
            this.groupBoxThongTinChiTietLoaiGiay.Controls.Add(this.txtIdLoaiGiay);
            this.groupBoxThongTinChiTietLoaiGiay.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBoxThongTinChiTietLoaiGiay.Location = new System.Drawing.Point(9, 316);
            this.groupBoxThongTinChiTietLoaiGiay.Name = "groupBoxThongTinChiTietLoaiGiay";
            this.groupBoxThongTinChiTietLoaiGiay.Size = new System.Drawing.Size(410, 129);
            this.groupBoxThongTinChiTietLoaiGiay.TabIndex = 8;
            this.groupBoxThongTinChiTietLoaiGiay.TabStop = false;
            this.groupBoxThongTinChiTietLoaiGiay.Text = "Thông Tin Chi Tiết";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(39, 74);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(91, 16);
            this.label3.TabIndex = 6;
            this.label3.Text = "Khuyến Mãi:";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(170, 70);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(211, 20);
            this.textBox1.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(43, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(95, 16);
            this.label1.TabIndex = 4;
            this.label1.Text = "Id Loại Giày:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(39, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(109, 16);
            this.label2.TabIndex = 3;
            this.label2.Text = "Tên Loại Giày:";
            // 
            // txtTenLoaiGiay
            // 
            this.txtTenLoaiGiay.Location = new System.Drawing.Point(170, 44);
            this.txtTenLoaiGiay.Name = "txtTenLoaiGiay";
            this.txtTenLoaiGiay.Size = new System.Drawing.Size(211, 20);
            this.txtTenLoaiGiay.TabIndex = 1;
            this.txtTenLoaiGiay.TextChanged += new System.EventHandler(this.txtTenLoaiGiay_TextChanged);
            // 
            // txtIdLoaiGiay
            // 
            this.txtIdLoaiGiay.Location = new System.Drawing.Point(170, 18);
            this.txtIdLoaiGiay.Name = "txtIdLoaiGiay";
            this.txtIdLoaiGiay.Size = new System.Drawing.Size(211, 20);
            this.txtIdLoaiGiay.TabIndex = 0;
            this.txtIdLoaiGiay.TextChanged += new System.EventHandler(this.txtIdLoaiGiay_TextChanged);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pictureBox1.BackgroundImage")));
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pictureBox1.Location = new System.Drawing.Point(203, 4);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(31, 33);
            this.pictureBox1.TabIndex = 13;
            this.pictureBox1.TabStop = false;
            // 
            // txtStatus
            // 
            this.txtStatus.Location = new System.Drawing.Point(170, 96);
            this.txtStatus.Name = "txtStatus";
            this.txtStatus.Size = new System.Drawing.Size(211, 20);
            this.txtStatus.TabIndex = 25;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(39, 99);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(55, 16);
            this.label10.TabIndex = 24;
            this.label10.Text = "Status:";
            // 
            // colStatus
            // 
            this.colStatus.Text = "Status";
            // 
            // frmLoaiGiay
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Teal;
            this.ClientSize = new System.Drawing.Size(434, 520);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBoxThongTinChiTietLoaiGiay);
            this.Controls.Add(this.txtSearchLoaiGiay);
            this.Controls.Add(this.groupBoxThongTinLoaiGiay);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmLoaiGiay";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmLoaiGiay";
            this.groupBoxThongTinLoaiGiay.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBoxThongTinChiTietLoaiGiay.ResumeLayout(false);
            this.groupBoxThongTinChiTietLoaiGiay.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBoxThongTinLoaiGiay;
        private System.Windows.Forms.ListView lvThongTinLoaiGiay;
        private System.Windows.Forms.ColumnHeader colID;
        private System.Windows.Forms.ColumnHeader coltenLoaiGiay;
        private System.Windows.Forms.TextBox txtSearchLoaiGiay;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnSuaHangGiay;
        private System.Windows.Forms.Button btnThemHangGiay;
        private System.Windows.Forms.GroupBox groupBoxThongTinChiTietLoaiGiay;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtTenLoaiGiay;
        private System.Windows.Forms.TextBox txtIdLoaiGiay;
        private System.Windows.Forms.ColumnHeader colKhuyenMai;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.TextBox txtStatus;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.ColumnHeader colStatus;
    }
}