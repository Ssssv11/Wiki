package com.hjc.req;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EbookReq extends PageReq{
    private Long id;
    private String name;
}
