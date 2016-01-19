using Maticsoft.BLL.SysManage;
using Maticsoft.Components.Setting;
using Maticsoft.Model.SysManage;
using Maticsoft.Web.Components.Setting.Shop;
using Maticsoft.Web.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Maticsoft.Web.Areas.Shop.Controllers
{
    public class ExAccountController : ControllerBase
    {
        public System.Web.Mvc.ActionResult Login(string returnUrl)
        {
            ((dynamic)base.ViewBag).RegisterToggle = ConfigSystem.GetValueByCache("Shop_RegisterToggle");
            WebSiteSet set = new WebSiteSet(ApplicationKeyType.Shop);
            ((dynamic)base.ViewBag).WebName = set.WebName;
            if (ConfigSystem.GetBoolValueByCache("System_Close_Login"))
            {
                return base.RedirectToAction("TurnOff", "Error");
            }
            if (!string.IsNullOrWhiteSpace(returnUrl))
            {
                ((dynamic)base.ViewBag).returnUrl = returnUrl;
            }
            //if ((base.HttpContext.User.Identity.IsAuthenticated && (base.get_CurrentUser() != null)) && (base.get_CurrentUser().UserType != "AA"))
            //{
            //    if (!string.IsNullOrWhiteSpace(returnUrl))
            //    {
            //        return this.Redirect(returnUrl);
            //    }
            //    return base.RedirectToAction("Index", "UserCenter");
            //}
            FormsAuthentication.SignOut();
            base.Session.Remove(Maticsoft.Common.Globals.SESSIONKEY_USER);
            base.Session.Clear();
            base.Session.Abandon();

            IPageSetting pageSetting = PageSetting.GetPageSetting("Home", ApplicationKeyType.Shop);
            ((dynamic)base.ViewBag).Title = "登录" + pageSetting.Title;
            ((dynamic)base.ViewBag).Keywords = pageSetting.Keywords;
            ((dynamic)base.ViewBag).Description = pageSetting.Description;
          
            return base.View("Login");
        }
    }
}
