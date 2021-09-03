package web.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import web.member.service.MemberService;
import web.member.service.impl.MemberServiceImpl;
import web.member.vo.MemberVO;


@WebServlet("/member/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		res.addHeader("Access-Control-Allow-Origin", "*");
		PrintWriter out = res.getWriter();
		
		MemberVO member = new MemberVO();
		member.setName(req.getParameter("name"));
		member.setIdNumber(req.getParameter("idNumber"));
		member.setPhone(req.getParameter("phone"));
		member.setEmail(req.getParameter("email"));
		
		//test add member
//		Member member = new Member();
//		member.setName("¤ý¾å©ú");
//		member.setIdNumber("A123456789");
//		member.setPhone("0987654321");
//		member.setEmail("abc@gmail.com");
//		member.setMemberLevel(102);
//		member.setMemberPoint(10000);
		
		//test update member
//		Member member = new Member();
//		member.setMemberId(1016);
//		member.setName("§d¥Ã§Ó2");
//		member.setIdNumber("A123456789");
//		member.setPhone("0912345678");
//		member.setEmail("cba@gmail.com");
//		member.setMemberLevel(1234);
//		member.setMemberPoint(20000);
		
		MemberService service;
		try {
			service = new MemberServiceImpl();
//			boolean result = service.addMember(member);
//			boolean result = service.updateMember(member);
//			boolean result = service.deleteMember(new Integer(1016));
//			res.getWriter().append(result+"");
			
//			if(result) {
				
				String name = "¼ïµ¾";
				String price = "250";
				HashMap map = new HashMap();
				map.put("name", name);
				map.put("price", price);
				JSONObject resJSONObject = new JSONObject(map);
		        out.println(resJSONObject);
//			}
			
			//select one
//			Member member = service.getMemberByKey(new Integer(1014));
//			if(member != null) {
//				res.getWriter().append(member.toString());
//			}
			
			//select all
//			StringBuilder sb = new StringBuilder();
//			List<Member> list = service.getAll();
//			Consumer<Member> memberConsumer = p -> {
//				sb.append(p.toString());
//				sb.append("<br>");
//			};
//			list.stream().forEach(memberConsumer);
//			res.getWriter().append(sb);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
