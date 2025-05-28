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
        return AppColors.handlerColorBgSuccess;
      case AppStatus.error:
        return AppColors.handlerColorBgError;
      case AppStatus.warning:
        return AppColors.handlerColorBgWarning;
      case AppStatus.networkError:
        return AppColors.handlerColorBgNetworkError;
      case AppStatus.timeout:
        return AppColors.handlerColorBgTimeout;
      case AppStatus.serverError:
        return AppColors.handlerColorBgServerError;
      case AppStatus.info:
        return AppColors.handlerColorBgInfo;
      case AppStatus.normal:
      return AppColors.primaryA10;
    }
  }

  static Color textColor(AppStatus status, {bool isEnabled = true}) {
    if (!isEnabled) return Colors.grey.shade600;

    switch (status) {
      case AppStatus.success:
        return AppColors.handlerColorTxtSuccess;
      case AppStatus.error:
        return AppColors.handlerColorTxtError;
      case AppStatus.warning:
        return AppColors.handlerColorTxtWarning;
      case AppStatus.networkError:
        return AppColors.handlerColorTxtNetworkError;
      case AppStatus.timeout:
        return AppColors.handlerColorTxtTimeout;
      case AppStatus.serverError:
        return AppColors.handlerColorTxtServerError;
      case AppStatus.info:
        return AppColors.handlerColorTxtInfo;
      case AppStatus.normal:
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
      return normalWidget ?? SizedBox.shrink();
    }
  }

  Widget _defaultErrorWidget() {
    return Center(
      child: Text(
        'حدث خطأ',
        style: TextStyle(color: AppColors.handlerColorTxtError),
      ),
    );
  }

  Widget _defaultWarningWidget() {
    return Center(
      child: Text(
        'تحذير',
        style: TextStyle(color: AppColors.handlerColorTxtWarning),
      ),
    );
  }

  Widget _defaultNetworkErrorWidget() {
    return Center(
      child: Text(
        'خطأ في الشبكة',
        style: TextStyle(color: AppColors.handlerColorTxtNetworkError),
      ),
    );
  }

  Widget _defaultTimeoutWidget() {
    return Center(
      child: Text(
        'انتهت المهلة',
        style: TextStyle(color: AppColors.handlerColorTxtTimeout),
      ),
    );
  }

  Widget _defaultServerErrorWidget() {
    return Center(
      child: Text(
        'خطأ في الخادم',
        style: TextStyle(color: AppColors.handlerColorTxtServerError),
      ),
    );
  }

  Widget _defaultInfoWidget() {
    return Center(
      child: Text(
        'معلومة',
        style: TextStyle(color: AppColors.handlerColorTxtInfo),
      ),
    );
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
