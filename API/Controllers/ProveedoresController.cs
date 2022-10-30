using API.Data;
using API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProveedoresController : ControllerBase
{
  private readonly farmatown3Context _context;

  public ProveedoresController(farmatown3Context context)
  {
    _context=context;
  }


  [HttpGet("ObtenerProveedores")]
  public async Task<ActionResult<List<ProveedorModel>>>Proveedores(){
    var proveedores = await _context.Proveedores
                            .Select(x => new ProveedorModel{
                                IdProveedor = x.IdProveedor,
                                NombreProveedor = x.NombreProveedor,
                                Cuit = x.Cuit
                              }).ToListAsync();
    return Ok(proveedores);
  }

}