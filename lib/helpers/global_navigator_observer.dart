import 'package:flutter/material.dart';


class GlobalNavigatorbserver extends NavigatorObserver {
  GlobalNavigatorbserver(Function analytics) {
    _analytics = analytics;
  }
  static Function _analytics;
  // 路由变更前的路由
  static Route beforeChangedRoute;
  // 路由变更后的路由
  static Route currentRoute;
  // 路由变更时间
  static int routeChangeTime = 0;
  //进入页面
  static String pageIn = 'PAGE_IN';
  //退出页面
  static String pageOut = 'PAGE_OUT';
  //从下一个页面返回回来
  static String pageBack = 'PAGE_BACK';
  //当前页面重新可见
  static String appIn = 'APP_IN';
  //当前页面不可见
  static String appOut = 'APP_OUT';

  // 添加导航监听后，跳转的时候需要使用Navigator.push路由
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);

    currentRoute = route;
    beforeChangedRoute = previousRoute;
    final distance = getStayTime();
    if (currentRoute != null) {
      handleRecordData(pageIn, currentRoute.settings.name, 0);
    }
    if (previousRoute != null) {
      handleRecordData(pageOut, beforeChangedRoute.settings.name, distance);
    }
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    currentRoute = newRoute;
    beforeChangedRoute = oldRoute;
    final distance = getStayTime();
    if (newRoute != null) {
      handleRecordData(pageIn, newRoute.settings.name, 0);
    }
    if (oldRoute != null) {
      handleRecordData(pageOut, oldRoute.settings.name, distance);
    }
  }

  @override
  void didPop(Route route, Route previousRoute) {
    // route返回上一页时当前页路由，previousRoute返回页路由
    // eg由B页面返回A页面，route是B页面路由，previousRoute是A页面路由
    super.didPop(route, previousRoute);

    currentRoute = previousRoute;
    beforeChangedRoute = route;
    final distance = getStayTime();
    if (currentRoute != null) {
      handleRecordData(pageBack, currentRoute.settings.name, 0);
    }
    if (beforeChangedRoute != null) {
      handleRecordData(pageOut, beforeChangedRoute.settings.name, distance);
    }
  }

  // APP退出到后台 用户当前看不到应用程序
  static onAppLifecyclePaused() {
    final distance = getStayTime();
    handleRecordData(appOut, currentRoute.settings.name, 0);
    handleRecordData(pageOut, currentRoute.settings.name, distance);
  }

  // APP切换到前端 应用程序可见并响应
  static onAppLifecycleResumed() {
    routeChangeTime = DateTime.now().millisecondsSinceEpoch;
    handleRecordData(appIn, currentRoute.settings.name, 0);
    handleRecordData(pageIn, currentRoute.settings.name, 0);
  }

  static int getStayTime() {
    var now = DateTime.now().millisecondsSinceEpoch;
    var distance = 0;
    if (routeChangeTime > 0) {
      distance = now - routeChangeTime;
    }
    routeChangeTime = now;
    return distance;
  }

  static handleRecordData(String eventType, String eventPage, int stayTime) {
    _analytics?.call(eventType, eventPage, stayTime);
  }
}