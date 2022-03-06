
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


String schoolName = "Landmark University";
String title = "About App";
String imageAboutApp = "assets/images/lu_image_graduation.jpeg";
String schoolAlmanac = "$schoolName Almanac, 2021";
String developerWebsite = "https://icdatinnovations.com/";

String googlePlayServicesPolicyWebsite = "https://play.google.com/about/privacy-security-deception/";
String googleAnalyticsFirebasePolicyWebsite = "https://firebase.google.com/policies/analytics/";
String firebaseCrashlyticsPolicyWebsite = "https://firebase.google.com/support/privacy/";
String facebookPolicyWebsite = "https://web.facebook.com/about/privacy/";
String twitterPolicyWebsite = "https://twitter.com/en/privacy";
String instagramPolicyWebsite = "https://help.instagram.com/";
String linkedInPolicyWebsite = "https://www.linkedin.com/legal/privacy-policy";
String gmailPolicyWebsite = "https://firebase.google.com/support/privacy/";

String mailFIRST = "mailto:";
String mailSECOND = "?subject=Hello ";

String aboutApp = "PLEASE READ CAREFULLY.\n\nThis Almanac Software was engineered and developed by 'ICDAT DANS LE MONDE LIMITED, Nigeria' Company with the RC Number of 3032487.";
String blemish = '"Do not be concerned about the blemishes and imperfections you may notice on the software, it is those blemishes that prove that the yearbook is authentic. :)"';
String copyrightTerms = "This software is subject to copyright of ICDAT dans le monde limited. Hence should not be developed or replicated without due permission by any company or individual.";
String termsEtConditions = "The following are the terms and conditions attached to usage of this software;";
String termsEtConditions2 = "$schoolAlmanac and/or her subsidiaries are the owners or the licensee of the materials published on this software, and are at freewill by this permission to share with her stakeholders, parents, staff and students.";
String termsEtConditions3 = "You may view and print material from our software for your personal non-commercial use. No other use is permitted without our prior written consent. In particular, you may not use any part of the materials on our software for commercial purposes without obtaining our prior written consent.";
String termsEtConditions4 = "You must not modify the paper or digital copies of any materials you have printed off or downloaded in any way, and you must not use any illustrations, photographs or any graphics separately from any accompanying text.";
String termsEtConditions5 = "The company's (or its subsidiaries') status (and that of any identified contributors) as the authors of materials on our software must always be acknowledged. No trademark, copyright or other proprietary notices contained in or appearing on material from our software should be altered or removed in whole or in part.";
String termsEtConditions6 = "The permission to reproduce material does not extend to material identified as belonging to third parties, where you must obtain the permission of the relevant owners before reproducing such material.";
String termsEtConditions7 = "If you print off, copy or download any part of our software in breach of these terms of use, your right to use our software will cease immediately and you must, at our option, return or destroy any copies of the materials you have made.";
String disclaimer = "Disclaimer/Liability";
String disclaimer1 = "Please note that this mobile software is linked to other websites that may have different terms of use and privacy policies. \nPlease refer to those websites for the appropriate information. \nPlease understand that ICDAT Dans Le Monde Limited has no control over the content of these third party websites. \nIn addition, a hyperlink to a non-ICDAT Dans Le Monde Limited website or link to access a third party mobile application does not mean that ICDAT Dans Le Monde Limited endorses or accepts any responsibility for the content, or the use, of the linked website or mobile application. \nIf you decide to access any of the third-party websites or mobile applications linked to this mobile software, you do so entirely at your own risk.";
String privacyPolicy = "Privacy Policy";
String privacyPolicy1 = "This text is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.";
String privacyPolicy2 = "If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. we will not use or share your information with anyone except as described in this Privacy Policy.";
String privacyPolicy3 = "The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible in this software unless otherwise defined in this Privacy Policy.";
String infoCollection = "Information Collection and Use";
String infoCollection1 = "For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.";
String infoCollection2 = "The app does use third party services that may collect information used to identify you.";
String infoCollection3 = "Link to privacy policy of third party service providers used by the app";
String infoCollectionLink1 = "Google Play Services";
String infoCollectionLink2 = "Google Analytics for Firebase";
String infoCollectionLink3 = "Firebase Crashlytics";
String infoCollectionLink4 = "Facebook";
String infoCollectionLink5 = "Twitter";
String infoCollectionLink6 = "Instagram";
String infoCollectionLink7 = "LinkedIn";
String infoCollectionLink8 = "Gmail";
String logData = "Log Data";
String logData1 = "We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. \nThis Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.";
String serviceProviders = "Service Providers";
String serviceProviders1 = "We may employ third-party companies and individuals due to the following reasons:";
String serviceProviders2 = "To facilitate our Service;";
String serviceProviders3 = "To provide the Service on our behalf;";
String serviceProviders4 = "To perform Service-related services; or";
String serviceProviders5 = "To assist us in analyzing how our Service is used.";
String serviceProviders6 = "We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.";
String security = "Security";
String security1 = "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. \nBut remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.";
String childrenPrivacy = "Children’s Privacy";
String childrenPrivacy1 = "These Services do not address anyone under the age of 8. We do not knowingly collect personally identifiable information from children under 8. \nIn the case we discover that a child under 8 has provided us with personal information, we immediately delete this from our servers. \nIf you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.";
String privacyPolicyChanges = "Changes to This Privacy Policy";
String privacyPolicyChanges1 = "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. This policy is effective as of 2021-04-30";
String contactUs = "Contact Us";
String contactUs1 = "If you have any questions or suggestions about our Terms and Conditions, Disclaimer, Privacy Policy, Software do not hesitate to send an email by clicking me.";
String termsEtConditionsMore = "For more information about our terms and conditions, please trust and click me.";


Color backgroundColor = Color.fromRGBO(102, 66, 36, 1);
Color appBarTextColor = Colors.white.withAlpha(250);
Color appBarBackgroundColor = Color.fromRGBO(104, 65, 34, 1);
Color appBarIconColor = Colors.white.withAlpha(250);
Color cardBackgroundColor = Colors.brown;
Color headingCardColor = Colors.white.withAlpha(250);
Color headingCardTextColor = Colors.brown;
Color cardTextColor = Colors.white.withAlpha(250);



class AboutAppDetails extends StatefulWidget {

  AboutAppDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AboutAppDetailsState createState() => _AboutAppDetailsState();
}

class _AboutAppDetailsState extends State<AboutAppDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(title,
          style: TextStyle(
              color: appBarTextColor
          ),),
        centerTitle: true,
        elevation: 10,
        backgroundColor: appBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appBarIconColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Card(
                margin: EdgeInsets.all(20),
                child: Image.asset(imageAboutApp),
              ),
            ),
            Container(
              child: Card(
                margin: EdgeInsets.all(20),
                color: cardBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20,),
                        child: Card(
                          color: headingCardColor,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                            child: Text(schoolAlmanac,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: headingCardTextColor,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text:TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: aboutApp+'\n\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: blemish+'\n\n\n',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: cardTextColor,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: copyrightTerms+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions2+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions3+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions4+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions5+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions6+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: termsEtConditions7+'\n\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            TextSpan(
                              text: disclaimer+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: disclaimer1+'\n\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: privacyPolicy+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: privacyPolicy1+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: privacyPolicy2+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: privacyPolicy3+'\n\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: infoCollection+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: infoCollection1+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: infoCollection2+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: infoCollection3+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: infoCollectionLink1+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  launch(googlePlayServicesPolicyWebsite);
                                }
                            ),
                            TextSpan(
                              text: infoCollectionLink2+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  launch(googleAnalyticsFirebasePolicyWebsite);
                                }
                            ),
                            TextSpan(
                              text: infoCollectionLink3+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  launch(firebaseCrashlyticsPolicyWebsite);
                                }
                            ),
                            TextSpan(
                              text: infoCollectionLink4+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  launch(facebookPolicyWebsite);
                                }
                            ),
                            TextSpan(
                              text: infoCollectionLink5+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  launch(twitterPolicyWebsite);
                                }
                            ),
                            TextSpan(
                              text: infoCollectionLink6+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  launch(instagramPolicyWebsite);
                                }
                            ),
                            TextSpan(
                              text: infoCollectionLink7+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  launch(linkedInPolicyWebsite);
                                }

                            ),
                            TextSpan(
                              text: infoCollectionLink8+'\n\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                launch(gmailPolicyWebsite);
                              }
                            ),

                            TextSpan(
                              text: logData+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: logData1+'\n\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: serviceProviders+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: serviceProviders1+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: serviceProviders2+'\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: serviceProviders3+'\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: serviceProviders4+'\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: serviceProviders5+'\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            TextSpan(
                              text: serviceProviders6+'\n\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: security+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: security1+'\n\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: childrenPrivacy+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: childrenPrivacy1+'\n\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: privacyPolicyChanges+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: privacyPolicyChanges1+'\n\n\n',
                              style: TextStyle(
                                fontSize: 13,
                                color: cardTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: contactUs+'\n\n',
                              style: TextStyle(
                                fontSize: 15,
                                color: cardTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                                text: termsEtConditionsMore+'\n\n',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: cardTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  launch(developerWebsite);
                                }
                            ),
                            TextSpan(
                              text: contactUs1+'\n\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: cardTextColor,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                launch(mailFIRST + "david.icdat@gmail.com" + mailSECOND);
                              }
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
