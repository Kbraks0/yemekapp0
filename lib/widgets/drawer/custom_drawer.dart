import 'package:button_animations/button_animations.dart';
import 'package:button_animations/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app_for_internship/constants/drawer/text_styles.dart';
import 'package:food_app_for_internship/screens/graphic_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.grey.shade800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height / 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    buildPartTitle(true, "Bilgilerim", 0),
                    IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.grey.shade200,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height / 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/pp_ls.jpg"),
                  radius: 55,
                ),
                buildInfoTitle("Kübra Kuş", Colors.white, 10),
                buildInfoTitle("Selçuk Üniversitesi", Colors.white, 2),
                buildInfoTitle("Yönetim Bilişim Sistemleri", Colors.white, 2),
                SizedBox(
                  width: MediaQuery.of(context).size.height / 15,
                ),
                buildInfoTitle("Bana Ulaşın", Colors.white, 50),
                SizedBox(
                  width: MediaQuery.of(context).size.height / 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSocialMediaIcon(
                        FontAwesomeIcons.linkedin,
                        Color(0xFF49659F),
                        "https://www.linkedin.com/in/k%C3%BCbra-k-7797811b4/",
                        false),
                    buildSocialMediaIcon(
                        FontAwesomeIcons.github,
                        Color(0xFF212121),
                        "https://github.com/Kbraks0",
                        false),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildPartTitle(false, "App Bilgileri", 15),
                SizedBox(height: MediaQuery.of(context).size.height/150,),
              SizedBox(height: MediaQuery.of(context).size.height/150),
              AnimatedButton(
                onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LineChartSample2()));
                },
                type: PredefinedThemes.successOutline,
                child: Text("Grafik Göster ")
              ),
                AnimatedButton(
                    onTap: () {
                      launch(mailToError.toString());
                    },
                    type: PredefinedThemes.successOutline,
                    child: buildPartTitle(false, "Sorularınızı iletin",0)
                ),
              SizedBox(height: MediaQuery.of(context).size.height/150),
              Card(
                elevation: 10,
                color: Colors.grey.shade300,
                child: Text(
                  "Tüm Hakları Bende Saklıdır",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      letterSpacing: 1,
                      wordSpacing: 2),
                  textAlign: TextAlign.center,
                ),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildSocialMediaIcon(
      IconData type, Color color, String url, bool isMail) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AnimatedButton(
        child: Icon(
          type,
          color: Colors.white,
          size: 25,
        ),
        onTap: () {
          if (isMail)
            launch(emailLaunchUri.toString());
          else {
            launchURL(url);
          }
        },
        type: null,
        height: 45,
        width: 45,
        borderRadius: 22.5,
        color: color,
      ),
    );
  }

  Padding buildPartTitle(bool isGreen, String text, double topMargin) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin),
      child: Text(
        text,
        style: isGreen
            ? TextStyleConstants.instance.partTitleStyle
                .copyWith(color: Colors.green.shade200)
            : TextStyleConstants.instance.partTitleStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Padding buildInfoTitle(String text, Color color, double topMargin) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin),
      child: Text(
        text,
        style: TextStyleConstants.instance.appInfoTitleStyle
            .copyWith(color: color),
        textAlign: TextAlign.center,
      ),
    );
  }

  Padding buildInfoDescription(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Text(
        text,
        style: TextStyleConstants.instance.appInfoTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '$url Adresi Açılamadı.';
    }
  }

  final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'kbrakus6@gmail.com',
      queryParameters: {'subject': 'Uygulamanız\bÜzerinden\bSize\bUlaşıyorum'});

  final Uri mailToError = Uri(
      scheme: 'mailto',
      path: 'kbrakus6@gmail.com',
      queryParameters: {'subject': 'CBG\bApp\bHata\bÖneri\bBildirme'});

}
