package dao;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;
public class CommentsDao {
	private static CommentsDao instance = new CommentsDao();
	private CommentsDao() {	}
	public static CommentsDao getInstance() {
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
}
