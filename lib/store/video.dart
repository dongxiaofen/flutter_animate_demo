import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoStore {
  OverlayEntry _overlayEntry;
  OverlayEntry get overlayEntry => _overlayEntry;
  BuildContext _context;
  BuildContext get context => _context;

  bool _count = false;
  bool get count => _count;

  String _url = 'https://video-cdn.naoxuejia.com/1cd874638fd5f82d0d15aa44de55d8ee.mov.video.m3u8?pm3u8/1143200&e=3700715446&token=6HXdYoPQFVMGnhmW45qWU3OvndEZz0h5aJF_y1qy:OXmuad6Cul3DZEraP-ble4HSWNY=';
  String get url => _url;

  VideoPlayerController _controller;
  VideoPlayerController get controller => _controller;

  void initVideo() {
    _controller = VideoPlayerController.network(_url);
    print('this is init');
    _controller.addListener(videoReportListener);
  }
  void videoReportListener() {
    final isPlaying = _controller.value.isPlaying;
    int position = _controller.value.position.inSeconds;
    print('---------isPlaying $isPlaying');
    print('---------position $position');
  }

  void addOverlay({OverlayEntry child}) {
    _overlayEntry = child;
  }

  void removeOverlayEntry() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
    }
    _overlayEntry = null;
  }
  void removeVideoController() async{
    await _controller?.pause();
    _controller.removeListener(videoReportListener);
    await _controller?.dispose();
    _controller = null;
  }

}