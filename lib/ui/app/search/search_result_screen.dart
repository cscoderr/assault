import 'package:assault/models/complaint_model.dart';
import 'package:assault/providers/complaint_provider.dart';
import 'package:assault/ui/core/custom_appbar.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultScreen extends StatefulWidget {
  final String searchQuery;
  SearchResultScreen({this.searchQuery});

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    final _searchProvider =
        Provider.of<ComplaintProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 30.0,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Search Result',
              ),
              SizedBox(
                height: SizeConfig.minBlockVertical * 3.0,
              ),
              FutureBuilder<ComplaintModel>(
                future: _searchProvider.searchComplaint(widget.searchQuery),
                builder: (context, snapshot) {
                  if (snapshot.hasError ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      flex: 2,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.data == null ||
                      snapshot.data.complaintListModel.length < 1) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 50.0,
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text('No result found'),
                          trailing: Icon(Icons.navigate_next),
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.complaintListModel.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              ExtendedNavigator.of(context).push(
                                Routes.complaintDetailsScreen,
                                arguments: ComplaintDetailsScreenArguments(
                                    complaintId: snapshot
                                        .data.complaintListModel[index].id),
                              );
                            },
                            title: Text(
                                '${snapshot.data.complaintListModel[index].fullName.toString()}'),
                            subtitle: Text(
                                '${snapshot.data.complaintListModel[index].state.toString()}'),
                            trailing: Text(
                                '${snapshot.data.complaintListModel[index].date.toString().split('T')[0]}'),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
