---
title: Centos8 下 zookeeper 的安装(单机模式)
catalog: true
comments: true
date: 2022-02-10 13:50:00
subtitle: Vagrant+VirtualBox 下安装 zookeeper.
header-img: general_bg.jpg
tags:
    - Linux
    - Zookeeper
    - JDK
categories:
    - 技术
---

# 安装 zookeeper（单机模式）

## 准备

- Vagrant: 一个对虚拟环境管理的工具
- VirtualBox: Oracle 旗下的虚拟机软件
- Zookeeper: 一个分布式的，开放源码的分布式应用程序协调服务

## 步骤

### 安装 JDK

到 oracle 官网下载 JDK 安装包

```shell
$ cd /usr/local
$ mkdir java
$ cd java
$ tar -zxvf /home/vagrant/download/jdk-8u321-linux-x64.tar.gz
```

配置环境变量
```shell
$ vim /etc/profile
```

在 /etc/profile 文件下追加以下内容
```
export JAVA_HOME="/usr/local/java/jdk1.8.0_321"
export CLASSPATH="."
export PATH=$PATH:$JAVA_HOME/bin
```

```shell
$ source /etc/profile
$ java -version
java version "1.8.0_321"
Java(TM) SE Runtime Environment (build 1.8.0_321-b07)
Java HotSpot(TM) 64-Bit Server VM (build 25.321-b07, mixed mode)
```
### 安装 zookeeper

从 apache 网站下载 zookeeper (https://zookeeper.apache.org/releases.html)

```shell
$ cd /usr/local
$ mkdir zookeeper
$ cd zookeeper
$ tar -zxvf /home/vagrant/download/apache-zookeeper-3.7.0-bin.tar.gz
```

配置 zookeeper

```shell
$ cd /usr/local/zookeeper/apache-zookeeper-3.7.0-bin
$ mkdir data
$ cd conf
$ cp zoo_sample.cfg zoo.cfg
```

修改 zoo.cfg 中 dataDir 目录的值为

```code
dataDir=/usr/local/zookeeper/apache-zookeeper-3.7.0-bin/data
```

### 启动 zookeeper

```shell
$ cd /usr/local/zookeeper/apache-zookeeper-3.7.0-bin/bin
$ sh zkServer.sh start
ZooKeeper JMX enabled by default
Using config: /usr/local/zookeeper/apache-zookeeper-3.7.0-bin/bin/../conf/zoo.cfg
Starting zookeeper ... STARTED
```

### 停止 zookeeper 

```shell
$ cd /usr/local/zookeeper/apache-zookeeper-3.7.0-bin/bin
$ sh zkServer.sh stop
```



