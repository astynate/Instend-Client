import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';
import 'package:yexder_mobile_client/global/models/handlers/gallery_handler.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/global/models/system/error.dart';
import 'package:yexder_mobile_client/global/models/system/validate_handler.dart';
import 'package:yexder_mobile_client/services/account/api/create/create_account_requests_api.dart';
import 'package:yexder_mobile_client/services/account/elements/inputs/simple/account_simple_input.dart';
import 'package:yexder_mobile_client/services/cloud/pages/settings/layout/settings.dart';
import 'package:yexder_mobile_client/services/cloud/state/user_state.dart';

class SettingsAccountPage extends StatefulWidget {
  const SettingsAccountPage({super.key});

  @override
  State<SettingsAccountPage> createState() => _SettingsAccountPageState();
}

class _SettingsAccountPageState extends State<SettingsAccountPage> {
  String? name;
  String? surname;
  String? nickname;
  Uint8List avatar = Uint8List(0);
  Uint8List header = Uint8List(0);
  bool isLoading = false; 

  void setDefault() {
    name = userState?.user?.name;
    surname = userState?.user?.surname;
    nickname = userState?.user?.nickname;
    avatar = base64Decode(userState?.user?.avatar ?? "");
    header = base64Decode(userState?.user?.header ?? "");
  }

  _SettingsAccountPageState() {
    setDefault();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsLayout(
      discard: () {
        setState(() {
          setDefault();
        });
      },
      save: () async {
        if (ValidateHandler.validateString(name, 20) == false) {
          applicationState.showAttentionMessage(context, "Invalid name"); return;
        }

        if (ValidateHandler.validateString(surname, 20) == false) {
          applicationState.showAttentionMessage(context, "Invalid surname"); return;
        }

        if (ValidateHandler.validateString(nickname, 20) == false) {
          applicationState.showAttentionMessage(context, "Invalid nickname"); return;
        }
        
        setState(() {
          isLoading = true;
        });

        String avatarAsBase64 = base64Encode(avatar);
        String headerAsBase64 = base64Encode(header);

        final result = await AccountAPI.updateAccount(name, surname, nickname, avatarAsBase64, headerAsBase64);

        setState(() {
          isLoading = false;
        });

        if (result.isFailure || (result.isSuccess && result.getValue()?.statusCode != 200) && context.mounted) {
          applicationState.showError(context, YexiderSystemError('Attention!', result.error));
          setState(() {
            setDefault();
          });
        } else {
          if (userState.user != null) {
            final user = UserModel.fromMap(userState.user!.toJson());
            
            user.name = name;
            user.surname = surname;
            user.nickname = nickname;
            user.avatar = avatarAsBase64;
            user.header = headerAsBase64;

            userState.setUser(user);
            applicationState.showAttentionMessage(context, "Your profile has been updated!");
          }
        }
      },
      title: "Account", 
      isLoading: isLoading,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector (
              onTap: () async {
                File? file = await GalleryHandler.pickImage();

                setState(() {
                  if (file != null) {
                    header = file.readAsBytesSync();
                  }
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(
                    header,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 125,
                    fit: BoxFit.cover,
                  )
              )
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: GestureDetector (
                  onTap: () async {
                    File? file = await GalleryHandler.pickImage();

                    setState(() {
                      if (file != null) {
                        avatar = file.readAsBytesSync();
                      }
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.memory(
                      avatar,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    )
                  )
                ),
              ),
            ),
            AccountSimpleInput(
              placeholder: "Name",
              defaultValue: name,
              onChanged: (String string) {
                setState(() {
                  name = string;
                });
              }
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: AccountSimpleInput(
                placeholder: "Surname",
                defaultValue: surname, 
                onChanged: (String string) {
                  setState(() {
                    surname = string;
                  });
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: AccountSimpleInput(
                placeholder: "Nickname",
                defaultValue: nickname, 
                onChanged: (String string) {
                  setState(() {
                    nickname = string;
                  });
                }
              ),
            )
          ],
        ),
      )
    );
  } 
}