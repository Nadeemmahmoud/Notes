import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/dI/service_locator.dart';
import 'package:notes_app/core/theme/app_theme_factory.dart';
import 'package:notes_app/core/theme/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:notes_app/core/theme/presentation/manager/theme_cubit/theme_state.dart';
import 'package:notes_app/core/theme/theme_helper.dart';
import 'package:notes_app/core/utils/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServiceLocator();
  final themeCubit = get<ThemeCubit>();
  await themeCubit.loadTheme();
  Bloc.observer = Simpleblocobserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(
    BlocProvider.value(value: themeCubit, child: const NotesApp()),
  );
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  static final _lightTheme = AppThemeFactory.createTheme(false);
  static final _darkTheme = AppThemeFactory.createTheme(true);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (previous, current) {
        if (previous is ThemeLoaded && current is ThemeLoaded) {
          return previous.themeMode != current.themeMode;
        }
        return true;
      },
      builder: (context, state) {
        final themeMode = state is ThemeLoaded
            ? mapThemeMode(state.themeMode)
            : ThemeMode.system;

        return BlocProvider(
          create: (context) => NotesCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: _lightTheme,
            darkTheme: _darkTheme,
            themeMode: themeMode,
            routes: {NotesView.id: (context) => const NotesView()},
            initialRoute: NotesView.id,
          ),
        );
      },
    );
  }
}
