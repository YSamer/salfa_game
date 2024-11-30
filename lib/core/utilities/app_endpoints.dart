class AppEndPoints {
  AppEndPoints._();

  // 'https://shurrly.mooo.com/api/v1/';
  static String baseUrl = 'https://shurrly.mooo.com/api/';
  static String filePath = 'https://shurrly.mooo.com/files';

  static String login = 'v2/user/auth/login';
  static String register = 'v2/user/auth/register';
  static String completeRegister = 'v2/user/auth/verify-phone';
  static String resendOTP = 'v2/user/auth/resend-otp';
  static String autoLogin = 'v2/user/auth/auto-login';
  static String getSettings = 'v1/user/settings/general';
  static String forgotPassword = 'v2/user/auth/forgot-password';
  static String verifyToken = 'v2/user/auth/verify-token';
  static String resetPassword = 'v2/user/auth/password/reset';
  static String logout = 'v2/user/auth/logout';
  static String basicInfoStep2 = 'v2/user/advisor-application/step-two';
  static String sendMediaStep1 = 'v2/user/advisor-application/step-one';
  static String step3PartOne = 'v2/user/advisor-application/get-session-rates';
  static String step3PartTwo = 'v2/user/advisor-application/step-three';
  static String deleteSessions =
      'v2/user/advisor-application/delete-session-rates/{id}';
  static String addAvailabilities = 'v2/user/advisor-application/step-four';
  static String getAppStep = 'v1/user/advisor-application/get-app-step';
  static String areaOfExpertise = 'v2/user/areaOfExpertise';
  static String location = 'v2//user/searchLocation';
  static String searchSkills = 'v2/user/searchSkills';
  static String addPrimaryExpertise = 'v2/user/auth/addPrimaryExpertise';
  static String addInterestedExpertises =
      'v2/user/auth/addInterestedExpertises';
  static String searchCategories = 'v1/user/searchCategories';
  static String getAvailabilities = 'v1/user/availabilities';
  static String getDuration = 'v2/user/advisor-application/get-durationsList';
  static String getAllSliders = 'v1/user/get-slider';
  static String getAdvisors = 'v2/user/get-advisors';
  static String getAdvisorSessions = 'v2/user/advisor/sessions/all';
  static String getSeekerSessions = 'v2/user/sessions/all';
  static String getAllAdvisors = 'v2/user/advisors/all';
  static String getAllCategories = 'v1/user/get-categories';
  static String proposeSession = 'v2/user/sessions/proposeSession';
  static String getAdvisorProfile = 'v2/user/advisors/{id}';
  static String acceptSession =
      'v2/user/advisor/sessions/{id}/accept';
  static String rejectSession =
      'v2/user/advisor/sessions/{id}/reject';
  static String rescheduleSession =
      'v1/user/sessions/proposed-sessions/{id}/reschedule';
  static String getAdvisorSession =
      'v2/user/sessions/advisor-session-rates/{id}';
  static String paypal = 'v1/user/payout/paypal-email';
  static String bankAccount = 'v1/user/payout/bank-details';
  static String bankDetails = 'v1/user/payout/bank-details';
  static String respondToReschedule =
      'v1/user/seeker/proposeSession/respondToReschedule/{id}';
  static String availabilities = 'v1/user/seeker/advisors-availabilities/{id}';
  static String blocks = 'v1/user/blocks/categories';
  static String blocksReasons = 'v1/user/blocks/reasons/category/{id}';
  static String addBlock = 'v1/user/blocks/store/{id}';
  static String blocksUser = 'v1/user/blocks';
  static String community = 'v2/user/community/all-questions';
  static String myQuestion = 'v2/user/community/my-questions';
  static String addQuestion = 'v2/user/community/add-question';
  static String updateQuestion = 'v2/user/community/update-question';
  static String deleteQuestion = 'v2/user/community/delete-question/{id}';
  static String addAnswer = 'v2/user/community/add-answer';
  static String addLike = 'v2/user/community/answers/{id}/like';
  static String blocksRemove = 'v1/user/blocks/remove/{id}';
  static String latestQ = 'v2/user/get-getLatestQuestions';
  static String dashboardSessions = 'v2/user/get-dashboardSessions';
  static String seekerMaterials = 'v1/user/materials/all';
  static String advisorMaterials = 'v1/user/materials/my-materials';
  static String profile = 'v2/user/profile/getPersonalData';
  static String checkEmail = 'v2/user/auth/check-email';
  static String newPassword = 'v2/user/auth/new-password';
  static String resendotp = 'v2/user/auth/resend-otp';
  static String sendotp = 'v2/user/auth/password/request-otp';
  static String verifyOtp = 'v2/user/auth/password/verify-otp';
  static String verifyEmail = 'v2/user/auth/verify-email';
  static String updateProfile = 'v2/user/profile/update-profile';
  static String updateImage = 'v2/user/profile/update-image';
}
