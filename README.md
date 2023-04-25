---
title: Integrated Platform for Data Analysis
date: 2022-09-17 00:00:00
updated: 2022-09-17 00:00:00
tags: Computation
categories: PROJECT
keywords: 
description:
top_img:
comments:
cover: https://pic3.zhimg.com/v2-b1864008123803703bea4796fd160147_b.jpg
toc:
toc_number:
toc_style_simple:
copyright:
copyright_author:
copyright_author_href:
copyright_url:
copyright_info:
mathjax:
katex: true
aplayer:
highlight_shrink:
sticky: 4
aside:
---

<font size="4">
<font face='KaiTi_GB2312'>

# README

>作者：禤科材
>
>学号： PB20030874
>
>单位：中国科学技术大学，化学物理系 
>
>邮箱：ustcxkc@mail.ustc.edu.cn
>
>QQ：2636832145
>
>版权归作者所有。商业转载请联系作者获取授权。非商业转载请注明出处。
>

>Author: Kecai Xuan
>
>Student ID Code: PB20030874
>
>Department of Physical Chemistry, University of Science and Technology of China
>
>
>Email：ustcxkc@mail.ustc.edu.cn
>
>QQ：2636832145
>
>Copyright is owned by the author. For commercial reprints, please contact the author for authorization. For non-commercial reprints, please indicate the source.

——————————————————————————————————————————————————————————————————

## 版本：1.0.0

## 引言

&emsp;&emsp;众所周知，科大学生不能没有大物实验，如同西方不能没有耶路撒冷。 **大学物理-基础实验** 这门课已经成为思想钢印，深深地印在了每一个科大人的头脑之中。自开设以来，这门课遭受的口诛笔伐难以用一段简单的背景介绍一笔带过。由于本门课程开设于中国科学技术大学东校区第一教学楼，所以此处仅简单罗列一些同学们提出关于一教的口号：“一教地底有金矿”“炸毁一教，人人有责”等等。

&emsp;&emsp;得益于计算机的高度发展，大物实验这门课程也有一定的新变化。自老师允许提交打印版报告以来，实现 **实验报告自动化** 就已经是很多前辈在修读这门课时努力的方向，并留下了不少珍贵遗产。例如林子涵学长开发的“学在科大”APP中大物实验的相关功能、Linux用户协会官网下的大物数据处理算法等等。作者本人也在大一时也写了一个简单的C语言数据处理程序求不确定度，在节省手动计算时间上取得了很大成功。

&emsp;&emsp;然而，这些珍贵遗产的功能仅限于几个较小的方面，大多也只能给出一些数字的计算结果。正在写报告的同学仍然需要打开很多软件、花费大量时间才能完成一篇简单的实验报告。比如使用 Excel 表格用于简单的求和、求积操作、Origin 用于图像的绘制与美化、Vscode 用于 $\LaTeX$ 文件的书写与编译等等。在这些软件中间来回操作也为报告的书写带来了极大不便。

&emsp;&emsp;自那时起，作者一直有一个这样的想法，即能不能将实验报告书写的各种功能集成到一个平台上？这样一来，同学们只需要对着一个或者两个窗口，就能完成实验报告的书写，进一步减少机械操作，也即向 **实验报告自动化** 迈出新的一步。

&emsp;&emsp;在此，作者在2022年秋季 **物理化学基础实验（上）** 的学习过程中，参考了前辈们的成果，开发了一套基于 Wolfram Mathematica 的集成实验数据处理平台（版本 Wolfram Mathematica 13.0.1.0, student edition ），兼有 **不确定度计算**、**绘图**、**拟合数据**、**LaTeX 输出** 等功能。根据作者本人一学期的使用和一小部分同学的反馈，本文所描述的集成平台可以极大节省做实验的同学们花在报告上不必要的时间，在使用过程中也不乏美的享受。

&emsp;&emsp;详尽的使用教程参见随文件附带的 `tutorial.pdf` 文档以及程序中的注释。使用中有任何问题，欢迎联系作者。

## 关于数据处理

&emsp;&emsp;本平台可应用于中国科学技术大学 **大学物理-基础实验** 以及 **物理化学基础实验（上）** 等实验课程的报告书写中，也不排除其他可能的应用。所有数据和代码（Wolfram 主体程序.nb、Wolfram 函数包.wl、C 语言不确定度处理程序.c 以及 Python 输出 $\LaTeX$ 形式的原始数据程序）一律开源，使用者可以根据自己的需要任意改动，请留意 **注释、函数的相互关系以及路径细节**。

### 主体程序

&emsp;&emsp;主体程序包含以下几个方面：

1. 数据的导入、修饰与绘图
2. 导出图片文件
2. 线性回归与残差
3. 非线性回归模型
5. 写入 $\TeX$ 文件

这些功能的实现需要调用函数包里的相应函数，使用前需要初始化，即加载相应的函数包。

### 函数包

&emsp;&emsp;函数包 `file.wl` 包含数据导入函数 `ImportDataFile` 和 图片导出函数 `ExportJpg` ，使用时请注意文件路径。

&emsp;&emsp;函数包 `draw.wl` 为一些绘图函数，可以分别 (`PlotRespectively`) 或者批量 (`PlotAll`) 绘制数据图像，这些函数使用的数据可以来自 `ImportDataFile` 的导入，也可以来自主程序生成的任意列表形式的变量。

### 调用外部程序

&emsp;&emsp;WSTP接口使得 Wolfram Mathematica 可以与外部程序进行通讯，通过它可以调用C、Python等一系列外部语言函数。

——————————————————————————————————————————————————————————————————


## 关于报告

&emsp;&emsp;报告文件对应中国科学技术大学 **物理化学基础实验（上）** 相应实验课题。文件夹中的 `report.pdf` 文件即为最终提交的报告。另附作者大一下学期 **大学物理-基础实验A** 的报告，其所使用的数据处理程序为本文件中 Wolfram Mathematica 集成平台的前身。

&emsp;&emsp;由于疫情封校的原因，实验10和实验11为线上完成，由老师提供数据。

&emsp;&emsp;实验报告均使用 $\LaTeX$ 编写，版本为 TeXLive 2021，由 XeTeX 编译。

&emsp;&emsp;报告文件与处理平台一样，全部开源。


</font>
</font>