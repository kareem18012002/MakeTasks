import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/components/widgets/bloc_observe.dart';
import 'package:todo/shared/network/local/cache_helper.dart';
import 'package:todo/shared/network/remote/dio_helper.dart';

import 'layout/todo_app/app/cubit.dart';
import 'layout/todo_app/app/first_page.dart';
import 'layout/todo_app/app/state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBool(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool? isDark;

  MyApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()
              ..createDatabase()..changeModeApp(fromShared: isDark)),

      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return MaterialApp(

            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.black, size: 35),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    titleSpacing: 16,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark)),
                iconTheme: const IconThemeData(color: Colors.black, size: 35),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.grey[500],
                    type: BottomNavigationBarType.fixed),
                primarySwatch: Colors.deepPurple),
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.white, size: 35),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    titleSpacing: 16,
                    backgroundColor: Colors.black,
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.black,
                        statusBarIconBrightness: Brightness.light)),
                iconTheme: const IconThemeData(color: Colors.white, size: 35),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 0,
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey[500],
                    type: BottomNavigationBarType.fixed),
                primarySwatch: Colors.deepPurple,
                textTheme:  const TextTheme(
                  bodyMedium: TextStyle(color: Colors.white) ,
                  bodyLarge: TextStyle(color: Colors.white),
                )
            ),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: FirstScreen(),
          );
        },
      ),
    );
  }
}
