using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Mvc_FluxoCaixa.Models;

namespace Mvc_FluxoCaixa.Controllers
{
    public class FluxodecaixaController : Controller
    {
        private FluxoCaixaEntities db = new FluxoCaixaEntities();

        // GET: Fluxodecaixa
        public ActionResult Index()
        {

            if (Session["usuarioLogadoID"] != null)
            {
                var fluxodecaixa = db.fluxodecaixa.Include(f => f.cliente).Include(f => f.despesa).Include(f => f.fornecedor).Include(f => f.produto).Include(f => f.tipodelancamento);
                return View(fluxodecaixa.ToList());
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        // GET: Fluxodecaixa/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            fluxodecaixa fluxodecaixa = db.fluxodecaixa.Find(id);
            if (fluxodecaixa == null)
            {
                return HttpNotFound();
            }
            return View(fluxodecaixa);
        }

        // GET: Fluxodecaixa/Create
        public ActionResult Create()
        {
            ViewBag.clienteId = new SelectList(db.cliente, "clienteId", "nome");
            ViewBag.despesaId = new SelectList(db.despesa, "despesaId", "descricao");
            ViewBag.fornecedorId = new SelectList(db.fornecedor, "fornecedorId", "nome");
            ViewBag.produtoId = new SelectList(db.produto, "produtoId", "descricao");
            ViewBag.tipodelancamentoId = new SelectList(db.tipodelancamento, "tipolancamentoId", "descrição");
            return View();
        }

        // POST: Fluxodecaixa/Create
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "fluxodecaixaid,data,qtd,valorproduto,tipodemovimento,despesaId,fornecedorId,produtoId,clienteId,tipodelancamentoId")] fluxodecaixa fluxodecaixa)
        {
            if (ModelState.IsValid)
            {
                db.fluxodecaixa.Add(fluxodecaixa);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.clienteId = new SelectList(db.cliente, "clienteId", "nome", fluxodecaixa.clienteId);
            ViewBag.despesaId = new SelectList(db.despesa, "despesaId", "descricao", fluxodecaixa.despesaId);
            ViewBag.fornecedorId = new SelectList(db.fornecedor, "fornecedorId", "nome", fluxodecaixa.fornecedorId);
            ViewBag.produtoId = new SelectList(db.produto, "produtoId", "descricao", fluxodecaixa.produtoId);
            ViewBag.tipodelancamentoId = new SelectList(db.tipodelancamento, "tipolancamentoId", "descrição", fluxodecaixa.tipodelancamentoId);
            return View(fluxodecaixa);
        }

        // GET: Fluxodecaixa/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            fluxodecaixa fluxodecaixa = db.fluxodecaixa.Find(id);
            if (fluxodecaixa == null)
            {
                return HttpNotFound();
            }
            ViewBag.clienteId = new SelectList(db.cliente, "clienteId", "nome", fluxodecaixa.clienteId);
            ViewBag.despesaId = new SelectList(db.despesa, "despesaId", "descricao", fluxodecaixa.despesaId);
            ViewBag.fornecedorId = new SelectList(db.fornecedor, "fornecedorId", "nome", fluxodecaixa.fornecedorId);
            ViewBag.produtoId = new SelectList(db.produto, "produtoId", "descricao", fluxodecaixa.produtoId);
            ViewBag.tipodelancamentoId = new SelectList(db.tipodelancamento, "tipolancamentoId", "descrição", fluxodecaixa.tipodelancamentoId);
            return View(fluxodecaixa);
        }

        // POST: Fluxodecaixa/Edit/5
        // Para proteger-se contra ataques de excesso de postagem, ative as propriedades específicas às quais deseja se associar. 
        // Para obter mais detalhes, confira https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "fluxodecaixaid,data,qtd,valorproduto,tipodemovimento,despesaId,fornecedorId,produtoId,clienteId,tipodelancamentoId")] fluxodecaixa fluxodecaixa)
        {
            if (ModelState.IsValid)
            {
                db.Entry(fluxodecaixa).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.clienteId = new SelectList(db.cliente, "clienteId", "nome", fluxodecaixa.clienteId);
            ViewBag.despesaId = new SelectList(db.despesa, "despesaId", "descricao", fluxodecaixa.despesaId);
            ViewBag.fornecedorId = new SelectList(db.fornecedor, "fornecedorId", "nome", fluxodecaixa.fornecedorId);
            ViewBag.produtoId = new SelectList(db.produto, "produtoId", "descricao", fluxodecaixa.produtoId);
            ViewBag.tipodelancamentoId = new SelectList(db.tipodelancamento, "tipolancamentoId", "descrição", fluxodecaixa.tipodelancamentoId);
            return View(fluxodecaixa);
        }

        // GET: Fluxodecaixa/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            fluxodecaixa fluxodecaixa = db.fluxodecaixa.Find(id);
            if (fluxodecaixa == null)
            {
                return HttpNotFound();
            }
            return View(fluxodecaixa);
        }

        // POST: Fluxodecaixa/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            fluxodecaixa fluxodecaixa = db.fluxodecaixa.Find(id);
            db.fluxodecaixa.Remove(fluxodecaixa);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult Login()
        {
            return View();
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
