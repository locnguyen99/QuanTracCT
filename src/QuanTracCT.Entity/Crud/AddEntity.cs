using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Entity.UpdateEntities
{
    public class AddEntity
    {
        ////1.Thêm mốc vào bảng mốc
        //public void AddMoc()
        //{
        //    var dataContext = new QuanTracLunCTContext();
        //    var moc = new Moc();
        //    moc.TenMoc = "M700";
        //    moc.MaCK = new Guid("431A53C7-B910-413F-93E4-C24E354356F6");
        //    dataContext.Entry(moc).State = EntityState.Modified;
        //    dataContext.Mocs.Add(moc);
        //    dataContext.SaveChanges();
        //}

        ////2.Thêm mốc quan trắc vào bảng mốc
        //public void AddMocQT()
        //{
        //    var dataContext = new QuanTracLunCTContext();  //muon add them properties thi them zo...
        //    var mocqt = new Moc();
        //    mocqt.TenMoc = "M8000";
        //    mocqt.LoaiMoc = "MocQT";
        //    mocqt.MaCK = new Guid("431A53C7-B910-413F-93E4-C24E354356F6");
        //    dataContext.Entry(mocqt).State = EntityState.Modified;
        //    dataContext.Mocs.Add(mocqt);
        //    dataContext.SaveChanges();
        //}

        //3.Add danh sach moc 
        //public void AddList()
        //{
        //    var dataContext = new QuanTracLunCTContext();
        //    IList<Moc> moc = new List<Moc>()
        //    {
        //        new Moc() { TenMoc = "M11", MaCK = new Guid("431A53C7-B910-413F-93E4-C24E354356F6") },
        //        new Moc() { TenMoc = "M12", MaCK = new Guid("431A53C7-B910-413F-93E4-C24E354356F6")  },
        //        new Moc() { TenMoc = "M13", MaCK = new Guid("431A53C7-B910-413F-93E4-C24E354356F6")  },
        //    };
        //    dataContext.Mocs.AddRange(moc);
        //    dataContext.SaveChanges();
        //}

        //public void addsygn()
        //{
        //    var dataContext = new QuanTracLunCTContext();
        //    var moc = new Moc();
        //    moc.TenMoc = "M323";
        //    moc.MaCK = new Guid("431A53C7-B910-413F-93E4-C24E354356F6");
        //    dataContext.Entry(moc).State = EntityState.Modified;
        //    dataContext.Mocs.AddAsync(moc);
        //    dataContext.SaveChanges();
        //}


    }
}
