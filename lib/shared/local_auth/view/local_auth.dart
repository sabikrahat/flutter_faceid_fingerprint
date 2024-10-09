import 'package:flutter/material.dart';
import '../provider/local_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/constants.dart';
import '../../../utils/extensions/extensions.dart';
import '../../riverpod/helper.dart';

class LocalAuthWidget extends ConsumerWidget {
  const LocalAuthWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(localAuthFuturePd).when(
        loading: () => Scaffold(body: riverpodLoading()),
        error: (e, s) => Scaffold(body: riverpodError(e, s)),
        data: (isAuthenticated) {
          return isAuthenticated
              ? child
              : Scaffold(
                  body: Center(
                    child: SizedBox(
                      width: 500.0,
                      child: Column(
                        mainAxisSize: mainMin,
                        children: [
                          const Icon(
                            Icons.security,
                            color: Colors.red,
                            size: 150.0,
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            'Authentication Required',
                            style: context.text.titleLarge,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Please authenticate to continue. This app uses biometric authentication to secure your data.',
                            style: context.text.bodyLarge!.copyWith(
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        });
  }
}
