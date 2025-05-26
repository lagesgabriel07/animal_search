import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  bool temMensagensNovas = true; // Simulação

  @override
  void initState() {
    super.initState();
    _checkNewMessages();
  }

  Future<void> _checkNewMessages() async {
    if (temMensagensNovas) {
      await NotificationService.instance.showNewMessageNotification();
      await NotificationService.instance.scheduleMessageReminder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensagens'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          temMensagensNovas 
              ? 'Você tem novas mensagens!' 
              : 'Nenhuma mensagem nova',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}