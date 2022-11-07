using API.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]


public class ReportesController : ControllerBase
{
     private readonly farmatown3Context _context;

    public ReportesController(farmatown3Context context)
    {
        _context = context;
    }

    [HttpGet("VistaArticulosAVencer")]
  public async Task<ActionResult<List<VistaArticulosAvencer>>>VistaArticulosAvencer(){

    var query = await _context.VistaArticulosAvencers.ToListAsync();
    return Ok(query);
  }

   [HttpGet("VistaArticulosXaño")]
  public async Task<ActionResult<List<VistaArticulosXaño>>>VistaArticulosXaño(){

    var query = await _context.VistaArticulosXaños.ToListAsync();
    return Ok(query);
  }

  [HttpGet("VistaMasVendidosXmes")]
  public async Task<ActionResult<List<VistaMasVendidosXme>>>VistaMasVendidosXme(){

    var query = await _context.VistaMasVendidosXmes.ToListAsync();
    return Ok(query);
  }
}

