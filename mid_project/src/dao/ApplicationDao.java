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
	static {
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
	}
	public int total(String member_id) {
		return session.selectOne("applyns.total", member_id);
	}
	public int apply(Application app) {
		return session.insert("applyns.apply", app);
	}
	public Application read(int application_no) {
		return session.selectOne("applyns.read", application_no);
	}
	public int delete(int application_no) {
		return session.update("applyns.delete", application_no);
	}
	public List<Application> appList(int startRow, int endRow, int adopt_no) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("adopt_no", adopt_no);
		return session.selectList("applyns.appList", hm);
	}
	public int appTotal(int adopt_no) {
		return session.selectOne("applyns.appTotal", adopt_no);
	}
	public int update(Application app) {
		return session.update("applyns.update", app);
	}
	public int getNo(int application_no) {
		return session.selectOne("applyns.getNo", application_no);
	}
}
