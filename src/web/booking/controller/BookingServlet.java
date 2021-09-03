package web.booking.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import web.booking.service.BookingInfoService;
import web.booking.service.impl.BookingInfoServiceImpl;
import web.booking.vo.BookingInfo;
import web.tools.ajax.ResponseFormat;

@WebServlet("/booking/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		res.addHeader("Access-Control-Allow-Origin", "*");
		PrintWriter out = res.getWriter();
		
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);

		try {
			Integer memberId = null;
			try {
				memberId = new Integer(req.getParameter("memberId").trim()); //�|���s��
			} catch(NumberFormatException e) {
				System.out.println("111111");
				errorMsgs.add("�ж�Ʀr.");
			}
			
			
			Integer bookTime = null;
			try {
				bookTime = new Integer(req.getParameter("whichTime")); //����
			} catch (NumberFormatException e) {
				System.out.println("222222");
				errorMsgs.add("�ж�Ʀr.");
			}
			
			
			Integer peopleNum = null;
			try {
				peopleNum = new Integer(req.getParameter("peopleNum")); //�y��H��
			} catch (NumberFormatException e) {
				System.out.println("333333");
				errorMsgs.add("�ж�Ʀr.");
			}
			
			java.sql.Date whichDate = null;
			try {
				whichDate = java.sql.Date.valueOf(req.getParameter("whichDate").trim()); //���
			} catch (IllegalArgumentException e) {
				System.out.println("444444");
				errorMsgs.add("�п�J���!");
			}

			Gson gson = new Gson();
			ResponseFormat rf = null;
			String jsonStr = null;
			
			if (!errorMsgs.isEmpty()) {
				out.print("error");
				out.flush();
			} else {

				BookingInfo bInfoVO = new BookingInfo();
				bInfoVO.setSeatCode("0"); //default�A�����t�y��
				bInfoVO.setMemberId(memberId); //�|��
				bInfoVO.setMealDate(whichDate); //���
				bInfoVO.setMealTime(bookTime); //�����A1:�� 2:�� 3:��
				bInfoVO.setBookingStatus(0); //default�A0:�w�q�� 1:�����q�� 2:���\�� 3:���� 4:�w���b
				bInfoVO.setPayBill(0); //default�A���I�\
				bInfoVO.setBookingSeattype(peopleNum); //�y��A2,4,6�H
				
				BookingInfoService bookingSvc = new BookingInfoServiceImpl();
				boolean result = bookingSvc.bookingSeat(bInfoVO);
				System.out.println("[controller]�s�W���\? " +result);
				
				if(result) {
					rf = new ResponseFormat("success", "200");
					jsonStr = gson.toJson(rf);
					out.print(jsonStr);
					out.close();
				}
			}
			
		} catch (Exception e) {
			errorMsgs.add("�ק��ƥ���:"+e.getMessage());
			out.print("error");
			out.flush();
		}
		/***************************1.�����ШD�Ѽ�****************************************/
	
		//test add booking
//		BookingInfo info = new BookingInfo();
//		info.setSeatCode("A007");
//		info.setMemberId(1011);
//
////		info.setMealDate(java.sql.Date.valueOf("2021-07-25"));
//		info.setMealDate(transferCalendarToSqlDate(2021, Calendar.AUGUST, 6));
//		info.setMealTime(0);
//		info.setBookingStatus(3);
//		info.setPayBill(0);
//		info.setBookingSeattype(6);
		
		//test update booking
//		BookingInfo info = new BookingInfo();
//		info.setMealId(23);
//		info.setSeatCode("A008");
//		info.setMemberId(1011);
//		info.setMealDate(transferCalendarToSqlDate(2021, Calendar.AUGUST, 7));
//		info.setMealTime(2);
//		info.setBookingStatus(4);
//		info.setPayBill(20000);
//		info.setBookingSeattype(4);

//		BookingInfoService service;
//		
//		try {
//			service = new BookingInfoServiceImpl();
//			boolean result = service.addBooking(info);
//			boolean result = service.updateBooking(info);
//			boolean result = service.deleteBooking(new Integer(23));
//			res.getWriter().append(result+"");
			
			//select one
//			BookingInfo info = service.getBookingByKey(new Integer(7));
//			if(info != null) {
//				res.getWriter().append(info.toString());
//			}
			
			//select all
//			StringBuilder sb = new StringBuilder();
//			List<BookingInfo> list = service.getAll();
//			Consumer<BookingInfo> bookingConsumer = p -> {
//				sb.append(p.toString());
//				sb.append("<br>");
//			};
//			list.stream().forEach(bookingConsumer);
//			res.getWriter().append(sb);
			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
	
	private java.sql.Date transferCalendarToSqlDate(int year, int month, int day) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month);
		calendar.set(Calendar.DAY_OF_MONTH, day);
		return new Date(calendar.getTimeInMillis());
	}

}
