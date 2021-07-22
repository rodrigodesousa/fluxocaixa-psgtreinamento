using Mvc_FluxoCaixa.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mvc_FluxoCaixa.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Login()
        {
            
            if (Session["usuarioLogadoID"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Usuario u)
        {
            // esta action trata o post (login)
            if (ModelState.IsValid) //verifica se é válido
            {
                using (FluxoCaixaEntities dc = new FluxoCaixaEntities())
                {
                    var v = dc.Usuario.Where(a => a.nomeUsuario.Equals(u.nomeUsuario) && a.senha.Equals(u.senha)).FirstOrDefault();
                    if (v != null)
                    {
                        Session["usuarioLogadoID"] = v.id.ToString();
                        Session["nomeUsuarioLogado"] = v.nomeUsuario.ToString();
                        return RedirectToAction("Index");
                    }
                }
            }
            return View(u);
        }
    }
}