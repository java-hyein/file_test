package gasan.test.first;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService {
	@Autowired
	FileMapper fm;

	public List<FileVO> fileView() throws Exception {
		return this.fm.fileView();
	}

	public void fileInsert(final FileVO vo) throws Exception {
		this.fm.fileInsert(vo);
	}
}