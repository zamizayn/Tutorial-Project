import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_project/homePage/addData.dart';
import 'package:tutorial_project/homePage/currentLocation.dart';
import 'package:tutorial_project/homePage/dropDownUI.dart';
import 'package:tutorial_project/homePage/postExample.dart';
import 'package:tutorial_project/homePage/ratingBar.dart';
import 'package:tutorial_project/homePage/sharedPrefs.dart';
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
    Provider.of<ApiProvider>(context, listen: false).fetchUsaData(context);
    Provider.of<ApiProvider>(context, listen: false).fetchEntries(context);

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
                  //inside row with consumer
                  Text("Fact is : "),
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
            Consumer<ApiProvider>(
              builder: (context, provider, child) {
                return provider.datas != null
                    ? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: provider.datas!.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              tileColor: Colors.blueGrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              leading: Icon(Icons.people),
                              trailing: Icon(Icons.chevron_right),
                              title: Text(
                                  "Population is : " +
                                      provider.datas!.data[index].population
                                          .toString(),
                                  style: TextStyle(color: Colors.white)),
                            ),
                          );
                        })
                    : CircularProgressIndicator();
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("Entries"),
            SizedBox(
              height: 10,
            ),
            Consumer<ApiProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        (provider.entriesPojo!.entries.length / 10).truncate(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.category,
                            color: Colors.black,
                          ),
                          tileColor: Colors.grey.shade400,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(provider.entriesPojo!.entries[index].category
                                  .toString()),
                              Text(
                                provider.entriesPojo!.entries[index].link,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.blue),
                              ),
                              Text(
                                provider
                                    .entriesPojo!.entries[index].description,
                                maxLines: 2,
                                style: TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
            )
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
        InkWell(
          onTap: () {
            navigate(context, AddData());
          },
          child: Container(
            width: getWidth(context),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Add Data")),
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            navigate(context, PostExample());
          },
          child: Container(
            width: getWidth(context),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("POST EXAMPLE")),
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            navigate(context, RatingBarClass());
          },
          child: Container(
            width: getWidth(context),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Rating")),
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            navigate(context, DropDownClass());
          },
          child: Container(
            width: getWidth(context),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("DropDown")),
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            navigate(context, SharedPrefs());
          },
          child: Container(
            width: getWidth(context),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Shared Prefs")),
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            navigate(context, CurrentLocation());
          },
          child: Container(
            width: getWidth(context),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Location")),
                )),
          ),
        )
      ],
    );
  }
}
