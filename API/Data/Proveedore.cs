using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class Proveedore
    {
        public Proveedore()
        {
            Lotes = new HashSet<Lote>();
        }

        public int IdProveedor { get; set; }
        public string? NombreProveedor { get; set; }
        public long? Cuit { get; set; }
        public string? Direccion { get; set; }

        public virtual ICollection<Lote> Lotes { get; set; }
    }
}
