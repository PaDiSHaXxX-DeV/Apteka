import 'package:apteka/Models/Cart_model.dart';
import 'package:apteka/Models/drugsModel.dart';
import 'package:apteka/page_3.dart';
import 'package:apteka/page_w.dart';
import 'package:flutter/material.dart';

class Page_3 extends StatefulWidget {
  int uz;
  Page_3({Key? key, required this.uz}) : super(key: key);

  @override
  State<Page_3> createState() => _Page_3State();
}

class _Page_3State extends State<Page_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            child: Row(
              children: [
                const Icon(
                  Icons.notifications_on_outlined,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.shopping_cart_checkout_outlined,
                      color: Colors.black),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.black,
        ),
        title: const Center(
            child: Text(
          "",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
        )),
      ),
      body: FutureBuilder<List<DrugsModel>?>(
        future: getResult,
        builder: (BuildContext context, AsyncSnapshot<List<DrugsModel?>?> oka) {
          if (oka.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (oka.hasError) {
            return Center(child: Text(oka.error.toString()));
          }
          if (oka.hasData) {
            List<DrugsModel?>? drug = oka.data;
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                 const Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    width: 327,
                    height: 157,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: Container(
                        width: 128,
                        height: 128,
                        child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(17)),
                            child: Image.network(
                              "${drug?[widget.uz]?.imageUrl}",
                              scale: 2,
                            ))),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 0, right: 0)),
                      Text(
                        " ${drug?[widget.uz]?.price}-sum",
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 170,
                      ),
                      Text(
                        "${drug?[widget.uz]?.name}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: const [
                      Padding(padding: EdgeInsets.only(left: 40)),
                      Text(
                        "Product Details",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 20),
                    child: Text(
                      "${drug?[widget.uz]?.description}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600]),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.16,
                  ),
                  InkWell(
                    onTap: () {
                      carts?.add(drug?[widget.uz]);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Page_4(ind: widget.uz)),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      child: const Center(
                          child: Text(
                        'Add To Card',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
