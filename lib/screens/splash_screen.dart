import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpaper_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      builder: (context, child) => Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Splash_Image.png',
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: 70.r,
                      blurRadius: 100.r)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Explore 4k",
                      style: TextStyle(
                          fontSize: 30.sp, fontWeight: FontWeight.bold)),
                  Text("Wallpapers",
                      style: TextStyle(
                          fontSize: 30.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  Text(
                    "Explore, Create, Share",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF868181)),
                  ),
                  Text(
                    "Ultra 4k Wallpapers Now!",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF868181)),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
                    child: Container(
                      height: 50.h,
                      width: 237.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                          child: Text("Explore Now",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.sp))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
