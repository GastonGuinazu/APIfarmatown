namespace API.Models;

public class LoteCreateModel{
    
  public DateTime? FechaLote { get; set; }
  public decimal? Total { get; set; }
  //public ProveedorModel? Proveedor { get; set; }
  public int idProveedor { get; set; }
}