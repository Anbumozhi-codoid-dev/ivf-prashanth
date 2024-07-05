import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';


import '../../Utils/AllImports.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  final storyController = StoryController();
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
            
                Stack(
            
                  children:[
            
            
            
            
            
                    Column(
                      children: [
            

                        Container(
                          height: 93.2.h,
                          child: StoryView(
                            indicatorColor: AppTheme.themePink,
                            storyItems: [
                              StoryItem.text(
                                title: "First Story",
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                              StoryItem.text(
                                title: "Second Story",
                                backgroundColor: Colors.red,
                                textStyle: TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                              StoryItem.pageImage(
                                url:
                                "https://media0.giphy.com/media/l0MYwvp2YnfOQfeNy/giphy.gif?cid=ecf05e47c8b5980e5daa414882c318f5c1079fbd7361b90a&rid=giphy.gif",
                                caption: Text("Happy"),
                                controller: storyController,
                              ),
                              StoryItem.pageImage(
                                  url:
                                  "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
                                  caption: Text("Image"),
                                  controller: storyController),
            
                              StoryItem.pageImage(
                                url:
                                "https://media.tenor.com/images/7ce1d61932ac230f37470e38e6a48720/tenor.gif",
                                caption: Text("Funny"),
                                controller: storyController,
                              ),
                              StoryItem.pageVideo(
                                  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                                  controller: storyController,


                              )
            
                            ],
                            onStoryShow: (s, index) {
                              print("Showing a story");
                            },
                            onComplete: () {
                              print("Completed a cycle");
                            },
                            progressPosition: ProgressPosition.bottom
                            ,
                            repeat: false,
                            controller: storyController,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,

                      child:

                    Container(
                      height: 13.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                          color: AppTheme.themePink,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60))),
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(0,2.h,0,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Image.asset(AppConstants.leftArrowSquare, scale: 3.6,)),
                            Container(
                              width: 60.w,
                              child: CommonUI().myText(
                                  text:
                                  "5 Best diet ideas during IVF Treatment",
                                  color: AppTheme.white,
                                  fontSize: 16.sp,
                                  overflow: TextOverflow.visible,
                                  maxLines: 2,
                                  fontfamily: "Nunito",
                                  fontWeight: FontWeight.w500),
                            ),
                            Gap(10.w)
                          ],
                        ),
                      ),
                    ),
                    ),
                    Positioned(
                      top: 81.h,
                        child:
                        Padding(
                          padding:  EdgeInsets.fromLTRB(2.w,0,0,0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              CommonUI().myText(text: "Fish Gravy",
                              color: AppTheme.white,
                                fontfamily: "Nunito",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,

                              ),
                              Gap(0.3.h),
                              Container(
                                width: 80.w,
                                height: 25.h,
                                child: CommonUI().myText(text: "Fish is rich in iron, protein and Omega-3 fatty acids.........",
                                color: AppTheme.white,
                                  fontSize: 11.sp,
                                  maxLines: 3,
                                  fontfamily: "Nunito",
                                  fontWeight: FontWeight.w500,

                                ),
                              ),
                            ],
                          ),
                        )

                    )
            ]
            
                ),
              ],
            ),
          ),
        ),
      );
  }
}
