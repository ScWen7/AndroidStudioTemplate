<?xml version="1.0"?>
<recipe>

   
    <#include "../common/recipe_manifest.xml.ftl" /> //在清单文件中注册此Activity

    <instantiate from="root/src/app_package/TemplateActivity.java.ftl"
         	to="${escapeXmlAttribute(srcOut)}/${activity}.java" /> //把生成的Activity生成到当前目录下，生成的名字是用户输入的，${activity}定义在全局文件中。

    <instantiate from="root/res/layout/activity_template.xml.ftl"
    		to="${escapeXmlAttribute(resOut)}/layout/${simpleLayoutName}.xml" /> //布局文件生成到Res的layout文件夹中，生成的名字也是由用户输入

    <open file="${escapeXmlAttribute(resOut)}/layout/${simpleLayoutName}.xml" /> //最后打开这个布局文件

    <open file="${escapeXmlAttribute(srcOut)}/${activity}.java" /> //最后打开这个Activity

</recipe>
