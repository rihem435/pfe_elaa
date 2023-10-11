import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:front/views/event_list_view.dart';
import 'package:front/views/favorite_view.dart';
import 'package:front/views/login_view.dart';
import 'package:front/views/product_selection_by_services.dart';
import 'package:front/views/profile_view.dart';
import 'package:front/views/setting_view.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_button_text.dart';
import 'package:front/widgets/custom_chechbox.dart';
import 'package:front/widgets/custom_favorite_list.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';

class HomeView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    controller.getCategories();
    controller.getProducts();
    Future<String> getData() {
      return Future.delayed(Duration(seconds: 2), () {
        return "I am data";
        // throw Exception("Custom Error");
      });
    }

    // controller.getNameCategory();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.search,
                color: AppColor.goldColor,
                size: 50,
              ),
              onPressed: () {
                //code to execute when this button is pressed
              }),
          backgroundColor: Colors.white, //your color
          surfaceTintColor: Colors.white,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 0,
                child: CustomText(
                  fontSize: 16,
                  text: 'Hello ${AccountInfoStorage.readName().toString()}' ,
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: CustomText(
                    fontSize: 16,
                    text: 'Budget' /* custom budget*/,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.person_2,
              size: 50,
              color: AppColor.goldColor,
            )
          ],
        ),
        endDrawer: Container(
          width: MediaQuery.of(context).size.width * 0.5, //<-- SEE HERE
          child: Drawer(
            backgroundColor: AppColor.goldColor.withOpacity(0.9),
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,

              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(AccountInfoStorage.readName().toString()),
                  accountEmail: Text(AccountInfoStorage.readEmail().toString()),
                  currentAccountPicture: CircleAvatar(
                    //get uesr photo from backend
                    backgroundImage:NetworkImage("https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=",
                      ) ,
                   // backgroundImage: NetworkImage("${AppApi.getImageUser}${AccountInfoStorage.readImage().toString()}"),
                    maxRadius: 25,
                  ),
                  decoration: BoxDecoration(color: AppColor.goldColor),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_2_outlined,
                  ),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileView()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.event_note_outlined,
                  ),
                  title: Text('My events'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventListView()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.favorite,
                  ),
                  title: Text('Favorite list'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoriteView()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                  ),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SettingView()));
                  },
                ),
                AboutListTile(
                  // <-- SEE HERE
                  icon: Icon(
                    Icons.info,
                  ),
                  child: Text('About app'),
                  applicationIcon: Icon(
                    Icons.local_play,
                  ),
                  applicationName: 'My Event Mangement App',
                  applicationVersion: '1.0.0',
                  applicationLegalese: '© 2023 Company',
                  aboutBoxChildren: [
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                GetBuilder<ProfileColntroller>(builder: (c) {
                  return ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                    ),
                    title: Text('Log out'),
                    onTap: () {
                      print('********************logout*************');
                      c.logOut();
                      Get.to(LoginView());
                    },
                  );
                })
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: CustomBackgroungImage(
            fit: BoxFit.cover,
            image: 'assets/images/landpage.jpg',
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //service
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomText(
                          textAlign: TextAlign.justify,
                          text: 'Services',
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          //textAlign: TextAlign.left,
                        ),
                      ),
                      //view all
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            CustomButtonText(
                              text: 'View All',
                              icon: Icons.arrow_forward,
                              function: () {
                                 Get.to(ProductSelectionByServices());
                              // Get.to(EventListView());
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //list service names
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categorieJson!.data!.length,
                      itemBuilder: (BuildContext context, index) {
                        return CustomChechbox(
                          function: () {},
                          text:
                              '${controller.categorieJson!.data![index].name}',
                          /*  height: 30,
                            width: 150, */
                          colorBorder: AppColor.goldColor,
                          widthBorder: 1,
                        );
                      }),
                ),
                //list products
                Expanded(
                  flex: 5,
                  child: FutureBuilder(
                      future: controller.getProducts(),
                      builder: (ctx, snapshot) {
                        // Checking if future is resolved or not
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          print("-----------------snapshot$snapshot");
                          return Center(
                            child: CircularProgressIndicator(
                                color: AppColor.secondary),
                          );
                        } else {
                          // If we got an error
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Something went wrong !!!',
                                style: TextStyle(fontSize: 18),
                              ),
                            );

                            // if we got our data
                          }

                          if (snapshot.data == null) {
                            // Extracting data from snapshot object
                            print(
                                '-----------------------snapshotdata=======>$snapshot');
                            return Center(
                              child: Text('There is no service for the moment', style: TextStyle(color: AppColor.secondary),),
                            );
                          } else {
                            return Center(
                              child: Expanded(
                                flex: 5,
                                child: GetBuilder<ProductsController>(
                                  builder: (controller) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      controller: scrollController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller
                                          .productGetJson!.data!.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        controller.getCategorieById(
                                            "${controller.productGetJson!.data![index].category}");
                                        return GestureDetector(
                                          child: CustomFavoriteList(
                                            function: () {},
                                            icon: Icons.favorite_border,
                                            //products[index].image.toString()
                                            //img: "${controller.productGetJson!.data![index].images}",
                                            img: "assets/images/logo2.png ",
                                            /* '${controller.productGetJson!.data![index].images}', */
                                            ServiceName: AccountInfoStorage
                                                    .readCategorieName()
                                                .toString(),
                                            //  " ${controller.getCategorieById("${AccountInfoStorage.readCategorieName()}")}",
                                            //" ${AccountInfoStorage.readCategorieName()}",
                                            //"zzz${controller.getCategorieById("${controller.productGetJson!.data![index].category}")}",
                                            //"${controller.productGetJson!.data![index].nameproduct}",
                                            Descriptiontext:
                                                "${controller.productGetJson!.data![index].price}",
                                            height: 200,
                                            width: 200,
                                            colorBorder: AppColor.goldColor,
                                            widthBorder: 1,
                                          ),
                                          onTap: () {
                                            ////
                                            print(
                                                "*-------------------------------------------*get category by id*****************");

                                            controller.getProductById(
                                                "${controller.productGetJson!.data![index].sId}");
                                            print(
                                                "*************get category by id*****************");
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                        }
                        // print("-----------------snapshot$snapshot");
                        // Displaying LoadingSpinner to indicate waiting state

                        // Future that needs to be resolved
                        // inorder to display something on the Canvas
                      }),
                ),

                // tasks
                /*        Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CustomText(
                                  textAlign: TextAlign.justify,
                                  text: 'Tasks',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  //textAlign: TextAlign.left,
                                ),
                    Color.fromARGB(177, 0, 0, 0)                       //view all
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    CustomButtonText(
                                      text: 'View All',
                                      icon: Icons.arrow_forward,
                                      function: () {
                                        //  Get.to();
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, index) {
                          return  Text("data");
                        }),
                  ),
  */
                // Top vendors
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                textAlign: TextAlign.justify,
                                text: 'Top Vendors',
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                //textAlign: TextAlign.left,
                              ),
                            ),
                            //view all
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  CustomButtonText(
                                    text: 'View All',
                                    icon: Icons.arrow_forward,
                                    function: () {
                                      //  Get.to();
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, index) {
                        return CustomFavoriteList(
                          function: () {},
                          icon: Icons.reviews,
                          img: 'assets/images/logo2.png',
                          ServiceName: "Catering",
                          Descriptiontext: '',
                          //  'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qul est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum',
                          height: 200,
                          width: 200,
                          colorBorder: Colors.white.withOpacity(1),
                          widthBorder: 1,
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
