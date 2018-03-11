using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using lkWeb.Service.Abstracts;
using AutoMapper;
using lkWeb.Entity;
using lkWeb.Service.Dto;
using lkWeb.Data;
using Microsoft.AspNetCore.Identity;
using NLog;
using Hangfire;

namespace lkWeb.Controllers
{
    public class HomeController : Controller
    {
         public IActionResult Index()
        {

    //        var jobId = BackgroundJob.Enqueue(

    //() => Console.WriteLine("Fire-and-forget!"));
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
