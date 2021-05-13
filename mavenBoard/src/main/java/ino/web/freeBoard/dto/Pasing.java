package ino.web.freeBoard.dto;

import org.springframework.stereotype.Component;

@Component
public class Pasing {
	private int startrow;
	private int endrow;

	


	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	

}
