package dao;
import java.io.Reader;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;
import model.Free_board;
public class Free_boardDao {
	private static Free_boardDao instance = new Free_boardDao();
	private Free_boardDao() {	}
	public static Free_boardDao getInstance() {
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
	public List<Free_board> list(String startRow, String endRow, String category) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("category", category);
		List<Free_board> list = session.selectList("freens.list", hm);
		return list;
	}
	public int total(String category) {
		return session.selectOne("freens.total", category);
	}
	public int insert(Free_board free_board) {
		return session.insert("freens.write", free_board);
	}
	public Free_board read(int free_no) {
		return session.selectOne("freens.read", free_no);
	}
	public int update(Free_board free_board) {
		return session.insert("freens.update", free_board);
	}
	public int delete(int free_no) {
		return session.update("freens.delete", free_no);
	}
	public void cntUp(int free_no) {
		session.update("freens.cntUp", free_no);
	}
	public List<Free_board> hotList(int startRow, int endRow, int cnt) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("cnt", cnt);
		return session.selectList("freens.hotList", hm);
	}
	public int hotTotal(int cnt) {
		return session.selectOne("freens.hotTotal", cnt);
	}
	public int cntComm(int free_no, int cntNum) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("free_no", free_no);
		hm.put("comm", cntNum);
		return session.update("freens.cntComm", hm);
	}
	public int search(String member_id) {
		return session.selectOne("freens.search", member_id);
	}
	public void writeImg(String content, int free_no) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("content", content);
		hm.put("free_no", free_no+"");
		session.update("freens.writeImg", hm);	
	}
	public int total_m(String category) {
		return session.selectOne("freens.total_m", category);
	}
	public List<Free_board> list_m(String sr, String er, String category) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("startRow", sr);
		hm.put("endRow", er);
		hm.put("category", category);
		List<Free_board> list = session.selectList("freens.list_m", hm);
		return list;
	}
}