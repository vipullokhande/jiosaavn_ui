import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/colors.dart';
import 'package:jiosaavn_vip/widgets/pro_features_widget.dart';

class JioSaavnProScreen extends StatelessWidget {
  const JioSaavnProScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 45, 54),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              clipBehavior: Clip.antiAlias,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.all(14),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Current Pack',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'No active Pack',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                ProFeaturesWidget(
                                  feature: 'Ad-free Music',
                                ),
                                ProFeaturesWidget(
                                  feature: 'Unlimited Jiotunes',
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                ProFeaturesWidget(
                                  feature: 'Unlimited Downloads',
                                ),
                                ProFeaturesWidget(
                                  feature: '2X Better Sound Quality',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    color: Colors.grey.shade200,
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Do you want missing features?',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              fixedSize: const Size(100, double.maxFinite),
                              shape: const BeveledRectangleBorder(),
                              backgroundColor:
                                  const Color.fromARGB(255, 42, 197, 179),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Buy Pro  >',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
