import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Regester_Screens/sign_up_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final giveRuppe = 0;
  final getRuppe = 0;

  // Short Cuts Name

  final shortCutName = [
    'Add Customer',
    'Add Supplier',
    'Add Item',
    'Add Category',
    'Add Stocks',
    'Add Sales',
    'Add Ladgor',
    'Add Due Customer',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: kBGColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: kPadding15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kSize15,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "₹ $giveRuppe",
                              style: const TextStyle(
                                fontSize: 18,
                                color: kGreenColor,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "You will give",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'NunitoSans',
                                color: kBlackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "₹ $getRuppe",
                              style: const TextStyle(
                                fontSize: 18,
                                color: kRedColor,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "You will get",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'NunitoSans',
                                color: kBlackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'View',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: kDarkBlueColor,
                                        fontFamily: 'NunitoSans',
                                      ),
                                    ),
                                    Text(
                                      'Report',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: kDarkBlueColor,
                                        fontFamily: 'NunitoSans',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: kDarkBlueColor,
                                  size: 22,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              kSize15,
              const Text(
                'Short Cuts',
                style: TextStyle(
                  fontSize: 22,
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'NunitoSans',
                ),
              ),
              kSize15,
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => navigateToScreen(context, index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: kPadding10,
                          child: Center(
                            child: Text(
                              shortCutName[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: kGreenColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'NunitoSans',
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void navigateToScreen(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ));
      break;
    case 1:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ));
      break;
    case 2:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ));
      break;
    case 3:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ));
      break;
    case 4:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ));
      break;
    case 5:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ));
      break;
    case 6:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ));
      break;
    case 7:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ));
      break;
    default:
      Navigator.pop(context);
  }
}
