import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Categories/View/home_categories_lisitng.dart';
import '../../Featured/View/home_featured_lisitng.dart';
import '../../LatestPhone/View/home_latest_phone.dart';

import '../../Product/View/home_products_lisitng.dart';
import '../../Routes/route_names.dart';
import '../../Utils/slider_data.dart';
import '../ViewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final homeVM = Get.find<HomeViewModel>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        backgroundColor: Colors.amber,
        width: 260,
      ),
      appBar: AppBar(
        title: Text("Mobile Zone"),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu_open,
              color: Colors.amber.shade600), // set your color here
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  auth
                      .signOut()
                      .then((value) => {Get.toNamed(RouteNames.loginView)})
                      .onError((error, stackTrace) => {});
                },
                icon: const Icon(Icons.logout_outlined)),
            // child: Icon(
            //   Icons.search_sharp,
            //   color: Colors.amber.shade600,
            //   size: 26,
            // ),
          )
        ],
      ),
      backgroundColor: Colors.grey,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              // image Silder Here
              Container(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 200,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    reverse: false,
                    aspectRatio: 5.0,
                  ),
                  itemCount: imageList.length,
                  itemBuilder: (context, i, id) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            imageList[i],
                            width: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () {
                        var url = imageList[i];
                      },
                    );
                  },
                ),
              ),

              // Latest Phones

              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Latest Phone",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              HomeLatestList(
                latestphone: homeVM.homeData.value.latestphone,
              ),
              const SizedBox(
                height: 20,
              ),

              // start Top Categrious

              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "By Brand",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              HomeCategoriesList(
                categories: homeVM.homeData.value.categories,
              ),
              const SizedBox(
                height: 20,
              ),

              // By Featured

              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "By Featured",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              HomeFeaturedList(
                featured: homeVM.homeData.value.featured,
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Top Products",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              HomeProductsListing(products: homeVM.homeData.value.products)
            ],
          ),
        ),
      ),
    );
  }
}
