package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Application;

public class ApplicationDao {
	private static ApplicationDao instance = new ApplicationDao();
	private ApplicationDao() {	}
	public static ApplicationDao getInstance() {
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
	public List<Application> list() {
		return session.selectList("applyns.list");
	}/*
		 * public Free select(int deptno) { return (Free)
		 * session.selectOne("deptns.select", deptno); } public int insert(Free dept) {
		 * return session.insert("deptns.insert", dept); } public int update(Dept dept)
		 * { return session.update("deptns.update", dept); } public int delete(int
		 * deptno) { return session.delete("deptns.delete", deptno); }
		 */
}
