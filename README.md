# Socket.io_CPP
Socket.io for cpp

## 说明

该项目世纪城Socket.io官方库[socket.io-client-cpp](https://github.com/socketio/socket.io-client-cpp) 的一个C++的实现。主要用于总结我的OC项目中集成socket.io-client-cpp的步骤，以及遇到的问题。

## XCode版本

使用XCode7.3 。 一定要注意配置该版本的XCode支持http请求。

## 集成步骤

* 首先创建Podfile，然后在该文件中输入以下内容：

```
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.3'

target 'SocketIOCpp_Demo' do
       pod 'SocketIO-Client-CPP'
end

```

* 在你使用socket.io的地方导入头文件

```
#include <SocketIO-Client-CPP/sio_client.h>
```

## 具体代码

```
 void SocketIOOperation::onopen()
{
    printf("connect succ\n");
    std::string s("zhangqi-ios");
    sclient.socket()->emit("login", s);
    
}


int SocketIOOperation::beginConnection(const char *url)
{
    sclient.set_open_listener(std::bind(&SocketIOOperation::onopen, this));
    sclient.socket()->on("login", sio::socket::event_listener_aux([&](string const&name,
                                                                      message::ptr const& data,bool isAck,message::list &ack_resp)
                                                                  {
                                                                      bool res = data->get_map()["success"]->get_bool();
                                                                      
                                                                      printf("socket.io---debug----login result:%d",res);
                                                                  }));
    // bind other event
    
    
    // begin connect
    sclient.connect("http://10.12.23.232:9000");
    
    return 0;
}

```

## MaxwellQi

[More about me...](https://maxwellqi.github.io/about-me/)