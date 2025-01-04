import 'package:flutter/material.dart';
import '../widgets/Huorly_cart.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Size screensize;

  @override
  Widget build(BuildContext context) {
    screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              width: screensize.width,
              height: screensize.height / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff9BC6FD), Color(0xff5099FC)])),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'tommarow',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          '7-sunny',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/sun_icon.jpg',
                        height: 100,
                      ),
                      Column(children: [
                        Text(
                          '20',
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        Text(
                          'sunny',
                          style: TextStyle(color: Colors.white60, fontSize: 24),
                        ),
                      ]),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 35),
                              text: '17',
                              children: [
                            TextSpan(
                                text: '  °C',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 30))
                          ]))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      cardWidget(
                        image: 'assets/wind_icon.jpg',
                      ),
                      cardWidget(
                        image: 'assets/drop_icon.jpg',
                      ),
                      cardWidget(
                        image: 'assets/rain_icon.png',
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(margin: EdgeInsets.all(8),alignment: Alignment.centerLeft,child: Text('Huorly',style: TextStyle(color: Colors.black87,fontSize: 25,fontWeight: FontWeight.bold),)),
            Container(
              width: double.infinity,
              height: screensize.height / 5,
              child:ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: 10,
  itemBuilder: (BuildContext context, int index) {
    return Center(child: Huorly_Cart(screensize: screensize));
  },
)
            )
            ,Expanded(child: ListView.separated(itemCount: 6,itemBuilder: (context , index ){return ListTile(title: Text('Sunday'),leading:Image.asset("assets/weathers.webp") );}, separatorBuilder: (context , index){return Divider();}))
          ],
        ),
      ),
    );
  }
}

class cardWidget extends StatelessWidget {
  const cardWidget({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              image,
              height: 45,
            )),
        Text(
          '17 °C',
          style: TextStyle(color: Colors.white70, fontSize: 20),
        ),
      ],
    );
  }
}





  // Text('17 °C',style: TextStyle(color: Colors.white70,fontSize: 20),),