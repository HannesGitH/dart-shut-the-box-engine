# Shut The Box Game Engine

## Features

- provides the logic and game-management layer to build shut the box games upon

## Getting started

add `shut_the_box_engine` to your pubspec.yaml

## Usage

this packages provides a `gameProvider` which can be used in provider patterns to access all stuff needed.
let intellij show you the rest.

This is how you would create a Counter app (thats not what this package is about lol):

```dart
import 'package:shut_the_box_engine/shut_the_box_engine.dart' as E;

class GameView extends ConsumerWidget {
  final _gamep = E.gameProvider(E.Game());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamep = ref.watch(_gamep); //.game;
    return Scaffold(
      body: Center(
        child: Text(gamep.game.players.length.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(_gamep).addPlayers([E.Player()]);
        },
      ),
    );
  }
}
```

## Additional information
