using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using ShoeStore.Models;

namespace ShoeStore.Controls
{
    class DanhMuc
    {
        Status status = new Status();
        Database database = new Database();
        DataTable hangGiay_tb;
        DataTable danhMuc_tb;
        string str;
        public DataTable DanhMuc_tb { get => danhMuc_tb; }
        public DataTable HangGiay_tb { get => hangGiay_tb; }

        public DanhMuc()
        {
            LoadDanhSach();
            HangGiay hangGiay = new HangGiay();
            this.hangGiay_tb = hangGiay.HangGiay_tb;
        }
        public void LoadDanhSach()
        {
            str = "select * from HANGGIAY inner join LOAIGIAY " +
                "on HANGGIAY.idHangGiay = LOAIGIAY.idHangGiay where LOAIGIAY.status=1";
            this.danhMuc_tb = database.Execute(str);
        }
        public void TimKiem(String ten)
        {
            str = "select * from HANGGIAY inner join LOAIGIAY " +
                "on HANGGIAY.idHangGiay = LOAIGIAY.idHangGiay where LOAIGIAY.status=1 and LOAIGIAY.tenLoaiGiay like '" + ten + "%'";
            this.danhMuc_tb = database.Execute(str);
        }
        public string Them(string ten, string idHangGiay)
        {
            string str = "insert into LOAIGIAY(tenLoaiGiay, idHangGiay) values(N'" + ten + "', '"+idHangGiay+"')";
            database.ExecuteNonQuery(str);
            LoadDanhSach();
            return status.Success;
        }
        public string CapNhat(int index, string ten, int idHangGiay)
        {
            string str = "update LOAIGIAY set tenLoaiGiay = N'" + ten + "', idHangGiay='"+ idHangGiay + "' where status = 1 and idLoaiGiay = " + danhMuc_tb.Rows[index]["idLoaiGiay"].ToString();
            database.ExecuteNonQuery(str);
            LoadDanhSach();
            return status.Success;
        }
        public string Xoa(int index)
        {
            str = "update LOAIGIAY set status=0 where idLoaiGiay = '" + danhMuc_tb.Rows[index]["idLoaiGiay"].ToString() + "'";
            database.ExecuteNonQuery(str);
            LoadDanhSach();
            return status.Success;
        }
    }
}
