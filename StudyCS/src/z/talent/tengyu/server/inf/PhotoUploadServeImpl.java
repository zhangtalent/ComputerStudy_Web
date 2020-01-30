package z.talent.tengyu.server.inf;

import java.io.File;

import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.exception.CosClientException;
import com.qcloud.cos.exception.CosServiceException;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.model.StorageClass;
import com.qcloud.cos.region.Region;

import z.talent.tengyu.server.PhotoUploadServe;

@Service("PhotoUploadServeImpl")
@Component
@Transactional
public class PhotoUploadServeImpl implements PhotoUploadServe {
	

	private static final String pathRoot = "C:\\tengyu\\";
	
	//转文件
	public String transportFile(MultipartFile file) throws IOException {
		
		String path="";
		if(!file.isEmpty()){
			//生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			//获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType=file.getContentType();
			//获得文件后缀名称
			String imageName=contentType.substring(contentType.indexOf("/")+1);
			path=""+uuid+"."+imageName;
			file.transferTo(new File(pathRoot+path));
			return pathRoot+path;
			
		}
		//System.err.println("--------------------\n"+path);
		return path;
	}
			 
	
	public String uploadToserve(String path) {
		
		//上到腾讯云cdn
		/**
		 * */
		 
		COSCredentials cred = new BasicCOSCredentials("AKIDHNFuLXiCdojOnweRowoQs78uRjmaFUaQ", "jEUVHo69xVnpa5KJ3XliPpzsVszrTpvr");
		// 采用了新的 region 名字，可用 region 的列表可以在官网文档中获取，也可以参考下面的 XML SDK 和 JSON SDK 的地域对照表
		ClientConfig clientConfig = new ClientConfig(new Region("ap-shanghai"));
		COSClient cosClient = new COSClient(cred, clientConfig);
		// 存储桶名称，格式为：BucketName-APPID
		String bucketName = "yss-1253784481";
		String name = UUID.randomUUID().toString();
		// 以下是向这个存储桶上传一个文件的示例
		String key = "studycs/"+name+".png";
		File localFile = new File(path);
		PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, localFile);
		// 设置存储类型：标准存储（Standard）, 低频存储（Standard_IA）和归档存储（ARCHIVE）。默认是标准存储（Standard）
		putObjectRequest.setStorageClass(StorageClass.Standard);
		String urlString = "";
		try {
		    PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);
		    // putobjectResult 会返回文件的 etag
		    String etag = putObjectResult.getETag();
		} catch (CosServiceException e) {
		    e.printStackTrace();
		    return  "{\"result\":\"fail\"}";
		} catch (CosClientException e) {
		    e.printStackTrace();
		    return  "{\"result\":\"fail\"}";
		} finally {
			//if(localFile.exists()) {localFile.delete();}
		}
		// 关闭客户端
		cosClient.shutdown();
		return "{\"result\":\"ok\",\"url\":\"https://yss-1253784481.cos.ap-shanghai.myqcloud.com/"+key+"\"}";
	}
}
