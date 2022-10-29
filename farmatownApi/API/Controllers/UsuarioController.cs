using API.Data;
using API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class UsuarioController : ControllerBase
{
  private readonly farmatown3Context _context;

  public UsuarioController(farmatown3Context context)
  {
    _context=context;
  }

     [HttpPost("login")]
    public async Task<ActionResult<UsuarioModel>> LogearUsuario(UsuarioModel userModel)
    {
        var user = _context.Usuarios.SingleOrDefault(x => x.Usuario1 == userModel.usuario && x.Pwd == userModel.pwd);

        if (user == null || user.IdTipoUsuario != 1)
        {
            return Unauthorized($"Usuario o contraseña incorrecta");
        }      

           var usr = new UsuarioModel
        {            
            usuario = user.Usuario1,
            pwd = user.Pwd                  
        }; 

        await _context.SaveChangesAsync();
        return Ok(usr);        
    }

}