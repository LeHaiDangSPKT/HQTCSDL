using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using ShoeStore.Models;

namespace ShoeStore.Controls
{
    class Giay
    {
        Status status = new Status();
        Database database = new Database();
        DataTable danhMuc_tb;
        DataTable hangGiay_tb;

        DataTable giay_tb;
        string str;
        string idLoaiGiay = "0";

        public DataTable DanhMuc_tb { get => danhMuc_tb; }
        public DataTable HangGiay_tb { get => hangGiay_tb; }
        public DataTable Giay_tb { get => giay_tb; }
        public Giay()
        {
            LoadDanhSach(idLoaiGiay);
            DanhMuc danhMuc_tb = new DanhMuc();
            this.danhMuc_tb = danhMuc_tb.DanhMuc_tb;
            HangGiay hangGiay = new HangGiay();
            this.hangGiay_tb = hangGiay.HangGiay_tb;
        }
        public Giay(string idLoaiGiay)
        {
            this.idLoaiGiay = idLoaiGiay;
            LoadDanhSach(idLoaiGiay);
            DanhMuc danhMuc_tb = new DanhMuc();
            this.danhMuc_tb = danhMuc_tb.DanhMuc_tb;
            HangGiay hangGiay = new HangGiay();
            this.hangGiay_tb = hangGiay.HangGiay_tb;
        }
        public void LoadDanhSach(string idLoaiGiay)
        {
            if(idLoaiGiay == "0")
            {
                str = "select * from HANGGIAY, LOAIGIAY, GIAY  where " +
                    "GIAY.status=1 and GIAY.idLoaiGiay = LOAIGIAY.idLoaiGiay and LOAIGIAY.idHangGiay = HANGGIAY.idHangGiay";

            }
            else
            {
                str = "select * from HANGGIAY, LOAIGIAY, GIAY  where " +
                    "GIAY.status=1 and GIAY.idLoaiGiay = LOAIGIAY.idLoaiGiay and LOAIGIAY.idHangGiay = HANGGIAY.idHangGiay " +
                    " and LOAIGIAY.idLoaiGiay='"+ idLoaiGiay + "' ORDER BY GIAY.idLoaiGiay ASC";

            }
            this.giay_tb = database.Execute(str);
        }
        public void TimKiem(string tenLoaiGiay)
        {
            str = "select * from HANGGIAY, LOAIGIAY, GIAY  where " +
                "GIAY.status=1 and GIAY.idLoaiGiay = LOAIGIAY.idLoaiGiay and LOAIGIAY.idHangGiay = HANGGIAY.idHangGiay and " +
                "LOAIGIAY.tenLoaiGiay like '" + tenLoaiGiay + "%'";
            this.giay_tb = database.Execute(str);
        }
        public string CapNhat(int index, string giaban)
        {
            string idGiay = giay_tb.Rows[index]["idGiay"].ToString();
            string str = "update GIAY set giaBan = '"+giaban+"' where status = 1 and idGiay = " + idGiay;
            database.ExecuteNonQuery(str);
            LoadDanhSach(idLoaiGiay);
            return status.Success;
        }
        public string Them(string idLoaiGiayThem, string mauSac, string size)
        {
            string str = "insert into GIAY(idLoaiGiay, mauSac, size) values('" + idLoaiGiayThem + "', N'" + mauSac + "', '" + size + "')";
            database.ExecuteNonQuery(str);
            LoadDanhSach(idLoaiGiay);
            return status.Success;
        }
    }
}
