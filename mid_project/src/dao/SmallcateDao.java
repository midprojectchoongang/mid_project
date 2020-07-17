package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Smallcate;

public class SmallcateDao {
	private static SmallcateDao instance = new SmallcateDao();

	private SmallcateDao() {
	}

	public static SmallcateDao getInstance() {
		return instance;
	}

	private  static SqlSession session;
	static {
		try {
			Reader reader = 
				Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf =
				new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("초기화 에러 : "+e.getMessage());
		}
	}
	public Smallcate select(String smallcate_id) {
		return (Smallcate) session.selectOne("smallcatens.select", smallcate_id);
	}

	

}