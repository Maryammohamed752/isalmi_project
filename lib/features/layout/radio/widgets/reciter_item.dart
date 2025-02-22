import 'package:flutter/material.dart';
import 'package:project_islami/core/theme/app_colors.dart';
import 'package:project_islami/models/radio_response_model.dart';
import 'package:project_islami/models/reciters_response_model.dart';
import 'package:project_islami/provider/radio_manager_provider.dart';
import 'package:provider/provider.dart';

class ReciterItem extends StatefulWidget {
  ReciterItem({super.key, required this.model});

  final Reciters model;

  @override
  State<ReciterItem> createState() => _ReciterItemState();
}

String? url;

class _ReciterItemState extends State<ReciterItem> {
  @override
  void initState() {
    getUrl();
    // TODO: implement initState
    super.initState();
  }

  void getUrl() {
    url = "${widget.model.moshaf![0].server}112.mp3";
  }

  bool isPlay = true;

  bool isFavourite = false;

  bool isMuted = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer<RadioManagerProvider>(
      builder: (context, RadioManagerProvider provider, child) {
        return Container(
          height: height * 0.13,
          margin: const EdgeInsets.symmetric(vertical: 7),
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16)),
          child: Stack(
            children: [
              isPlay
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset("assets/images/mosque_item.png"),
                    )
                  : Positioned(
                      bottom: -25,
                      left: -25,
                      right: -26,
                      child: Image.asset("assets/images/sounditem.png"),
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.model.name!,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          isFavourite = !isFavourite;
                          setState(() {});
                        },
                        icon: isFavourite
                            ? Icon(
                                Icons.favorite,
                                size: 30,
                                color: AppColors.secondaryColor,
                              )
                            : Icon(
                                Icons.favorite_border,
                                size: 30,
                                color: AppColors.secondaryColor,
                              ),
                      ),
                      IconButton(
                          onPressed: () {
                            provider.play(url!);
                            //// isPlay = !isPlay;
                            //setState(() {});
                          },
                          icon:
                              //isPlay
                              //?
                              Icon(
                            provider.currentPlayingUrl == url! &&
                                    provider.isPlaying!
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 30,
                            color: AppColors.secondaryColor,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            if (provider.currentPlayingUrl == url!) {
                              provider.stop();
                            }
                          },
                          icon: //isVolumeUp
                              //?
                              Icon(
                            Icons.stop,
                            size: 30,
                            color: AppColors.secondaryColor,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            isMuted = !isMuted;
                            setState(() {});
                            provider.setVolume(isMuted ? 2.0 : 0.0);
                          },
                          icon: Icon(
                            isMuted ? Icons.volume_up : Icons.volume_off,
                            size: 30,
                            color: Colors.black,
                          ))
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
