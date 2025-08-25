package com.musicismylife.domain.emotion;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmotionDTO {
	private String EMOTION_CODE;
	private String DESCRIPTION;
	private String YOUTUBE_PLAYLIST_LINK;

	public EmotionDTO() {}

	public EmotionDTO(String EMOTION_CODE, String DESCRIPTION, String YOUTUBE_PLAYLIST_LINK) {
		this.EMOTION_CODE = EMOTION_CODE;
		this.DESCRIPTION = DESCRIPTION;
		this.YOUTUBE_PLAYLIST_LINK = YOUTUBE_PLAYLIST_LINK;
	}


}
