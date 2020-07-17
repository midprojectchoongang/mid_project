package dao;
import java.io.Reader;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;
import model.Adopt_board;
public class Adopt_boardDao {
	private static Adopt_boardDao instance = new Adopt_boardDao();
	private Adopt_boardDao() {	}
	public static Adopt_boardDao getInstance() {
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
	public List<Adopt_board> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		return session.selectList("adoptns.list", hm);
	}
	public int total() {
		return session.selectOne("adoptns.total");
	}
	public int insert(Adopt_board adopt_board) {
		return session.insert("adoptns.write", adopt_board);
	}
	public Adopt_board read(int adopt_no) {
		return session.selectOne("adoptns.read", adopt_no);
	}
	public int update(Adopt_board adopt_board) {
		return session.update("adoptns.update", adopt_board);
	}
	public int delete(int adopt_no) {
		return session.update("adoptns.delete", adopt_no);
	}
	public int search(String member_id) {
		return session.selectOne("adoptns.search", member_id);
	}
}
