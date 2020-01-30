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
	
	//ת�ļ�
	public String transportFile(MultipartFile file) throws IOException {
		
		String path="";
		if(!file.isEmpty()){
			//����uuid��Ϊ�ļ�����
			String uuid = UUID.randomUUID().toString().replaceAll("-","");
			//����ļ����ͣ������ж��������ͼƬ����ֹ�ϴ���
			String contentType=file.getContentType();
			//����ļ���׺����
			String imageName=contentType.substring(contentType.indexOf("/")+1);
			path=""+uuid+"."+imageName;
			file.transferTo(new File(pathRoot+path));
			return pathRoot+path;
			
		}
		//System.err.println("--------------------\n"+path);
		return path;
	}
			 
	
	public String uploadToserve(String path) {
		
		//�ϵ���Ѷ��cdn
		/**
		 * */
		 
		COSCredentials cred = new BasicCOSCredentials("AKIDHNFuLXiCdojOnweRowoQs78uRjmaFUaQ", "jEUVHo69xVnpa5KJ3XliPpzsVszrTpvr");
		// �������µ� region ���֣����� region ���б�����ڹ����ĵ��л�ȡ��Ҳ���Բο������ XML SDK �� JSON SDK �ĵ�����ձ�
		ClientConfig clientConfig = new ClientConfig(new Region("ap-shanghai"));
		COSClient cosClient = new COSClient(cred, clientConfig);
		// �洢Ͱ���ƣ���ʽΪ��BucketName-APPID
		String bucketName = "yss-1253784481";
		String name = UUID.randomUUID().toString();
		// ������������洢Ͱ�ϴ�һ���ļ���ʾ��
		String key = "studycs/"+name+".png";
		File localFile = new File(path);
		PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, localFile);
		// ���ô洢���ͣ���׼�洢��Standard��, ��Ƶ�洢��Standard_IA���͹鵵�洢��ARCHIVE����Ĭ���Ǳ�׼�洢��Standard��
		putObjectRequest.setStorageClass(StorageClass.Standard);
		String urlString = "";
		try {
		    PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);
		    // putobjectResult �᷵���ļ��� etag
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
		// �رտͻ���
		cosClient.shutdown();
		return "{\"result\":\"ok\",\"url\":\"https://yss-1253784481.cos.ap-shanghai.myqcloud.com/"+key+"\"}";
	}
}
