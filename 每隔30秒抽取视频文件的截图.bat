@echo off

SETLOCAL ENABLEDELAYEDEXPANSION

:Loop

REM 本脚本用来快速截取视频文件的截图，比较适合影评类自媒体作者使用
REM 1.下载最新版的ffmpeg.exe 然后和此批处理文件放在同一个目录下
REM 2.事先把需要截图的视频文件*.mp4放到C:\Users\你的用户名\Videos\下，支持子文件夹
REM 3.双击此脚本运行，弹出一个黑窗口千万不要在运行中手工关闭，任务完成后它会自动关闭
REM 4.截屏生成的图片将会以XX_01.jpg存到C:\Users\你的用户名\Pictures\下
REM 下面的参数是从视频的第2：30开始(为了跳过片头)每隔30秒截屏一次，每个视频最多截500张
REM 推荐使用HaoZipRename这个软件把视频文件重命名后再截图，生成的图片名为XX_01.jgg
REM 不知道如何跳过片尾，有好的建议请发到https://github.com/lousi8/imagecut或者微信dingdingxxyyzz

set InDir=C:\Users\%USERNAME%\Videos\
set outDir=C:\Users\%USERNAME%\Pictures\

for /r "%InDir%" %%i in (*.mp4) do (
set var=%outDir%%%~ni
ffmpeg -ss 00:2:30 -i "%%~i" -vframes 500 -r 1/30 -f image2 "!var!_%%02d.jpg" -y
)
shift /1

:End