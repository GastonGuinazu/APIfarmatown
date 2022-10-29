using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class Factura
    {
        public Factura()
        {
            DetallesFacturas = new HashSet<DetallesFactura>();
        }

        public int IdFactura { get; set; }
        public DateTime? Fecha { get; set; }
        public decimal? Total { get; set; }
        public bool? TieneObraSocial { get; set; }
        public long? DniCliente { get; set; }
        public int? IdUsuario { get; set; }
        public bool? TipoPago { get; set; }

        public virtual Cliente? DniClienteNavigation { get; set; }
        public virtual Usuario? IdUsuarioNavigation { get; set; }
        public virtual TipoPago? TipoPagoNavigation { get; set; }
        public virtual ICollection<DetallesFactura> DetallesFacturas { get; set; }
    }
}
