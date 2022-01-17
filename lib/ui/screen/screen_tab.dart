import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/screen/contact_us/contact_us_list.dart';
import 'package:doctor_app/ui/screen/forgot_password/forgot_password_list.dart';
import 'package:doctor_app/ui/screen/home/home_list.dart';
import 'package:doctor_app/ui/screen/notification/notification_list.dart';
import 'package:doctor_app/ui/screen/onboarding/onboarding_list.dart';
import 'package:doctor_app/ui/screen/product_list/product_list.dart';
import 'package:doctor_app/ui/screen/signin/signin_list.dart';
import 'package:doctor_app/ui/screen/signup/signup_list.dart';
import 'package:doctor_app/ui/screen/timeline/timeline_list.dart';
import 'package:doctor_app/ui/screen/user/user_list.dart';
import 'package:doctor_app/ui/screen/user_profile/user_profile_list.dart';
import 'package:doctor_app/ui/screen/verification/verification_list.dart';
import 'package:flutter/material.dart';

class ScreenTabPage extends StatefulWidget {
  @override
  _ScreenTabPageState createState() => _ScreenTabPageState();
}

class _ScreenTabPageState extends State<ScreenTabPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int number = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: ListView(
        padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
        children: [
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.vibration,
              title: 'On Boarding',
              desc: 'First time on board',
              page: OnboardingListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.login,
              title: 'Sign In',
              desc: 'Used for authentication',
              page: SigninListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.how_to_reg,
              title: 'Sign Up',
              desc: 'Used for authentication',
              page: SignupListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.check,
              title: 'Verification',
              desc: 'Used for authentication',
              page: VerificationListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.vpn_key,
              title: 'Forgot Password',
              desc: 'Used for authentication',
              page: ForgotPasswordListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.home,
              title: 'Home',
              desc: 'Main screen of the apps',
              page: HomeListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.person_outline,
              title: 'User / Account',
              desc: 'Used for user / account menu',
              page: UserListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.account_circle,
              title: 'User Profile',
              desc: 'Used for profile',
              page: UserProfileListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.phone,
              title: 'Contact Us',
              desc: 'Used for contact the customer support',
              page: ContactUsListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.list_alt,
              title: 'Product List',
              desc: 'Used for listing product',
              page: ProductListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.timeline,
              title: 'Timeline',
              desc: 'Used for timeline',
              page: TimelineListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.notifications,
              title: 'Notification',
              desc: 'Used for notification message',
              page: NotificationListPage()
          ),
        ],
      ),
    );
  }
}
