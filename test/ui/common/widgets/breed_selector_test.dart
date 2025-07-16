import 'package:dogfydiet_app/application/widgets/breed_selector/breed_selector_notifier.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:dogfydiet_app/ui/common/widgets/breed_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/create_test_widget_with_localizations.dart';

const testBreed1 = DogBreed(
  id: 1,
  name: {'es': 'Golden Retriever', 'en': 'Golden Retriever'},
);

const testBreed2 = DogBreed(
  id: 2,
  name: {'es': 'Pastor Alemán', 'en': 'German Shepherd'},
);

const testBreed3 = DogBreed(
  id: 3,
  name: {'es': 'Labrador', 'en': 'Labrador'},
);

void main() {
  group('BreedSelector Widget Tests', () {
    testWidgets('should display placeholder when no breed is selected', (tester) async {
      const placeholder = 'Select a breed';

      const mockState = BreedSelectorState(
        breeds: [testBreed1],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            breedSelectorNotifierProvider.overrideWith(
              () => _TestBreedSelectorNotifier(mockState),
            ),
          ],
          child: createTestWidgetWithLocalizations(
            child: BreedSelector(
              selectedBreed: null,
              onBreedSelected: (_) {},
              placeholder: placeholder,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text(placeholder), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });

    testWidgets('should display selected breed name when breed is selected', (tester) async {
      const mockState = BreedSelectorState(
        breeds: [testBreed1],
        selectedBreed: testBreed1,
        isLoading: false,
        error: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            breedSelectorNotifierProvider.overrideWith(
              () => _TestBreedSelectorNotifier(mockState),
            ),
          ],
          child: createTestWidgetWithLocalizations(
            child: BreedSelector(
              selectedBreed: testBreed1,
              onBreedSelected: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Golden Retriever'), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    });

    testWidgets('should not open modal when loading', (tester) async {
      const mockState = BreedSelectorState(
        breeds: [],
        selectedBreed: null,
        isLoading: true,
        error: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            breedSelectorNotifierProvider.overrideWith(
              () => _TestBreedSelectorNotifier(mockState),
            ),
          ],
          child: createTestWidgetWithLocalizations(
            child: BreedSelector(
              selectedBreed: null,
              onBreedSelected: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(DraggableScrollableSheet), findsNothing);
    });

    testWidgets('should show error snackbar when there is an error', (tester) async {
      const errorMessage = 'Error loading breeds';

      const mockState = BreedSelectorState(
        breeds: [],
        selectedBreed: null,
        isLoading: false,
        error: errorMessage,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            breedSelectorNotifierProvider.overrideWith(
              () => _TestBreedSelectorNotifier(mockState),
            ),
          ],
          child: createTestWidgetWithLocalizations(
            child: BreedSelector(
              selectedBreed: null,
              onBreedSelected: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.text(errorMessage), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should open modal with breed list when tapped', (tester) async {
      const mockState = BreedSelectorState(
        breeds: [testBreed1, testBreed2],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            breedSelectorNotifierProvider.overrideWith(
              () => _TestBreedSelectorNotifier(mockState),
            ),
          ],
          child: createTestWidgetWithLocalizations(
            child: BreedSelector(
              selectedBreed: null,
              onBreedSelected: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(DraggableScrollableSheet), findsOneWidget);
      expect(find.text('Golden Retriever'), findsOneWidget);
      expect(find.text('Pastor Alemán'), findsOneWidget);
    });

    testWidgets('should filter breeds when searching', (tester) async {
      const mockState = BreedSelectorState(
        breeds: [testBreed1, testBreed2, testBreed3],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            breedSelectorNotifierProvider.overrideWith(
              () => _TestBreedSelectorNotifier(mockState),
            ),
          ],
          child: createTestWidgetWithLocalizations(
            child: BreedSelector(
              selectedBreed: null,
              onBreedSelected: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.text('Golden Retriever'), findsOneWidget);
      expect(find.text('Pastor Alemán'), findsOneWidget);
      expect(find.text('Labrador'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Golden');
      await tester.pumpAndSettle();

      expect(find.text('Golden Retriever'), findsOneWidget);
      expect(find.text('Pastor Alemán'), findsNothing);
      expect(find.text('Labrador'), findsNothing);
    });

    testWidgets('should show selected breed with check icon in modal', (tester) async {
      const mockState = BreedSelectorState(
        breeds: [testBreed1, testBreed2],
        selectedBreed: testBreed1,
        isLoading: false,
        error: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            breedSelectorNotifierProvider.overrideWith(
              () => _TestBreedSelectorNotifier(mockState),
            ),
          ],
          child: createTestWidgetWithLocalizations(
            child: BreedSelector(
              selectedBreed: testBreed1,
              onBreedSelected: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('should call onBreedSelected when breed is tapped in modal', (tester) async {
      DogBreed? selectedBreedResult;

      const mockState = BreedSelectorState(
        breeds: [testBreed1, testBreed2],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            breedSelectorNotifierProvider.overrideWith(
              () => _TestBreedSelectorNotifier(mockState),
            ),
          ],
          child: createTestWidgetWithLocalizations(
            child: BreedSelector(
              selectedBreed: null,
              onBreedSelected: (selectedBreed) => selectedBreedResult = selectedBreed,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Golden Retriever'));
      await tester.pumpAndSettle();

      expect(selectedBreedResult, equals(testBreed1));
    });

    testWidgets('should show "No se encontraron razas" when no breeds match search', (tester) async {
      const mockState = BreedSelectorState(
        breeds: [testBreed1, testBreed2],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            breedSelectorNotifierProvider.overrideWith(
              () => _TestBreedSelectorNotifier(mockState),
            ),
          ],
          child: createTestWidgetWithLocalizations(
            child: BreedSelector(
              selectedBreed: null,
              onBreedSelected: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'xyz');
      await tester.pumpAndSettle();

      expect(find.text('No se encontraron razas'), findsOneWidget);
    });

    testWidgets('should handle case insensitive search', (tester) async {
      const mockState = BreedSelectorState(
        breeds: [testBreed1, testBreed2],
        selectedBreed: null,
        isLoading: false,
        error: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            breedSelectorNotifierProvider.overrideWith(
              () => _TestBreedSelectorNotifier(mockState),
            ),
          ],
          child: createTestWidgetWithLocalizations(
            child: BreedSelector(
              selectedBreed: null,
              onBreedSelected: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'golden');
      await tester.pumpAndSettle();

      expect(find.text('Golden Retriever'), findsOneWidget);
      expect(find.text('Pastor Alemán'), findsNothing);
    });
  });
}

class _TestBreedSelectorNotifier extends BreedSelectorNotifier {
  final BreedSelectorState _mockState;

  _TestBreedSelectorNotifier(this._mockState);

  @override
  BreedSelectorState build() => _mockState;

  @override
  Future<void> loadBreeds() async {}

  @override
  void selectBreed(DogBreed breed) {}

  @override
  void clearSelection() {}

  @override
  void clearError() {}
}
