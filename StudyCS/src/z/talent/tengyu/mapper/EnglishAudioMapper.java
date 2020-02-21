package z.talent.tengyu.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import z.talent.tengyu.bean.EnglishAudio;

public interface EnglishAudioMapper {
	
	public EnglishAudio getEnglishAudioByUuid(@Param("uuid")String uuid);
	public ArrayList<EnglishAudio> getEnglishAudios(@Param("offset")int offset,@Param("limit")int limit);
	public boolean insertEnglishAudio(EnglishAudio EnglishAudio);
	public boolean DeleteEnglishAudioByUuid(@Param("uuid")String uuid);
	public int getEnglishAudioCounts();
	
}

