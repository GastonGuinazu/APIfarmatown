namespace API.Models;

public class LoteModel
{
  public int IdLote { get; set; }
  public DateTime? FechaLote { get; set; }
  public decimal? Total { get; set; }
  public int idProveedor { get; set; }
}
