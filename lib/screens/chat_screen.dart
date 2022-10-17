import 'package:chatapp/models/models.dart';
import 'package:chatapp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme.dart';
import 'screens.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessageData data) => MaterialPageRoute(
        builder: (context) => ChatScreen(
          messageData: data,
        ),
      );
  const ChatScreen({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0.2,
        iconTheme: Theme.of(context).iconTheme,
        leading: CupertinoButton(
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.grey,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: _ChatAppBarTitle(
          messageData: messageData,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.video_camera_solid,
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.phone_fill,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: _MessageList(),
          ),
          SafeArea(
            top: false,
            bottom: true,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: _ActionBar(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatAppBarTitle extends StatelessWidget {
  const _ChatAppBarTitle({super.key, required this.messageData});

  final MessageData messageData;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(url: messageData.profilePic),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageData.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                'Online now',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        reverse: true,
        children: const [
          _MessageContent(
            message: 'Alo đang ở đâu vậy, dạo này ',
            messageDate: '12:30 PM',
          ),
          _MessageOwnContent(
              message: 'Tao không khỏe đó, rồi sao !qkheqkwheqhwekekjqwhe',
              messageDate: '12:30 PM'),
          _MessageContent(
            message: 'Alo đang ở đâu vậy, dạo này khỏe không? dkáhdkahdksad',
            messageDate: '12:30 PM',
          ),
          _MessageOwnContent(
              message: 'Tao không khỏe đó, rồi sao!', messageDate: '12:30 PM'),
          _MessageContent(
            message: 'Alo đang ở đâu vậy, dạo này khỏe không? dkáhdkahdksad',
            messageDate: '12:30 PM',
          ),
          _MessageOwnContent(
              message: 'Tao không khỏe đó', messageDate: '12:30 PM'),
          _MessageContent(
            message: 'Alo đang ở đâu vậy, dạo này khỏe không? dkáhdkahdksad',
            messageDate: '12:30 PM',
          ),
          _MessageOwnContent(
              message: 'Tao không khỏe đó, rồi sao!', messageDate: '12:30 PM'),
          _MessageContent(
            message: 'Alo đang ở đâu vậy, dạo này khỏe không? dkáhdkahdksad',
            messageDate: '12:30 PM',
          ),
          _MessageOwnContent(
              message: 'Tao không khỏe đó', messageDate: '12:30 PM'),
          _DateLable(
            lable: 'Yesterday',
          ),
        ],
      ),
    );
  }
}

class _DateLable extends StatelessWidget {
  const _DateLable({super.key, required this.lable});

  final String lable;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Text(
              lable,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textFaded,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageContent extends StatelessWidget {
  const _MessageContent({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  final double _radius = 26;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: width * 0.7,
                  minWidth: 0,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_radius),
                    topRight: Radius.circular(_radius),
                    bottomRight: Radius.circular(_radius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15),
                  child: Text(
                    message,
                    style: const TextStyle(
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Container(),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                messageDate,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MessageOwnContent extends StatelessWidget {
  const _MessageOwnContent({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  static const double _radius = 26;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: width * 0.6,
                  minWidth: 0,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_radius),
                    topRight: Radius.circular(_radius),
                    bottomLeft: Radius.circular(_radius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 15),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: AppColors.textLigth,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                messageDate,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 1,
                style: const TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type message...',
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                    ),
                    // color: AppColors.cardLight,
                    onPressed: () {
                      Navigator.of(context).push(CameraScreen.route());
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.attach_file,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (builder) => bottomPopup());
                    },
                    // color: AppColors.cardLight,
                  ),
                ),
              ),
            ),
          ),
        ),
        // Container(
        //   decoration: BoxDecoration(
        //     border: Border(
        //       right:
        //           BorderSide(width: 2, color: Theme.of(context).dividerColor),
        //     ),
        //   ),
        //   child: const Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16.0),
        //     child: Icon(
        //       CupertinoIcons.camera_fill,
        //     ),
        //   ),
        // ),
        // const Expanded(
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 16),
        //     child: TextField(
        //       style: TextStyle(
        //         fontSize: 14,
        //       ),
        //       decoration: InputDecoration(
        //         hintText: 'Type message...',
        //         border: InputBorder.none,
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: Ink(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accent,
            ),
            child: IconButton(
              icon: const Icon(Icons.send_rounded),
              color: Colors.white,
              splashColor: AppColors.accent,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}

Widget bottomPopup() {
  return SizedBox(
    height: 300,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ActionIcon(
                  icon: Icons.insert_drive_file,
                  color: Colors.indigo,
                  title: "Document"),
              ActionIcon(
                  icon: Icons.camera_alt_rounded,
                  color: Colors.pink,
                  title: "Camera"),
              ActionIcon(
                  icon: Icons.insert_photo,
                  color: Colors.purple,
                  title: "Gallery"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ActionIcon(
                  icon: Icons.headphones, color: Colors.orange, title: "Audio"),
              ActionIcon(
                  icon: Icons.location_pin,
                  color: Colors.greenAccent,
                  title: "Location"),
              ActionIcon(
                  icon: Icons.people_alt_rounded,
                  color: Colors.blue,
                  title: "Contact"),
            ],
          ),
        ],
      ),
    ),
  );
}
