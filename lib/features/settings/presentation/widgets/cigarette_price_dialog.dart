import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quitra/core/di/injection.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:quitra/features/onboarding/data/models/user_profile_isar.dart';
import 'package:quitra/l10n/app_localizations.dart';

class CigarettePriceDialog extends StatefulWidget {
  const CigarettePriceDialog({super.key});

  @override
  State<CigarettePriceDialog> createState() => _CigarettePriceDialogState();
}

class _CigarettePriceDialogState extends State<CigarettePriceDialog> {
  bool _isPacket = false;
  String _cigarettePriceStr = '';
  String _packetPriceStr = '';
  String _cigarettesPerPacketStr = '';
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final dataSource = getIt<OnboardingLocalDataSource>();
    final profile = await dataSource.getUserProfile();
    if (profile != null && mounted) {
      setState(() {
        if (profile.cigarettePrice != null) {
          _isPacket = false;
          _cigarettePriceStr = profile.cigarettePrice!.toString();
        } else if (profile.packetPrice != null &&
            profile.cigarettesPerPacket != null) {
          _isPacket = true;
          _packetPriceStr = profile.packetPrice!.toString();
          _cigarettesPerPacketStr = profile.cigarettesPerPacket!.toString();
        }
        _isLoading = false;
      });
    } else if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveProfile() async {
    final dataSource = getIt<OnboardingLocalDataSource>();
    final existingProfile = await dataSource.getUserProfile();

    double? cigPrice;
    double? packPrice;
    int? cigsPerPack;

    if (!_isPacket) {
      if (_cigarettePriceStr.isEmpty) {
        setState(() => _error = 'priceRequired');
        return;
      }
      cigPrice = double.tryParse(_cigarettePriceStr);
      if (cigPrice == null) {
        setState(() => _error = 'invalidNumber');
        return;
      }
    } else {
      if (_packetPriceStr.isEmpty) {
        setState(() => _error = 'priceRequired');
        return;
      }
      packPrice = double.tryParse(_packetPriceStr);
      if (packPrice == null) {
        setState(() => _error = 'invalidNumber');
        return;
      }
      if (_cigarettesPerPacketStr.isEmpty) {
        setState(() => _error = 'priceRequired');
        return;
      }
      cigsPerPack = int.tryParse(_cigarettesPerPacketStr);
      if (cigsPerPack == null) {
        setState(() => _error = 'invalidNumber');
        return;
      }
    }

    final profile = existingProfile ?? UserProfileIsar()
      ..cigarettesPerDay = 10
      ..yearsSmoking = 1
      ..quitMethod = 'cold_turkey'
      ..quitStartDate = DateTime.now();

    profile.cigarettePrice = cigPrice;
    profile.packetPrice = packPrice;
    profile.cigarettesPerPacket = cigsPerPack;

    await dataSource.saveUserProfile(profile);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withValues(alpha: 0.08),
              blurRadius: 40,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.cigarettePriceLabel,
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(fontSize: 24),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTypeOption(
                              context,
                              title: l10n.priceOptionSingle,
                              isSelected: !_isPacket,
                              onTap: () => setState(() => _isPacket = false),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTypeOption(
                              context,
                              title: l10n.priceOptionPacket,
                              isSelected: _isPacket,
                              onTap: () => setState(() => _isPacket = true),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      if (!_isPacket)
                        _buildTextField(
                          context,
                          label: l10n.singleCigarettePriceLabel,
                          value: _cigarettePriceStr,
                          onChanged: (v) {
                            setState(() {
                              _cigarettePriceStr = v;
                              _error = null;
                            });
                          },
                          isDecimal: true,
                        )
                      else ...[
                        _buildTextField(
                          context,
                          label: l10n.packetPriceLabel,
                          value: _packetPriceStr,
                          onChanged: (v) {
                            setState(() {
                              _packetPriceStr = v;
                              _error = null;
                            });
                          },
                          isDecimal: true,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          context,
                          label: l10n.cigarettesPerPacketLabel,
                          value: _cigarettesPerPacketStr,
                          onChanged: (v) {
                            setState(() {
                              _cigarettesPerPacketStr = v;
                              _error = null;
                            });
                          },
                          isDecimal: false,
                        ),
                      ],
                      if (_error != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          _error == 'priceRequired'
                              ? l10n.priceRequired
                              : l10n.invalidNumber,
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 12,
                          ),
                        ),
                      ],
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: _saveProfile,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              gradient: AppTheme.signatureGradient,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                l10n.saveAction,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppTheme.primary
                : AppTheme.primary.withValues(alpha: 0.2),
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
            color: AppTheme.primary.withValues(alpha: 0.5),
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
