package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Free_scrap;

public class Free_scrapDao {
	private static Free_scrapDao instance = new Free_scrapDao();
	private Free_scrapDao() {	}
	public static Free_scrapDao getInstance() {
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
	@SuppressWarnings("unchecked")
	public List<Free_scrap> list(int startRow, int endRow, String member_id) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("startRow", startRow+"");
		hm.put("endRow", endRow+"");
		hm.put("member_id", member_id);
		
		return session.selectList("freeScrapns.list", hm);
	}
	public int total(String member_id) {
		return (int) session.selectOne("freeScrapns.total", member_id);
	}
	public int scrap(Free_scrap free_scrap) {
		return session.insert("freeScrapns.scrap", free_scrap);
	}
	@SuppressWarnings("unchecked")
	public List<Free_scrap> read(String member_id) {
		return session.selectList("freeScrapns.read", member_id);
	}
	public int delete(String member_id, int free_no) {
		HashMap<String, String> deleteKey = new HashMap<>();
		deleteKey.put("member_id", member_id);
		deleteKey.put("free_no", free_no+"");
		
		return session.update("freeScrapns.delete", deleteKey);
	}
	
	
	
}
