@TestOn('node')
library platform_test;

import 'package:node_interop/node.dart';
import 'package:node_io/node_io.dart';
import 'package:test/test.dart';

void main([String scriptName = 'platform_test.dart']) {
  group('Platform', () {
    test('environment', () {
      expect(Platform.environment, isMap);
      expect(Platform.environment, isNotEmpty);
      expect(Platform.environment, contains('PATH'));
    });

    test('script', () {
      expect(Platform.script, new isInstanceOf<Uri>());
      expect(Platform.script.isAbsolute, isTrue);
      expect(Platform.script.path, process.argv[1]);
      expect(Platform.script.pathSegments.last, contains(scriptName));
    });

    test('executable', () {
      expect(Platform.executable, 'node');
      expect(Platform.executable, process.argv0);
    });

    test('executableArguments', () {
      expect(Platform.executableArguments, isList);
      expect(Platform.executableArguments, process.execArgv);
    });

    test('unsupported platforms', () {
      expect(Platform.isAndroid, isFalse);
      expect(Platform.isFuchsia, isFalse);
      expect(Platform.isIOS, isFalse);
    });

    test('isMacOS', () {
      expect(Platform.isMacOS, isTrue);
      expect(Platform.isLinux, isFalse);
      expect(Platform.isWindows, isFalse);
    }, testOn: 'mac-os');

    test('isLinux', () {
      expect(Platform.isMacOS, isFalse);
      expect(Platform.isLinux, isTrue);
      expect(Platform.isWindows, isFalse);
    }, testOn: 'linux');

    test('isWindows', () {
      expect(Platform.isMacOS, isFalse);
      expect(Platform.isLinux, isFalse);
      expect(Platform.isWindows, isTrue);
    }, testOn: 'windows');

    test('localHostname', () {
      expect(Platform.localHostname, isNotEmpty);
    });

    test('numberOfProcessors', () {
      expect(Platform.numberOfProcessors, greaterThanOrEqualTo(1));
    });

    test('operatingSystem', () {
      expect(Platform.operatingSystem, process.platform);
      expect(Platform.operatingSystem, isNotEmpty);
    });

    test('packageConfig', () {
      expect(() {
        Platform.packageConfig;
      }, throwsA(new isInstanceOf<UnsupportedError>()));
    });

    test('packageRoot', () {
      expect(() {
        Platform.packageRoot;
      }, throwsA(new isInstanceOf<UnsupportedError>()));
    });

    test('pathSeparator', () {
      if (Platform.isWindows) {
        expect(Platform.pathSeparator, '\\');
      } else {
        expect(Platform.pathSeparator, '/');
      }
    });

    test('resolvedExecutable', () {
      expect(Platform.resolvedExecutable, process.execPath);
      expect(Platform.resolvedExecutable, isNotEmpty);
    });

    test('localeName', () {
      expect(() {
        Platform.localeName;
      }, throwsA(new isInstanceOf<UnsupportedError>()));
    });
  });
}
