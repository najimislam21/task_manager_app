class TMUrls {
  static String baseUrls = 'https://task-manager-api.ostad.live/api/v1';
  static String SingUpUrls = '$baseUrls/Registration';
  static String SingInUrls = '$baseUrls/Login';
  static String getTaskCountUrls = '$baseUrls/taskStatusCount' ;
  static String createTaskURl = '$baseUrls/createTask' ;
  static String getTaskByStatusURl(String status) => '$baseUrls/listTaskByStatus/$status' ;
  static String deleteTaskURl(String id) => '$baseUrls/deleteTask/$id' ;
}