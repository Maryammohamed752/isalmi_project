import 'package:flutter/material.dart';
import 'package:project_islami/core/theme/app_colors.dart';

class RadioItem extends StatefulWidget {
  const RadioItem({super.key});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlay = true;

  bool isFavourite = false;

  bool isVolumeUp = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
                "Radio Ibrahim Al-Akdar",
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
                        isPlay = !isPlay;
                        setState(() {});
                      },
                      icon: isPlay
                          ? Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: AppColors.secondaryColor,
                            )
                          : Icon(
                              Icons.pause,
                              size: 30,
                              color: AppColors.secondaryColor,
                            )),
                  IconButton(
                    onPressed: () {
                      isVolumeUp = !isVolumeUp;
                      setState(() {});
                    },
                    icon: isVolumeUp
                        ? Icon(
                            Icons.volume_up,
                            size: 30,
                            color: AppColors.secondaryColor,
                          )
                        : Icon(
                            Icons.volume_off,
                            size: 30,
                            color: AppColors.secondaryColor,
                          ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
