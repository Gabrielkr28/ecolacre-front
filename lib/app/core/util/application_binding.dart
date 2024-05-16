import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/cubit/pessoa_fisica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/cubit/pessoa_juridica_cubit.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/shared/cubit/bottom_nav_bar_cubit.dart';
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
  GetIt getIt = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<PessoaFisicaCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<PessoaJuridicaCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<BottomNavBarCubit>(),
        ),
      ],
      child: widget.child,
    );
  }
}
