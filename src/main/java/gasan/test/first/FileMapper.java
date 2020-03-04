package gasan.test.first;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileMapper {
	
	@Autowired
	private SqlSession session;
	private static String namespace;

	static {
		FileMapper.namespace = "gasan.test.first.FileMapper";
	}

	public List<FileVO> fileView() throws Exception {
		return session.selectList(namespace + ".fileView");
	}

	public void fileInsert(final FileVO vo) throws Exception {
		this.session.insert(namespace + ".fileInsert", vo);
	}
}