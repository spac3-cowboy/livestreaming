import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

class MyWidget extends StatefulWidget {
  const MyWidget(
      {Key? key,
      required this.liveID,
      this.isHost = false,
      required this.userID,
      required this.userName})
      : super(key: key);

  final String liveID;
  final bool isHost;
  final String userID;
  final String userName;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID: Constants.appId,
        appSign: Constants.appSign,
        userID: widget.userID,
        userName: widget.userName,
        roomID: widget.liveID,
        config: widget.isHost
            ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
            : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience(),
      ),
    );
  }
}
