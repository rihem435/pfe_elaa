import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_colors.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/widgets/custom_backgroung_image.dart';
import 'package:front/widgets/custom_dropdown_services_choices.dart';
import 'package:front/widgets/custom_input_text.dart';
import 'package:front/widgets/custom_product_list_V.dart';
import 'package:front/widgets/custom_text.dart';
import 'package:get/get.dart';



class ServiceDetails extends GetView<ProductsController> {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    // ImageCloudinary imageCloudinary = ImageCloudinary();
    // controller.getCategories();
    // controller.getProducts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //your color
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.goldColor,
            size: 40,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: CustomText(fontSize: 18, text: 'My produsct list'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
                          controller: scrollController,

        child: CustomBackgroungImage(
          fit: BoxFit.cover,
          image: 'assets/images/landpage.jpg',
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                text: "Hello, ${AccountInfoStorage.readName().toString()}!",
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),

              /// Events
              /*           Expanded(
                flex: 1,
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.productsByUserIdJson!.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      return CustomProductListV(
                        colorBorder: AppColor.secondary,
                        productName:
                            "${controller.productsByUserIdJson!.data![index].nameproduct}",
                        description:
                            "${controller.productsByUserIdJson!.data![index].description}",
                        local: "testesttestt",
                        price: "${controller.productsByUserIdJson!.data![index].price}",
                        widthBorder: 2,
                        function: () {},
                      );
                    }),
              ),
 */
              FutureBuilder(
                  future: controller.getAllProductByUserId(),
                  builder: (ctx, snapshot) {
                    // Checking if future is resolved or not
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                            '${snapshot.error} occurred',
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
                          child: Text(
                            'There is no product for the moment. \n addProduct and make the best sells !!',
                            style: TextStyle(color: AppColor.secondary),
                          ),
                        );
                      } else {
                        return Expanded(
                          flex: 1,
                          child: GetBuilder<ProductsController>(
                            builder: (controller) {
                              return ListView.builder(
                                shrinkWrap: true,
                                controller: scrollController,
                                scrollDirection: Axis.vertical,
                                itemCount: controller
                                    .productsByUserIdJson!.data!.length,
                                itemBuilder: (BuildContext context, index) {
                                  controller.getCategorieById(
                                      "${controller.productGetJson!.data![index].category}");

                                  return CustomProductListV(
                                    colorBorder: AppColor.secondary,
                                    productName:
                                        "${controller.productsByUserIdJson!.data![index].nameproduct}",
                                    description:
                                        "${controller.productsByUserIdJson!.data![index].description}",
                                    local: "testesttestt",
                                    price:
                                        "${controller.productsByUserIdJson!.data![index].price}",
                                    categorie:
                                        AccountInfoStorage.readCategorieName().toString(),
                                      // "${controller.categorieGetByIdJson!.data!.name}",
                                    widthBorder: 2,
                                    function: () {},
                                  );
                                },
                              );
                            },
                          ),
                        );
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColor.secondary,
          foregroundColor: Colors.white,
          // icon: Icon(Icons.add_outlined),
          label: Text('New Service'),
          onPressed: () {
            Get.dialog(
              AlertDialog(
                title: Text("New Service to sell",
                    style: TextStyle(color: AppColor.goldColor)),
                backgroundColor: Colors.white,
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      //product title
                      CustomInputText(
                        controller: controller.productNameController,
                        obscureText: false,
                        label: "Product Name:",
                      ),
                      //description
                      CustomInputText(
                        controller: controller.productDescriptionController,
                        obscureText: false,
                        label: "Description:",
                      ),
                      //location dropdownlist
                      CustomInputText(
                        controller: controller.productPriceController,
                        obscureText: false,
                        label: "Price:",
                      ),

                      
                      //addimages

                      //CustomMiltipleImage(),

                      /*  ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColor.secondary)),
                        child: Text('Select Image from Gallery'),
                        onFocusChange: (value) {
                          controller.profilePicFile != null
                              ? Image.file(controller.profilePicFile!,
                                  fit: BoxFit.cover)
                              : Image.network(
                                  controller.profilePicFile != null
                                      ? "${AccountInfoStorage.readImage().toString()}"
                                      : "https://media.istockphoto.com/id/1300845620/fr/vectoriel/appartement-dic%C3%B4ne-dutilisateur-isol%C3%A9-sur-le-fond-blanc-symbole-utilisateur.jpg?s=612x612&w=0&k=20&c=BVOfS7mmvy2lnfBPghkN__k8OMsg7Nlykpgjn0YOHj0=",
                                );
                        },
                        onPressed: () {
                          controller.selectImages;
                        },
                      ), */
                      //categories
                      CustomDropdownServices(),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'Add',
                      style: TextStyle(color: AppColor.secondary, fontSize: 20),
                    ),
                    onPressed: () {
                      print(
                          "========================== product creation ======");
                      controller.createProduct();
                      controller.productDescriptionController.clear();
                      controller.productNameController.clear();
                      controller.productPriceController.clear();
                      Navigator.of(context).pop();

                      //  Get.to(ServiceDetails());
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
