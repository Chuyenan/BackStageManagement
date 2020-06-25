package com.npu.converters;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringToDate implements Converter<String, Date> {

    @Override
    public Date convert(String source) {
        System.out.println("转换器执行了。。。。。。。。。。");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = format.parse(source);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
