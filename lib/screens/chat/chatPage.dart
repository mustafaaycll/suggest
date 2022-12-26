// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:suggest/classes/course.dart';
import 'package:suggest/screens/home/courseDetailPage.dart';
import 'package:suggest/utils/colors.dart';
import 'package:suggest/utils/fonts.dart';
import 'package:suggest/utils/icons.dart';
import 'package:uuid/uuid.dart';

class ChatPage extends StatefulWidget {
  final Course course;
  const ChatPage({super.key, required this.course});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    Course course = widget.course;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        titleSpacing: 0,
        iconTheme: IconThemeData(
          color: AppColors.sabanci,
        ),
        backgroundColor: AppColors.bg,
        title: MainHeaderScroll(course.code, true),
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              pushNewScreen(context, screen: CourseDetails(course: course));
            },
            icon: Icon(
              AppIcons.info,
              color: AppColors.sabanci,
              size: 25,
            ),
          ),
        ],
      ),
      body: Chat(
        theme: CustomChatTheme(course: course),
        messages: _messages,
        onAttachmentPressed: _handleAttachmentPressed,
        onMessageTap: _handleMessageTap,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        user: _user,
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      backgroundColor: AppColors.bg,
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  color: AppColors.bg,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _handleImageSelection();
                    },
                    leading: Icon(
                      CupertinoIcons.photo_camera,
                      color: AppColors.sabanci,
                    ),
                    title: Center(
                      child: Text(
                        "Photo",
                        style: TextStyle(
                          color: AppColors.sabanci,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      CupertinoIcons.doc_text,
                      color: AppColors.bg,
                    ),
                  ),
                ),
                Card(
                  color: AppColors.bg,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _handleFileSelection();
                    },
                    leading: Icon(
                      CupertinoIcons.doc_text,
                      color: AppColors.sabanci,
                    ),
                    title: Center(
                      child: Text(
                        "File",
                        style: TextStyle(
                          color: AppColors.sabanci,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      CupertinoIcons.doc_text,
                      color: AppColors.bg,
                    ),
                  ),
                ),
                Card(
                  color: AppColors.bg,
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    leading: Icon(
                      CupertinoIcons.xmark,
                      color: AppColors.negative,
                    ),
                    title: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: AppColors.negative,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      CupertinoIcons.doc_text,
                      color: AppColors.bg,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? result = await _picker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index = _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage = (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index = _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage = (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List).map((e) => types.Message.fromJson(e as Map<String, dynamic>)).toList();

    setState(() {
      _messages = messages;
    });
  }
}

@immutable
class CustomChatTheme extends ChatTheme {
  final Course course;

  const CustomChatTheme({
    required this.course,
    super.attachmentButtonIcon = const Icon(
      AppIcons.attachment,
      color: AppColors.sabanci,
    ),
    super.attachmentButtonMargin,
    super.backgroundColor = AppColors.bg,
    super.dateDividerMargin = const EdgeInsets.only(
      bottom: 32,
      top: 16,
    ),
    super.dateDividerTextStyle = const TextStyle(
      color: neutral2,
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    super.deliveredIcon,
    super.documentIcon = const Icon(
      CupertinoIcons.doc_text,
      color: AppColors.bg,
    ),
    super.emptyChatPlaceholderTextStyle = const TextStyle(
      color: AppColors.systemGrey,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.errorColor = error,
    super.errorIcon = const Icon(
      AppIcons.error,
      color: AppColors.negative,
    ),
    super.inputBackgroundColor = AppColors.bg,
    super.inputBorderRadius = const BorderRadius.vertical(
      top: Radius.circular(20),
    ),
    super.inputContainerDecoration,
    super.inputMargin = EdgeInsets.zero,
    super.inputPadding = const EdgeInsets.fromLTRB(24, 20, 24, 20),
    super.inputTextColor = AppColors.textBlack,
    super.inputTextCursorColor,
    super.inputTextDecoration = const InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.zero,
      isCollapsed: true,
    ),
    super.inputTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.messageBorderRadius = 15,
    super.messageInsetsHorizontal = 15,
    super.messageInsetsVertical = 15,
    super.primaryColor = AppColors.sabanci,
    super.receivedEmojiMessageTextStyle = const TextStyle(fontSize: 40),
    super.receivedMessageBodyBoldTextStyle,
    super.receivedMessageBodyCodeTextStyle,
    super.receivedMessageBodyLinkTextStyle,
    super.receivedMessageBodyTextStyle = const TextStyle(
      color: AppColors.textBlack,
      fontSize: 14,
      fontWeight: REGULAR,
      height: 1.5,
    ),
    super.receivedMessageCaptionTextStyle = const TextStyle(
      color: AppColors.systemGrey,
      fontSize: 12,
      fontWeight: REGULAR,
      height: 1.333,
    ),
    super.receivedMessageDocumentIconColor = AppColors.sabanci,
    super.receivedMessageLinkDescriptionTextStyle = const TextStyle(
      color: AppColors.textBlack,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.428,
    ),
    super.receivedMessageLinkTitleTextStyle = const TextStyle(
      color: AppColors.textBlack,
      fontSize: 16,
      fontWeight: BLACK,
      height: 1.375,
    ),
    super.secondaryColor = AppColors.systemGreyLightest,
    super.seenIcon,
    super.sendButtonIcon = const Icon(
      AppIcons.send,
      color: AppColors.sabanci,
    ),
    super.sendButtonMargin,
    super.sendingIcon,
    super.sentEmojiMessageTextStyle = const TextStyle(fontSize: 40),
    super.sentMessageBodyBoldTextStyle,
    super.sentMessageBodyCodeTextStyle,
    super.sentMessageBodyLinkTextStyle,
    super.sentMessageBodyTextStyle = const TextStyle(
      color: AppColors.textWhite,
      fontSize: 14,
      fontWeight: REGULAR,
      height: 1.5,
    ),
    super.sentMessageCaptionTextStyle = const TextStyle(
      color: neutral7WithOpacity,
      fontSize: 12,
      fontWeight: REGULAR,
      height: 1.333,
    ),
    super.sentMessageDocumentIconColor = neutral7,
    super.sentMessageLinkDescriptionTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 14,
      fontWeight: REGULAR,
      height: 1.428,
    ),
    super.sentMessageLinkTitleTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 16,
      fontWeight: BLACK,
      height: 1.375,
    ),
    super.statusIconPadding = const EdgeInsets.symmetric(horizontal: 4),
    super.systemMessageTheme = const SystemMessageTheme(
      margin: EdgeInsets.only(
        bottom: 24,
        top: 8,
        left: 8,
        right: 8,
      ),
      textStyle: TextStyle(
        color: neutral2,
        fontSize: 12,
        fontWeight: BLACK,
        height: 1.333,
      ),
    ),
    super.unreadHeaderTheme = const UnreadHeaderTheme(
      color: secondary,
      textStyle: TextStyle(
        color: neutral2,
        fontSize: 12,
        fontWeight: REGULAR,
        height: 1.333,
      ),
    ),
    super.userAvatarImageBackgroundColor = Colors.transparent,
    super.userAvatarNameColors = colors,
    super.userAvatarTextStyle = const TextStyle(
      color: neutral7,
      fontSize: 12,
      fontWeight: BLACK,
      height: 1.333,
    ),
    super.userNameTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: BLACK,
      height: 1.333,
    ),
  });
}
