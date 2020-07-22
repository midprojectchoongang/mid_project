package dao;
import java.io.*;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;
import model.Shelter;
public class ShelterDao {
	private static ShelterDao instance = new ShelterDao();
	private ShelterDao() {}
	public static ShelterDao getInstance() {
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
	public List<Shelter> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		List<Shelter> list = session.selectList("shelterns.list", hm);
		return list;
	}
	public int total() {
		return session.selectOne("shelterns.total");
	}
	public int insert(Shelter shelter) {
		return session.insert("shelterns.insert", shelter);
	}
	public Shelter select(int shelter_no) {
		return session.selectOne("shelterns.select", shelter_no);
	}
	public int delete(int shelter_no) {
		return session.update("shelterns.delete", shelter_no);
	}
	public int update(Shelter shelter) {
		return session.update("shelterns.update", shelter);
	}
}