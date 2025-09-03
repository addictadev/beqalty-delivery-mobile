import 'package:baqaltydeliveryapp/core/images_preview/app_assets.dart';
import 'package:baqaltydeliveryapp/core/images_preview/custom_svg_img.dart';
import 'package:baqaltydeliveryapp/core/navigation_services/navigation_manager.dart';
import 'package:baqaltydeliveryapp/core/theme/app_colors.dart';
import 'package:baqaltydeliveryapp/core/utils/responsive_utils.dart';
import 'package:baqaltydeliveryapp/core/widgets/custom_back_button.dart';
import 'package:baqaltydeliveryapp/core/widgets/primary_button.dart';
import 'package:baqaltydeliveryapp/features/auth/presentation/view/sucess_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../widgets/auth_background_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Document upload states
  String? nationalIdFront;
  String? nationalIdBack;
  String? driversLicense;
  String? vehicleDocuments;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundWidget(
      backgroundHeight: 200,
      overlayOpacity: 0.15,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.responsivePadding),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),

                      _buildBackButton(),

                      SizedBox(height: 24),

                      _buildWelcomeSection(),

                      SizedBox(height: 48),

                      _buildFormFields(),

                      SizedBox(height: 32),

                      _buildRegisterButton(),

                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              _buildLoginLink(),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(icon: Icons.chevron_left, size: 40),
        SizedBox(width: 10.w),
      ],
    );
  }

  Widget _buildWelcomeSection() {
    return Row(
      children: [
        _buildCharacterIllustration(),

        SizedBox(width: 16),

        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.robotoFlex(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
                height: 1.2,
                fontStyle: FontStyle.italic,
              ),
              children: [TextSpan(text: "Hello! Register to get started")],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCharacterIllustration() {
    return CustomSvgImage(
      assetName: AppAssets.authLoginBackground,
      width: 30.w,
      height: 30.w,
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildDocumentUploadField(
          label: "National ID (Front)",
          documentName: nationalIdFront ?? "Abdallah's ID",
          hasDocument: nationalIdFront != null,
          onUpload: () => _uploadDocument('nationalIdFront'),
          onRemove: nationalIdFront != null
              ? () => _removeDocument('nationalIdFront')
              : null,
        ),

        SizedBox(height: 20),

        _buildDocumentUploadField(
          label: "National ID (Back)",
          documentName: nationalIdBack ?? "Abdallah's ID",
          hasDocument: nationalIdBack != null,
          onUpload: () => _uploadDocument('nationalIdBack'),
          onRemove: nationalIdBack != null
              ? () => _removeDocument('nationalIdBack')
              : null,
        ),

        SizedBox(height: 20),

        _buildDocumentUploadField(
          label: "Driver's License",
          documentName: driversLicense ?? "Upload Document",
          hasDocument: driversLicense != null,
          onUpload: () => _uploadDocument('driversLicense'),
          onRemove: driversLicense != null
              ? () => _removeDocument('driversLicense')
              : null,
        ),

        SizedBox(height: 20),

        _buildDocumentUploadField(
          label: "Vehicle Documents",
          documentName: vehicleDocuments ?? "Upload Document",
          hasDocument: vehicleDocuments != null,
          onUpload: () => _uploadDocument('vehicleDocuments'),
          onRemove: vehicleDocuments != null
              ? () => _removeDocument('vehicleDocuments')
              : null,
        ),
      ],
    );
  }

  Widget _buildDocumentUploadField({
    required String label,
    required String documentName,
    required bool hasDocument,
    required VoidCallback onUpload,
    VoidCallback? onRemove,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.robotoFlex(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: onUpload,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Icon(
                  hasDocument ? Icons.picture_as_pdf : Icons.cloud_upload,
                  color: hasDocument ? Colors.red : Colors.grey.shade600,
                  size: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    documentName,
                    style: GoogleFonts.robotoFlex(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: hasDocument
                          ? AppColors.textPrimary
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
                if (hasDocument && onRemove != null)
                  GestureDetector(
                    onTap: onRemove,
                    child: Icon(
                      Icons.close,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _uploadDocument(String documentType) {
    setState(() {
      switch (documentType) {
        case 'nationalIdFront':
          nationalIdFront = "Abdallah's ID";
          break;
        case 'nationalIdBack':
          nationalIdBack = "Abdallah's ID";
          break;
        case 'driversLicense':
          driversLicense = "Driver's License Document";
          break;
        case 'vehicleDocuments':
          vehicleDocuments = "Vehicle Registration";
          break;
      }
    });
  }

  void _removeDocument(String documentType) {
    setState(() {
      switch (documentType) {
        case 'nationalIdFront':
          nationalIdFront = null;
          break;
        case 'nationalIdBack':
          nationalIdBack = null;
          break;
        case 'driversLicense':
          driversLicense = null;
          break;
        case 'vehicleDocuments':
          vehicleDocuments = null;
          break;
      }
    });
  }

  Widget _buildRegisterButton() {
    return PrimaryButton(text: "Register", onPressed: () {
      NavigationManager.navigateTo(SucessRegisterScreen());
    });
  }

  Widget _buildLoginLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.robotoFlex(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
          children: [
            TextSpan(text: "Already have an account? "),
            TextSpan(
              text: "Login Now",
              style: GoogleFonts.robotoFlex(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },
            ),
          ],
        ),
      ),
    );
  }
}
