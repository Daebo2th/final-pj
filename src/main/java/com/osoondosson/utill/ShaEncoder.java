package com.osoondosson.utill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class ShaEncoder {
	
	@Autowired
	@Qualifier("passwordEncorder")
	ShaPasswordEncoder shaPasswordEncoder;
	
	public String encoding(String str) {
		return shaPasswordEncoder.encodePassword(str, null);
	}
	
	// salt 적용
	public String saltEncoding(String str, String salt) {
		return shaPasswordEncoder.encodePassword(str, salt);
	}
}
