// ignore_for_file: camel_case_types

import 'package:clothing_app/Model/productmodel.dart';

import 'package:get/get.dart';

class allproductcontroller extends GetxController {
  RxList<Product> allitems = <Product>[].obs;
  RxList<Product> cartitem = <Product>[].obs;
  RxList<Product> favoriteItems = <Product>[].obs;
  RxList<List<Product>> orders = <List<Product>>[].obs;

  additemtofavorite(Product product) {
    favoriteItems.add(product);
  }

  removeitemfromfavorite(int index) {
    favoriteItems.removeAt(index);
  }

  additemtocart(Product product) {
    cartitem.add(product);
  }

  removeitemfromcart(int index) {
    cartitem.removeAt(index);
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
    super.onInit();
  }
}