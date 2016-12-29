#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys
#写入内容前删除文件
import os
os.remove('/tmp/df2.txt')

filename=sys.argv[1]
use_memory=sys.argv[2]
data=open(filename)
ln=0
str=''
#写入内容前清空文件，与删除文件方法二选一
#cleanfile=open('/tmp/df2.txt', 'w')
#cleanfile.truncate()
#cleanfile.close()

def judge_memory_use(str):
    list_str = [word for word in str.split()]
    if int(list_str[-2]) > int(use_memory):
        output_line = open('/tmp/df2.txt', 'a')
        output_line.write(str+'\n')
        output_line.close()
        print str

for sline in data.readlines():
    nline = sline.replace('%','')
    ln += 1
    if nline[0] == "l":
        if ln > 1:
            judge_memory_use(str)
        str = ''.join([nline.strip(),''])
    else:
        str = '	'.join([str,nline.strip()])
judge_memory_use(str)
