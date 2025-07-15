import 'package:dogfydiet_app/application/screens/user/profile_screen/profile_screen_notifier.dart';
import 'package:dogfydiet_app/domain/model/objects/order.dart';
import 'package:dogfydiet_app/domain/model/objects/order_item.dart';
import 'package:dogfydiet_app/domain/model/value_objects/order_status.dart';
import 'package:dogfydiet_app/ui/common/app_layout/app_layout.dart';
import 'package:dogfydiet_app/ui/common/extensions/context_extension.dart';
import 'package:dogfydiet_app/ui/common/utilities/order_status_localizer.dart';
import 'package:dogfydiet_app/ui/screens/home/home_screen/home_screen.dart';
import 'package:dogfydiet_app/ui/theme/shapes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

part 'widgets/empty_orders.dart';
part 'widgets/info_row.dart';
part 'widgets/order_card.dart';
part 'widgets/order_details_sheet.dart';
part 'widgets/order_item_card.dart';
part 'widgets/order_status_filter.dart';
part 'widgets/order_status_chip.dart';
part 'widgets/orders_summary.dart';
part 'widgets/summary_card.dart';


class ProfileScreen extends ConsumerStatefulWidget {
  static const String routePath = '/$routeName';
  static const String routeName = 'profile';

  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showStickyFilter = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    const threshold = 300.0;
    final shouldShow = _scrollController.offset > threshold;

    if (shouldShow != _showStickyFilter) {
      setState(() {
        _showStickyFilter = shouldShow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileScreenNotifierProvider);
    final profileNotifier = ref.read(profileScreenNotifierProvider.notifier);

    return AppLayout(
      child: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () => profileNotifier.refreshOrders(),
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.all(Shapes.gutter),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: Shapes.gutter2x),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(Shapes.gutter),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.receipt_long,
                            size: 32,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: Shapes.gutter),
                        Text(
                          context.l10n.myOrders,
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Shapes.gutterSmall),
                        Text(
                          context.l10n.manageAndReviewOrders,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: Shapes.gutter),

                  // Summary Cards
                  const _OrdersSummary(),

                  const SizedBox(height: Shapes.gutter2x),

                  // Status Filter (solo visible cuando no está sticky)
                  AnimatedOpacity(
                    opacity: _showStickyFilter ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: const _OrderStatusFilter(),
                  ),

                  const SizedBox(height: Shapes.gutter),

                  // Error handling
                  if (profileState.error != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: Shapes.gutter),
                      padding: const EdgeInsets.all(Shapes.gutter),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(Shapes.borderRadius),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          const SizedBox(width: Shapes.gutterSmall),
                          Expanded(
                            child: Text(
                              profileState.error!,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => profileNotifier.clearError(),
                            icon: Icon(
                              Icons.close,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Content
                  if (profileState.isLoading)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(Shapes.gutter4x),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (profileState.filteredOrders.isEmpty)
                    const _EmptyOrders()
                  else
                  // Orders list
                    ...profileState.filteredOrders.map(
                          (order) => Padding(
                        padding: const EdgeInsets.only(bottom: Shapes.gutter),
                        child: _OrderCard(
                          order: order,
                          onTap: () => _OrderDetailsSheet.show(context, order),
                          onStatusChange: (newStatus) {
                            profileNotifier.updateOrderStatus(order.id, newStatus);
                          },
                          onDelete: () => profileNotifier.deleteOrder(order.id),
                        ),
                      ),
                    ),

                  // Bottom spacing
                  const SizedBox(height: Shapes.gutter4x),
                ],
              ),
            ),
          ),

          // Filtros fijos en la parte superior cuando se hace scroll
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: _showStickyFilter ? 0 : -100,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(Shapes.gutter),
              child: const SafeArea(
                bottom: false,
                child: _OrderStatusFilter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}