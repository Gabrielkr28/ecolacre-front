import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:bloc/bloc.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/cubit/pessoa_fisica_cubit.dart';
import 'package:project/app/core/util/application_binding.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBinding extends StatefulWidget {
  final Widget child;
  const ApplicationBinding({
    super.key,
    required this.child,
  });

  @override
  State<ApplicationBinding> createState() => _ApplicationBindingState();
}

class _ApplicationBindingState extends State<ApplicationBinding> {
  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<PessoaFisicaCubit>(),
        ),
      ],
      child: widget.child,
    );
  }
}
