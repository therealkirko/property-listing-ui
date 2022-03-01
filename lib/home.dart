import 'package:flutter/material.dart';
import 'package:listing/listing_model.dart';
import 'package:listing/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> category = [
    'Houses',
    'Apartments',
    'Villas',
    'Offices',
    'Shops',
    'Warehouses',
    'Land'
  ];

  List<ListingModel> listing = [
    ListingModel(1, 'Bluish homes',  'images/1.jpg', '27th Street symemarang', 1500.00, 3, 3, 500),
    ListingModel(2, 'Blossom blue homes', 'images/2.jpg', '27th Wallstreet', 1800.00, 4, 3, 700),
    ListingModel(3, 'Royal Homes', 'images/3.jpg', '27th Wallstreet, Aberdeus', 2200.00, 5, 4, 1200),
  ];

  List<ListingModel> near = [
    ListingModel(1, 'Bluish homes',  'images/4.jpg', '27th Street symemarang', 1500.00, 3, 3, 500),
    ListingModel(2, 'Blossom blue homes', 'images/3.jpg', '27th Wallstreet', 3000.00, 5, 4, 1200),
  ];

  var selectedIndex = 0;

  tooggleIndex(value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.settings
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Location'
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Symmetang',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      image: const DecorationImage(
                        image: AssetImage('images/profile.png'),
                        fit: BoxFit.cover,
                      )
                    ),
                  )
                ]
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search Category, or near you',
                    suffixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                  )
                ),
              )
            ),
            SizedBox(
              height: size.height * .07,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: category.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => tooggleIndex(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: (selectedIndex == index) ? textColor : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          category[index],
                          style: TextStyle(
                            color: (selectedIndex == index) ? Colors.white : textColor,
                          ),
                        ),
                      )
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * .35,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: listing.length,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: size.height,
                    width: size.width * .5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(listing[index].image),
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listing[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  listing[index].address
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.pink.withOpacity(.2),
                                      radius: 12,
                                      child: const Icon(
                                        Icons.bed_outlined,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      ' ${listing[index].bedrooms}'
                                    ),
                                    const SizedBox(width: 4),
                                    CircleAvatar(
                                      backgroundColor: Colors.pink.withOpacity(.2),
                                      radius: 12,
                                      child: const Icon(
                                        Icons.bathtub_outlined,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      ' ${listing[index].bathrooms}'
                                    ),
                                    const SizedBox(width: 4),
                                    CircleAvatar(
                                      backgroundColor: Colors.pink.withOpacity(.2),
                                      radius: 12,
                                      child: const Icon(
                                        Icons.train_outlined,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      ' ${listing[index].size} mm'
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ),
                      ],
                    ),
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Near You',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * .3,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                itemCount: near.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: size.height * .13,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: size.height,
                          width: size.width * .28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(near[index].image),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                near[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                near[index].address
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${near[index].size} km'
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '\$ ${near[index].price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      )
    );
  }
}