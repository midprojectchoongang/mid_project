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
	public List<Adopt_scrap> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		return session.selectList("adoptScrapns.list", hm);
	}
	public int total() {
		return (int) session.selectOne("adoptScrapns.total");
	}
	public int scrap(Adopt_scrap adopt_scrap) {
		return session.insert("adoptScrapns.scrap", adopt_scrap);
	}
	@SuppressWarnings("unchecked")
	public List<Adopt_scrap> read(String member_id) {
		return session.selectList("adoptScrapns.read", member_id);
	}
	
	
}
