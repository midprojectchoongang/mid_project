package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Location;


public class LocationDao {
	private static LocationDao instance = new LocationDao();

	private LocationDao() {
	}

	public static LocationDao getInstance() {
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
	public String select(int i) {
		return session.selectOne("locatens.select", i);
	}
}