// ignore_for_file: camel_case_types

import 'package:clothing_app/Model/Boxes.dart';
import 'package:clothing_app/Model/productmodel.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class allproductcontroller extends GetxController {
  RxList<Product> allitems = <Product>[].obs;

  RxList<Product> cartitem = <Product>[].obs;
  RxList<Product> favoriteItems = <Product>[].obs;
  RxList<List<Product>> orders = <List<Product>>[].obs;

  additemtofavorite(Product product) {
    var boxInstance = Boxes.getBoxinstance();
    boxInstance.put("favoriteProducts", "");
    favoriteItems.add(product);
    var listdata = [];
    favoriteItems.forEach((element) {
      listdata.add(element);
    });

    boxInstance.put("favoriteProducts", listdata);
  }

  removeitemfromfavorite(int index) {
    var boxInstance = Boxes.getBoxinstance();
    boxInstance.put("favoriteProducts", "");
    favoriteItems.removeAt(index);
    var listdata = [];
    favoriteItems.forEach((element) {
      listdata.add(element);
    });
    boxInstance.put("favoriteProducts", listdata);
  }

  additemstocart(Product product) {
    var boxInstance = Boxes.getBoxinstance();
    boxInstance.put("cartProducts", "");

    cartitem.add(product);

    var listdata = [];
    cartitem.forEach((element) {
      listdata.add(element);
    });

    boxInstance.put("cartProducts", listdata);
  }

  additemsfromFavoritetocart() {
    var boxInstance = Boxes.getBoxinstance();
    boxInstance.put("cartProducts", "");

    favoriteItems.forEach((element) {
      cartitem.add(element);
    });

    var listdata = [];
    cartitem.forEach((element) {
      listdata.add(element);
    });

    boxInstance.put("cartProducts", listdata);
  }

  removeitemfromcart(int index) {
    var boxInstance = Boxes.getBoxinstance();
    boxInstance.put("cartProducts", "");
    cartitem.removeAt(index);
    var listdata = [];
    cartitem.forEach((element) {
      listdata.add(element);
    });

    boxInstance.put("cartProducts", listdata);
  }

  getfavoriteProductsItems() async {
    var boxInstance = Boxes.getBoxinstance();
    var data = boxInstance.get("favoriteProducts");
    data.forEach((element) {
      favoriteItems.add(element);
      print(element);
    });
    print(data);
  }

  getCartProductsItems() async {
    var boxInstance = Boxes.getBoxinstance();
    var data = boxInstance.get("cartProducts");
    data.forEach((element) {
      cartitem.add(element);
    });
  }

  void initialize() {
    final List<Product> items = [
      Product(
          Product_name: "Antheaa",
          Product_description:
              "Black and rust orange floral print woven tiered midi fit and flare dress with ruffles, has a V-neck, short ruched sleeves, elasticated waistband, an attached lining, and flared hem",
          Product_imageurl: [
            "https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/16635070/2022/1/21/9be08db5-5d00-4b9b-aeab-4872e87e60591642745322469-Antheaa-Women-Dresses-5351642745321918-1.jpg",
            "https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/12595594/2020/10/15/b6e22b58-3450-468f-afeb-3218b6ce7acb1602737925709SareemallNavyBluePolyChiffonSolidEthnicPartywearSareewithMat1.jpg",
          ],
          Product_color_available: [
            0xFF000000,
            0xFF0000FF,
            0xFFE75480,
            0xFFd0a946
          ],
          Product_size_n_price: [
            {"Size": "XS", "Price": 1475},
            {"Size": "S", "Price": 1480},
            {"Size": "M", "Price": 1480},
            {"Size": "L", "Price": 1580},
            {"Size": "XL", "Price": 1680},
          ],
          Product_reviews: [
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
          ],
          Product_type: [
            "All"
                'SUMMER',
            'TROPICAL',
            'FLORAL',
            'GIRLS'
          ]),
      Product(
          Product_name: "ONLY",
          Product_description: """ Brown floral print fit & flare dress
Round neck
Short, flutter sleeve
Gathered or pleated detail
Above knee length in flared hem

Size & Fit
The model (height 5'8) is wearing a size S

Material & Care
Polyester
Machine wash""",
          Product_imageurl: [
            "https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/18096656/2022/4/29/2ac95f82-4055-4a0a-9df3-c1c05705bf9c1651250152422ONLYBrownDress1.jpg",
          ],
          Product_color_available: [
            0xFF000000,
            0xFF0000FF,
            0xFFE75480,
            0xFFd0a946
          ],
          Product_size_n_price: [
            {"Size": "XS", "Price": 1475},
            {"Size": "S", "Price": 1480},
            {"Size": "M", "Price": 1480},
            {"Size": "L", "Price": 1580},
            {"Size": "XL", "Price": 1680},
          ],
          Product_reviews: [
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 3, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
          ],
          Product_type: [
            'SUMMER',
            'TROPICAL',
            'FLORAL',
            'GIRLS'
          ]),
      Product(
          Product_name: "ONLY2",
          Product_description: """ Brown floral print fit & flare dress
Round neck
Short, flutter sleeve
Gathered or pleated detail
Above knee length in flared hem

Size & Fit
The model (height 5'8) is wearing a size S

Material & Care
Polyester
Machine wash""",
          Product_imageurl: [
            "https://assets.myntassets.com/h_1440,q_100,w_1080/v1/assets/images/18096656/2022/4/29/2ac95f82-4055-4a0a-9df3-c1c05705bf9c1651250152422ONLYBrownDress1.jpg",
          ],
          Product_color_available: [
            0xFF000000,
            0xFF0000FF,
            0xFFE75480,
            0xFFd0a946
          ],
          Product_size_n_price: [
            {"Size": "XS", "Price": 1475},
            {"Size": "S", "Price": 1480},
            {"Size": "M", "Price": 1480},
            {"Size": "L", "Price": 1580},
            {"Size": "XL", "Price": 1680},
          ],
          Product_reviews: [
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
            {"Stars": 4, "Review": "Beautiful and elegant dress,loved it!"},
          ],
          Product_type: [
            'SUMMER',
            'TROPICAL',
            'FLORAL',
            'GIRLS'
          ]),
    ];
    for (var element in items) {
      allitems.add(element);
    }
  }

  @override
  void onInit() {
    initialize();
    getfavoriteProductsItems();
    getCartProductsItems();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.box("favoriteProducts").close();
    Hive.box("CartProducts").close();
    Hive.box("OrderedProducts").close();
  }
}
