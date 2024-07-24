import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/models/handlers/convert_handler.dart';
import 'package:yexder_mobile_client/services/cloud/state/user_state.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  Uint8List get avatar => base64Decode(userState.user?.avatar ?? "");
  Uint8List get header => base64Decode(userState.user?.header ?? "");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.memory(
                      header,
                      width: MediaQuery.of(context).size.width,
                      height: 110,
                      fit: BoxFit.cover,
                    )
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Image.memory(
                            avatar,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userState.user?.nickname ?? "",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 21,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                            Text(
                              '${userState.user?.name} ${userState.user?.surname}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Text(
                              '${userState.user?.balance?.toInt()}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' Tokens',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '   ${userState.user?.friendCount}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' Friends',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '   ${ConvertHandler.convertBytesToMB(userState.user?.storageSpace ?? 0)}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' MB',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]
                        )
                      ),
                    ],
                  ),
                ]
              ),
            ),
          )
        ]
      ),
    );
  }
}