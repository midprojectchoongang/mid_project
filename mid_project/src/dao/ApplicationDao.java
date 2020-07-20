package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Application;

public class ApplicationDao {
	private static ApplicationDao instance = new ApplicationDao();
	private ApplicationDao() {	}
	public static ApplicationDao getInstance() {
		return instance;
	}
	
	private static SqlSession session;
	static { // 클래스변수 초기화 블럭
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("초기화 에러 : " + e.getMessage());
		}
	}
	public List<Application> list(String startRow, String endRow, String member_id) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("member_id", member_id);
		
		return session.selectList("applyns.list", hm);
	}/*
		 * public Free select(int deptno) { return (Free)
		 * session.selectOne("deptns.select", deptno); } public int insert(Free dept) {
		 * return session.insert("deptns.insert", dept); } public int update(Dept dept)
		 * { return session.update("deptns.update", dept); } public int delete(int
		 * deptno) { return session.delete("deptns.delete", deptno); }
		 */
	public int total(String member_id) {
		return session.selectOne("applyns.total", member_id);
	}
	public int apply(Application app) {
		return session.insert("applyns.apply", app);
	}
	public Application read(int application_no) {
		return session.selectOne("applyns.read", application_no);
	}
}
