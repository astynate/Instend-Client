import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/models/handlers/convert_handler.dart';
import 'package:yexder_mobile_client/global/models/storage/file.dart';

class FileView extends StatelessWidget {
  final FileModel file;

  const FileView({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {  },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: 
                  (file.fileAsBytes != null) ?
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.memory(
                        file.fileAsBytes ?? Uint8List(0),
                        fit: BoxFit.contain,
                      ),
                    ) : AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        color: Theme.of(context).colorScheme.onPrimary,
                        child: Center(
                          child: Text(
                            file.type ?? "none",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ),
                    )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              (file.name?.length ?? 0) > 7 ? '${file.name?.substring(0, 7)}...' : file.name ?? "Noname",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 14.0,
                fontWeight: FontWeight.w800
              ),
            ),
          ),
          Text(
            ConvertHandler.convertDatetimeToAmericanFormat(file.lastEditTime ?? DateTime.now()),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 10.0,
              fontWeight: FontWeight.w300
            ),
          )
        ],
      ),
    );
  }
}