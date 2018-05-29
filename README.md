# iOS-Animation



> 本文所有示例代码都是Swift4，参看文末链接

Core Animation是IOS和OS X平台上负责图形渲染与动画的基础框架。Core Animation可以作用与动画视图或者其他可视元素，为你完成了动画所需的大部分绘画工作。你只需要配置少量的动画参数（如开始点的位置和结束点的位置）即可使用Core Animation的动画效果。Core Animation将大部分实际的绘图任务交给了图形硬件来处理，图形硬件会加速图形渲染的速度。这种自动化的图形加速技术让动画拥有更高的帧率并且显示效果更加平滑，不会加重CPU的负担而影响程序的运行速度。

![Core Animation常用类继承关系](https://upload-images.jianshu.io/upload_images/1678135-16f8312b54e20cc1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

上图少了iOS9才引入的`CASpringAnimation`, 它继承至`CABasicAnimation`
### 一、常用属性 
这些属性一般是在基类`CAAnimation`和协议`CAMediaTiming`中，是几种动画类共用的属性。
- duration : 动画的持续时间 
- beginTime : 动画的开始时间 
- repeatCount : 动画的重复次数 
- autoreverses :动画结束时是否执行逆动画
- timingFunction : 控制动画的显示节奏系统提供五种值选择，分别是：

    1. kCAMediaTimingFunctionLinear 线性动画
    2. kCAMediaTimingFunctionEaseIn 先慢后快（慢进快出）
    3. kCAMediaTimingFunctionEaseOut 先块后慢（快进慢出）
    4. kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
    5. kCAMediaTimingFunctionDefault 默认，也属于中间比较快

- delegate ： 动画代理。能够检测动画的执行和结束，在动画执行和结束做一些处理。
```
public protocol CAAnimationDelegate : NSObjectProtocol {    
    @available(iOS 2.0, *)
    optional public func animationDidStart(_ anim: CAAnimation)

    @available(iOS 2.0, *)
    optional public func animationDidStop(_ anim: CAAnimation, finished flag: Bool)
}
```

- fillMode  动画在开始和结束时的动作。
  1. kCAFillModeRemoved  这个是**默认值**，也就是说当动画开始前和动画结束后，动画对layer都没有影响，动画结束后，layer会恢复到之前的状态
  2. kCAFillModeForwards 当动画结束后，layer会一直保持着动画最后的状态
  3. kCAFillModeBackwards  在动画开始前，只需要将动画加入了一个layer，layer便立即进入动画的初始状态并等待动画开始。
  4. kCAFillModeBoth 这个其实就是上面两个的合成.动画加入后开始之前，layer便处于动画初始状态，动画结束后layer保持动画最后的状态

### 二、基础动画（CABasicAnimation）
基础动画就是从一个状态值（fromValue）变换成另一个状态值（toValue），特有的属性：
- fromValue 所改变属性的起始值
- toValue   所改变属性的结束时的值
- byValue   所改变属性相同起始值的改变量
下面的代码是一个简单位置移动动画：
```
        let moveView = UIView(frame:  CGRect(x: 20, y: 240, width: 70, height: 70))
        moveView.center = CGPoint(x: 40, y: 200)
        moveView.backgroundColor = UIColor.red
        view.addSubview(moveView)
        
        let moveAnim = CABasicAnimation(keyPath: "position")
        moveAnim.fromValue = NSValue(cgPoint: CGPoint(x: 40, y: 240))
        moveAnim.toValue = NSValue(cgPoint: CGPoint(x: 300, y: 240))
        moveAnim.duration = 2
        moveAnim.repeatCount = Float.infinity
        moveAnim.autoreverses = true

        moveView.layer.add(moveAnim, forKey: "moveAnim")
```
![位移动画](https://upload-images.jianshu.io/upload_images/2240549-67c1815e1f3ae4d1.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/280)
另外`CABasicAnimation`还可以做旋转、比例缩放、背景颜色变化、内容（图片）变化、透明度变化、圆角变化、指定大小变化等动画。（这些我都写了一些示例代码，链接在文末）
这些动画的代码形式基本都差不多，先建立视图，然后创建`CABasicAnimation`类型动画对象，并指定不同的`fromValue`、`toValue`等属性，最后把动画对象加入到视图的`CALayer`层。

![基础动画](https://upload-images.jianshu.io/upload_images/1678135-07f4789a6a54406d.gif?imageMogr2/auto-orient/strip)


### 三、关键帧动画（CAKeyframeAnimation）

按照指定的一串值进行动画,好像拍电影一样的一帧一帧的效果。

- values： 动画对象会在指定的时间(duration)内，依次显示values数组中的每一个关键帧
-  path ： 可以设置一个CGPathRef\CGMutablePathRef,让层跟着路径移动。path只对CALayer的anchorPoint和position起作用。**设置了path，那么values将被忽略。**
-  keyTimes ： 可以为对应的关键帧指定对应的时间点,其取值范围为0到1.0,keyTimes中的每一个时间值都对应values中的每一帧。当keyTimes没有设置的时候,各个关键帧的时间是平分的。
- rotationMode : 旋转样式

>  CABasicAnimation可看做是最多只有2个关键帧（开始和结束）的CAKeyframeAnimation

下面的代码通过`values`做成抖动的动画：
```
        let anima = CAKeyframeAnimation(keyPath: "transform.rotation")
        anima.values = [-Double.pi/180*4,Double.pi/180*4, -Double.pi/180*4]
        anima.repeatCount = Float.infinity
        animView.layer.add(anima, forKey: "shake")
```
使用`path`配合贝塞尔曲线就可以做成如下效果：
![](https://upload-images.jianshu.io/upload_images/1678135-02b4ecb39d19c595.gif?imageMogr2/auto-orient/strip)

代码
```
        let tempView = UIView(frame: CGRect(x: 50, y: 100, width: 250, height: 500))
        let bezierPath = UIBezierPath(ovalIn: tempView.frame)
        let orbitAnim = CAKeyframeAnimation(keyPath: "position")
        orbitAnim.duration = 5
        orbitAnim.path = bezierPath.cgPath
        orbitAnim.calculationMode = kCAAnimationPaced
        orbitAnim.fillMode = kCAFillModeForwards
        orbitAnim.repeatCount = Float.infinity
        orbitAnim.rotationMode = kCAAnimationRotateAutoReverse
        animView.layer.add(orbitAnim, forKey: "orbitAnim")
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.purple.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.path = bezierPath.cgPath
        view.layer.addSublayer(shapeLayer)
```



### 四、组动画（CAAnimationGroup）

组动画顾名思义就是把不同的动画组合起来，比如下面的代码：
```
        // 位移
        let anima1 = CABasicAnimation(keyPath: "position")
        anima1.fromValue = NSValue(cgPoint: CGPoint(x: 40, y: 240))
        anima1.toValue = NSValue(cgPoint: CGPoint(x: 300, y: 240))
        // 缩放
        let anima2 = CABasicAnimation(keyPath: "transform.scale")
        anima2.fromValue = NSNumber.init(value: 0.8)
        anima2.toValue = NSNumber.init(value: 2.0)
        // 旋转
        let anima3 = CABasicAnimation(keyPath: "transform.rotation")
        anima3.toValue = Double.pi*4
        // 组合
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [anima1, anima2, anima3]
        groupAnimation.duration = 3.0
        
        animView.layer.add(groupAnimation, forKey: nil)
```
组合后的动画效果就是在移动的同时，也在缩放和旋转。

### 五、过渡动画（CATransition）

CATransition用于做过渡动画或者转场动画，能够为层提供移出屏幕和移入屏幕的动画效果。
- type：动画过渡类型
四个系统公开的

|系统公开API|   效果说明|        是否支持方向
-----------|---------|----------
|kCATransitionFade| 淡出效果|   是
|kCATransitionMoveIn |  新视图移动到旧视图上| 是
|kCATransitionPush |    新视图推出旧视图|   是
|kCATransitionReveal|   移开旧视图显示新视图| 是

其他还有一些非系统公开的过渡类型：
```
["cube", "suckEffect", "rippleEffect", "pageCurl", "pageUnCurl", "oglFlip"]

```
- subtype : 过渡动画的动画方向
```
kCATransitionFromRight 从右侧进入
kCATransitionFromLeft 从左侧进入
kCATransitionFromTop 从顶部进入
kCATransitionFromBottom 从底部进入
```
- startProgress：动画起点(在整体动画的百分比) 
- endProgress：动画终点(在整体动画的百分比)

![过渡动画](https://upload-images.jianshu.io/upload_images/1678135-aa32bdb7b39c23be.gif?imageMogr2/auto-orient/strip)



### 六、弹簧动画 CASpringAnimation
常用属性
- mass： 模拟的是质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大 默认值：1 ;
- stiffness：刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快。默认值： 100 ；
- damping：阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快。默认值：10；
- initialVelocity：初始速率，动画视图的初始速度大小。默认值：0 ；
速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反；
- settlingDuration：估算时间 返回弹簧动画到停止时的估算时间，根据当前的动画参数估算；
实例：
```
        // 不同的keypath，不同的效果
        let springAnimation = CASpringAnimation(keyPath: "position.y")
        
        if springAnimation.keyPath == "position" {
            springAnimation.fromValue = NSValue.init(cgPoint: self.jellyView.layer.position)
            springAnimation.toValue = NSValue.init(cgPoint: point)
        } else if springAnimation.keyPath == "position.x" {
            springAnimation.fromValue = self.jellyView.layer.position.x
            springAnimation.toValue = point.x
        } else if springAnimation.keyPath == "position.y" {
            springAnimation.fromValue = self.jellyView.layer.position.y
            springAnimation.toValue = point.y
        } else if springAnimation.keyPath == "bounds" {
            springAnimation.fromValue = NSValue.init(cgRect: CGRect(x: point.x, y: point.y, width: 60, height: 60))
            springAnimation.toValue = NSValue.init(cgRect: self.jellyView.frame)
        }
        
        springAnimation.mass = 5
        
        springAnimation.stiffness = 100
        
        springAnimation.damping = 10
        
        springAnimation.initialVelocity = 10
        springAnimation.duration = springAnimation.settlingDuration
        
        springAnimation.isRemovedOnCompletion = false
        
        self.jellyView.layer.add(springAnimation, forKey: "springAnimation")
```
keyPath不同时效果不同：
![keyPath为bounds](https://upload-images.jianshu.io/upload_images/1866197-0c79cf0d8f4e1301.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/381)
![keyPath为position](https://upload-images.jianshu.io/upload_images/1866197-06eec110bc34e64e.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/381)
![keyPath为position.y](https://upload-images.jianshu.io/upload_images/1866197-92ff78ba4db756bc.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/381)



> 代码：本文所有的示例代码都在[https://github.com/andyRon/iOS-Animation](https://github.com/andyRon/iOS-Animation)

> 参考：
[IOSAnimationDemo](https://github.com/yixiangboy/IOSAnimationDemo)
[iOS动画详解(学习动画看这一篇就够了)](https://www.jianshu.com/p/9b3a3b4006ef)
[一篇文章搞定 CASpringAnimation 弹簧动画](https://www.jianshu.com/p/a91104b28b54)
[Core Animation 官方手册](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/Introduction/Introduction.html)



