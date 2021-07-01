package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;

  private org.apache.jasper.runtime.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_if_test.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <title>图书馆首页</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\r\n");
      out.write("    <script src=\"js/jquery-3.2.1.js\"></script>\r\n");
      out.write("    <script src=\"js/bootstrap.min.js\" ></script>\r\n");
      out.write("    <script src=\"js/js.cookie.js\"></script>\r\n");
      out.write("    <style>\r\n");
      out.write("        #login{\r\n");
      out.write("           height: 50%;\r\n");
      out.write("            width: 28%;\r\n");
      out.write("            margin-left: auto;\r\n");
      out.write("            margin-right: auto;\r\n");
      out.write("            margin-top: 5%;\r\n");
      out.write("            display: block;\r\n");
      out.write("            position: center;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .form-group {\r\n");
      out.write("            margin-bottom: 0;\r\n");
      out.write("        }\r\n");
      out.write("        * {\r\n");
      out.write("            padding:0;\r\n");
      out.write("            margin:0;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body background=\"img/timg.jpg\" style=\" background-repeat:no-repeat ;\r\n");
      out.write("background-size:100% 100%;\r\n");
      out.write("background-attachment: fixed;\">\r\n");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("<h2 style=\"text-align: center; color: white; font-family: '华文行楷'; font-size: 500%\">图 书 馆</h2>\r\n");
      out.write("\r\n");
      out.write("<div class=\"panel panel-default\" id=\"login\">\r\n");
      out.write("    <div class=\"panel-heading\" style=\"background-color: #fff\">\r\n");
      out.write("        <h3 class=\"panel-title\">请登录</h3>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"panel-body\">\r\n");
      out.write("        <div class=\"form-group\">\r\n");
      out.write("            <label for=\"id\">账号</label>\r\n");
      out.write("            <input type=\"text\" class=\"form-control\" id=\"id\" placeholder=\"请输入账号\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"form-group\">\r\n");
      out.write("            <label for=\"passwd\">密码</label>\r\n");
      out.write("            <input type=\"password\" class=\"form-control\" id=\"passwd\" placeholder=\"请输入密码\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"checkbox text-left\">\r\n");
      out.write("            <label>\r\n");
      out.write("                <input type=\"checkbox\" id=\"remember\">记住密码\r\n");
      out.write("            </label>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <p style=\"text-align: right;color: red;position: absolute\" id=\"info\"></p><br/>\r\n");
      out.write("        <button id=\"loginButton\"  class=\"btn btn-primary  btn-block\">登陆\r\n");
      out.write("        </button>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("    <script>\r\n");
      out.write("        $(\"#id\").keyup(\r\n");
      out.write("            function () {\r\n");
      out.write("                if(isNaN($(\"#id\").val())){\r\n");
      out.write("                    $(\"#info\").text(\"提示:账号只能为数字\");\r\n");
      out.write("                }\r\n");
      out.write("                else {\r\n");
      out.write("                    $(\"#info\").text(\"\");\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        )\r\n");
      out.write("        // 记住登录信息\r\n");
      out.write("        function rememberLogin(username, password, checked) {\r\n");
      out.write("            Cookies.set('loginStatus', {\r\n");
      out.write("                username: username,\r\n");
      out.write("                password: password,\r\n");
      out.write("                remember: checked\r\n");
      out.write("            }, {expires: 30, path: ''})\r\n");
      out.write("        }\r\n");
      out.write("        // 若选择记住登录信息，则进入页面时设置登录信息\r\n");
      out.write("        function setLoginStatus() {\r\n");
      out.write("            var loginStatusText = Cookies.get('loginStatus')\r\n");
      out.write("            if (loginStatusText) {\r\n");
      out.write("                var loginStatus\r\n");
      out.write("                try {\r\n");
      out.write("                    loginStatus = JSON.parse(loginStatusText);\r\n");
      out.write("                    $('#id').val(loginStatus.username);\r\n");
      out.write("                    $('#passwd').val(loginStatus.password);\r\n");
      out.write("                    $(\"#remember\").prop('checked',true);\r\n");
      out.write("                } catch (__) {}\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        // 设置登录信息\r\n");
      out.write("        setLoginStatus();\r\n");
      out.write("        $(\"#loginButton\").click(function () {\r\n");
      out.write("            var id =$(\"#id\").val();\r\n");
      out.write("            var passwd=$(\"#passwd\").val();\r\n");
      out.write("            var remember=$(\"#remember\").prop('checked');\r\n");
      out.write("            if (id == '') {\r\n");
      out.write("                $(\"#info\").text(\"提示:账号不能为空\");\r\n");
      out.write("            }\r\n");
      out.write("            else if( passwd ==''){\r\n");
      out.write("                $(\"#info\").text(\"提示:密码不能为空\");\r\n");
      out.write("            }\r\n");
      out.write("            else if(isNaN( id )){\r\n");
      out.write("                $(\"#info\").text(\"提示:账号必须为数字\");\r\n");
      out.write("            }\r\n");
      out.write("            else {\r\n");
      out.write("                $.ajax({\r\n");
      out.write("                    type: \"POST\",\r\n");
      out.write("                    url: \"api/loginCheck\",\r\n");
      out.write("                    data: {\r\n");
      out.write("                        id:id ,\r\n");
      out.write("                        passwd: passwd\r\n");
      out.write("                    },\r\n");
      out.write("                    dataType: \"json\",\r\n");
      out.write("                    success: function(data) {\r\n");
      out.write("                        if (data.stateCode.trim() === \"0\") {\r\n");
      out.write("                            $(\"#info\").text(\"提示:账号或密码错误！\");\r\n");
      out.write("                        } else if (data.stateCode.trim() === \"1\") {\r\n");
      out.write("                            $(\"#info\").text(\"提示:登陆成功，跳转中...\");\r\n");
      out.write("                            window.location.href=\"admin_main.html\";\r\n");
      out.write("                        } else if (data.stateCode.trim() === \"2\") {\r\n");
      out.write("                            if(remember){\r\n");
      out.write("                                rememberLogin(id,passwd,remember);\r\n");
      out.write("                            }else {\r\n");
      out.write("                                Cookies.remove('loginStatus');\r\n");
      out.write("                            }\r\n");
      out.write("                            $(\"#info\").text(\"提示:登陆成功，跳转中...\");\r\n");
      out.write("                            window.location.href=\"reader_main.html\";\r\n");
      out.write("\r\n");
      out.write("                        }\r\n");
      out.write("                    }\r\n");
      out.write("                });\r\n");
      out.write("            }\r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${!empty error}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("    <script>\r\n");
        out.write("            alert(\"");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("\");\r\n");
        out.write("            window.location.href=\"login.html\";\r\n");
        out.write("</script>\r\n");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }
}
