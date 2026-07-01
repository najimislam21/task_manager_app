import 'package:flutter/material.dart';
import 'package:task_manager/utils/app_colors.dart';

class TmAppbar extends StatelessWidget implements PreferredSize {
  const TmAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.PColor,
      title: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('https://plain-apac-prod-public.komododecks.com/202606/24/arlE5kQEPzRM4MZlvmnm/image.png'),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Md Najim Islam', style:Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white
              ),),
              Text('najimislameng@gmail.com', style:Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white),),
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}