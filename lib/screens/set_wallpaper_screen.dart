import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wallpaper_app/screens/home_screen.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({super.key, required this.imageurl});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            widget.imageurl,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                setWallpaperBottomSheet();
              },
              child: Container(
                height: 50.h,
                width: 237.w,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  bottom: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Text(
                  "Set Wallpaper",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> setLockWallpaper() async {
    var location = WallpaperManager.LOCK_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    var result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  Future<void> setHomeWallpaper() async {
    var location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    var result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  Future<void> setBothWallpaper() async {
    var location = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    var result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  setWallpaperBottomSheet() {
    showModalBottomSheet(
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setHomeWallpaper();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  child: Text(
                    'Home Screen',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setLockWallpaper();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  child: Text(
                    'Lock Screen',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setBothWallpaper();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  child: Text(
                    'Both Screen',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 70, right: 70, top: 20, bottom: 40),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
