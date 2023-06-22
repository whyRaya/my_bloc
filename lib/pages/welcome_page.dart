import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/widgets/raya_text.dart';

import '../cubit/app_cubit.dart';
import '../widgets/raya_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["singapore.jpeg", "jogja.jpeg", "anyer.jpeg"];
  List titles = ["Singapore", "Yogyakarta", "Anyer"];
  List subtitle = ["The Jewel", "Malioboro", "Sambolo Beach"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("image/${images[index]}"),
                    fit: BoxFit.cover),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 85, 16, 16),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(26, 26, 26, 50),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RayaText(
                            text: titles[index], textState: RayaTextState.b30),
                        RayaText(
                            text: subtitle[index],
                            textState: RayaTextState.m21),
                        if (index == 2) const SizedBox(height: 75),
                        if (index == 2)
                          RayaButton(
                            text: "NEXT",
                            onTap: () {
                              BlocProvider.of<AppCubit>(context).getData();
                            },
                          ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                          3,
                          (indexSlider) => Container(
                                width: 8,
                                height: index == indexSlider ? 25 : 8,
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(index == indexSlider
                                        ? 0xFFFFFFFF
                                        : 0x4DFFFFFF)),
                              )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
