/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2021-07-16 01:42:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/library/css/login.css\">\r\n");
      out.write("    <script src=\"/library/js/jquery-3.2.1.js\"></script>\r\n");
      out.write("    <script src=\"/library/js/login.js\"></script>\r\n");
      out.write("    <title>登陆界面</title>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"pic middiv\" style=\"height: 10%;\">\r\n");
      out.write("        <p style=\"font-size:larger;\">图书管理系统登录</p>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"outborder\">\r\n");
      out.write("        <div class=\"text middiv\">\r\n");
      out.write("            <p id=\"main-tips\">提示信息<br><br><br><br><br><br><br><br><br><br><br><br><br>提示信息</p>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"login middiv\">\r\n");
      out.write("            <!--<img src=\"src\\black.png\" style=\"width: 100%; height: 30%; object-fit: cover;\">-->\r\n");
      out.write("            <div id=\"top-tips\">请登录</div><br>\r\n");
      out.write("            <div style=\"margin: 10%;\">\r\n");
      out.write("                <label>username:</label>\r\n");
      out.write("\r\n");
      out.write("                <input type=\"text\" name=\"username\" id=\"username\" size=\"30\" onkeydown=\"return disableTextSubmit(event)\">\r\n");
      out.write("                <br>\r\n");
      out.write("                <br id=\"d\" style=\"display:none;\">\r\n");
      out.write("                <label id=\"emailLabel\" style=\"display:none\">email:</label>\r\n");
      out.write("                <input type=\"text\" id=\"email\" size=\"30\" style=\"display:none\">\r\n");
      out.write("                <input id=\"hiddenText\" name=\"mode\" value=\"login\" type=\"text\" style=\"display:none\" />\r\n");
      out.write("\r\n");
      out.write("                <label>password:</label>\r\n");
      out.write("                <input type=\"password\" name=\"password\" id=\"password\" size=\"30\" onkeydown=\"return disableTextSubmit(event)\">\r\n");
      out.write("                <br><br>\r\n");
      out.write("                <input id=\"register\" class=\"button\" type=\"button\" value=\"去注册\" onclick='return to_register();';>\r\n");
      out.write("                <input id=\"in\" class=\"button\" type=\"button\" value=\"登录\">\r\n");
      out.write("                <input id=\"submitregister\" class=\"button\" type=\"submit\" value=\"注册\" onclick='return submit_register();'\r\n");
      out.write("                    style=\"display: none;margin:0 auto\">\r\n");
      out.write("\r\n");
      out.write("                <br>\r\n");
      out.write("                <p id=\"notice\"></p>\r\n");
      out.write("            </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("$('submitregister').click(function(){\r\n");
      out.write("     var username =$(\"#username\").val();\r\n");
      out.write("     var email=$('#email').val();\r\n");
      out.write("     var password=$(\"#password\").val();\r\n");
      out.write("     if (username==''){\r\n");
      out.write("    \t  $(\"#notice\").text(\"提示:账号不能为空\");\r\n");
      out.write("     }\r\n");
      out.write("     else if( email ==''){\r\n");
      out.write("         $(\"#notice\").text(\"提示:邮箱不能为空\");\r\n");
      out.write("     }\r\n");
      out.write("     else if( password ==''){\r\n");
      out.write("         $(\"#notice\").text(\"提示:密码不能为空\");\r\n");
      out.write("     }\r\n");
      out.write("     else\r\n");
      out.write("   \t {\r\n");
      out.write("    \t $.ajax({\r\n");
      out.write("    \t\t type:\"POST\",\r\n");
      out.write("    \t\t url:\"api/register\",\r\n");
      out.write("    \t\t data:{\r\n");
      out.write("    \t\t\t username:username,\r\n");
      out.write("    \t\t\t email:email,\r\n");
      out.write("    \t\t\t password:password\r\n");
      out.write("    \t\t },\r\n");
      out.write("    \t\t dataType:\"json\",\r\n");
      out.write("    \t\t success:function(data){\r\n");
      out.write("    \t\t\t if(data.stateCode.trim()===\"0\")\r\n");
      out.write("    \t\t\t {\r\n");
      out.write("    \t\t\t\t $(\"#notice\").text(\"提示:注册失败，该邮箱已经注册过\");\r\n");
      out.write("    \t\t\t }\r\n");
      out.write("    \t\t\t else if(data.stateCode.trim()===\"1\")\r\n");
      out.write("    \t\t\t {\r\n");
      out.write("    \t\t\t\t $(\"#notice\").text(\"提示:注册成功\");\r\n");
      out.write("    \t\t\t }\r\n");
      out.write("    \t\t }\r\n");
      out.write("    \t })\r\n");
      out.write("   \t }\r\n");
      out.write("     \r\n");
      out.write("     \r\n");
      out.write("})\r\n");
      out.write("\r\n");
      out.write("$(\"#in\").click(function () {\r\n");
      out.write("            var username =$(\"#username\").val();\r\n");
      out.write("            var password=$(\"#password\").val();\r\n");
      out.write("            if (username == '') {\r\n");
      out.write("                $(\"#notice\").text(\"提示:账号不能为空\");\r\n");
      out.write("            }\r\n");
      out.write("            else if( password ==''){\r\n");
      out.write("                $(\"#notice\").text(\"提示:密码不能为空\");\r\n");
      out.write("            }\r\n");
      out.write("            else {\r\n");
      out.write("                $.ajax({\r\n");
      out.write("                    type: \"POST\",\r\n");
      out.write("                    url: \"api/loginCheck\",\r\n");
      out.write("                    data: {\r\n");
      out.write("                        username:username ,\r\n");
      out.write("                        password: password\r\n");
      out.write("                    },\r\n");
      out.write("                    dataType: \"json\",\r\n");
      out.write("                    success: function(data) {\r\n");
      out.write("                    console.log(data.stateCode);\r\n");
      out.write("                        if (data.stateCode.trim() === \"0\") {\r\n");
      out.write("                            $(\"#notice\").text(\"提示:账号或密码错误！\");\r\n");
      out.write("                        } else if (data.stateCode.trim() === \"1\") {\r\n");
      out.write("                            $(\"#notice\").text(\"提示:登陆成功，跳转中...\");\r\n");
      out.write("                            window.location.href=\"admin_main.html\";\r\n");
      out.write("                        } else if (data.stateCode.trim() === \"2\") {\r\n");
      out.write("\r\n");
      out.write("                            $(\"#notice\").text(\"提示:登陆成功，跳转中...\");\r\n");
      out.write("                            window.location.href=\"reader_main.html\";\r\n");
      out.write("\r\n");
      out.write("                        }\r\n");
      out.write("                    }\r\n");
      out.write("                })\r\n");
      out.write("            }\r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
