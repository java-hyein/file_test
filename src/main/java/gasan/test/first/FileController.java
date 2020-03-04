package gasan.test.first;

import java.io.File;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
import org.springframework.ui.Model;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;

@Controller
public class FileController {
	@Resource(name = "uploadPath")
	private String uploadPath;
	@Autowired
	FileService fs;
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	

	@RequestMapping(value = ("/fileResult"), method = RequestMethod.GET)
	public String fileView(final Model model) throws Exception {
		FileController.logger.info("fileResult window");
		final List<FileVO> file = fs.fileView();
		model.addAttribute("fileResult", file);
		return "/fileResult";
	}

	@RequestMapping("/file")
	public String file(final Model model) {
		System.out.println("file");
		return "/file";
	}

	@RequestMapping(value = ("/file"), method = RequestMethod.POST)
	public String postGoodsRegister(FileVO vo, MultipartFile file) throws Exception {
		final String imgUploadPath = uploadPath;
		final String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			vo.setGdsImg(ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = File.separator + "impUpload" + File.separator + "admin.png";
			vo.setGdsImg(fileName);
			vo.setGdsThumbImg(fileName);
		}
		System.out.println("=================");
		System.out.println("name = " + vo.getGdsName());
		System.out.println("img = " + vo.getGdsImg());
		System.out.println("=================");
		fs.fileInsert(vo);
		return "redirect:/fileResult";
	}
}