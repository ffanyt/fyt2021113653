# Linux环境配置相关

## Linux双系统安装

- [Ubuntu的ISO文件下载](https://cn.ubuntu.com/download)

- 制作启动盘

    - 原先用win32diskimager制作，导致U盘写保护无法识别
        
        ```
        在cmd中里输入：DISKPART，按回车,会显示计算机名,及DISKPART>命令行
        然后输入：LIST DISK，回车，会列出电脑上所有硬盘和U盘
        输入：SELECT DISK x（对应U盘的名字编号）
        输入：CLEAN，回车删除整个磁盘数据
        输入：CREATE PARTITION PRIMARY，回车创建主磁盘分区
        输入：FORMAT FS=FAT32 QUICK，回车，以FAT32格式快速格式化磁盘分区
        ```
    - 使用rufus进行系统盘制作

- 华为电脑进入BIOS
  
    ```
    1.开机按F2，取消安全启动模式，保存后重启
    2.按F12就可以选择U盘启动
    ```

- Ubuntu系统的安装
  
    ```
    安装前注意磁盘格式，新电脑一般为GPT格式
    磁盘管理中，通过压缩卷，设置一块40G及以上大小的未分配空间
    安装Ubuntu时下载更新不要勾选，可能因网络问题安装比较慢
    在其他选项创建分区：
        总磁盘容量40G
        引导区500MB EFI系统分区
        内存交换分区10GB    交换空间
        /根挂载点20GB   Ext4 挂载点/
        /home挂载点10GB或以上   Ext4 挂载点/home
    用户名hitcrt 密码0
    ```

- 安装后一些配置

    - 由于默认启动菜单在Ubuntu选项，每次启动电脑需要立即选择Windows才能进入Windows系统，因此需要对启动菜单更改

        >sudo gedit /etc/default/grub

        进入文件后，将GRUB DEFAULT=0改为Windows启动的序号

## Ubuntu环境的配置

### 安装Git

>sudo apt install git

### 安装build-essential

>sudo apt-get update
>
>sudo apt install build-essential

### 安装cmake

1. 安装依赖

    >sudo apt-get install openssl libssl-dev

2. 解压cmake

    >cd xxx
    >
    >tar -zxvf xxxxx.tar.gz

3. 在解压后的文件夹中输入

    >sudo ./bootstrap && sudo make && sudo make install
    ```
    不知道为什么-j4的命令无法调用，无法使用多线程
    ```

4. 验证安装是否成功
    >cmake --version

### 安装opencv


Install minimal prerequisites (Ubuntu 18.04 as reference)

>sudo apt update && sudo apt install -y cmake g++ wget unzip

Download and unpack sources

>wget -O opencv.zip https://github.com/opencv/opencv/archive/4.x.zip
>
>unzip opencv.zip

Create build directory

>mkdir -p build && cd build

Configure

>cmake  ../opencv-4.x

Build

>cmake --build .

Install

>sudo make install

```
Warning
The installation process only copies files to predefined locations and does minor patching. Installing using this method does not integrate opencv into the system package registry and thus, for example, opencv can not be uninstalled automatically. We do not recommend system-wide installation to regular users due to possible conflicts with system packages.
By default OpenCV will be installed to the /usr/local directory, all files will be copied to following locations:

/usr/local/bin - executable files
/usr/local/lib - libraries (.so)
/usr/local/cmake/opencv4 - cmake package
/usr/local/include/opencv4 - headers
/usr/local/share/opencv4 - other files (e.g. trained cascades in XML format)
```

### Clash使用

"https://zhuanlan.zhihu.com/p/430035973"












