



import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/const/text_constants.dart';
import 'package:app_solidale/screens/onboarding/widget/onboarding_tile.dart';
import 'package:app_solidale/screens/presentation/page/presentation_page.dart';

class DataConstants {
  // Onboarding
  static final onboardingTiles = [
    OnboardingTile(
      title: TextConstants.onboarding1Title,
      mainText: TextConstants.onboarding1Description,
      imagePath: PathConstants.onboarding1,
    ),
    OnboardingTile(
      title: TextConstants.onboarding2Title,
      mainText: TextConstants.onboarding2Description,
      imagePath: PathConstants.onboarding2,
    ),
    OnboardingTile(
      title: TextConstants.onboarding4Title,
      mainText: TextConstants.onboarding4Description,
      imagePath: PathConstants.onboarding4,
    ),
    OnboardingTile(
      title: TextConstants.onboarding3Title,
      mainText: TextConstants.onboarding3Description,
      imagePath: PathConstants.onboarding3,
    ),
    const PresentationPage()
      
  ];

 
  

  // Reminder
  static List<String> reminderDays = [
    TextConstants.everyday,
    TextConstants.monday_friday,
    TextConstants.weekends,
    TextConstants.monday,
    TextConstants.tuesday,
    TextConstants.wednesday,
    TextConstants.thursday,
    TextConstants.friday,
    TextConstants.saturday,
    TextConstants.sunday,
  ];
}
