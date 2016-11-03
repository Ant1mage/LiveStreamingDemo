# LiveStreamingDemo
## 手机端直播Demo 修复iOS10所需权限报错的问题
### 运行环境: Xcode8.0 & iOS 10
### 最低支持: Xcode7.3 & iOS 7
### 直播功能请真机测试
-------------------------<br>
本项目基于LFLiveKit(https://github.com/LaiFengiOS/LFLiveKit)<br>
实现手机端采集,美颜,编码,推流,拉流,解码,播放功能<br>
播放端采用bilibili开源框架ijkplayer(https://github.com/Bilibili/ijkplayer)<br>
流媒体服务器用的自己搭建的nginx服务器,不会的同学详情请见(http://www.jianshu.com/p/c594c3d1167c)<br>
-------------------------<br>
运行前注意事项:<br>
#### 1.项目不自带ijkplayer freamwork,请自己下载并将ijkplayer打包制作成freamwork,(不会的同学请移步http://www.cnblogs.com/wanghuaijun/p/5502216.html)<bf>并在Xcode下拖入Freamworks文件夹中<br>
#### 2.推流URL在项目Classes->Caputure->View->AZStratLiveVideo.m文件中,第209行代码,可自行修改stream url,用VLC播放器播放


