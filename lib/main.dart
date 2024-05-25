import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<WordService>(() => WordService());
  runApp(MyApp());
}

class JustStr extends InheritedWidget {
  const JustStr({
    super.key,
    required this.str,
    required super.child,
  });

  final String str;

  static JustStr? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JustStr>();
  }

  static JustStr of(BuildContext context) {
    final JustStr? result = maybeOf(context);
    assert(result != null, 'pusto');
    return result!;
  }

  @override
  bool updateShouldNotify(JustStr oldWidget) => str != oldWidget.str;
}

class WordService {
  String word = '';
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => Main(),
    ),
    GoRoute(path: "/pageA", builder: (context, state) => PageA()),
    GoRoute(path: "/pageB", builder: (context, state) => PageB())
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class Main extends StatelessWidget {
  final TextEditingController _controllerForCD = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(
            children: [
                TextField(
                  controller: _controllerForCD,
                  decoration: InputDecoration(
                    hintText: 'Enter a word',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      GetIt.I.get<WordService>().word = _controllerForCD.text;
                      _controllerForCD.text = "";
                    },
                child: Text("Add CD text"),),

              Row(
                children: [
                  ElevatedButton(
                      onPressed: () => context.go("/pageA"), child: Text("Page A")),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => context.go("/pageB"), child: Text("Page B")),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PageC())),
                      child: Text("Page C")),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PageD())),
                      child: Text("Page D")),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              CachedNetworkImage(
                imageUrl:
                "https://thumbs.dreamstime.com/z/alphabet-blocks-5217589.jpg?ct=jpeg",
                height: 300,
                width: 500,
                errorWidget: (context, url, widget) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    )),
              )
            ],
          ),
    ));
  }
}


class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page A'),
        backgroundColor: Colors.red,
      ),
      body: JustStr(
        str: "Page A",  // умереть не встать(
        child: Builder(
            builder: (BuildContext innerContext){
              return Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => context.go("/"), child: Text("Main Page")),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => context.go("/pageA"), child: Text(JustStr.of(innerContext).str)),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => context.go("/pageB"), child: Text("Page B")),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                              context, MaterialPageRoute(builder: (context) => PageC())),
                          child: Text("Page C")),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                              context, MaterialPageRoute(builder: (context) => PageD())),
                          child: Text("Page D")),
                      const SizedBox(
                        height: 20,
                      ),
                      CachedNetworkImage(
                        imageUrl:
                        "https://thumbs.dreamstime.com/z/animal-alphabet-13450915.jpg?ct=jpeg",
                        height: 300,
                        width: 300,
                        errorWidget: (context, url, widget) => const Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                            )),
                      )
                    ],
                  ));
            }
        )

      )

    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page B'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => context.go("/"), child: Text("Main Page")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => context.go("/pageA"), child: Text("Page A")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => context.go("/pageB"), child: Text("Page B")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => PageC())),
                  child: Text("Page C")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => PageD())),
                  child: Text("Page D")),
              const SizedBox(
                height: 20,
              ),
              CachedNetworkImage(
                imageUrl:
                "https://thumbs.dreamstime.com/z/animal-alphabet-b-13450918.jpg?ct=jpeg",
                height: 300,
                width: 300,
                errorWidget: (context, url, widget) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    )),
              ),
            ],
          )),
    );
  }
}

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordService = GetIt.I.get<WordService>();
    return Scaffold(
        appBar: AppBar(
          title: Text(wordService.word),
          backgroundColor: Colors.limeAccent,
        ),
        body: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                TextButton(
                  child: const Text('Go back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CachedNetworkImage(
                  imageUrl:
                  "https://thumbs.dreamstime.com/z/animal-alphabet-c-13450922.jpg?ct=jpeg",
                  height: 300,
                  width: 300,
                  errorWidget: (context, url, widget) => const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      )),
                )
              ],
            )));
  }
}

class PageD extends StatelessWidget {
  @override
  final wordServiceD = GetIt.I.get<WordService>();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(wordServiceD.word),
          backgroundColor: Colors.purple,
        ),
        body: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                TextButton(
                  child: const Text('Go back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CachedNetworkImage(
                  imageUrl:
                  "https://thumbs.dreamstime.com/z/animal-alphabet-d-13450928.jpg?ct=jpeg",
                  height: 300,
                  width: 300,
                  errorWidget: (context, url, widget) => const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      )),
                )
              ],
            )));
  }
}
