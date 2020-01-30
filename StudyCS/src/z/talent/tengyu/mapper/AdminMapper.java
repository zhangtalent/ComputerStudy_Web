package z.talent.tengyu.mapper;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {

	
	public int getMember(@Param("username")String username,@Param("password")String password);
	
	public boolean updatePassword(@Param("uuid")String id);

}

