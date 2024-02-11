import 'dart:convert';
import 'package:assignment_module14/photo_details_screen.dart';
import 'package:assignment_module14/pictures.dart';
import 'package:flutter/foundation.dart'; // kDebugMode
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({super.key});
  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  List<Pictures> myList = [];
  bool isLoading = false;
  bool failedLoad = false;

  @override
  void initState() {
    super.initState();
    fetchData(); // async function
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Visibility(
          visible: isLoading == false,
          replacement: const CircularProgressIndicator(),
          child: Visibility(
            visible: failedLoad == false,
            replacement: const Text("Error loading data, try again latter"),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ListView.separated(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhotoDetailsScreen(
                              myList[index].url,
                              myList[index].title,
                              myList[index].id,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(myList[index].thumbnailUrl),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              //width: ,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(myList[index].title),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1, // eats space, doesn't create new
                    color: Colors.grey[200],
                    height: 10, // spacing height, creates new space
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    try{
      isLoading = true;
      setState(() {});
      const url = "https://jsonplaceholder.typicode.com/photos";
      final uri = Uri.parse(url);
      final Response response = await get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        //print(json[0]); // can use just json
        myList.clear();
        for (dynamic i in json) {
          // for (Map<String,dynamic> i in json) works
          myList.add(Pictures.fromJson(i)); // can use just json above?
        }
      }else{
        failedLoad = true;
      }
      isLoading = false;
      setState(() {});
    }catch(e){
      failedLoad = true;
      if (kDebugMode) {
        print("error: $e");
      }
    }
  }
}
