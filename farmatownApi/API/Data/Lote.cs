using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class Lote
    {
        public Lote()
        {
            DetalleLotes = new HashSet<DetalleLote>();
        }

        public int IdLote { get; set; }
        public DateTime? FechaLote { get; set; }
        public decimal? Total { get; set; }
        public int? IdProveedor { get; set; }

        public virtual Proveedore? IdProveedorNavigation { get; set; }
        public virtual ICollection<DetalleLote> DetalleLotes { get; set; }
    }
}
