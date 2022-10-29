using System.Net.Http.Headers;
namespace API.Models;

public class ProveedorModel
{
  public int? IdProveedor { get; set; }
  public string? NombreProveedor { get; set; }   
  public long? Cuit { get; set; }  

  public ProveedorModel()
  {
    
  }
  public ProveedorModel(int? idProveedor,string? nombreProveedor,long? cuit)
  {
    this.IdProveedor = idProveedor;
    this.NombreProveedor = nombreProveedor;
    this.Cuit = cuit;
  }
}
