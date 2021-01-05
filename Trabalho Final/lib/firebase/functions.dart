import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

getCurrentUserId() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User user = auth.currentUser;
  final uid = user.uid;
  return uid;
}

abrirUrlFacebook() async {
  const url = 'https://www.facebook.com/cursinhocomunitariopimentascp';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

abrirUrlYoutube() async {
  const url = 'https://www.youtube.com/user/cursinhopimentas';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
