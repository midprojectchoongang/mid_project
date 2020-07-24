package dao;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

import model.Comments;
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
	public int write(Comments comm) {
		return session.insert("commentsns.write", comm);
	}
	public List<Comments> list(int free_no) {
		return session.selectList("commentsns.list", free_no);
	}
	public void updateRef() {
		session.update("commentsns.updateRef");
	}

}
