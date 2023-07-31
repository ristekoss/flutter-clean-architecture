import 'package:flutter/material.dart';
import 'package:boilerplate/features/main/domain/models/user.dart';

import '../../../../design/constants/text_style.dart';

class ItemCard extends StatelessWidget {
  final VoidCallback onTap;
  final User user;
  const ItemCard({Key? key, required this.onTap, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.1))
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(user.imageUrl),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(width: 18,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: AppTextStyle.headline3,),
                Text(user.email, style: AppTextStyle.extraSmall,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
