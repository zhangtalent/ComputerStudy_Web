package z.talent.tengyu.mapper;

import java.util.ArrayList;


import org.apache.ibatis.annotations.Param;

import z.talent.tengyu.bean.EnglishListenError;

public interface EnglishListenErrorMapper {
	
	public int getEnglishListenErrorByAudioIdAndUserId(@Param("audioid")String audioid,@Param("userid")String userid,@Param("time")String time);
	public ArrayList<EnglishListenError> getEnglishListenErrors();
	public boolean insertEnglishListenError(EnglishListenError EnglishListenError);
	public boolean DeleteEnglishListenErrorByUuid(@Param("uuid")String uuid);
	public int getEnglishListenErrorCounts();

}

