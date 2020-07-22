package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Adopt_scrap;

public class Adopt_scrapDao {
	private static Adopt_scrapDao instance = new Adopt_scrapDao();
	private Adopt_scrapDao() {	}
	public static Adopt_scrapDao getInstance() {
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
	public List<Adopt_scrap> list(int startRow, int endRow, String member_id) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("startRow", startRow+"");
		hm.put("endRow", endRow+"");
		hm.put("member_id", member_id);
		
		return session.selectList("adoptScrapns.list", hm);
	}
	public int total(String member_id) {
		return (int) session.selectOne("adoptScrapns.total", member_id);
	}
	public int scrap(Adopt_scrap adopt_scrap) {
		return session.insert("adoptScrapns.scrap", adopt_scrap);
	}
	@SuppressWarnings("unchecked")
	public List<Adopt_scrap> read(String member_id) {
		return session.selectList("adoptScrapns.read", member_id);
	}
	public int delete(String member_id, int adopt_no) {
		HashMap<String, String> deleteKey = new HashMap<>();
		deleteKey.put("member_id", member_id);
		deleteKey.put("adopt_no", adopt_no+"");
		
		return session.update("adoptScrapns.delete", deleteKey);
	}
	
}
