import 'package:flutter/material.dart';
import 'package:my_bloc/widgets/raya_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List images = ["singapore.jpeg", "jogja.jpeg", "anyer.jpeg"];
  List discover = ["Attraction", "Culinary", "Hotel"];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 21),
          const RayaText(
            text: "Discover",
            textState: RayaTextState.m21,
            color: Colors.black,
          ),
          const SizedBox(height: 21),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: TabBar(
              indicator:
                  const _CircleTabIndicator(color: Colors.green, radius: 4),
              labelPadding: const EdgeInsets.only(left: 0, right: 16),
              tabs: discover
                  .map((value) => Tab(text: value))
                  .toList(),
              labelColor: Colors.purple,
              labelStyle: getRayaTextStyle(RayaTextState.m16, Colors.purple),
              unselectedLabelColor: Colors.green,
              unselectedLabelStyle: getRayaTextStyle(RayaTextState.m14, Colors.red),
              controller: tabController,
              isScrollable: true,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: TabBarView(controller: tabController, children: [
              SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 16),
                  itemCount: 3,
                  itemBuilder: (context, index) => Container(
                      width: 100,
                      height: 250,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/${images[index]}"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF9A3939),
                      )),
                ),
              ),
              Center(
                  child: RayaText(
                      text: discover[1],
                      color: Colors.black,
                      textState: RayaTextState.m21)),
              Center(
                  child: RayaText(
                      text: discover[2],
                      color: Colors.black,
                      textState: RayaTextState.m21)),
            ]),
          ),
          const SizedBox(height: 24),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RayaText(
                  text: "Explore More",
                  textState: RayaTextState.m16,
                  color: Colors.black),
              Spacer(),
              RayaText(
                  text: "See all",
                  textState: RayaTextState.m14,
                  color: Colors.purple),
            ],
          ),
          const SizedBox(height: 24)
        ],
      ),
    );
  }
}

class _CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const _CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  const _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
