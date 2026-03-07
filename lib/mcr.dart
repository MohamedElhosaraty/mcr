import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/localization/set_localization.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'feature/home/cubits/notes_cubit/notes_cubit.dart';

class Mcr extends StatelessWidget {
  const Mcr({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) =>
        NotesCubit()
          ..fetchAllNotes(),
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            return MaterialApp(
              locale: NotesCubit.get(context).language,
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('ar', 'EG'),
              ],
              localizationsDelegates: const [
                SetLocalization.localizationsDelegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              title: 'Mcr',
              theme: ThemeData(
                brightness: NotesCubit
                    .get(context)
                    .selectDart
                    ? Brightness.light
                    : Brightness.dark,
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.splashScreen,
              onGenerateRoute: AppRouter.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
