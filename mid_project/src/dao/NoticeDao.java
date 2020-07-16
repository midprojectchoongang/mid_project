package dao;
import java.io.*;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;
import model.Notice;
public class NoticeDao {
	private static NoticeDao instance = new NoticeDao();
	private NoticeDao() {}
	public static NoticeDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("ERROR_connect: " + e.getMessage());
		}
	}
	public List<Notice> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		List<Notice> list = session.selectList("noticens.list", hm);
		return list;
	}
	public int total() {
		return session.selectOne("noticens.total");
	}
	public int insert(Notice notice) {
		return session.insert("noticens.insert", notice);
	}
	public Notice select(int notice_no) {
		return session.selectOne("noticens.select", notice_no);
	}
	public int delete(int notice_no) {
		return session.update("noticens.delete", notice_no);
	}
	public int update(Notice notice) {
		return session.update("noticens.update", notice);
	}
}