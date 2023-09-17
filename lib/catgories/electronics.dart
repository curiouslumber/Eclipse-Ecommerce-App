import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class ElectronicsCategory extends StatefulWidget {
  const ElectronicsCategory({super.key});

  @override
  State<ElectronicsCategory> createState() => _ElectronicsCategoryState();
}

class _ElectronicsCategoryState extends State<ElectronicsCategory> {
  List<Map<String, dynamic>> jsonData = [];
  bool isLoading = true; // Added boolean to track loading state

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url =
        Uri.parse('https://fakestoreapi.com/products/category/electronics');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        jsonData = List<Map<String, dynamic>>.from(data);
        isLoading = false; // Set loading state to false once data is loaded
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xff1D262D), // Navigation bar
          statusBarColor: Color(0xff1D262D), // Status bar
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: const Icon(Icons.shop))
        ],
        foregroundColor: const Color.fromARGB(255, 171, 191, 255),
        centerTitle: true,
        title: const Text(
          'Eclipse',
          style: TextStyle(fontFamily: 'Raleway-SemiBold'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.only(top: 14.h, left: 6.w, right: 6.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(
              "images/dark-pattern.jpg",
            ),
            repeat: ImageRepeat.repeat,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          children: [
            SearchBar(
              hintText: 'Search Eclipse',
              hintStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Raleway-Light',
                  color: const Color(0xff727272),
                ),
              ),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(255, 86, 123, 243),
                ),
                borderRadius: BorderRadius.circular(3.w),
              )),
              padding: MaterialStatePropertyAll(
                  EdgeInsets.only(left: 2.w, right: 4.w)),
              trailing: [
                Icon(
                  Icons.search,
                  size: 6.w,
                  color: const Color.fromARGB(255, 86, 123, 243),
                )
              ],
              backgroundColor: const MaterialStatePropertyAll(
                Color(0xff333333),
              ),
              textStyle: MaterialStatePropertyAll(TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontFamily: 'Raleway-Regular')),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.h),
              height: 75.h,
              alignment: Alignment.center,
              child: isLoading
                  ? const CircularProgressIndicator() // Display CircularProgressIndicator while loading
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: jsonData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            title: Text(jsonData[index]['title']),
                            subtitle:
                                Text('Price: \$${jsonData[index]['price']}'),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
