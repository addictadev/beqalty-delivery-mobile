import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/utils/styles/styles.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String? profileImageUrl;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.responsivePadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.profileHeaderBackground,
            AppColors.profileHeaderBackground.withValues(alpha: 0.9),
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: context.responsiveMargin),

          // Profile Picture and Info
          Row(
            children: [
              // Profile Picture
              Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bgProfile,
                  border: Border.all(color: AppColors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowMedium,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: profileImageUrl != null
                    ? ClipOval(
                        child: Image.network(
                          profileImageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildDefaultAvatar();
                          },
                        ),
                      )
                    : _buildDefaultAvatar(),
              ),

              SizedBox(width: context.responsiveMargin * 2),

              // Name and Email
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyles.textViewBold24.copyWith(
                        color: AppColors.white,
                        fontSize: 6.w,
                      ),
                    ),
                    SizedBox(height: context.responsiveMargin * 0.5),
                    Text(
                      email,
                      style: TextStyles.textViewRegular14.copyWith(
                        color: AppColors.white.withValues(alpha: 0.9),
                        fontSize: 3.5.w,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: context.responsiveMargin * 2),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.bgProfile,
      ),
      child: Icon(Icons.person, size: 10.w, color: AppColors.primary),
    );
  }
}
