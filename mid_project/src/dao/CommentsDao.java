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
	static {
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
	public Comments orig(int find) {
		return session.selectOne("commentsns.orig", find);
	}
	public int update(Comments comm) {
		return session.update("commentsns.update", comm);
	}
	public int delete(int comment_no) {
		return session.update("commentsns.delete", comment_no);
	}
	public int cntNum(int free_no) {
		return session.selectOne("commentsns.cntNum", free_no);
	}

}
