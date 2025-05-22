import 'package:flutter/material.dart';
import '../config/constants.dart';

enum AppStatus {
  normal,
  success,
  error,
  warning,
  networkError,
  timeout,
  serverError,
  info,
}

class AppStatusHandler {
  static Color backgroundColor(AppStatus status, {bool isEnabled = true}) {
    if (!isEnabled) return Colors.grey.shade400;

    switch (status) {
      case AppStatus.success:
        return AppColors.handler_color_BG_Success;
      case AppStatus.error:
        return AppColors.handler_color_BG_Error;
      case AppStatus.warning:
        return AppColors.handler_color_BG_Warning;
      case AppStatus.networkError:
        return AppColors.handler_color_BG_NetworkError;
      case AppStatus.timeout:
        return AppColors.handler_color_BG_Timeout;
      case AppStatus.serverError:
        return AppColors.handler_color_BG_ServerError;
      case AppStatus.info:
        return AppColors.handler_color_BG_Info;
      case AppStatus.normal:
      default:
        return AppColors.primary_a10;
    }
  }

  static Color textColor(AppStatus status, {bool isEnabled = true}) {
    if (!isEnabled) return Colors.grey.shade600;

    switch (status) {
      case AppStatus.success:
        return AppColors.handler_color_Txt_Success;
      case AppStatus.error:
        return AppColors.handler_color_Txt_Error;
      case AppStatus.warning:
        return AppColors.handler_color_Txt_Warning;
      case AppStatus.networkError:
        return AppColors.handler_color_Txt_NetworkError;
      case AppStatus.timeout:
        return AppColors.handler_color_Txt_Timeout;
      case AppStatus.serverError:
        return AppColors.handler_color_Txt_ServerError;
      case AppStatus.info:
        return AppColors.handler_color_Txt_Info;
      case AppStatus.normal:
      default:
        return Colors.white;
    }
  }
}

class StatusWidgetHandler extends StatelessWidget {
  final String statusString;
  final Widget successWidget;
  final Widget? errorWidget;
  final Widget? warningWidget;
  final Widget? networkErrorWidget;
  final Widget? timeoutWidget;
  final Widget? serverErrorWidget;
  final Widget? infoWidget;
  final Widget? normalWidget;

  const StatusWidgetHandler({
    super.key,
    required this.statusString,
    required this.successWidget,
    this.errorWidget,
    this.warningWidget,
    this.networkErrorWidget,
    this.timeoutWidget,
    this.serverErrorWidget,
    this.infoWidget,
    this.normalWidget,
  });

  @override
  Widget build(BuildContext context) {
    final status = parseAppStatus(statusString);

    switch (status) {
      case AppStatus.success:
        return successWidget;

      case AppStatus.error:
        return errorWidget ?? _defaultErrorWidget();

      case AppStatus.warning:
        return warningWidget ?? _defaultWarningWidget();

      case AppStatus.networkError:
        return networkErrorWidget ?? _defaultNetworkErrorWidget();

      case AppStatus.timeout:
        return timeoutWidget ?? _defaultTimeoutWidget();

      case AppStatus.serverError:
        return serverErrorWidget ?? _defaultServerErrorWidget();

      case AppStatus.info:
        return infoWidget ?? _defaultInfoWidget();

      case AppStatus.normal:
      default:
        return normalWidget ?? SizedBox.shrink();
    }
  }

  Widget _defaultErrorWidget() {
    return Center(child: Text('حدث خطأ', style: TextStyle(color: AppColors.handler_color_Txt_Error)));
  }

  Widget _defaultWarningWidget() {
    return Center(child: Text('تحذير', style: TextStyle(color: AppColors.handler_color_Txt_Warning)));
  }

  Widget _defaultNetworkErrorWidget() {
    return Center(child: Text('خطأ في الشبكة', style: TextStyle(color: AppColors.handler_color_Txt_NetworkError)));
  }

  Widget _defaultTimeoutWidget() {
    return Center(child: Text('انتهت المهلة', style: TextStyle(color: AppColors.handler_color_Txt_Timeout)));
  }

  Widget _defaultServerErrorWidget() {
    return Center(child: Text('خطأ في الخادم', style: TextStyle(color: AppColors.handler_color_Txt_ServerError)));
  }

  Widget _defaultInfoWidget() {
    return Center(child: Text('معلومة', style: TextStyle(color: AppColors.handler_color_Txt_Info)));
  }
}

AppStatus parseAppStatus(String statusString) {
  switch (statusString.toLowerCase()) {
    case 'success':
      return AppStatus.success;
    case 'error':
      return AppStatus.error;
    case 'warning':
      return AppStatus.warning;
    case 'networkerror':
      return AppStatus.networkError;
    case 'timeout':
      return AppStatus.timeout;
    case 'servererror':
      return AppStatus.serverError;
    case 'info':
      return AppStatus.info;
    case 'normal':
    default:
      return AppStatus.normal;
  }
}
