import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/models/handlers/convert_handler.dart';
import 'package:yexder_mobile_client/global/models/storage/collection.dart';
import 'package:yexder_mobile_client/services/cloud/state/storage_state.dart';

class CollectionView extends StatelessWidget {
  final CollectionModel collection;

  const CollectionView({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        storageState.fetchFolder(collection.id);
      },
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
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              collection.name ?? "Noname",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 14.0,
                fontWeight: FontWeight.w800
              ),
            ),
          ),
          Text(
            ConvertHandler.convertDatetimeToAmericanFormat(collection.creationTime ?? DateTime.now()),
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