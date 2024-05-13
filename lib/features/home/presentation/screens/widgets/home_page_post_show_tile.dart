import 'package:flutter/material.dart';
import 'package:inno_net_app/core/extensions/screen_size_extension.dart';

/// [HomePagePostsShowTile] is a class that is used to display the home page post show tile.
/// this widget is responsible for displaying the post show tile on the home page.
/// this widget includes the profile image, profile name, post image, post description, post like, post comment, post share, and post save.
class HomePagePostsShowTile extends StatelessWidget {
  const HomePagePostsShowTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(left: 5, bottom: 5),

                // specify width to make it an oval, remove for a circle
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  // color: Colors.red,
                  shape: BoxShape.circle, // this makes it round
                ),
                child: const ClipOval(
                    // child: profileDetails['image'].isEmpty
                    //     ? Container(
                    //         color: const Color.fromARGB(255, 183, 175, 175),
                    //         child: SvgPicture.asset(
                    //             "assets/avua-pool/defaultImage.svg"))
                    //     : CachedNetworkImage(
                    //         imageUrl: profileDetails['image'],
                    //         fit: BoxFit.fill,
                    //       ),
                    )),
            5.w,
            Text(
              'InnoNet',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            const Icon(
              Icons.more_vert,
              size: 30,
            ),
          ],
        ),
        5.h,
        Container(
          height: 400,
          color: Colors.red,
        ),
      ],
    );
  }
}
