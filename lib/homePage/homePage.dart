import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_project/modals/superheros.dart';
import 'package:tutorial_project/providers/apiProvider.dart';
import 'package:tutorial_project/utils/custom.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SuperHero> listOfItems = [];

  @override
  void initState() {
    super.initState();

    Provider.of<ApiProvider>(context, listen: false).fetchDataFromRepo(context);
    listOfItems.add(SuperHero(
        name: "Iron Man",
        image: "https://i.ytimg.com/vi/8ugaeA-nMTc/maxresdefault.jpg",
        actor: "Rober Downey Jr"));
    listOfItems.add(SuperHero(
        name: "Captain America",
        image:
            "https://images.indianexpress.com/2021/01/chris-evans-captain-america-1200.jpg",
        actor: "Chris Evan"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listOfItems.add(SuperHero(
              name: "Hulk",
              image:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxCQufZ5U0HXMFtewAi8D4I8PDxi2nuReZfg&usqp=CAU",
              actor: "Bruce"));
          setState(() {});
        },
      ),
      appBar: AppBar(),
      drawer: Container(
        height: getHeight(context),
        width: getWidth(context) / 2,
        color: Colors.blueGrey,
        child: SafeArea(
          child: drawerWidget(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            listOfHeros(),
            Text(
              "Datas From Api",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Fact : "),
                  Consumer<ApiProvider>(
                    builder: (context, provider, child) {
                      return provider.catsData != null
                          ? Expanded(child: Text(provider.catsData!.fact))
                          : Text("Fetching Data...");
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView listOfHeros() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: listOfItems.length,
      itemBuilder: (ctx, index) {
        return listItems(index);
      },
    );
  }

  Padding listItems(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(listOfItems[index].image),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listOfItems[index].name),
                  Text(listOfItems[index].actor)
                ],
              ),
              Spacer(),
              Icon(Icons.chevron_right)
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  Column drawerWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text("Drawer Header")
      ],
    );
  }
}
