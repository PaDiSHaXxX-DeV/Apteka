import 'package:apteka/page_w.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Page_2())));
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          decoration:const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/aju1.png"),fit: BoxFit.cover),
              gradient: LinearGradient(colors: [Color(0xFF2D9CDB),Color(0xFF4157FF)])),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/ortada.png",scale:0.8,)),
            ],
          ),
        ),
      ),
    );
  }
}
