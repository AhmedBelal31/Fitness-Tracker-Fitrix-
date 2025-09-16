class ApiConstants {
  static const String apiBaseUrl = "https://achievers.codenesslab.com/api/";

  static const String login = "auth/login";
  static const String register = "auth/register";

  static const String categoriesList = "/categories";
  static const String categoriesQuestions = "/get-category-questions";
  static const String submitAnswers = "/add-update-user-category-answers";
  static const String updateProfile = "/update-profile";

  static const String sendEmailOTP = "/send-email-otp";
  static const String verifyOTP = "/verify-otp";
  static const String updatePassword = "/reset-password";
  static const String socialLogin = "/auth/social/auth";

  static const String userProfile = "/user";
  static const String homeCategoriesChallenges = "/user-category-challenges";
  static const String homeRecommendedChallenges = "/recommended-challenges";
  static const String homeAllCategoriesAndChallenges =
      "/get-all-category-challenges";
  static const String homeCreateChallenge = "/challenges";
  static const String userChallenges = "/users-challenges";
  static const String homeUserTimeline = "/user-timeline";
  static const String joinChallenge = "/join-challenge";
  static const String leaveChallenge = "/leave-challenge";
  static const String toggleTimelineLike = "/timeline-toggle-like";
  static const String searchForChallenges = "/challenge-by-name";

  //Calendar
  static const String userChallengeByDate = "/users-challenges-by-date";

  //Progress
  static const String createProgress = "/progress";
  static const String weeklyProgress = "/progress-by-week";

  // Prayer
  static const String prayerTimesByDate = "/prayer-times-by-date";
  static const String prayerTimesFullYear = "/prayer-times-full-year";
  static const String userPrayer = "/user-prayers";

  // Azkar
  static const String azkar = "/azkar";
  static const String createAzkar = "/create-azkar";
  static const String updateZikrCounter = "/update-zikr-counter";

  // Quran
  static const String getBookmark = "/quran-bookmark";
  static const String updateBookmark = "/quran-bookmark";

  //books
  static const String bookBookmark = "/bookmark";

  // User Mood
  static const String userMood = "/user-mood";

  //Profile
  static const String userProfileImages = "/user-profile-images";
  static const String userFollowersImages = "/user-followers-images";

//  Following And Followers
  static const String userFollowing = '/user-following';
  static const String userFollowers = '/user-followers';
  static const String userStats = '/user-stats';
  static const String follow = '/follow';
  static const String unfollow = '/unfollow';
  static const String challengeById = '/challenges';

  // Badges
  static const String badges = '/badges';
  static const String userBadges = '/users-badges';
  static const String badgesWithProgress = '/badges-with-progress';
}
