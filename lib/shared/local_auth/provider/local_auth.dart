import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/local_auth.dart';

final localAuthFuturePd =
    FutureProvider<bool>((_) async => await LocalAuth.authenticate());
