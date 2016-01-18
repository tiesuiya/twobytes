package com.twobytes.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import basic.jdbc.JdbcUtils;
import basic.utils.TimeUtils;

import com.twobytes.bean.Note;
import com.twobytes.service.NoteServices;

@Service
public class NoteServicesImpl implements NoteServices {

	@Override
	public Note getLastNote(String userId) throws Exception {
		// 获得最后一条记录
		String sql = "select * from note ORDER BY createTime DESC LIMIT 0,1 where userId = ?";
		Note noteLast = JdbcUtils.findSimpleRefResult(sql, Note.class, userId);

		// 根据查询出的当天日记做出判断
		if (noteLast == null) {
			// 创建并返回当天日记
			return createNewNote(userId);
		} else {
			// 计算日记创建和系统时间的天数差
			int i = TimeUtils.getDaysBetweenSys(noteLast.getCreatetime());
			if (i > 0) {
				// 大于0表示为新的一天，创建并返回当天日记
				return createNewNote(userId);
			} else if (i < 0) {
				// 抛出异常，正常情况下这是不可能的事
				throw new RuntimeException("系统时间可能存在错误！");
			} else {
				// 为0表示当天，返回当天记录
				return noteLast;
			}
		}
	}

	/**
	 * 更新日记
	 */
	@Override
	public boolean saveNote(Note note) {
		String sql = "update note set content = ?,updateTime = ? where id = ?";
		boolean resultBool = JdbcUtils.updateByPreparedStatement(sql, note.getContent(), TimeUtils.getCurrentTime(), note.getId());
		return resultBool;
	}

	/**
	 * 创建并返回当天日记
	 * 
	 * @param userId
	 * @return
	 */
	private Note createNewNote(String userId) {
		// 创建当天日记
		String sql = "insert into note set createTime = ?, userId = ?";
		boolean isCreate = JdbcUtils.updateByPreparedStatement(sql, TimeUtils.getCurrentTime(), userId);
		// 返回当天日记
		sql = "select * from note ORDER BY createTime DESC LIMIT 0,1 where userId = ?";
		return isCreate ? JdbcUtils.findSimpleRefResult(sql, Note.class, userId) : null;
	}

	@Override
	public List<Note> getNodes(String userId) {
		String sql = "select * from note where userId = ?";
		return JdbcUtils.findMoreRefResult(sql, Note.class, userId);
	}

}
