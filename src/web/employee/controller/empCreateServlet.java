package web.employee.controller;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.employee.service.EmployeeService;
import web.employee.vo.EmployeeVO;
@WebServlet("/employee/empCreateServlet")
public class empCreateServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
		res.setContentType("text/html;charset=UTF-8");

		req.setCharacterEncoding("UTF-8");
		res.addHeader("Access-Control-Allow-Origin", "*");
		String action = req.getParameter("action");

		
		if ("create".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String emp_name = req.getParameter("emp_name");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (emp_name == null || emp_name.trim().length() == 0) {
					errorMsgs.add("���u�m�W: �ФŪť�");
				} else if(!emp_name.trim().matches(enameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("���u�m�W: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��10����");
	            }

				String id_number = req.getParameter("id_number");
				if (id_number == null || id_number.trim().length() == 0) {
					errorMsgs.add("�����Ҧr��: �ФŪť�");
				}
				String emp_phone = req.getParameter("emp_phone");
				if (emp_phone == null || emp_phone.trim().length() == 0) {
					errorMsgs.add("���u�q��: �ФŪť�");
				}
				String emp_mail = req.getParameter("emp_mail");
				if (emp_mail == null || emp_mail.trim().length() == 0) {
					errorMsgs.add("���u�l��H�c: �ФŪť�");
				}
				String password = req.getParameter("password");
				if (password == null || password.trim().length() == 0) {
					errorMsgs.add("���u�K�X: �ФŪť�");
				}
				String confirm_password = req.getParameter("confirm_password");
				if(!confirm_password.equals(password)) {
					errorMsgs.add("�нT�{�z��J���T�{�K�X�P�K�X�O�_�@�P");
				}
				Date utilDate = new Date();
				java.sql.Date hiredate = new java.sql.Date(utilDate.getTime());

				EmployeeVO empVO = new EmployeeVO();
				empVO.setEmp_name(emp_name);
				empVO.setId_number(id_number);
				empVO.setEmp_phone(emp_phone);
				empVO.setEmp_mail(emp_mail);
				empVO.setPassword(password);
				empVO.setHiredate(hiredate);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/employee/EmployeeCreateAccount.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************2.�}�l�s�W���***************************************/
				EmployeeService empSvc = new EmployeeService();
				empSvc.addEmp(emp_name, id_number, emp_phone, emp_mail, password, hiredate);
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/employee/login.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����login.jsp
				successView.forward(req, res);
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�п�J���T���");
				RequestDispatcher failureView = req.getRequestDispatcher("/employee/EmployeeCreateAccount.jsp");
				failureView.forward(req, res);
			}
		}
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		
	}
}