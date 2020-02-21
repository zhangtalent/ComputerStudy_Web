package z.talent.tengyu.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import z.talent.tengyu.bean.EnglishPassage;

public interface EnglishPassageMapper {
	
	public EnglishPassage getEnglishPassageByUuid(@Param("uuid")String uuid);
	public ArrayList<EnglishPassage> getEnglishPassages(@Param("offset")int offset,@Param("limit")int limit);
	public boolean insertEnglishPassage(EnglishPassage EnglishPassage);
	public boolean DeleteEnglishPassageByUuid(@Param("uuid")String uuid);
	public int getEnglishPassageCounts();
	
}

