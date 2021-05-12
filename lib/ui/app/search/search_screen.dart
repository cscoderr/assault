import 'package:assault/ui/core/search_box.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 50.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SearchBox(
              controller: _searchController,
              hintText: 'Search',
              inputType: TextInputType.text,
              borderSide: BorderSide(
                color: kPrimaryBorder,
              ),
              onSubmit: (value) {
                ExtendedNavigator.of(context).push(
                  Routes.searchResultScreen,
                  arguments: SearchResultScreenArguments(
                    searchQuery: value.toString(),
                  ),
                );
                _searchController.text = "";
                // _searchProvider.setSearchDone = true;
                // _searchProvider.searchDone = true;
                // _searchProvider.searchComplaint(value).then((value) {
                //   if (value.status == false) {
                //     _searchProvider.searchDone = false;
                //     _searchProvider.requestCompleted = false;
                //     _searchProvider.searchString = "No result found";
                //   } else if (value.status == true &&
                //       value.complaintListModel == null) {
                //     _searchProvider.searchDone = false;
                //     _searchProvider.requestCompleted = false;
                //     _searchProvider.searchString = "No result found";
                //   } else {
                //     _searchProvider.requestCompleted = true;
                //     // _searchProvider.setRequestCompleted = true;
                //   }
                // });
              },
            ),
          ),
          Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  'Enter your search',
                  style: kMainTextStyle.copyWith(
                    fontSize: 20.0,
                    color: kPrimaryTextColor,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

// Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   "assets/svgs/search.svg",
//                 ),
//                 SizedBox(
//                   height: SizeConfig.minBlockVertical * 2.0,
//                 ),
//                 Center(
//                   child: Text(
//                     'Search',
//                     style: kMainTextStyle.copyWith(
//                       fontSize: 22.0,
//                       color: kPrimaryTextColor,
//                     ),
//                   ),
//                 ),
//               ],
//               // ),
//             ),
