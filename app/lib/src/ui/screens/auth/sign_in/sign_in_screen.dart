import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tyrion/src/store/constants/assets.dart';
import 'package:tyrion/src/store/states/firebase_config/firebase_config_provider.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class SignInScreen extends HookConsumerWidget {
  final void Function(UserCredential) onComplete;

  const SignInScreen({
    super.key,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> isLoading = useState(false);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: Padding(
              padding: AppTheme.dl.sys.dimension.space.edge,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                          height: AppTheme.dl.sys.dimension.baseDimension * 10),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox.square(
                            dimension: constraints.maxWidth -
                                AppTheme.dl.sys.dimension.baseDimension * 20,
                            child: Image.asset(
                              AppAssets.tabletCheckRobot,
                              fit: BoxFit.scaleDown,
                              color: Theme.of(context).colorScheme.surface,
                              colorBlendMode: BlendMode.hue,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                          height: AppTheme.dl.sys.dimension.baseDimension * 4),
                      Text(
                        'Welcome back!',
                        style: AppTheme.dl.sys.typography.headingLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: AppTheme.dl.sys.dimension.baseDimension * 6),
                      Text(
                        'It seems I need to ensure you are who you say you are. Just a precaution.',
                        style: AppTheme.dl.sys.typography.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              AppTheme.dl.sys.dimension.baseDimension * 4,
                        ),
                        child: !(isLoading.value)
                            ? ElevatedButton(
                                onPressed: () async {
                                  isLoading.value = true;

                                  try {
                                    FirebaseAuth firebaseAuth = ref
                                        .read(firebaseConfigStateProvider)
                                        .valueOrNull!
                                        .firebaseAuth!;

                                    String? idToken;

                                    // TODO: Google One Tap Sign In - Needs PR #6 to be merged
                                    // if (defaultTargetPlatform ==
                                    //     TargetPlatform.android) {
                                    //   // Your Web Client Id
                                    //   const String webClientId =
                                    //       '341937295454-c5es0jhupbnkoni9078fhl87njmfine7.apps.googleusercontent.com';

                                    //   var result =
                                    //       await GoogleOneTapSignIn.startSignIn(
                                    //           webClientId: webClientId);

                                    //   idToken = result?.idToken as String;
                                    // } else {
                                    final GoogleSignInAccount? googleUser =
                                        await GoogleSignIn().signIn();

                                    final GoogleSignInAuthentication?
                                        googleAuth =
                                        await googleUser?.authentication;

                                    idToken = googleAuth?.idToken;
                                    // }

                                    if (idToken == null) {
                                      isLoading.value = false;
                                      return;
                                    }

                                    final OAuthCredential credential =
                                        GoogleAuthProvider.credential(
                                      idToken: idToken,
                                    );

                                    UserCredential userCredential =
                                        await firebaseAuth
                                            .signInWithCredential(credential);

                                    onComplete(userCredential);
                                  } catch (e) {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        'Something went wrong. Please try again later.',
                                      ),
                                    ));
                                    if (kDebugMode) {
                                      print(e);
                                    }
                                  }

                                  isLoading.value = false;
                                },
                                child: Text('Sign In With Google'),
                              )
                            : SizedBox.square(
                                dimension:
                                    AppTheme.dl.sys.dimension.baseDimension *
                                        10,
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
