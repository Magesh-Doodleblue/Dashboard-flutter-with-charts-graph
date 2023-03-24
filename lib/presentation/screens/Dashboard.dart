import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data_file.dart';
import 'drawer_dashboard.dart';
import 'hierarchy.dart';
import 'piechart.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const Hierarchy());
            },
            icon: const Icon(
              Icons.people,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
            ),
          ),
        ],
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text: TextSpan(
                  text: "Hello ",
                  style: TextStyle(color: Colors.blue[900], fontSize: 20),
                  children: [
                    TextSpan(
                      text: "Magesh",
                      style: TextStyle(
                          color: Colors.blue[900], fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: ", welcome back!",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "DashBoard",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CourseGrid(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Items in Inventory",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        StatisticsGrid(),
                        SizedBox(
                          height: 280,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(flex: 1, child: PlaningGrid()),
                ],
              ),
              const ActivityHeader(),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: MediaQuery.of(context).size.height / 2,
                    child: ChartContainer(
                      chart: BarChartContent(),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 2,
                      child: const PieDonutChart()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartContainer extends StatelessWidget {
  final Widget chart;

  const ChartContainer({
    Key? key,
    required this.chart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.95 * 0.65,
        padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: chart,
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 18,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

class CourseGrid extends StatelessWidget {
  const CourseGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: course.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 7, crossAxisCount: 2, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(course[index].backImage),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          course[index].text,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          course[index].lessons,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          course[index].imageUrl,
                          height: 110,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class PlaningGrid extends StatelessWidget {
  const PlaningGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          GridView.builder(
              itemCount: planing.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 16 / 4,
                  crossAxisCount: 1,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        color: const Color(0xffF7F7F7),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: planing[index].color,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 55,
                                width: 55,
                                child: planing[index].icon,
                              )
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                planing[index].heading,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                planing[index].subHeading,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.more_vert,
                                color: Colors.grey,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class PlaningHeader extends StatelessWidget {
  const PlaningHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Text(
              "Planning ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "View All",
              style: TextStyle(color: Colors.blue, height: 2),
            )
          ],
        ),
        Row(
          children: const [
            Icon(
              Icons.calendar_month_outlined,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "18 July 2022",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 2,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}

class StatisticsGrid extends StatelessWidget {
  const StatisticsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: statistics.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15,
          childAspectRatio: 1,
          crossAxisCount: 4,
          mainAxisSpacing: 20),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    statistics[index].title,
                    maxLines: 2,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 7,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Text(
                        statistics[index].number,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ActivityHeader extends StatelessWidget {
  const ActivityHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Activity",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Row(
          children: const [
            Text(
              "Day",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              "Week",
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              "Month",
              style: TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}

class BarChartContent extends StatelessWidget {
  BarChartContent({Key? key}) : super(key: key);
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(show: false),
            lineBarsData: [
              // The red line
              LineChartBarData(
                spots: dummyData1,
                isCurved: true,
                barWidth: 3,
                color: Colors.indigo,
              ),
              // The orange line
              LineChartBarData(
                spots: dummyData2,
                isCurved: true,
                barWidth: 3,
                color: Colors.red,
              ),
              // The blue line
              LineChartBarData(
                spots: dummyData3,
                isCurved: false,
                barWidth: 3,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
