import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:Coruja_billiard/app/data/widget/onBoardingSlider.dart';
import 'package:Coruja_billiard/app/modules/preventHome/views/prevent_home_view.dart';
import 'package:Coruja_billiard/app/routes/app_pages.dart';
import 'package:Coruja_billiard/app/modules/cart/controllers/cart_controller.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int _currentPage = 0;
  PageController _controller = PageController();

  // list page

  List<Widget> _pages = [
    onBoardingSider(
        title: "HI, There",
        description:
            "Isi Harimu denga hal-hal menyenangkan, biar kamu nambah cakeup .",
        image: "assets/on_boarding/3.svg"),
    onBoardingSider(
        title: "Booking Billiard ?",
        description: "Kini saatnya anda menjelajahi hobi mu kawan.",
        image: "assets/on_boarding/1.svg"),
    onBoardingSider(
        title: "Masih Bingung ?",
        description:
            "Yuk Lanjut jelajah dan reservasikan waktu luangmu di billiard kami !",
        image: "assets/on_boarding/2.svg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Color.fromARGB(255, 210, 241, 51)
                                : Color.fromARGB(255, 210, 241, 51)
                                    .withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  height: 30,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 210, 241, 51),
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? GestureDetector(
                          onTap: () {
                            Get.offAllNamed((Routes.PREVENT_HOME));
                          },
                          child: Text(
                            "Jelajahi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
