package z.talent.tengyu.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import z.talent.tengyu.bean.EnglishReadData;

public interface EnglishReadDataMapper {
	
	public int getEnglishReadDataByAudioIdAndUserId(@Param("pageid")String pageid,@Param("userid")String userid,@Param("time")String time);
	public ArrayList<EnglishReadData> getEnglishReadDatas(@Param("offset")int offset,@Param("limit")int limit);
	public boolean insertEnglishReadData(EnglishReadData EnglishReadData);
	public boolean DeleteEnglishReadDataByUuid(@Param("uuid")String uuid);
	public int getEnglishReadDataCounts();
	public boolean updateEnglishReadData(@Param("readtime")Integer readtime,@Param("pageid")String pageid,@Param("userid")String userid,@Param("time")String time);
	
}

