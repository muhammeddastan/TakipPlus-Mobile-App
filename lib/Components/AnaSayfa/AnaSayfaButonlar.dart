// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';

SingleChildScrollView AnasayfaButonlar() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Container(
              height: 180,
              width: 200,
              decoration: BoxDecoration(
                  color: Renkler.Green, borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Container(
              height: 180,
              width: 200,
              decoration: BoxDecoration(
                  color: Renkler.Green, borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Container(
              height: 180,
              width: 200,
              decoration: BoxDecoration(
                  color: Renkler.Green, borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
            child: Container(
              height: 180,
              width: 200,
              decoration: BoxDecoration(
                  color: Renkler.Green, borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ],
      ),
    ),
  );
}
