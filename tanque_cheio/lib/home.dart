import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';
import 'main.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

void _navigateToRegister(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => RegisterPage()),
  );
}

void _main(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyApp()),
  );
}

class _SliderScreenState extends State<SliderScreen> {
  List imageList = [
    {"id": 1, "image_path": 'assets/imgs/primeiro-home.png'},
    {"id": 2, "image_path": 'assets/imgs/segundo-home.png'},
    {"id": 3, "image_path": 'assets/imgs/terceiro-home.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                          bottom: Radius.circular(30),
                        ),
                        child: Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  height: 600,
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 45 : 11,
                      height: 11.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.white
                              : Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20.0), // Adicione margens internas aqui
            child: ElevatedButton(
              onPressed: () {
                _navigateToRegister(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0),
                shadowColor: Colors.grey[400],
                elevation: 5.0,
              ),
              child: Text(
                'Entrar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20.0), // Adicione margens internas aqui
            child: ElevatedButton(
              onPressed: () {
                _navigateToRegister(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFC700),
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0),
                shadowColor: Colors.grey[400],
                elevation: 5.0,
              ),
              child: Text(
                'Cadastre-se',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
