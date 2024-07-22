import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/services/cloud/elements/avatar/avatar.dart';
import 'package:yexder_mobile_client/services/proxy/pages/authorization/authorization.dart';

class ExistingAccount extends StatelessWidget {
  final UserModel user;

  const ExistingAccount({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () async { 
        await secureStorage.write(key: "system_access_token", value: user.systemAccessToken);
        await secureStorage.write(key: "system_refresh_token", value: user.systemRefreshToken);

        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AuthorizationPage()),
            (Route<dynamic> route) => false,
          );
        }
      },
      child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            AvatarElement(
              base64String: user.avatar ?? "",
              size: const Size(60, 60),
              borderRadius: 8.0
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nickname ?? "Anonymus user",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700
                    )
                  ),
                  Text(
                    '${user.name} ${user.surname}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(
                "assets/main/global/next.svg",
                height: 20,
                width: 20,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}