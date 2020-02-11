package z.talent.tengyu.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import z.talent.tengyu.bean.Journal;
import z.talent.tengyu.bean.JournalTypes;

public interface JournalTypesMapper {

	
	public ArrayList<JournalTypes> getTypeAndCount();
	public JournalTypes getTypeBykeyid(@Param("keyid")String keyid);
	public ArrayList<JournalTypes> getTypes();
	public int getJournalTypeCounts();
	public boolean insertType(JournalTypes journal);
	public boolean DeleteTypeByUuid(@Param("uuid")String uuid);
	public boolean updateType(@Param("keyid")String keyid,@Param("title")String title,@Param("uuid")String uuid);
}

