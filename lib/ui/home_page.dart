import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/common/contants.dart';
import 'package:flutter_ahlul_quran_app/login.dart';
import 'package:flutter_ahlul_quran_app/ui/profile_page.dart';
import 'package:flutter_ahlul_quran_app/ui/surat_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_ahlul_quran_app/ui/motivation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ahlul Quran',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.sp,
            vertical: 16.sp,
          ),
          child: Column(
            children: [
              // Card Motivasi
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MotivationPage()));
                },
                child: Container(
                  width: size.width - 24.w - 24.w,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.sp,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 45.sp),
                                    child: SvgPicture.asset(
                                      'assets/petik.svg',
                                      fit: BoxFit.fitHeight,
                                      color: AppColors.white,
                                      height: 45.h,
                                      width: 40.w,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20.sp),
                                    child: Text(
                                      'Motivasi',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                top: -4.sp,
                                left: 215.sp,
                                child: SizedBox(
                                  width: 160.w,
                                  height: 160.h,
                                  child: SvgPicture.asset(
                                      'assets/ornament.svg'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Al-Quran Card
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SuratPage();
                  }));
                },
                child: Container(
                  width: size.width - 24.w - 24.w,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.sp,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 24.sp),
                                    child: SvgPicture.asset(
                                      'assets/book.svg',
                                      fit: BoxFit.fitHeight,
                                      color: AppColors.white,
                                      height: 72.h,
                                      width: 64.w,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 24.sp),
                                    child: Text(
                                      'Al Quran',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                top: -8.sp,
                                left: 215.sp,
                                child: SizedBox(
                                  width: 160.w,
                                  height: 160.h,
                                  child: SvgPicture.asset(
                                      'assets/ornament.svg'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Profile Card
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MembersListScreen()));
                },
                child: Stack(
                  children: [
                    Container(
                      width: size.width - 24.w - 24.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(24.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.sp, left: 0.sp),
                              child: SvgPicture.asset(
                                'assets/brain.svg',
                                fit: BoxFit.fitHeight,
                                color: AppColors.white,
                                height: 60.h,
                                width: 50.w,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.sp),
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -4.sp,
                      left: 235.sp,
                      child: SizedBox(
                        width: 160.w,
                        height: 160.h,
                        child: SvgPicture.asset('assets/ornament.svg'),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 28.h),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF0D47A1),
        onPressed: () {
          _logout(context);
        },
        child: Icon(Icons.logout_outlined),
      ),
    );
  }

  _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
    );
  }
}
