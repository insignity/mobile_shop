import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';

List<Widget> detailsWidget(ProductEntity productEntity) {
  return [
    Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text(
                'Shop',
                style: Style.txt20,
              ),
              Container(
                width: 86,
                decoration: const BoxDecoration(
                    border:
                        Border.fromBorderSide(BorderSide(color: Clr.orange))),
              )
            ],
          ),
          const Text(
            'Details',
            style: Style.txt20opacity50,
          ),
          const Text(
            'Features',
            style: Style.txt20opacity50,
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 33.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset('assets/icons/cpu.png'),
              const SizedBox(
                height: 5,
              ),
              Text(productEntity.cpu, style: Style.txtGrey11)
            ],
          ),
          Column(
            children: [
              Image.asset('assets/icons/camera.png'),
              const SizedBox(
                height: 5,
              ),
              Text(productEntity.camera, style: Style.txtGrey11)
            ],
          ),
          Column(
            children: [
              Image.asset('assets/icons/ssd.png'),
              const SizedBox(
                height: 5,
              ),
              Text(productEntity.ssd, style: Style.txtGrey11)
            ],
          ),
          Column(
            children: [
              Image.asset('assets/icons/sd.png'),
              const SizedBox(
                height: 5,
              ),
              Text(productEntity.sd, style: Style.txtGrey11)
            ],
          ),
        ],
      ),
    )
  ];
}
