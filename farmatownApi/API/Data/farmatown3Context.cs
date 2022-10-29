using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace API.Data
{
    public partial class farmatown3Context : DbContext
    {
        public farmatown3Context()
        {
        }

        public farmatown3Context(DbContextOptions<farmatown3Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Articulo> Articulos { get; set; } = null!;
        public virtual DbSet<Cliente> Clientes { get; set; } = null!;
        public virtual DbSet<DetalleLote> DetalleLotes { get; set; } = null!;
        public virtual DbSet<DetallesFactura> DetallesFacturas { get; set; } = null!;
        public virtual DbSet<Droga> Drogas { get; set; } = null!;
        public virtual DbSet<Factura> Facturas { get; set; } = null!;
        public virtual DbSet<FacturasObraSocial> FacturasObraSocials { get; set; } = null!;
        public virtual DbSet<Laboratorio> Laboratorios { get; set; } = null!;
        public virtual DbSet<Lote> Lotes { get; set; } = null!;
        public virtual DbSet<Proveedore> Proveedores { get; set; } = null!;
        public virtual DbSet<Tarjeta> Tarjetas { get; set; } = null!;
        public virtual DbSet<TipoArticulo> TipoArticulos { get; set; } = null!;
        public virtual DbSet<TipoPago> TipoPagos { get; set; } = null!;
        public virtual DbSet<TipoUsuario> TipoUsuarios { get; set; } = null!;
        public virtual DbSet<Usuario> Usuarios { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Articulo>(entity =>
            {
                entity.HasKey(e => e.IdArticulo)
                    .HasName("PK__articulo__AABB7422921869E2");

                entity.ToTable("articulos");

                entity.Property(e => e.IdArticulo).HasColumnName("idArticulo");

                entity.Property(e => e.IdDroga).HasColumnName("id_droga");

                entity.Property(e => e.IdLaboratorio).HasColumnName("id_laboratorio");

                entity.Property(e => e.IdTipoArticulo).HasColumnName("idTipoArticulo");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.PrecioUnitario)
                    .HasColumnType("decimal(10, 2)")
                    .HasColumnName("precioUnitario");

                entity.Property(e => e.Stock).HasColumnName("stock");

                entity.HasOne(d => d.IdDrogaNavigation)
                    .WithMany(p => p.Articulos)
                    .HasForeignKey(d => d.IdDroga)
                    .HasConstraintName("fk_droga");

                entity.HasOne(d => d.IdLaboratorioNavigation)
                    .WithMany(p => p.Articulos)
                    .HasForeignKey(d => d.IdLaboratorio)
                    .HasConstraintName("fk_laboratorio");

                entity.HasOne(d => d.IdTipoArticuloNavigation)
                    .WithMany(p => p.Articulos)
                    .HasForeignKey(d => d.IdTipoArticulo)
                    .HasConstraintName("FK__articulos__idTip__3E52440B");
            });

            modelBuilder.Entity<Cliente>(entity =>
            {
                entity.HasKey(e => e.Dni)
                    .HasName("PK__clientes__D87608A62C385F01");

                entity.ToTable("clientes");

                entity.Property(e => e.Dni)
                    .ValueGeneratedNever()
                    .HasColumnName("dni");

                entity.Property(e => e.Apellido)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("apellido");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.Telefono).HasColumnName("telefono");
            });

            modelBuilder.Entity<DetalleLote>(entity =>
            {
                entity.HasKey(e => e.IdDetalleLote)
                    .HasName("PK__detalle___FD2F82F4E590C3AF");

                entity.ToTable("detalle_lote");

                entity.Property(e => e.IdDetalleLote).HasColumnName("id_detalle_lote");

                entity.Property(e => e.CantidadComprada).HasColumnName("cantidad_comprada");

                entity.Property(e => e.IdArticulo).HasColumnName("idArticulo");

                entity.Property(e => e.IdLote).HasColumnName("id_lote");

                entity.Property(e => e.PrecioCompra)
                    .HasColumnType("decimal(10, 2)")
                    .HasColumnName("precio_compra");

                entity.HasOne(d => d.IdArticuloNavigation)
                    .WithMany(p => p.DetalleLotes)
                    .HasForeignKey(d => d.IdArticulo)
                    .HasConstraintName("FK__detalle_l__idArt__4222D4EF");

                entity.HasOne(d => d.IdLoteNavigation)
                    .WithMany(p => p.DetalleLotes)
                    .HasForeignKey(d => d.IdLote)
                    .HasConstraintName("FK__detalle_l__id_lo__412EB0B6");
            });

            modelBuilder.Entity<DetallesFactura>(entity =>
            {
                entity.HasKey(e => e.IdDetalle)
                    .HasName("PK__detalles__49CAE2FB1DEDDFA5");

                entity.ToTable("detallesFactura");

                entity.Property(e => e.IdDetalle).HasColumnName("idDetalle");

                entity.Property(e => e.Cantidad).HasColumnName("cantidad");

                entity.Property(e => e.Descuento).HasColumnName("descuento");

                entity.Property(e => e.IdArticulo).HasColumnName("idArticulo");

                entity.Property(e => e.IdFactura).HasColumnName("idFactura");

                entity.Property(e => e.MontoDescontado)
                    .HasColumnType("decimal(10, 2)")
                    .HasColumnName("montoDescontado");

                entity.Property(e => e.Precio)
                    .HasColumnType("decimal(10, 2)")
                    .HasColumnName("precio");

                entity.Property(e => e.Subtotal)
                    .HasColumnType("decimal(10, 2)")
                    .HasColumnName("subtotal");

                entity.HasOne(d => d.IdArticuloNavigation)
                    .WithMany(p => p.DetallesFacturas)
                    .HasForeignKey(d => d.IdArticulo)
                    .HasConstraintName("FK__detallesF__idArt__4316F928");

                entity.HasOne(d => d.IdFacturaNavigation)
                    .WithMany(p => p.DetallesFacturas)
                    .HasForeignKey(d => d.IdFactura)
                    .HasConstraintName("FK__detallesF__idFac__440B1D61");
            });

            modelBuilder.Entity<Droga>(entity =>
            {
                entity.HasKey(e => e.IdDroga)
                    .HasName("PK__drogas__94A94E7272A60FE1");

                entity.ToTable("drogas");

                entity.Property(e => e.IdDroga).HasColumnName("id_droga");

                entity.Property(e => e.NombreDroga)
                    .HasMaxLength(40)
                    .IsUnicode(false)
                    .HasColumnName("nombreDroga");
            });

            modelBuilder.Entity<Factura>(entity =>
            {
                entity.HasKey(e => e.IdFactura)
                    .HasName("PK__facturas__3CD5687E669F6884");

                entity.ToTable("facturas");

                entity.Property(e => e.IdFactura).HasColumnName("idFactura");

                entity.Property(e => e.DniCliente).HasColumnName("dniCliente");

                entity.Property(e => e.Fecha)
                    .HasColumnType("date")
                    .HasColumnName("fecha");

                entity.Property(e => e.IdUsuario).HasColumnName("idUsuario");

                entity.Property(e => e.TieneObraSocial).HasColumnName("tieneObraSocial");

                entity.Property(e => e.TipoPago).HasColumnName("tipoPago");

                entity.Property(e => e.Total)
                    .HasColumnType("decimal(10, 2)")
                    .HasColumnName("total");

                entity.HasOne(d => d.DniClienteNavigation)
                    .WithMany(p => p.Facturas)
                    .HasForeignKey(d => d.DniCliente)
                    .HasConstraintName("FK__facturas__dniCli__44FF419A");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.Facturas)
                    .HasForeignKey(d => d.IdUsuario)
                    .HasConstraintName("FK__facturas__idUsua__45F365D3");

                entity.HasOne(d => d.TipoPagoNavigation)
                    .WithMany(p => p.Facturas)
                    .HasForeignKey(d => d.TipoPago)
                    .HasConstraintName("FK__facturas__tipoPa__46E78A0C");
            });

            modelBuilder.Entity<FacturasObraSocial>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("facturasObraSocial");

                entity.Property(e => e.CantidadConOs).HasColumnName("Cantidad_Con_OS");

                entity.Property(e => e.CantidadSinOs).HasColumnName("Cantidad_Sin_OS");
            });

            modelBuilder.Entity<Laboratorio>(entity =>
            {
                entity.HasKey(e => e.IdLaboratorio)
                    .HasName("PK__laborato__781B42E2173E0024");

                entity.ToTable("laboratorios");

                entity.Property(e => e.IdLaboratorio).HasColumnName("id_laboratorio");

                entity.Property(e => e.NombreLab)
                    .HasMaxLength(40)
                    .IsUnicode(false)
                    .HasColumnName("nombreLab");
            });

            modelBuilder.Entity<Lote>(entity =>
            {
                entity.HasKey(e => e.IdLote)
                    .HasName("PK__lotes__9A000486EB734BD2");

                entity.ToTable("lotes");

                entity.Property(e => e.IdLote).HasColumnName("id_lote");

                entity.Property(e => e.FechaLote)
                    .HasColumnType("date")
                    .HasColumnName("fecha_lote");

                entity.Property(e => e.IdProveedor).HasColumnName("id_proveedor");

                entity.Property(e => e.Total)
                    .HasColumnType("decimal(10, 2)")
                    .HasColumnName("total");

                entity.HasOne(d => d.IdProveedorNavigation)
                    .WithMany(p => p.Lotes)
                    .HasForeignKey(d => d.IdProveedor)
                    .HasConstraintName("FK__lotes__id_provee__47DBAE45");
            });

            modelBuilder.Entity<Proveedore>(entity =>
            {
                entity.HasKey(e => e.IdProveedor)
                    .HasName("PK__proveedo__8D3DFE288FD1C952");

                entity.ToTable("proveedores");

                entity.Property(e => e.IdProveedor).HasColumnName("id_proveedor");

                entity.Property(e => e.Cuit).HasColumnName("cuit");

                entity.Property(e => e.Direccion)
                    .HasMaxLength(25)
                    .IsUnicode(false)
                    .HasColumnName("direccion");

                entity.Property(e => e.NombreProveedor)
                    .HasMaxLength(40)
                    .IsUnicode(false)
                    .HasColumnName("nombre_proveedor");
            });

            modelBuilder.Entity<Tarjeta>(entity =>
            {
                entity.HasKey(e => e.NroTarjeta)
                    .HasName("PK__tarjetas__8B6B356E48D37FFB");

                entity.ToTable("tarjetas");

                entity.Property(e => e.NroTarjeta)
                    .ValueGeneratedNever()
                    .HasColumnName("nro_tarjeta");

                entity.Property(e => e.CodSeguridad).HasColumnName("cod_seguridad");

                entity.Property(e => e.Dni).HasColumnName("dni");

                entity.Property(e => e.FechaVenc)
                    .HasColumnType("date")
                    .HasColumnName("fecha_venc");

                entity.HasOne(d => d.DniNavigation)
                    .WithMany(p => p.Tarjeta)
                    .HasForeignKey(d => d.Dni)
                    .HasConstraintName("FK__tarjetas__dni__48CFD27E");
            });

            modelBuilder.Entity<TipoArticulo>(entity =>
            {
                entity.HasKey(e => e.IdTipoArticulo)
                    .HasName("PK__tipoArti__3FB5FB0EE421EC24");

                entity.ToTable("tipoArticulos");

                entity.Property(e => e.IdTipoArticulo).HasColumnName("idTipoArticulo");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");
            });

            modelBuilder.Entity<TipoPago>(entity =>
            {
                entity.HasKey(e => e.TipoPago1)
                    .HasName("PK__tipoPago__A7F8024CDA5EADB6");

                entity.ToTable("tipoPago");

                entity.Property(e => e.TipoPago1).HasColumnName("tipoPago");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(25)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");
            });

            modelBuilder.Entity<TipoUsuario>(entity =>
            {
                entity.HasKey(e => e.IdTipoUsuario)
                    .HasName("PK__tipoUsua__03006BFF96FC9EB3");

                entity.ToTable("tipoUsuarios");

                entity.Property(e => e.IdTipoUsuario)
                    .ValueGeneratedNever()
                    .HasColumnName("idTipoUsuario");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasKey(e => e.IdUsuario)
                    .HasName("PK__usuarios__645723A65BC140CD");

                entity.ToTable("usuarios");

                entity.Property(e => e.IdUsuario).HasColumnName("idUsuario");

                entity.Property(e => e.Apellido)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("apellido");

                entity.Property(e => e.IdTipoUsuario).HasColumnName("idTipoUsuario");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.Pwd)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("pwd");

                entity.Property(e => e.Usuario1)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("usuario");

                entity.HasOne(d => d.IdTipoUsuarioNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.IdTipoUsuario)
                    .HasConstraintName("FK__usuarios__idTipo__49C3F6B7");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
