import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/features/onboarding/presentation/widgets/step_container.dart';
import 'package:quitra/l10n/app_localizations.dart';

class CigarettePriceStep extends StatefulWidget {
  final bool isPacket;
  final String cigarettePriceStr;
  final String packetPriceStr;
  final String cigarettesPerPacketStr;
  final ValueChanged<bool> onTypeChanged;
  final ValueChanged<String> onCigarettePriceChanged;
  final ValueChanged<String> onPacketPriceChanged;
  final ValueChanged<String> onCigarettesPerPacketChanged;

  const CigarettePriceStep({
    super.key,
    required this.isPacket,
    required this.cigarettePriceStr,
    required this.packetPriceStr,
    required this.cigarettesPerPacketStr,
    required this.onTypeChanged,
    required this.onCigarettePriceChanged,
    required this.onPacketPriceChanged,
    required this.onCigarettesPerPacketChanged,
  });

  @override
  State<CigarettePriceStep> createState() => _CigarettePriceStepState();
}

class _CigarettePriceStepState extends State<CigarettePriceStep> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return StepContainer(
      title: l10n.cigarettePriceStepTitle,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildTypeOption(
                  context,
                  title: l10n.priceOptionSingle,
                  isSelected: !widget.isPacket,
                  onTap: () => widget.onTypeChanged(false),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTypeOption(
                  context,
                  title: l10n.priceOptionPacket,
                  isSelected: widget.isPacket,
                  onTap: () => widget.onTypeChanged(true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          if (!widget.isPacket) ...[
            _buildTextField(
              context,
              label: l10n.singleCigarettePriceLabel,
              value: widget.cigarettePriceStr,
              onChanged: widget.onCigarettePriceChanged,
              isDecimal: true,
            ),
          ] else ...[
            _buildTextField(
              context,
              label: l10n.packetPriceLabel,
              value: widget.packetPriceStr,
              onChanged: widget.onPacketPriceChanged,
              isDecimal: true,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              context,
              label: l10n.cigarettesPerPacketLabel,
              value: widget.cigarettesPerPacketStr,
              onChanged: widget.onCigarettesPerPacketChanged,
              isDecimal: false,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTypeOption(
    BuildContext context, {
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppTheme.primary
                : AppTheme.primary.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: isSelected ? Colors.white : AppTheme.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
    required bool isDecimal,
  }) {
    return TextField(
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: value,
          selection: TextSelection.collapsed(offset: value.length),
        ),
      ),
      onChanged: onChanged,
      keyboardType: TextInputType.numberWithOptions(decimal: isDecimal),
      inputFormatters: isDecimal
          ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))]
          : [FilteringTextInputFormatter.digitsOnly],
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppTheme.onSurface,
          ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppTheme.onSurfaceVariant),
        filled: true,
        fillColor: AppTheme.surfaceContainerLowest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppTheme.primary.withOpacity(0.5),
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
      ),
    );
  }
}
