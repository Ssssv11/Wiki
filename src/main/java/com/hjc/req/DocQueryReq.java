package com.hjc.req;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DocQueryReq extends PageReq{
    private String name;
}
