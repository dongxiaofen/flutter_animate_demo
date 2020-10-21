// import 'package:flutter/material.dart';
// import 'package:flutter_canvas/store/video.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';

// class VideoFloat extends StatefulWidget {
//   // VideoFloat({Key key}) : super(key: key);
//   @override
//   _VideoFloatState createState() => _VideoFloatState();
// }

// class _VideoFloatState extends State<VideoFloat> {
//   @override
//   void initState() {
//     super.initState();
//     initVideo();
//     final videoStore = Provider.of<VideoStore>(
//       context,
//       listen: false,
//     );
//     videoStore.removeOverlayEntry();
//   }

//   void initVideo() async {
//     final videoStore = Provider.of<VideoStore>(
//       context,
//       listen: false,
//     );
//     if (videoStore.controller?.value?.initialized ?? false) {
//       // todo
//       await videoStore.controller.pause();
//       print('pause ----=');
//     } else {
//       videoStore.initVideo();
//       await videoStore.controller.initialize().then((_) async {
//         setState(() {});
//         print('this is initialize then ');
//         // await videoStore.controller.play();
//         // await _controller.seekTo(Duration(seconds: currentPosition));
//       });
//       // videoStore.controller.addListener(videoReportListener);
//     }
//   }

//   void showOverlay(BuildContext context) async {
//     final videoStore = Provider.of<VideoStore>(
//       context,
//       listen: false,
//     );
//     // final _overlayEntry = videoStore.overlayEntry;
//     OverlayState overlayState = Overlay.of(context);
//     if (videoStore.overlayEntry == null) {
//       videoStore.addOverlay(
//         child: OverlayEntry(
//           builder: (BuildContext context) => Positioned(
//             bottom: MediaQuery.of(context).padding.bottom + 40.0,
//             right: 20.0,
//             child: Material(
//               color: Colors.blue,
//               child: Container(
//                 child: Row(
//                   children: <Widget>[
//                     FlutterLogo(size: 60,),
//                     IconButton(
//                       onPressed: () {
//                         final videoStore = Provider.of<VideoStore>(
//                           context,
//                           listen: false,
//                         );
//                         videoStore.controller?.pause();
//                       },
//                       icon: Icon(Icons.pause),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         videoStore.controller.pause();
//                         videoStore.removeVideoController();
//                         videoStore.removeOverlayEntry();
//                       },
//                       icon: Icon(Icons.cancel),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )),
//       );

//       overlayState.insert(videoStore.overlayEntry);
//     } else {
//       videoStore.overlayEntry.markNeedsBuild();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final videoStore = Provider.of<VideoStore>(
//       context,
//       listen: false,
//     );
//     print('${videoStore.controller == null} -------');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('test'),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//             if (videoStore.controller?.value?.isPlaying ?? false) {
//               showOverlay(context);
//             } else {
//               videoStore.removeVideoController();
//             }
//           },
//           icon: Icon(Icons.cancel),
//         ),
//       ),
//       // body: Text(videoStore.url),
//       body: Container(
//         child: (videoStore.controller?.value?.initialized ?? false)
//             ? Column(
//                 children: <Widget>[
//                   AspectRatio(
//                     aspectRatio: 16 / 9,
//                     child: Container(
//                       color: Colors.grey,
//                       child: Center(child: VideoPlayer(videoStore.controller)),
//                     ),
//                   ),
//                   FlatButton(
//                     onPressed: () {
//                       if (videoStore.controller?.value?.isPlaying ?? false) {
//                         videoStore.controller.pause();
//                       } else {
//                         videoStore.controller.play();
//                       }
//                     },
//                     color: Colors.blue,
//                     child: Text(
//                         (videoStore.controller?.value?.isPlaying ?? false)
//                             ? '暂停'
//                             : '播放'),
//                   ),
//                 ],
//               )
//             : Text('loading'),
//       ),
//     );
//   }
// }
