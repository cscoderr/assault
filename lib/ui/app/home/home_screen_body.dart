import 'package:assault/models/complaint_model.dart';
import 'package:assault/models/response_message_model.dart';
import 'package:assault/providers/complaint_provider.dart';
import 'package:assault/providers/navigation_provider.dart';
import 'package:assault/providers/user_provider.dart';
import 'package:assault/ui/core/constants.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({Key key}) : super(key: key);

  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

enum LegendShape { Circle, Rectangle }

class _HomeScreenBodyState extends State<HomeScreenBody> {
  String numOfComplaint;
  Map<String, double> dataMap = {
    "Califonia": 5,
    "New York": 3,
    "Rivers": 2,
    "Los Angeles": 2,
  };
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  LegendShape _legendShape = LegendShape.Circle;

  int key = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      Provider.of<ComplaintProvider>(context, listen: false).totalComplaint();
      Provider.of<NavigationProvider>(context, listen: false).getChart();
      //getChartAnalytics(context);
    });
  }

  getTotalComplaint(BuildContext context) async {
    numOfComplaint =
        await Provider.of<ComplaintProvider>(context, listen: false)
            .totalComplaint();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final complaintProvider =
        Provider.of<ComplaintProvider>(context, listen: false);
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 50.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfig.minBlockVertical * 5.0,
            ),
            Container(
              width: double.infinity,
              height: 120.0,
              decoration: BoxDecoration(
                color: Color(0xFFFA6A22),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!userProvider.isAnonymousLogin)
                    Text(
                      '${userProvider.user.firstName + ' ' + userProvider.user.lastName}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: kWhiteColor,
                      ),
                    ),
                  SizedBox(
                    height: SizeConfig.minBlockVertical,
                  ),
                  Text(
                    '${userProvider.isAnonymousLogin ? 'Anonymous' : 'User'}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.minBlockVertical * 3.0,
            ),
            if (!userProvider.isAnonymousLogin)
              Container(
                width: double.infinity,
                height: 120.0,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${complaintProvider.numOfComplaint}',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical,
                    ),
                    Text(
                      'Number of complaint',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: SizeConfig.minBlockVertical * 3.0,
            ),
            Text(
              'Top Reported Areas',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfig.minBlockVertical * 2.0,
            ),
            if (navigationProvider.analyticMapModel != null)
              PieChart(
                dataMap: navigationProvider.analyticMapModel,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 25,
                chartRadius: MediaQuery.of(context).size.width / 1.2,
                // colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.disc,
                ringStrokeWidth: 32,
                //centerText: "HYBRID",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: _legendShape == LegendShape.Circle
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              )
            else
              Center(
                child: CircularProgressIndicator(),
              ),

            SizedBox(
              height: SizeConfig.minBlockVertical * 5.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'History',
            //       style: TextStyle(
            //         fontSize: 20.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         ExtendedNavigator.of(context).push(
            //           Routes.listComplaintScreen,
            //         );
            //       },
            //       child: Text(
            //         'See All',
            //         style: TextStyle(
            //           fontSize: 16.0,
            //           color: kPrimaryColor,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            // SizedBox(
            //   height: SizeConfig.minBlockVertical * 2.0,
            // ),
            //_buildHistoryCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context) {
    final _complaintProvider = Provider.of<ComplaintProvider>(context);
    return FutureBuilder<ComplaintModel>(
      future: _complaintProvider.myComplaint(),
      builder: (context, snapshot) {
        if (snapshot.hasError ||
            snapshot.data == null ||
            snapshot.data.status == false ||
            snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data.complaintListModel == null) {
          return Card(
            child: ListTile(
              title: Text(
                "No history available",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              trailing: Icon(Icons.navigate_next),
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                    '${snapshot.data.complaintListModel[index].fullName.toString()}'),
                subtitle: Text(
                    '${snapshot.data.complaintListModel[index].state.toString()}'),
                trailing: Text(
                    '${snapshot.data.complaintListModel[index].date.toString().split('T')[0]}'),
              ),
            );
          },
        );
      },
    );
  }
}
