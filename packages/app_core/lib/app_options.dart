import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'authentication_status.dart';
part 'user.dart';

class AppOptions {
  AppOptions({
    @required this.locale,
    @required this.authenticationStatus,
  });

  final Locale locale;
  final AuthenticationStatus authenticationStatus;

  AppOptions copyWith({
    Locale locale,
    AuthenticationStatus authenticationStatus,
  }) {
    return AppOptions(
      locale: locale ?? this.locale,
      authenticationStatus: authenticationStatus ?? this.authenticationStatus,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is AppOptions &&
      locale == other.locale &&
      authenticationStatus.isSignedIn == other.authenticationStatus.isSignedIn;

  @override
  int get hashCode => hashValues(
        locale,
        authenticationStatus.isSignedIn,
      );

  static AppOptions of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_AppOptionsBindingScope>();
    return scope.state._options;
  }

  static void update(BuildContext context, AppOptions newOptions) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_AppOptionsBindingScope>();
    scope.state.update(newOptions);
  }
}

class _AppOptionsBindingScope extends InheritedWidget {
  _AppOptionsBindingScope({
    @required this.state,
    @required this.child,
  }) : super(child: child);

  final _AppOptionsBindingState state;
  final Widget child;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

class AppOptionsBinding extends StatefulWidget {
  AppOptionsBinding({
    Key key,
    @required this.initialOptions,
    @required this.child,
  })  : assert(initialOptions != null),
        super(key: key);

  final AppOptions initialOptions;
  final Widget child;

  @override
  _AppOptionsBindingState createState() => _AppOptionsBindingState();
}

class _AppOptionsBindingState extends State<AppOptionsBinding> {
  AppOptions _options;

  @override
  void initState() {
    _options = widget.initialOptions;
    super.initState();
  }

  void update(AppOptions options) {
    if (options != _options) {
      setState(() {
        _options = options;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _AppOptionsBindingScope(
      state: this,
      child: widget.child,
    );
  }
}
