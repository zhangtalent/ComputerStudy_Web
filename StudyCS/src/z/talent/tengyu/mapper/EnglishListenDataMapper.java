package z.talent.tengyu.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import z.talent.tengyu.bean.EnglishListenData;

public interface EnglishListenDataMapper {
	
	public int getEnglishListenDataByAudioIdAndUserId(@Param("audioid")String audioid,@Param("userid")String userid,@Param("time")String time);
	public ArrayList<EnglishListenData> getEnglishListenDatas(@Param("offset")int offset,@Param("limit")int limit);
	public boolean insertEnglishListenData(EnglishListenData EnglishListenData);
	public boolean DeleteEnglishListenDataByUuid(@Param("uuid")String uuid);
	public int getEnglishListenDataCounts();
	public boolean updateEnglishListenData(@Param("rateofcorrect")Integer rateofcorrect,@Param("listentime")Integer listentime,@Param("audioid")String audioid,@Param("userid")String userid,@Param("time")String time);
	
}

