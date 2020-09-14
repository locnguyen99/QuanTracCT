using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Entity.Crud
{
    public class UpdateEntities
    {
        public void UpdateMoc()
        {
            var dataContext = new QuanTracLunCTContext();
            var moc = new Moc();
            moc.TenMoc = "M554";
            moc.MaCK = new Guid("431A53C7-B910-413F-93E4-C24E354356F6");
            dataContext.Entry(moc).State = EntityState.Modified;
            dataContext.Mocs.Update
        }
    }
}
