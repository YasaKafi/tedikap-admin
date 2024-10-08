// ignore_for_file: constant_identifier_names

part of 'AppPages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const MENU = _Paths.MENU;
  static const CHAT = _Paths.CHAT;
  static const NAVBAR = _Paths.NAVBAR;
  static const ORDER = _Paths.ORDER;
  static const SPLASH1 = _Paths.SPLASH1;
  static const SPLASH2 = _Paths.SPLASH2;
  static const ORDER_STATUS = _Paths.ORDER_STATUS;
  static const LOGIN = _Paths.LOGIN;
  static const TAMBAH_MENU = _Paths.TAMBAH_MENU;
  static const TAMBAH_VOUCHER = _Paths.TAMBAH_VOUCHER;
  static const CHAT_ROOM = _Paths.CHAT_ROOM;
  static const TAMBAH_NOTIF = _Paths.TAMBAH_NOTIF;
  static const VOUCHER_VIEW = _Paths.VOUCHER_VIEW;
  static const EDIT_VOUCHER = _Paths.EDIT_VOUCHER;
  static const EDIT_MENU = _Paths.EDIT_MENU;
  static const DETAIL_MENU = _Paths.DETAIL_MENU;
  static const REWARD = _Paths.REWARD;
  static const DETAIL_REWARD = _Paths.DETAIL_REWARD;
  static const EDIT_REWARD = _Paths.EDIT_REWARD;
  static const TAMBAH_REWARD = _Paths.TAMBAH_REWARD;
  static const HISTORY_PAGE = _Paths.HISTORY_PAGE;
  static const CRUD_PAGE = _Paths.CRUD_PAGE;

  static const BOX_PROMO = _Paths.BOX_PROMO;
  static const TAMBAH_BOX_PROMO = _Paths.TAMBAH_BOX_PROMO;
  static const EDIT_BOX_PROMO = _Paths.EDIT_BOX_PROMO;

  static const IMAGE_BANNER = _Paths.IMAGE_BANNER;
  static const TAMBAH_IMAGE_BANNER = _Paths.TAMBAH_IMAGE_BANNER;
  static const EDIT_IMAGE_BANNER = _Paths.EDIT_IMAGE_BANNER;

  static const REVIEW_PAGE = _Paths.REVIEW_PAGE;

  static const SCAN = _Paths.SCAN;

  static const EDIT_SESSION_TIME = _Paths.EDIT_SESSION_TIME;

  static const PROMO_PAGE = _Paths.PROMO_PAGE;
  static const TAMBAH_PROMO = _Paths.TAMBAH_PROMO;
  static const PICK_PRODUCT = _Paths.PICK_PRODUCT;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const SPLASH1 = '/splash1';
  static const SPLASH2 = '/splash2';
  static const NAVBAR = '/bottom-navbar';

  static const HOME = '/home';
  static const TAMBAH_NOTIF = '/tambah-notif';

  static const MENU = '/menu';
  static const EDIT_MENU = '/edit-menu';
  static const DETAIL_MENU = '/detail-menu/:id';
  static const TAMBAH_MENU = '/tambah-menu';

  static const REWARD = '/reward';
  static const EDIT_REWARD = '/edit-reward';
  static const DETAIL_REWARD = '/detail-reward/:id';
  static const TAMBAH_REWARD = '/tambah-reward';

  static const CRUD_PAGE = '/crud-page';
  static const ORDER = '/order';
  static const ORDER_STATUS = '/order-status';
  static const HISTORY_PAGE = '/history-page';

  static const VOUCHER_VIEW = '/voucher-view';
  static const EDIT_VOUCHER = '/edit-voucher';
  static const TAMBAH_VOUCHER = '/tambah-voucher';

  static const BOX_PROMO = '/box-promo';
  static const TAMBAH_BOX_PROMO = '/tambah-box-promo';
  static const EDIT_BOX_PROMO = '/edit-box-promo';

  static const IMAGE_BANNER = '/image-banner';
  static const TAMBAH_IMAGE_BANNER = '/tambah-image-banner';
  static const EDIT_IMAGE_BANNER = '/edit-image-banner';

  static const CHAT = '/chat';
  static const CHAT_ROOM = '/chat-room';

  static const REVIEW_PAGE = '/review-page';

  static const SCAN = '/scan-page';

  static const EDIT_SESSION_TIME = '/edit-session-time';

  static const PROMO_PAGE = '/promo-page';
  static const TAMBAH_PROMO = '/tambah-promo';
  static const PICK_PRODUCT = '/pick-product';
}
