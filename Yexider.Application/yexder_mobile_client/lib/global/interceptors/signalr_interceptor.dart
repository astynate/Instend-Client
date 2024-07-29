import 'package:signalr_core/signalr_core.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';

class SignalrInterceptor {
  static final SignalrInterceptor _instance = SignalrInterceptor._internal();
  static const String _baseUrl = "http://192.168.1.63:5000";

  factory SignalrInterceptor() {
    return _instance;
  }

  SignalrInterceptor._internal() {
    // storageHubConnection.on("CreateFolder", SignalrCollectionHandler.createFolder);
  }

  // final storageHubConnection = HubConnectionBuilder().withUrl('$_baseUrl/storage-hub').build();

  Future<void> connect() async {
    // await storageHubConnection.start();
    final connection = HubConnectionBuilder().withUrl('$_baseUrl/storage-hub', 
      HttpConnectionOptions(
        logging: (level, message) => print(message),
        // skipNegotiation: true
      )
    ).build();

    connection.onclose((error) {
      print("!");
    });

    // connection.on

    connection.on("CreateFolder", (object) {
      print("AAAAAAAAAAAAAAAAAAAAAAA");
    });

    await connection.start();

    if (connection.state == HubConnectionState.connected) {
      final token = await secureStorage.read(key: "system_access_token");
      await connection.invoke("Join", args: [token]);
    }
    // SignalR signalR = SignalR(
    //   _baseUrl,
    //   'storage-hub',
    //   hubMethods: ["CreateFolder"],
    //   statusChangeCallback: (status) => print(status),
    //   hubCallback: (methodName, message) => print('MethodName = $methodName, Message = $message'));

    // signalR.connect();
  }
}

SignalrInterceptor signalR = SignalrInterceptor();