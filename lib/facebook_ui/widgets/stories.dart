import 'package:flutter/material.dart';
import 'package:myapp/facebook_ui/config/palette.dart';

import 'package:myapp/facebook_ui/models/models.dart';
import 'package:myapp/facebook_ui/widgets/widgets.dart';

class Stories extends StatelessWidget {
  final User? currentUser;
  final List<Story>? stories;

  const Stories({
    Key? key,
    @required this.currentUser,
    @required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color:Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 10.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories!.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories![index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool? isAddStory;
  final User? currentUser;
  final Story? story;
  const _StoryCard({
    Key? key,
    this.isAddStory = false,
    this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            isAddStory! ? currentUser?.imageUrl ?? "" : story?.imageUrl ?? "",
            width: 110.0,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 110.0,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: Responsive.isDesktop(context) ? const [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 4.0),] : null
              ),
          
        ),
        Positioned(
          child: isAddStory!
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    iconSize: 30.0,
                    color: Palette.facebookBlue,
                  ),
                )
              : ProfileAvatar(
                  imageUrl: story?.user?.imageUrl ?? "",
                  hasBorder: !story!.isViewed!),
          top: 8.0,
          left: 8.0,
        ),
        Positioned(
          child: Text(
            isAddStory! ? "Add to Story" : story!.user!.name!,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
        )
      ],
    );
  }
}
