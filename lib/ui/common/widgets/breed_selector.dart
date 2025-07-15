import 'package:dogfydiet_app/application/widgets/breed_selector/breed_selector_notifier.dart';
import 'package:dogfydiet_app/ui/common/extensions/context_extension.dart';
import 'package:dogfydiet_app/ui/theme/shapes.dart';
import 'package:dogfydiet_app/domain/model/objects/dog_breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BreedSelector extends ConsumerWidget {
  final DogBreed? selectedBreed;
  final Function(DogBreed) onBreedSelected;
  final String? placeholder;

  const BreedSelector({
    super.key,
    this.selectedBreed,
    required this.onBreedSelected,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breedState = ref.watch(breedSelectorNotifierProvider);

    return GestureDetector(
      onTap: () => _showBreedSelector(context, ref, breedState),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Shapes.gutter,
          vertical: Shapes.gutter,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedBreed?.getLocalizedName('es') ?? placeholder ?? context.l10n.whatBreedIsYourDog,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: selectedBreed != null
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }

  void _showBreedSelector(BuildContext context, WidgetRef ref, breedState) {
    if (breedState.isLoading) {
      return;
    }

    if (breedState.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(breedState.error!)),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Shapes.borderRadiusLarge),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return _BreedSelectorModal(
              breeds: breedState.breeds,
              selectedBreed: selectedBreed,
              onBreedSelected: (breed) {
                ref.read(breedSelectorNotifierProvider.notifier).selectBreed(breed);
                onBreedSelected(breed);
                context.pop();
              },
              scrollController: scrollController,
            );
          },
        );
      },
    );
  }
}

class _BreedSelectorModal extends StatefulWidget {
  final List<DogBreed> breeds;
  final DogBreed? selectedBreed;
  final Function(DogBreed) onBreedSelected;
  final ScrollController scrollController;

  const _BreedSelectorModal({
    required this.breeds,
    required this.selectedBreed,
    required this.onBreedSelected,
    required this.scrollController,
  });

  @override
  State<_BreedSelectorModal> createState() => _BreedSelectorModalState();
}

class _BreedSelectorModalState extends State<_BreedSelectorModal> {
  late TextEditingController _searchController;
  List<DogBreed> _filteredBreeds = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredBreeds = widget.breeds;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterBreeds(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredBreeds = widget.breeds;
      } else {
        _filteredBreeds = widget.breeds.where((breed) {
          return breed.getLocalizedName('es').toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Shapes.gutter),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: Shapes.gutter),
          Text(
            context.l10n.selectBreed,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: Shapes.gutter),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar raza...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Shapes.borderRadius),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: Shapes.gutter,
                vertical: Shapes.gutter,
              ),
            ),
            onChanged: _filterBreeds,
          ),
          const SizedBox(height: Shapes.gutter),
          Expanded(
            child: _filteredBreeds.isEmpty
                ? Center(
                    child: Text(
                      'No se encontraron razas',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : ListView.builder(
                    controller: widget.scrollController,
                    itemCount: _filteredBreeds.length,
                    itemBuilder: (context, index) {
                      final breed = _filteredBreeds[index];
                      final isSelected = widget.selectedBreed?.id == breed.id;

                      return ListTile(
                        title: Text(
                          breed.getLocalizedName('es'),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        trailing: isSelected
                            ? Icon(
                                Icons.check_circle,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            : null,
                        onTap: () => widget.onBreedSelected(breed),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
