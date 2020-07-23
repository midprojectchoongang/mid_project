package dao;
import java.io.Reader;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import model.Member;
public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {
	}
	public static MemberDao getInstance() {
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
	public Member select(String member_id) {
		Member member = (Member)session.selectOne("memberns.select", member_id);
		return member;
	}
	public Member idChk(String member_id) {
		Member member = (Member)session.selectOne("memberns.idChk", member_id);
		return member;
	}
	public int loginChk(String member_id, String password) {
		int result = 0;
		Member member = select(member_id);
		if (member == null) 
			result = -1;
		else if (member.getPassword().equals(password)) {
			result = 1;
		}
		return result;
	}
	public int insert(Member member) {
		return session.insert("memberns.insert", member);
	}
	public int update(Member member) {
		return session.update("memberns.update", member);
	}
	public int updatePw(Member member) {
		return session.update("memberns.updatePw", member);
	}
	public int delete(String member_id) {
		return session.update("memberns.delete", member_id);
	}
	public List<Member> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("memberns.list", hm);
	}
	public int delMaster(String member_id, String del_be) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("member_id", member_id);
		hm.put("del", del_be);
		return session.update("memberns.delMaster", hm);
	}
	public int total() {
		return session.selectOne("memberns.total");
	}
}