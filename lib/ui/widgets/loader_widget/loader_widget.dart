import 'package:comics_db_app/ui/components/loading_indicator.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/loader_widget/loader_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cubit = context.read<LoaderViewCubit>();
    onLoaderViewCubitStateChange(context, cubit.state);
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoaderViewCubit, LoaderViewCubitState>(
      // listenWhen: (previous, current) => current != LoaderViewCubitState.unknown,
      listener: onLoaderViewCubitStateChange,
      child: const Scaffold(
        body: Center(
          child: LoadingIndicatorWidget(),
        ),
      ),
    );
  }

  void onLoaderViewCubitStateChange(BuildContext context, LoaderViewCubitState state) {
    final nextScreen =
        state == LoaderViewCubitState.authorized ? MainNavigationRouteNames.mainScreen : MainNavigationRouteNames.auth;
    Navigator.of(context).pushReplacementNamed(nextScreen);
  }
}
