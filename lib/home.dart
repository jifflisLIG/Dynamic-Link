import 'package:clipboard/clipboard.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String loginLink = 'Unavailable';
  String profileLink = 'Unavailable';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDynamicLinks();
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;

      if (deepLink != null) {
        Navigator.pushNamed(context, deepLink.path);
      }
    }, onError: (OnLinkErrorException e) async {
      print(e.message);
    });

    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }

  Future<void> _createDynamicLink(String type) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: 'https://jeffligdynamic.page.link',
        link: Uri.parse('https://jeffligdynamic.page.link/$type'),
        androidParameters: AndroidParameters(
            packageName: 'com.cody.dynamic_link',
            minimumVersion: 0,
            fallbackUrl: Uri.parse(
                'https://play.google.com/store/apps/details?id=com.cody.dynamic_link')),
        dynamicLinkParametersOptions: DynamicLinkParametersOptions(
          shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
        ),
        iosParameters: IosParameters(
            bundleId: 'com.cody.dynamicLink',
            minimumVersion: '0',
            fallbackUrl: Uri.parse('www.google.com')),
        socialMetaTagParameters: SocialMetaTagParameters(
            description: "This is a simple description of your $type screen",
            title: "This is a $type title"));


    final ShortDynamicLink shortLink = await parameters.buildShortLink();
    Uri url = shortLink.shortUrl;


    print(url.toString());
    setState(() {
      if(type=='login'){
        loginLink = url.toString();
      }else{
        profileLink = url.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          FlatButton(
            color: Colors.red,
            onPressed: () {
              _createDynamicLink('login');
            },
            child: Text(
              'Generate Login Link',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            loginLink,
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
              icon: Icon(Icons.copy),
              onPressed: () {
                FlutterClipboard.copy(loginLink).then((value) => Toast.show(
                    "Copied on clipboard!", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM));
              }),
          SizedBox(
            height: 50,
          ),
          FlatButton(
            color: Colors.red,
            onPressed: () {
              _createDynamicLink('profile');
            },
            child: Text(
              'Generate Profile Link',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            profileLink,
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
          IconButton(
              icon: Icon(Icons.copy),
              onPressed: () {
                FlutterClipboard.copy(profileLink).then((value) => Toast.show(
                    "Copied on clipboard!", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM));
              }),
        ],
      ),
    ));
  }
}
