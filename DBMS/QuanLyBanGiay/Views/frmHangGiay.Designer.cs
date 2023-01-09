namespace QuanLyBanGiay.Views
{
    partial class frmHangGiay
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmHangGiay));
            this.groupBoxThongTinHangGiay = new System.Windows.Forms.GroupBox();
            this.lvThongTinHangGiay = new System.Windows.Forms.ListView();
            this.colID = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.coltenHangGiay = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.groupBoxThongTinChiTietHangGiay = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtTenHangGiay = new System.Windows.Forms.TextBox();
            this.txtIdHangGiay = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnSuaHangGiay = new System.Windows.Forms.Button();
            this.btnThemHangGiay = new System.Windows.Forms.Button();
            this.txtSearchHangGiay = new System.Windows.Forms.TextBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.txtStatus = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.colStatus = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.groupBoxThongTinHangGiay.SuspendLayout();
            this.groupBoxThongTinChiTietHangGiay.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBoxThongTinHangGiay
            // 
            this.groupBoxThongTinHangGiay.Controls.Add(this.lvThongTinHangGiay);
            this.groupBoxThongTinHangGiay.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBoxThongTinHangGiay.Location = new System.Drawing.Point(12, 30);
            this.groupBoxThongTinHangGiay.Name = "groupBoxThongTinHangGiay";
            this.groupBoxThongTinHangGiay.Size = new System.Drawing.Size(410, 272);
            this.groupBoxThongTinHangGiay.TabIndex = 0;
            this.groupBoxThongTinHangGiay.TabStop = false;
            this.groupBoxThongTinHangGiay.Text = "Thông Tin Hãng Giày";
            // 
            // lvThongTinHangGiay
            // 
            this.lvThongTinHangGiay.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.colID,
            this.coltenHangGiay,
            this.colStatus});
            this.lvThongTinHangGiay.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lvThongTinHangGiay.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lvThongTinHangGiay.HideSelection = false;
            this.lvThongTinHangGiay.Location = new System.Drawing.Point(3, 16);
            this.lvThongTinHangGiay.Name = "lvThongTinHangGiay";
            this.lvThongTinHangGiay.Size = new System.Drawing.Size(404, 253);
            this.lvThongTinHangGiay.TabIndex = 0;
            this.lvThongTinHangGiay.UseCompatibleStateImageBehavior = false;
            this.lvThongTinHangGiay.View = System.Windows.Forms.View.Details;
            // 
            // colID
            // 
            this.colID.Text = "ID";
            // 
            // coltenHangGiay
            // 
            this.coltenHangGiay.Text = "Tên Hãng Giày";
            this.coltenHangGiay.Width = 166;
            // 
            // groupBoxThongTinChiTietHangGiay
            // 
            this.groupBoxThongTinChiTietHangGiay.Controls.Add(this.txtStatus);
            this.groupBoxThongTinChiTietHangGiay.Controls.Add(this.label10);
            this.groupBoxThongTinChiTietHangGiay.Controls.Add(this.label1);
            this.groupBoxThongTinChiTietHangGiay.Controls.Add(this.label2);
            this.groupBoxThongTinChiTietHangGiay.Controls.Add(this.txtTenHangGiay);
            this.groupBoxThongTinChiTietHangGiay.Controls.Add(this.txtIdHangGiay);
            this.groupBoxThongTinChiTietHangGiay.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBoxThongTinChiTietHangGiay.Location = new System.Drawing.Point(12, 308);
            this.groupBoxThongTinChiTietHangGiay.Name = "groupBoxThongTinChiTietHangGiay";
            this.groupBoxThongTinChiTietHangGiay.Size = new System.Drawing.Size(410, 129);
            this.groupBoxThongTinChiTietHangGiay.TabIndex = 1;
            this.groupBoxThongTinChiTietHangGiay.TabStop = false;
            this.groupBoxThongTinChiTietHangGiay.Text = "Thông Tin Chi Tiết";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(38, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(102, 16);
            this.label1.TabIndex = 4;
            this.label1.Text = "Id Hãng Giày:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(38, 65);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(116, 16);
            this.label2.TabIndex = 3;
            this.label2.Text = "Tên Hãng Giày:";
            // 
            // txtTenHangGiay
            // 
            this.txtTenHangGiay.Location = new System.Drawing.Point(169, 61);
            this.txtTenHangGiay.Name = "txtTenHangGiay";
            this.txtTenHangGiay.Size = new System.Drawing.Size(211, 20);
            this.txtTenHangGiay.TabIndex = 1;
            // 
            // txtIdHangGiay
            // 
            this.txtIdHangGiay.Location = new System.Drawing.Point(169, 24);
            this.txtIdHangGiay.Name = "txtIdHangGiay";
            this.txtIdHangGiay.Size = new System.Drawing.Size(211, 20);
            this.txtIdHangGiay.TabIndex = 0;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnSuaHangGiay);
            this.groupBox1.Controls.Add(this.btnThemHangGiay);
            this.groupBox1.Location = new System.Drawing.Point(12, 443);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(410, 56);
            this.groupBox1.TabIndex = 2;
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
            // txtSearchHangGiay
            // 
            this.txtSearchHangGiay.Location = new System.Drawing.Point(243, 12);
            this.txtSearchHangGiay.Name = "txtSearchHangGiay";
            this.txtSearchHangGiay.Size = new System.Drawing.Size(179, 20);
            this.txtSearchHangGiay.TabIndex = 6;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pictureBox1.BackgroundImage")));
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pictureBox1.Location = new System.Drawing.Point(203, 2);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(31, 33);
            this.pictureBox1.TabIndex = 12;
            this.pictureBox1.TabStop = false;
            // 
            // txtStatus
            // 
            this.txtStatus.Location = new System.Drawing.Point(169, 95);
            this.txtStatus.Name = "txtStatus";
            this.txtStatus.Size = new System.Drawing.Size(209, 20);
            this.txtStatus.TabIndex = 25;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(38, 99);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(55, 16);
            this.label10.TabIndex = 24;
            this.label10.Text = "Status:";
            // 
            // colStatus
            // 
            this.colStatus.Text = "Status";
            // 
            // frmHangGiay
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.DarkCyan;
            this.ClientSize = new System.Drawing.Size(434, 511);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.txtSearchHangGiay);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBoxThongTinChiTietHangGiay);
            this.Controls.Add(this.groupBoxThongTinHangGiay);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmHangGiay";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmHangGiay";
            this.groupBoxThongTinHangGiay.ResumeLayout(false);
            this.groupBoxThongTinChiTietHangGiay.ResumeLayout(false);
            this.groupBoxThongTinChiTietHangGiay.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBoxThongTinHangGiay;
        private System.Windows.Forms.ListView lvThongTinHangGiay;
        private System.Windows.Forms.GroupBox groupBoxThongTinChiTietHangGiay;
        private System.Windows.Forms.ColumnHeader colID;
        private System.Windows.Forms.ColumnHeader coltenHangGiay;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtTenHangGiay;
        private System.Windows.Forms.TextBox txtIdHangGiay;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnSuaHangGiay;
        private System.Windows.Forms.Button btnThemHangGiay;
        private System.Windows.Forms.TextBox txtSearchHangGiay;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.TextBox txtStatus;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.ColumnHeader colStatus;
    }
}