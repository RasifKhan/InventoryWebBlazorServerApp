using System;
using System.Collections.Generic;
using System.Net.Sockets;
using Atl_Inv_DataAccess;
using Atl_Inv_DataAccess.Data;
using Atl_Inv_DataAccess.Data.view;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
namespace Atl_Inv_DataAccess.Data
{
  public class ApplicationDbContext : IdentityDbContext
   {
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
    {

    }
        public virtual DbSet<Zone> Zones { get; set; }
        public virtual DbSet<SetupDt_Data> SetupDt_Datas { get; set; }
        public virtual DbSet<SetupMt_Data> SetupMt_Datas { get; set; }
        public virtual DbSet<ContactPersonInfoSetup> ContactPersonInfosSetup { get; set; }
        public virtual DbSet<EmployeeInfoSetup> EmployeeInfosSetup { get; set; }
        public virtual DbSet<CompanyInfoSetup> CompanyInfosSetup { get; set; }
        public virtual DbSet<QuotationMT> QuotationsMT { get; set; }
        public virtual DbSet<QuotationDt> QuotationsDt { get; set; }
        public virtual DbSet<ProductInfoSetup> ProductInfosSetup { get; set; }
        public virtual DbSet<WorkOrder> WorkOrders { get; set; }
        public virtual DbSet<ApplicationUser> ApplicationUsers { get; set; }
        public virtual DbSet<StockMt> StocksMt { get; set; }
        public virtual DbSet<StockDt> StocksDt { get; set; }
        public virtual DbSet<ChallanMt> ChallansMt { get; set; }
        public virtual DbSet<VwStockMrProdDetail> VW_StockMrProdDetails { get; set; }
        public virtual DbSet<VwWorkOrderProdDetail> VW_WorkOrderProdDetails { get; set; }
        public virtual DbSet<VwExistingStockProd> VW_ExistingStockProd { get; set; }
        public virtual DbSet<ChallanDt> ChallansDt { get; set; }


        //public virtual DbSet<AspNetUserRole> AspNetUserRoles { get; set; }
        //public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        //public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
      

    }
}
//protected override void OnModelCreating(ModelBuilder modelBuilder)
//{
//    modelBuilder.Entity<CompanyInfo>(entity =>
//    {
//        entity.HasKey(e => e.CompanyId).HasName("PK_CompanyInfo");

//        entity.Property(e => e.AddedDate).HasColumnType("smalldatetime");
//        entity.Property(e => e.Address).IsUnicode(false);
//        entity.Property(e => e.Alias)
//            .HasMaxLength(255)
//            .IsUnicode(false);
//        entity.Property(e => e.CompanyName)
//            .HasMaxLength(255)
//            .IsUnicode(false);
//        entity.Property(e => e.ContactNumber)
//            .HasMaxLength(255)
//            .IsUnicode(false);
//        entity.Property(e => e.Email)
//            .HasMaxLength(255)
//            .IsUnicode(false);
//        entity.Property(e => e.GroupName)
//            .HasMaxLength(255)
//            .IsUnicode(false);
//        entity.Property(e => e.Mention)
//            .HasMaxLength(255)
//            .IsUnicode(false);
//        entity.Property(e => e.Remarks)
//            .HasMaxLength(255)
//            .IsUnicode(false);
//        entity.Property(e => e.UpdatedDate).HasColumnType("smalldatetime");

//        entity.HasOne(d => d.Zone).WithMany(p => p.CompanyInfos)
//            .HasForeignKey(d => d.ZoneId)
//            .HasConstraintName("FK_ZoneId");
//    });

//    modelBuilder.Entity<Zone>(entity =>
//    {
//        entity.HasKey(e => e.ZoneId).HasName("PK_Zone");

//        entity.Property(e => e.AddedDate).HasColumnType("smalldatetime");
//        entity.Property(e => e.Remarks)
//            .HasMaxLength(255)
//            .IsUnicode(false);
//        entity.Property(e => e.UpdatedDate).HasColumnType("smalldatetime");
//        entity.Property(e => e.ZoneName)
//            .HasMaxLength(255)
//            .IsUnicode(false);
//    });
//***************Note  this part for crating '20240115060306_AddIdentityTables' migration 
//modelBuilder.Entity<IdentityUserLogin<string>>().HasKey(p => p.UserId);

//modelBuilder.Entity<IdentityUserRole<string>>(entity =>
//{
//    entity.HasKey(e => new { e.UserId, e.RoleId });
//});

//modelBuilder.Entity<IdentityUserToken<string>>(entity =>
//{
//    entity.HasKey(e => new { e.UserId, e.LoginProvider, e.Name });
//});
//****************Note**************

//   OnModelCreatingPartial(modelBuilder);

