# CMake学习文档

## 初试

### CMakeLists.txt简单构建

文件内容

```
PROJECT(HELLO)
SET(SRC_LIST main.c)
ADD_EXECUTABLE(hello SRC_LIST)
```