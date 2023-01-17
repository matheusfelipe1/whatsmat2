import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUtils {
  showAlertOk(String title, String msg, VoidCallback func, BuildContext context) {
    final size = MediaQuery.of(context).size;
    showCupertinoModalPopup(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: SizedBox(
              height: size.height * .7,
              width: size.width * .9,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(title, style: const TextStyle(fontSize: 18, color: Colors.black),),
                    ),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Center(
                      child: Text(msg, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, color: Colors.black)),
                    ),
                    SizedBox(
                      height: size.height * .3,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: func,
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: size.height * .01),
                          width: size.width * .8,
                          height: size.height * .08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 89, 180, 254),
                                Color.fromARGB(255, 221, 221, 221)
                              ])),
                          child: const Center(
                              child: Text(
                            'OK',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
