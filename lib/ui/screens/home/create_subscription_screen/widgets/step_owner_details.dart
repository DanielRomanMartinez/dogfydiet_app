part of '../create_subscription_screen.dart';

class _StepOwnerDetails extends ConsumerStatefulWidget {
  @override
  ConsumerState<_StepOwnerDetails> createState() => _StepOwnerDetailsState();
}

class _StepOwnerDetailsState extends ConsumerState<_StepOwnerDetails> {
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  bool _controllersInitialized = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _initializeControllers(CreateSubscriptionScreenState state) {
    if (!_controllersInitialized) {
      _emailController.text = state.form.ownerEmail ?? '';
      _phoneController.text = state.form.ownerPhone ?? '';
      _controllersInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createSubscriptionScreenNotifierProvider);
    final notifier = ref.read(createSubscriptionScreenNotifierProvider.notifier);

    _initializeControllers(state);

    return Padding(
      padding: const EdgeInsets.all(Shapes.gutter),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Container(
            padding: const EdgeInsets.all(Shapes.gutter),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Text(
              '👍',
              style: TextStyle(fontSize: 32),
            ),
          ),
          const SizedBox(height: Shapes.gutter2x),
          Text(
            context.l10n.specialMenuAlmostReady(state.form.petName ?? context.l10n.yourDog),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Shapes.gutter2x),
          Row(
            children: [
              Icon(
                Icons.email_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: Shapes.gutter),
              Expanded(
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'EMAIL@GMAIL.COM',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Shapes.borderRadius),
                    ),
                  ),
                  onChanged: (value) {
                    notifier.updateOwnerEmail(value);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: Shapes.gutter),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Shapes.gutterSmall,
                  vertical: Shapes.gutter,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(Shapes.borderRadius),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ES',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: Shapes.gutterSmall),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Shapes.gutterSmall),
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '612345678',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Shapes.borderRadius),
                    ),
                  ),
                  onChanged: (value) {
                    notifier.updateOwnerPhone(value);
                  },
                ),
              ),
            ],
          ),
          const Spacer(flex: 2),
          Text(
            context.l10n.acceptTermsMessage,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}