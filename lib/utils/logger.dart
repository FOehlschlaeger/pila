import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// [AppLogger]
/// 
/// This instance creates a logger instance which can be globally used.
class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  final now = DateTime.now();
  
  File? _logFile;

  AppLogger._internal();

  factory AppLogger() {
    return _instance;
  }

  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final logDir = Directory('${directory.path}/logs');
    if (!await logDir.exists()) {
      await logDir.create(recursive: true);
    }
    _logFile = File('${logDir.path}/${now.year}_${now.month}_${now.day}.txt');
    print(_logFile);
  }

  Future<void> log(String message) async {
    if (_logFile == null) await init();
    
    final timestamp = DateTime.now().toIso8601String();
    final logEntry = "[$timestamp] $message\n";
    
    await _logFile!.writeAsString(logEntry, mode: FileMode.append);
    
    print(logEntry);
  }
}

/// [log]
/// 
/// Set global function for usage without the need for instanciating.
/// 
/// Example usage in code:
/// ```dart
/// import 'package:pila/utils/logger.dart';
/// 
/// log("here comes the message to log")
/// ```
Future<void> log(String message) async {
  await AppLogger().log(message);
}
