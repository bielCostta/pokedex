import 'dart:convert';

import 'dart:io';

T fixture<T>(String name) =>
    json.decode(File('test/fixture/$name').readAsStringSync()) as T;
