import 'dart:html';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:nazerin_project/constans/custom_colors.dart';
import 'package:nazerin_project/ruler_map/pages/gmap.dart';

class FFirstPage extends StatefulWidget {
  const FFirstPage({
    Key? key,
  }) : super(key: key);

  @override
  _FFirstPageState createState() => _FFirstPageState();
}

class _FFirstPageState extends State<FFirstPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  // int? selectedTab;

  @override
  void initState() {
    // TODO: implement initState
    //tabController!.index = selectedTab!;
    tabController = TabController(length: 3, vsync: this);
    //fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        //!making Base direction of tabs to RTL ==================
        child: Directionality(
      textDirection: TextDirection.rtl,
      //! TabController For controling Tabs========
      child: DefaultTabController(
        //initialIndex: selectedTab!,
        //!length of tabs ========
        length: 3,

        //!Start of Page ===================
        child: Scaffold(
            //AppBAr SET________________________
            appBar: AppBar(
              // shape:const RoundedRectangleBorder(
              //   side: BorderSide(color:Colors.amber ),
              // ),
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: IconButton(
                    onPressed: () {
                      // print('person has Clicked');
                      //! showDialog For user======== ((TEMPORARY))
                      showDialog(
                        context: context,
                        builder: (context) => Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            title: const Text('اطلاعات کاربر'),
                            backgroundColor: Colors.white,
                            content: SizedBox(
                              height: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('نام کاربری'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('ایمیل'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('شماره همراه')
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('خروج'))
                            ],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person)),
              ),
              //!Left btns of AppBar============================
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 8, 0, 0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const GmapPage()));
                          },
                          icon: const Icon(Icons.location_pin)),
                      //setup popupMenu For Appbar_______________________
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: PopupMenuButton<String>(
                            elevation: 0,
                            color: lGray,
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: const Text(
                                      'فرم ها',
                                    ),
                                    height: 10,
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                    onTap: () {
                                      print('forms taped');
                                    },
                                  ),
                                  const PopupMenuDivider(
                                    height: 12,
                                  ),
                                  PopupMenuItem(
                                    child: const Text(
                                      'پروژه های من',
                                      textDirection: TextDirection.rtl,
                                    ),
                                    height: 10,
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                    onTap: () {
                                      print('myproject taped');
                                    },
                                  ),
                                  const PopupMenuDivider(
                                    height: 12,
                                  ),
                                  PopupMenuItem(
                                    child: const Text(
                                      'علاقه مندی ها',
                                      textDirection: TextDirection.rtl,
                                    ),
                                    height: 10,
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                    onTap: () {
                                      print('favorite taped');
                                    },
                                  ),
                                  const PopupMenuDivider(
                                    height: 12,
                                  ),
                                  PopupMenuItem(
                                    child: const Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Text(
                                        'جستوجو',
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    height: 10,
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                    onTap: () {},
                                  )
                                ]),
                      )
                    ],
                  ),
                )
              ],
              centerTitle: true,
              title: const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'ناظرین ',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                ),
              ),
              toolbarHeight: 65,
              elevation: 0,
              backgroundColor: mGray,

              // Tabs in Appbar __________________________
              bottom: TabBar(
                isScrollable: false,
                labelColor: mGray,
                indicatorColor: mGray,

                //replayOrange,
                unselectedLabelColor: mGray,
                //Colors.white,
                controller: tabController,
                automaticIndicatorColorAdjustment: false,
                tabs: const [
                  Tab(
                    icon: Icon(Icons.looks_one),
                  ),
                  Tab(
                    icon: Icon(Icons.looks_two),
                  ),
                  Tab(
                    icon: Icon(Icons.looks_3),
                  )
                ],
              ),
            ),
            backgroundColor: lGray,

            // body _ coloumn avatars ________________

            body: const Center(
              child: Text("Welcom To Base Page Sir"),
            )

            // TabBarView(
            //   controller: tabController,
            //   children: const [FirstTab3(), SecondTab4(), ThirTab3()],
            // ),
            // bottomSheet: const BottomTask(),
            ),
      ),
    ));
  }

  // void fetchData() async {
  //   var url =
  //       // "http://46.209.155.42:9091/datasnap/rest/TServerMethods1/getdata/userdata/'s.rafeie";

  //       "http://welearnacademy.ir/flutter/products_list.json";

  //   Response response = await get(Uri.parse(url));
  //   print(json.decode(utf8.decode(response.bodyBytes)));
  // }
}
