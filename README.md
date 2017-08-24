# LPStretchableHeaderView
#### 两行代码实现tableView头部视图拉伸放大效果

![image](https://github.com/splsylp/LPStretchableHeaderView/blob/master/stretchableView.gif )

####[实现原理解析](http://www.jianshu.com/p/1b3788dfa4ea)


##### 使用
###### 1.初始化调用
```Swift
stretchableView = LPStretchableHeaderView(stretchableView: bgImageView)
```
###### 2.代理方法实现：
```Swift
func scrollViewDidScroll(_ scrollView: UIScrollView) {
    stretchableView.scrollViewDidScroll(scrollView)
}
```
---
### 您的star，是对我最大的鼓励与支持~