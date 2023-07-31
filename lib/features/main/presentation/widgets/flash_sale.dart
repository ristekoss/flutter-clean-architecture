import 'package:flutter/material.dart';

import '../../../../design/constants/colors.dart';
import '../../../../design/constants/text_style.dart';

class FlashSale extends StatelessWidget {
  final int timeLeft;
  const FlashSale({Key? key, this.timeLeft = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(timeLeft == 0){
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Flash Sale $timeLeft', style: AppTextStyle.appBar.copyWith(color: AppColors.primary),),
        SizedBox(
          height: 200,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 180,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
        ),


      ],
    );
  }
}
