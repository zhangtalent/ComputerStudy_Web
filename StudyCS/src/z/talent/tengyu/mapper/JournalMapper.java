package z.talent.tengyu.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import z.talent.tengyu.bean.Journal;

public interface JournalMapper {

	
	public Journal getJournalByUuid(@Param("uuid")String uuid);
	public ArrayList<Journal> getJournals(@Param("offset")int offset,@Param("limit")int limit);
	public boolean insertJournal(Journal journal);
	public boolean DeleteJournalByUuid(@Param("uuid")String uuid);
	public int getJournalCounts();
}

