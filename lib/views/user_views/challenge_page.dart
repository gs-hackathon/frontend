import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallangePage extends StatefulWidget {
  final String imageUrl;
  final String taskName;
  final String taskDescription;
  final String taskStar;
  final String taskDay;
  final List<String> taskRules;
  const ChallangePage(
      {Key key,
      this.imageUrl,
      this.taskName,
      this.taskDescription,
      this.taskStar,
      this.taskDay, this.taskRules})
      : super(key: key);

  @override
  State<ChallangePage> createState() => _ChallangePageState();
}

class _ChallangePageState extends State<ChallangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(widget.imageUrl,
                width: Get.width, height: Get.height / 3.5, fit: BoxFit.cover),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.taskName,
                          style: TextStyle(color: Colors.tealAccent[700])),
                      Text(widget.taskDescription)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Ödül"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.stars, color: Colors.yellow, size: 18),
                            SizedBox(width: 5),
                            Column(children: [
                              Text(
                                widget.taskStar,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 2)
                            ]),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
            Container(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kurallar",
                        style: TextStyle(color: Colors.tealAccent[700])),
                    SizedBox(height: 15),
                    Text(widget.taskRules[0]),
                    SizedBox(height: 10),
                    Text(
                        widget.taskRules[1]),
                    SizedBox(height: 10),
                    Text(widget.taskRules[2]),
                    SizedBox(height: 10),
                    Text(widget.taskRules[3])
                  ],
                )),
            SizedBox(height: 30),
            Container(
                width: Get.width,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.tealAccent[700],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                    onPressed: () {
                      print("bastıı");
                      // Get.to(() => InsertAdvertDetails(selectedItems: _filters));
                    },
                    child: Text("Kabul Et",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.tealAccent[700],
                    )))
          ],
        ),
      ),
    );
  }

  PreferredSize appBarMethod() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.tealAccent[700],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text(widget.taskName,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white))),
    );
  }
}
