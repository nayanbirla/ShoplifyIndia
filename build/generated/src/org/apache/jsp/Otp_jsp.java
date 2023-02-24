package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Otp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title></title> \n");
      out.write("        <style>\n");
      out.write("            .otp-input-wrapper {\n");
      out.write("  width: 240px;\n");
      out.write("  text-align: left;\n");
      out.write("  display: inline-block;\n");
      out.write("}\n");
      out.write(".otp-input-wrapper input {\n");
      out.write("  padding: 0;\n");
      out.write("  width: 264px;\n");
      out.write("  font-size: 32px;\n");
      out.write("  font-weight: 600;\n");
      out.write("  color: #3e3e3e;\n");
      out.write("  background-color: transparent;\n");
      out.write("  border: 0;\n");
      out.write("  margin-left: 12px;\n");
      out.write("  letter-spacing: 48px;\n");
      out.write("  font-family: sans-serif !important;\n");
      out.write("}\n");
      out.write(".otp-input-wrapper input:focus {\n");
      out.write("  box-shadow: none;\n");
      out.write("  outline: none;\n");
      out.write("}\n");
      out.write(".otp-input-wrapper svg {\n");
      out.write("  position: relative;\n");
      out.write("  display: block;\n");
      out.write("  width: 240px;\n");
      out.write("  height: 2px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("<div class=\"otp-input-wrapper\">\n");
      out.write("  <input type=\"text\" maxlength=\"4\" pattern=\"[0-9]*\" autocomplete=\"off\">\n");
      out.write("  <svg viewBox=\"0 0 240 1\" xmlns=\"http://www.w3.org/2000/svg\">\n");
      out.write("    <line x1=\"0\" y1=\"0\" x2=\"240\" y2=\"0\" stroke=\"#3e3e3e\" stroke-width=\"2\" stroke-dasharray=\"44,22\" />\n");
      out.write("  </svg>\n");
      out.write("</div>\n");
      out.write("    </body>\n");
      out.write("    </html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
