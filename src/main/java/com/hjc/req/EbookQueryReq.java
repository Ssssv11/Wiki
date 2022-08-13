package com.hjc.req;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EbookQueryReq extends PageReq{
    private Long id;
    private String name;
    private Long categoryId2;
}
