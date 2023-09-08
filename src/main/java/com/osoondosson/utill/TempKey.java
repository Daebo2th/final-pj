package com.osoondosson.utill;



import java.util.Random;

/**
 * 인증키를 생성
 * */
public class TempKey {

    private boolean lowerCheck;
    private int size;

    /**
     * @Param size 인증키길이 <br>
     * @Param lowerCheck 소문자 변환 여부 <br>
     *
     * @return init() 인증키
     * */
    public String getKey(int size, boolean lowerCheck) {
        this.size = size;
        this.lowerCheck = lowerCheck;
        return init();
    }

    private String init() {
        Random  ran = new Random();
        StringBuffer sb = new StringBuffer();
        int num = 0;
        do {
            num = ran.nextInt(75)+48;
            if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
                sb.append((char)num);
            }else {
                continue;
            }
        } while (sb.length() < size);
        if(lowerCheck) {
            return sb.toString().toLowerCase();
        }
        return sb.toString();
    }
}
