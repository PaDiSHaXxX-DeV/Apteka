import 'dart:ui';

import 'package:apteka/Models/Cart_model.dart';
import 'package:apteka/page_w.dart';
import 'package:flutter/material.dart';

import 'Models/drugsModel.dart';

class Page_4 extends StatefulWidget {
  int ind;
  Page_4({super.key, required this.ind});

  @override
  State<Page_4> createState() => _Page_4State();
}

class _Page_4State extends State<Page_4> {
  int opshe = 1;
  int? pull = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Your cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
            pull = drug?[widget.ind]?.price;

            return Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: carts!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          top: 0, left: 8, right: 10, bottom: 0),
                      width: double.infinity,
                      height: 200,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${carts!.elementAt(index)!.imageUrl}"),
                                        fit: BoxFit.cover)),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "${carts!.elementAt(index)!.name}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white),
                                        child: InkWell(
                                          onTap: () {
                                            // Navigator.pop(context);
                                          },
                                          child: const Center(
                                            child: Icon(
                                              Icons.clear,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "\$ ${carts!.elementAt(index)!.price}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 115,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFF2F4FF),
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Color(0xFFDFE3FF)),
                                              child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      carts!
                                                              .elementAt(index)!
                                                              .count +
                                                          1;
                                                    });
                                                  },
                                                  child: const Center(
                                                      child: Text(
                                                    "-",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                  ))),
                                            ),
                                            Text(
                                              "${carts!.elementAt(index)!.count}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 26),
                                            ),
                                            Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: const Color(0xFFA0ABFF),
                                              ),
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    carts!
                                                            .elementAt(index)!
                                                            .count +
                                                        1;
                                                  });
                                                },
                                                child: const Center(
                                                  child: Text(
                                                    "+",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
//  Container(
//                                 width: 327,
//                                 height: 53,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(56),
//                                   color: Color(0xFF4157FF),
//                                 ),
//                                 child: Center(
//                                     child: Text(
//                                   "Place Order ${opshe > 0 ? (pull! * opshe) : 0}-So`m",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w400),
//                                 )),
//                               )
                            