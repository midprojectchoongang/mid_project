package dao;
import java.io.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;
import model.Master;
public class MasterDao {
	private static MasterDao instance = new MasterDao();
	private MasterDao() {}
	public static MasterDao getInstance() {
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
	public int loginChk(String id, String password) {
		int result = 0; // 암호 불일치
		Master member = select(id);
		if(member == null) result = -1; // 없는 아이디
		else if(member.getPassword().equals(password)) {
			result = 1; // 아이디 암호 일치
		}
		return result;
	}
	public Master select(String id) {
		return session.selectOne("masterns.select", id);
	}
}