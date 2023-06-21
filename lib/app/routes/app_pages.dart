import 'package:get/get.dart';

import '../modules/ar/bindings/ar_binding.dart';
import '../modules/ar/views/ar_view.dart';
import '../modules/bottom_navbar/bindings/bottom_navbar_binding.dart';
import '../modules/bottom_navbar/views/bottom_navbar_view.dart';
import '../modules/detail_courses/bindings/detail_courses_binding.dart';
import '../modules/detail_courses/views/detail_courses_view.dart';
import '../modules/discussion/bindings/discussion_binding.dart';
import '../modules/discussion/views/discussion_view.dart';
import '../modules/discussion_room/bindings/discussion_room_binding.dart';
import '../modules/discussion_room/views/discussion_room_view.dart';
import '../modules/discussion_room_detail/bindings/discussion_room_detail_binding.dart';
import '../modules/discussion_room_detail/views/discussion_room_detail_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/learn_ability_test/bindings/learn_ability_test_binding.dart';
import '../modules/learn_ability_test/views/learn_ability_test_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/question_quiz/bindings/question_quiz_binding.dart';
import '../modules/question_quiz/views/question_quiz_view.dart';
import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/quiz_detail/bindings/quiz_detail_binding.dart';
import '../modules/quiz_detail/views/quiz_detail_view.dart';
import '../modules/quiz_score/bindings/quiz_score_binding.dart';
import '../modules/quiz_score/views/quiz_score_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/summary/bindings/summary_binding.dart';
import '../modules/summary/views/summary_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.DISCUSSION,
      page: () => const DiscussionView(),
      binding: DiscussionBinding(),
    ),
    GetPage(
      name: _Paths.DISCUSSION_ROOM,
      page: () => const DiscussionRoomView(),
      binding: DiscussionRoomBinding(),
    ),
    GetPage(
      name: _Paths.DISCUSSION_ROOM_DETAIL,
      page: () => const DiscussionRoomDetailView(),
      binding: DiscussionRoomDetailBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
    ),
    GetPage(
      name: _Paths.LEARN_ABILITY_TEST,
      page: () => const LearnAbilityTestView(),
      binding: LearnAbilityTestBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ_SCORE,
      page: () => const QuizScoreView(),
      binding: QuizScoreBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_COURSES,
      page: () => const DetailCoursesView(),
      binding: DetailCoursesBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVBAR,
      page: () => const BottomNavbarView(),
      binding: BottomNavbarBinding(),
    ),
    GetPage(
      name: _Paths.SUMMARY,
      page: () => const SummaryView(),
      binding: SummaryBinding(),
    ),
    GetPage(
      name: _Paths.AR,
      page: () => const ArView(),
      binding: ArBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ_DETAIL,
      page: () => const QuizDetailView(),
      binding: QuizDetailBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_QUIZ,
      page: () => const QuestionQuizView(),
      binding: QuestionQuizBinding(),
    ),
  ];
}
