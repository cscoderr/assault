import 'package:assault/ui/core/appConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static const String REGISTER = AppConfig.app_endpoint_url + '/auth/register';

  static const String LOGIN = AppConfig.app_endpoint_url + '/auth/sign-in';

  static const String FORGOT_PASSWORD =
      AppConfig.app_endpoint_url + '/auth/forgot-password';

  static const String FORGOT_PASSWORD_OTP =
      AppConfig.app_endpoint_url + '/auth/check-reset-otp';

  static const String CHANGE_PASSWORD =
      AppConfig.app_endpoint_url + '/auth/edit/password';

  static const String EDIT_PROFILE =
      AppConfig.app_endpoint_url + '/auth/edit/profile';

  static const String COMPLANT_DETAILS =
      AppConfig.app_endpoint_url + 'complaint/details';

  ///complaint/details?id=[id]

  static const String TOTAL_COMPLAINT =
      AppConfig.app_endpoint_url + '/complaint/count';

  static const String ANALYTICS =
      AppConfig.app_endpoint_url + '/analytics/location-analytics';

  static const String PHYSICAL_ADDRESS =
      AppConfig.app_endpoint_url + '/complaint/get-physical-area';

  ///complaint/get-physical-area?lat=40.679379&lng=-73.940501

  static const String VERIFY = AppConfig.app_endpoint_url + '/auth/verify';

  static const String RESEND_VERIFY =
      AppConfig.app_endpoint_url + '/auth/resend-verify-otp';

  static const String FILE_COMPLAINT =
      AppConfig.app_endpoint_url + '/complaint/file';

  static const String LIST_COMPLAINT =
      AppConfig.app_endpoint_url + '/complaint/my-complaints';

  static const String COMPLAINT_DETAILS =
      AppConfig.app_endpoint_url + '/complaint/details?id=';

  static const String SEARCH_COMPLAINT =
      AppConfig.app_endpoint_url + '/complaint/search';
}
