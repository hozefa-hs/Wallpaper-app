import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallpaper_app/controllers/home_data.dart';
import 'package:wallpaper_app/screens/set_wallpaper_screen.dart';

import '../models/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      builder: (context, child) => Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<WallpaperModel> imagesList = [];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    Future.delayed(
      const Duration(seconds: 4),
      () {
        getWallpapers();
      },
    );
  }

  getWallpapers() async {
    Wallpaper wallpaper = Wallpaper();
    await wallpaper.getWallpaper();
    imagesList = wallpaper.wallpaperImages;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FaIcon(FontAwesomeIcons.bars),
          ),
          title: Text(
            "Wallpaper",
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              margin: EdgeInsets.all(10),
              child: CircleAvatar(
                child: Icon(Icons.person),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
            ),
          ],
        ),
        body: imagesList.isNotEmpty
            ? Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        categoryTile(Colors.black, Colors.white, "Recent"),
                        categoryTile(
                            Color(0xFFDBDBDB), Colors.black, "Trending"),
                        categoryTile(
                            Color(0xFFDBDBDB), Colors.black, "Popular"),
                        categoryTile(Color(0xFFDBDBDB), Colors.black, "Nature"),
                        categoryTile(Color(0xFFDBDBDB), Colors.black, "Solid"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 50.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color(0xFFDBDBDB), width: 2),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        child: FaIcon(FontAwesomeIcons.magnifyingGlass),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: GridView.builder(
                        itemCount: imagesList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                          // crossAxisSpacing: 5,
                          // mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreen(
                                      imageurl: imagesList[index].large2x),
                                ),
                              );
                            },
                            child: gridTile(src: imagesList[index].tiny),
                          );
                        }),
                  ),
                ],
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Bringing the world's beauty to your screen, just a moment...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget categoryTile(Color containerColor, Color textColor, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40.h,
        width: 90.w,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 16.sp, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  Widget gridTile({required String src}) {
    return Container(
      height: 200.h,
      width: 160.w,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFFDBDBDB),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Image.network(
          src,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
