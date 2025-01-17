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
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("초기화 에러 : " + e.getMessage());
		}
	}
	public List<Adopt_board> list(int startRow, int endRow, String member_id) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("startRow", startRow+"");
		hm.put("endRow", endRow+"");
		hm.put("member_id", member_id);
		return session.selectList("adoptns.list", hm);
	}
	public int total(String member_id) {
		return session.selectOne("adoptns.total", member_id);
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
	public int count(int adopt_no) {
		return session.update("adoptns.count", adopt_no);
	}
	public List<Adopt_board> myList(int startRow, int endRow, String member_id) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("startRow", startRow+"");
		hm.put("endRow", endRow+"");
		hm.put("member_id", member_id);
		
		return session.selectList("adoptns.myList", hm);
	}
	public void writeImg(String content, int adopt_no) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("content", content);
		hm.put("adopt_no", adopt_no+"");
		session.update("adoptns.writeImg", hm);
	}
	public int myTotal(String member_id) {
		return session.selectOne("adoptns.myTotal", member_id);
	}
	public int total_m() {
		return session.selectOne("adoptns.total_m");
	}
	public List<Adopt_board> list_m(int startRow, int endRow) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("startRow", startRow+"");
		hm.put("endRow", endRow+"");
		return session.selectList("adoptns.list_m", hm);
	}
}
