import 'package:flutter/material.dart';

@immutable
class MessageData {
  const MessageData({
    required this.senderName,
    required this.message,
    required this.messageDate,
    required this.date,
    required this.profilePic,
  });
  final String senderName;
  final String message;
  final DateTime messageDate;
  final String date;
  final String profilePic;
}
