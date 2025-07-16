import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Helper para manejar mejor el pumping en tests con Riverpod
class TestHelper {
  /// Pump widget con cleanup automático de timers
  static Future<void> pumpWidgetWithCleanup(
    WidgetTester tester,
    Widget widget, {
    Duration? duration,
  }) async {
    await tester.pumpWidget(widget, duration: duration);
    await tester.pumpAndSettle();

    // Ejecutar tareas pendientes
    await tester.binding.delayed(Duration.zero);

    // Dar un frame extra para que Riverpod limpie sus timers
    await tester.pump();
  }

  /// Cleanup completo para tests con Riverpod
  static Future<void> cleanupAfterTest(WidgetTester tester) async {
    // Ejecutar todas las tareas pendientes
    await tester.pumpAndSettle();
    await tester.binding.delayed(Duration.zero);

    // Dar frames adicionales para cleanup
    await tester.pump();
    await tester.pump();

    // Ejecutar una última vez las tareas pendientes
    await tester.binding.delayed(Duration.zero);
  }

  /// Crear container con cleanup automático
  static ProviderContainer createTestContainer({
    List<Override> overrides = const [],
  }) {
    return ProviderContainer(overrides: overrides);
  }

  /// Disponer container de forma segura
  static Future<void> disposeContainer(ProviderContainer container) async {
    // Ejecutar tareas pendientes antes de disponer
    await Future.delayed(Duration.zero);
    container.dispose();
    // Dar un poco más de tiempo para que termine la limpieza
    await Future.delayed(Duration.zero);
  }
}
