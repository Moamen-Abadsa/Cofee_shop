// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Contact us`
  String get contact_contact_us {
    return Intl.message(
      'Contact us',
      name: 'contact_contact_us',
      desc: '',
      args: [],
    );
  }

  /// `There are many variations of passages`
  String get contact_paragraph {
    return Intl.message(
      'There are many variations of passages',
      name: 'contact_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `GENERAL INFORMATION`
  String get contact_header1 {
    return Intl.message(
      'GENERAL INFORMATION',
      name: 'contact_header1',
      desc: '',
      args: [],
    );
  }

  /// `OFFICE ADDRESS`
  String get contact_office_address {
    return Intl.message(
      'OFFICE ADDRESS',
      name: 'contact_office_address',
      desc: '',
      args: [],
    );
  }

  /// `402 Rimal ’ Building, Aljalaa’ st.`
  String get contact_address1 {
    return Intl.message(
      '402 Rimal ’ Building, Aljalaa’ st.',
      name: 'contact_address1',
      desc: '',
      args: [],
    );
  }

  /// `Gaza, Palestine.`
  String get contact_address2 {
    return Intl.message(
      'Gaza, Palestine.',
      name: 'contact_address2',
      desc: '',
      args: [],
    );
  }

  /// `EMAIL ADDRESS`
  String get contact_email_address {
    return Intl.message(
      'EMAIL ADDRESS',
      name: 'contact_email_address',
      desc: '',
      args: [],
    );
  }

  /// `info@coffeespott.com`
  String get contact_email1 {
    return Intl.message(
      'info@coffeespott.com',
      name: 'contact_email1',
      desc: '',
      args: [],
    );
  }

  /// `sales@coffeespott.com`
  String get contact_email2 {
    return Intl.message(
      'sales@coffeespott.com',
      name: 'contact_email2',
      desc: '',
      args: [],
    );
  }

  /// `CONTACT INFORMATION`
  String get contact_contact_information {
    return Intl.message(
      'CONTACT INFORMATION',
      name: 'contact_contact_information',
      desc: '',
      args: [],
    );
  }

  /// `+970 59 943 6800`
  String get contact_phone_number1 {
    return Intl.message(
      '+970 59 943 6800',
      name: 'contact_phone_number1',
      desc: '',
      args: [],
    );
  }

  /// `+970 828 23045`
  String get contact_phone_number2 {
    return Intl.message(
      '+970 828 23045',
      name: 'contact_phone_number2',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get contact_name {
    return Intl.message(
      'name',
      name: 'contact_name',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get contact_name_hint {
    return Intl.message(
      'Your name',
      name: 'contact_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get contact_email {
    return Intl.message(
      'Email',
      name: 'contact_email',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get contact_email_hint {
    return Intl.message(
      'Email address',
      name: 'contact_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get contact_phone {
    return Intl.message(
      'Phone',
      name: 'contact_phone',
      desc: '',
      args: [],
    );
  }

  /// `0599000000`
  String get contact_phone_hint {
    return Intl.message(
      '0599000000',
      name: 'contact_phone_hint',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get contact_message {
    return Intl.message(
      'Message',
      name: 'contact_message',
      desc: '',
      args: [],
    );
  }

  /// `Type your Message`
  String get contact_message_hint {
    return Intl.message(
      'Type your Message',
      name: 'contact_message_hint',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get contact_submit {
    return Intl.message(
      'Submit',
      name: 'contact_submit',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Condition`
  String get contact_footer1 {
    return Intl.message(
      'Terms and Condition',
      name: 'contact_footer1',
      desc: '',
      args: [],
    );
  }

  /// `Contact details`
  String get contact_footer2 {
    return Intl.message(
      'Contact details',
      name: 'contact_footer2',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get contact_footer3 {
    return Intl.message(
      'Privacy policy',
      name: 'contact_footer3',
      desc: '',
      args: [],
    );
  }

  /// `© 2017 Coffe Spott. All rights reserved.`
  String get contact_footer4 {
    return Intl.message(
      '© 2017 Coffe Spott. All rights reserved.',
      name: 'contact_footer4',
      desc: '',
      args: [],
    );
  }

  /// `Coffee `
  String get about_header1 {
    return Intl.message(
      'Coffee ',
      name: 'about_header1',
      desc: '',
      args: [],
    );
  }

  /// `Spott`
  String get about_header11 {
    return Intl.message(
      'Spott',
      name: 'about_header11',
      desc: '',
      args: [],
    );
  }

  /// `Who We Are`
  String get about_header2 {
    return Intl.message(
      'Who We Are',
      name: 'about_header2',
      desc: '',
      args: [],
    );
  }

  /// `There are many variations of passages of Lorem Ipsum available \n but the majority have suffered alteration in some form, by injected humour \n or randomised words which don’t look even slightly believable.\n if you are going to use a passage of Lorem Ipsum, you need to be sure there isn’t \n anything embarrassing hidden in the middle of text.\n \n All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks\n as necessary, making this the first true generator on the Internet.`
  String get about_paragraph1 {
    return Intl.message(
      'There are many variations of passages of Lorem Ipsum available \n but the majority have suffered alteration in some form, by injected humour \n or randomised words which don’t look even slightly believable.\n if you are going to use a passage of Lorem Ipsum, you need to be sure there isn’t \n anything embarrassing hidden in the middle of text.\n \n All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks\n as necessary, making this the first true generator on the Internet.',
      name: 'about_paragraph1',
      desc: '',
      args: [],
    );
  }

  /// `Our Vision`
  String get about_header3 {
    return Intl.message(
      'Our Vision',
      name: 'about_header3',
      desc: '',
      args: [],
    );
  }

  /// `There are many variations of passages of Lorem Ipsum available \n but the majority have suffered alteration in some form, by injected humour \n or randomised words which don’t look even slightly believable.\n if you are going to use a passage of Lorem Ipsum, you need to be sure there isn’t \n anything embarrassing hidden in the middle of text.\n \n All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks\n as necessary, making this the first true generator on the Internet.`
  String get about_paragraph2 {
    return Intl.message(
      'There are many variations of passages of Lorem Ipsum available \n but the majority have suffered alteration in some form, by injected humour \n or randomised words which don’t look even slightly believable.\n if you are going to use a passage of Lorem Ipsum, you need to be sure there isn’t \n anything embarrassing hidden in the middle of text.\n \n All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks\n as necessary, making this the first true generator on the Internet.',
      name: 'about_paragraph2',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get signup_header {
    return Intl.message(
      'SIGN UP',
      name: 'signup_header',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get signup_first_name {
    return Intl.message(
      'First Name',
      name: 'signup_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Your first name `
  String get signup_first_name_hint {
    return Intl.message(
      'Your first name ',
      name: 'signup_first_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get signup_last_name {
    return Intl.message(
      'Last Name',
      name: 'signup_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Your last name `
  String get signup_last_name_hint {
    return Intl.message(
      'Your last name ',
      name: 'signup_last_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signup_email {
    return Intl.message(
      'Email',
      name: 'signup_email',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get signup_email_hint {
    return Intl.message(
      'Email address',
      name: 'signup_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signup_password {
    return Intl.message(
      'Password',
      name: 'signup_password',
      desc: '',
      args: [],
    );
  }

  /// `Type password`
  String get signup_password_hint {
    return Intl.message(
      'Type password',
      name: 'signup_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Repeat Password`
  String get signup_password_repeat {
    return Intl.message(
      'Repeat Password',
      name: 'signup_password_repeat',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup_button {
    return Intl.message(
      'Sign up',
      name: 'signup_button',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get signin_header {
    return Intl.message(
      'SIGN IN',
      name: 'signin_header',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signin_email {
    return Intl.message(
      'Email',
      name: 'signin_email',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get signin_email_hint {
    return Intl.message(
      'Email Address',
      name: 'signin_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signin_Password {
    return Intl.message(
      'Password',
      name: 'signin_Password',
      desc: '',
      args: [],
    );
  }

  /// `Your password`
  String get signin_Password_hint {
    return Intl.message(
      'Your password',
      name: 'signin_Password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signin_button {
    return Intl.message(
      'Sign in',
      name: 'signin_button',
      desc: '',
      args: [],
    );
  }

  /// `Events and Offers`
  String get events_header {
    return Intl.message(
      'Events and Offers',
      name: 'events_header',
      desc: '',
      args: [],
    );
  }

  /// `There are many variations of passages`
  String get events_paragraph {
    return Intl.message(
      'There are many variations of passages',
      name: 'events_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events_events {
    return Intl.message(
      'Events',
      name: 'events_events',
      desc: '',
      args: [],
    );
  }

  /// `Perfect Coffee Latte`
  String get events_subheader1 {
    return Intl.message(
      'Perfect Coffee Latte',
      name: 'events_subheader1',
      desc: '',
      args: [],
    );
  }

  /// `There are many variations of passages of \n Lorem Ipsum available, but the majority have \n suffered alteration in some form.`
  String get events_paragraph2 {
    return Intl.message(
      'There are many variations of passages of \n Lorem Ipsum available, but the majority have \n suffered alteration in some form.',
      name: 'events_paragraph2',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get events_offers {
    return Intl.message(
      'Offers',
      name: 'events_offers',
      desc: '',
      args: [],
    );
  }

  /// `$14.99`
  String get events_offers_value {
    return Intl.message(
      '\$14.99',
      name: 'events_offers_value',
      desc: '',
      args: [],
    );
  }

  /// `Perfect Coffee Latte`
  String get events_subheader2 {
    return Intl.message(
      'Perfect Coffee Latte',
      name: 'events_subheader2',
      desc: '',
      args: [],
    );
  }

  /// `There are many variations of passages of \n Lorem Ipsum available, but the majority have \n suffered alteration in some form.`
  String get events_paragraph3 {
    return Intl.message(
      'There are many variations of passages of \n Lorem Ipsum available, but the majority have \n suffered alteration in some form.',
      name: 'events_paragraph3',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get menu_home {
    return Intl.message(
      'Home',
      name: 'menu_home',
      desc: '',
      args: [],
    );
  }

  /// `Café`
  String get menu_cafe {
    return Intl.message(
      'Café',
      name: 'menu_cafe',
      desc: '',
      args: [],
    );
  }

  /// `Events and Offers`
  String get menu_event {
    return Intl.message(
      'Events and Offers',
      name: 'menu_event',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get menu_about {
    return Intl.message(
      'About us',
      name: 'menu_about',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get menu_contact {
    return Intl.message(
      'Contact Us',
      name: 'menu_contact',
      desc: '',
      args: [],
    );
  }

  /// `Add your Café`
  String get menu_add {
    return Intl.message(
      'Add your Café',
      name: 'menu_add',
      desc: '',
      args: [],
    );
  }

  /// `Best coffe with \n best price`
  String get home_page_view {
    return Intl.message(
      'Best coffe with \n best price',
      name: 'home_page_view',
      desc: '',
      args: [],
    );
  }

  /// `View All Café`
  String get home_view_button {
    return Intl.message(
      'View All Café',
      name: 'home_view_button',
      desc: '',
      args: [],
    );
  }

  /// `Most Rating`
  String get home_most_rating {
    return Intl.message(
      'Most Rating',
      name: 'home_most_rating',
      desc: '',
      args: [],
    );
  }

  /// `Events and Offers`
  String get home_event_and_offers {
    return Intl.message(
      'Events and Offers',
      name: 'home_event_and_offers',
      desc: '',
      args: [],
    );
  }

  /// `Perfect Coffee Latte`
  String get home_subheader {
    return Intl.message(
      'Perfect Coffee Latte',
      name: 'home_subheader',
      desc: '',
      args: [],
    );
  }

  /// `There are many variations of passages of \n Lorem Ipsum available, but the majority have \n suffered alteration in some form.`
  String get home_paragraph {
    return Intl.message(
      'There are many variations of passages of \n Lorem Ipsum available, but the majority have \n suffered alteration in some form.',
      name: 'home_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `$14.99`
  String get home_offers_value {
    return Intl.message(
      '\$14.99',
      name: 'home_offers_value',
      desc: '',
      args: [],
    );
  }

  /// `View more`
  String get home_view_more {
    return Intl.message(
      'View more',
      name: 'home_view_more',
      desc: '',
      args: [],
    );
  }

  /// `Browse Cafés`
  String get cafe_header {
    return Intl.message(
      'Browse Cafés',
      name: 'cafe_header',
      desc: '',
      args: [],
    );
  }

  /// `View All Café`
  String get cafe_header_paragraph2 {
    return Intl.message(
      'View All Café',
      name: 'cafe_header_paragraph2',
      desc: '',
      args: [],
    );
  }

  /// `See recently added Cafes with the highest Pulse.`
  String get cafe_header_paragraph1 {
    return Intl.message(
      'See recently added Cafes with the highest Pulse.',
      name: 'cafe_header_paragraph1',
      desc: '',
      args: [],
    );
  }

  /// `All categories`
  String get cafe_most_rating {
    return Intl.message(
      'All categories',
      name: 'cafe_most_rating',
      desc: '',
      args: [],
    );
  }

  /// `categories`
  String get cafe_most_categories {
    return Intl.message(
      'categories',
      name: 'cafe_most_categories',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get cafe_event_and_offers {
    return Intl.message(
      'Recent',
      name: 'cafe_event_and_offers',
      desc: '',
      args: [],
    );
  }

  /// `Crty Cafe`
  String get cafe_subheader1 {
    return Intl.message(
      'Crty Cafe',
      name: 'cafe_subheader1',
      desc: '',
      args: [],
    );
  }

  /// `There are many variations of passages of Lorem Ipsum available.`
  String get cafe_paragraph {
    return Intl.message(
      'There are many variations of passages of Lorem Ipsum available.',
      name: 'cafe_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `Horseshoe Cafe`
  String get cafe_subheader2 {
    return Intl.message(
      'Horseshoe Cafe',
      name: 'cafe_subheader2',
      desc: '',
      args: [],
    );
  }

  /// `CoffeeShop`
  String get cafe_subheader3 {
    return Intl.message(
      'CoffeeShop',
      name: 'cafe_subheader3',
      desc: '',
      args: [],
    );
  }

  /// `Load More`
  String get cafe_load_button {
    return Intl.message(
      'Load More',
      name: 'cafe_load_button',
      desc: '',
      args: [],
    );
  }

  /// `Add your Café`
  String get add_cafe_header {
    return Intl.message(
      'Add your Café',
      name: 'add_cafe_header',
      desc: '',
      args: [],
    );
  }

  /// `Join to us by adding your Cafe Restaurant.`
  String get add_cafe_header_paragraph {
    return Intl.message(
      'Join to us by adding your Cafe Restaurant.',
      name: 'add_cafe_header_paragraph',
      desc: '',
      args: [],
    );
  }

  /// `GENERAL INFORMATION`
  String get add_cafe_subheader {
    return Intl.message(
      'GENERAL INFORMATION',
      name: 'add_cafe_subheader',
      desc: '',
      args: [],
    );
  }

  /// `Café name`
  String get add_cafe_name {
    return Intl.message(
      'Café name',
      name: 'add_cafe_name',
      desc: '',
      args: [],
    );
  }

  /// `Your café name `
  String get add_cafe_name_hint {
    return Intl.message(
      'Your café name ',
      name: 'add_cafe_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get add_cafe_category {
    return Intl.message(
      'Category',
      name: 'add_cafe_category',
      desc: '',
      args: [],
    );
  }

  /// `Select category`
  String get add_cafe_category_hint {
    return Intl.message(
      'Select category',
      name: 'add_cafe_category_hint',
      desc: '',
      args: [],
    );
  }

  /// `Worktime`
  String get add_cafe_worktime {
    return Intl.message(
      'Worktime',
      name: 'add_cafe_worktime',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get add_cafe_from {
    return Intl.message(
      'From',
      name: 'add_cafe_from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get add_cafe_to {
    return Intl.message(
      'To',
      name: 'add_cafe_to',
      desc: '',
      args: [],
    );
  }

  /// `8:00 AM`
  String get add_cafe_from_hint {
    return Intl.message(
      '8:00 AM',
      name: 'add_cafe_from_hint',
      desc: '',
      args: [],
    );
  }

  /// `12:00 PM`
  String get add_cafe_to_hint {
    return Intl.message(
      '12:00 PM',
      name: 'add_cafe_to_hint',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get add_cafe_location {
    return Intl.message(
      'Location',
      name: 'add_cafe_location',
      desc: '',
      args: [],
    );
  }

  /// `Your café location`
  String get add_cafe_location_hint {
    return Intl.message(
      'Your café location',
      name: 'add_cafe_location_hint',
      desc: '',
      args: [],
    );
  }

  /// `Café logo`
  String get add_cafe_cafe_logo {
    return Intl.message(
      'Café logo',
      name: 'add_cafe_cafe_logo',
      desc: '',
      args: [],
    );
  }

  /// `Choose photo`
  String get add_cafe_choose {
    return Intl.message(
      'Choose photo',
      name: 'add_cafe_choose',
      desc: '',
      args: [],
    );
  }

  /// `Additional information`
  String get add_cafe_add_info {
    return Intl.message(
      'Additional information',
      name: 'add_cafe_add_info',
      desc: '',
      args: [],
    );
  }

  /// `Type additional information`
  String get add_cafe_add_info_hint {
    return Intl.message(
      'Type additional information',
      name: 'add_cafe_add_info_hint',
      desc: '',
      args: [],
    );
  }

  /// `FEATURES`
  String get add_cafe_features {
    return Intl.message(
      'FEATURES',
      name: 'add_cafe_features',
      desc: '',
      args: [],
    );
  }

  /// `Smoking`
  String get add_cafe_smoking {
    return Intl.message(
      'Smoking',
      name: 'add_cafe_smoking',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get add_cafe_yes {
    return Intl.message(
      'Yes',
      name: 'add_cafe_yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get add_cafe_no {
    return Intl.message(
      'No',
      name: 'add_cafe_no',
      desc: '',
      args: [],
    );
  }

  /// `Study places`
  String get add_cafe_study_places {
    return Intl.message(
      'Study places',
      name: 'add_cafe_study_places',
      desc: '',
      args: [],
    );
  }

  /// `Meeting rooms`
  String get add_cafe_meeting {
    return Intl.message(
      'Meeting rooms',
      name: 'add_cafe_meeting',
      desc: '',
      args: [],
    );
  }

  /// `Discount code`
  String get add_cafe_discount_code {
    return Intl.message(
      'Discount code',
      name: 'add_cafe_discount_code',
      desc: '',
      args: [],
    );
  }

  /// `Discount percentage`
  String get add_cafe_discount_percentage {
    return Intl.message(
      'Discount percentage',
      name: 'add_cafe_discount_percentage',
      desc: '',
      args: [],
    );
  }

  /// `Submit your café`
  String get add_cafe_submit {
    return Intl.message(
      'Submit your café',
      name: 'add_cafe_submit',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
