import 'package:flutter/material.dart';
import 'package:flutter_api_with_getx/controllers/product_controller.dart';
import 'package:flutter_api_with_getx/product_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(
                () => (productController.isLoading.value == true)
                    ? Center(child: CircularProgressIndicator())
                    : AlignedGridView.count(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        //shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 4,
                        itemCount: productController.productsList.length,
                        itemBuilder: (context, index) {
                          return ProductTile(
                            productController.productsList[index],
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
