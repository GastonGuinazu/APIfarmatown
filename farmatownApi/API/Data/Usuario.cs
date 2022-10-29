using System;
using System.Collections.Generic;

namespace API.Data
{
    public partial class Usuario
    {
        public Usuario()
        {
            Facturas = new HashSet<Factura>();
        }

        public int IdUsuario { get; set; }
        public string? Usuario1 { get; set; }
        public string? Pwd { get; set; }
        public string? Nombre { get; set; }
        public string? Apellido { get; set; }
        public int? IdTipoUsuario { get; set; }

        public virtual TipoUsuario? IdTipoUsuarioNavigation { get; set; }
        public virtual ICollection<Factura> Facturas { get; set; }
    }
}
