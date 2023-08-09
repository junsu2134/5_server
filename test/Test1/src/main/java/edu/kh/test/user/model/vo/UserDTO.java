package edu.kh.test.user.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor

public class UserDTO {
	private int userNo;
	private String userId;
	private String userName;
	private int userAge;
	
}
