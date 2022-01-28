library shut_the_box_engine;

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'models/card.dart';
part 'cardSets.dart';
part 'models/dice.dart';
part 'models/game.dart';
part 'models/player.dart';

part 'providers.dart';

part 'interfaces/identifiable.dart';

var rng = Random();
