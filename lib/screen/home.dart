import 'package:bodhi_ai_assig/controller/getxcontroller.dart';
import 'package:bodhi_ai_assig/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controllergetx medinieData = Get.put(Controllergetx());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    medinieData.GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.remove('uid');
                prefs.remove('username');
                prefs.reload();
                Navigator.pushNamedAndRemoveUntil(
                    context, Login.routeName, (route) => false);
              },
              icon: Icon(
                Icons.logout,
              ))
        ],
      ),
      body: Center(
        child: Obx(() => medinieData.mediniedata.value.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      const Text(
                        "Your Daily Prescriptions",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Text("Generic name:",
                                  style: TextStyle(fontSize: 18)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                  medinieData.mediniedata.value[0].genericName
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Text("Labeler Name:",
                                  style: TextStyle(fontSize: 18)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                  medinieData.mediniedata.value[0].labelerName
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: const Text("Brand name:",
                                  style: TextStyle(fontSize: 18)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                  medinieData.mediniedata.value[0].brandName
                                      .toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      const Text(
                        "Active Ingredients",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      // Text(medinieData.mediniedata.value[0].productNdc.toString())
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ListView(
                            children: List.generate(
                                medinieData.mediniedata.value[0]
                                    .activeIngredients!.length,
                                (index) => Container(
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.vaccines,
                                          color: Colors.redAccent,
                                        ),
                                        title: Text(medinieData
                                                .mediniedata
                                                .value[0]
                                                .activeIngredients![index]
                                                .name
                                                .toString() ??
                                            ""),
                                        subtitle: Text(medinieData
                                                .mediniedata
                                                .value[0]
                                                .activeIngredients![index]
                                                .strength
                                                .toString() ??
                                            ""),
                                      ),
                                    )),
                          ))
                    ],
                  ),
                ),
              )),
      ),
    );
  }
}
