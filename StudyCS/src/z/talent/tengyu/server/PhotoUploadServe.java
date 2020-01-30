package z.talent.tengyu.server;



import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;



public interface PhotoUploadServe {
	
	
	public String transportFile(MultipartFile file) throws IOException;
	
	public String uploadToserve(String path);
}
