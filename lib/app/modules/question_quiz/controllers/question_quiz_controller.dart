import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constant/api_url.dart';
import '../../../data/model/question_model.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/services/question_service.dart';
import 'package:http/http.dart' as http;

class QuestionQuizController extends GetxController {
  String id = Get.arguments['id'];
  String optionA = "";
  String optionB = "";
  String optionC = "";
  String optionD = "";
  String answer = "";
  String message = "";
  int data = 0;

  List<QuestionModel> question = [];
  int index = 0;

  void selectAnswer(String answer) {
    question[index].selectedAnswer = answer;
    update();
  }

  bool isLoading = true;

  // The state of the timer (running or not)
  bool isRunning = false;
  @override
  void onInit() {
    fetchQuestion();
    // startTimer();
    super.onInit();
  }

  void fetchQuestion() async {
    List<QuestionModel> data = await QuestionService().fetchQuestion(id: id);
    isLoading = false;
    question = data;
    update();
  }

  void nextQuestion() {
    if (index < question.length - 1) {
      index++;
    } else {
      sendAnswersToApi();
    }
    update();
  }

  void backQuestion() {
    if (index == 0) {
      return;
    } else {
      index--;
    }
    update();
  }

  void onChanged(String? value) {
    selectAnswer(value.toString());
    update();
  }

  Future<void> sendAnswersToApi() async {
    final storage = GetStorage();

    List<Map<String, dynamic>> answers = [];

    for (QuestionModel questionss in question) {
      String? selectedAnswer = questionss.selectedAnswer;

      if (selectedAnswer != null) {
        answers.add({
          'question_id': id,
          'answer': selectedAnswer,
        });
      }
    }

    Map<String, dynamic> requestBody = {
      'quiz_id': id,
      'answers': answers,
    };

    Uri uri = Uri.parse('$apiUrl/submit-answer');
    http.Response response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${storage.read("token")}',
      },
      body: json.encode(requestBody),
    );
    data = json.decode(response.body)['data']['score'];
    message = json.decode(response.body)['data']['message'];

    print(response.body);
    if (response.statusCode == 200) {
      Get.toNamed(Routes.QUIZ_SCORE, arguments : {
        'score' : data,
        'message':message,
      });
      // Answers submitted successfully
      print('Answers submitted successfully');
    } else {
      // Failed to submit answers, handle error
      print('Failed to submit answers');
    }
  }

  // The timer
  Timer? timer;
  int minutes = 15;
  int seconds = 0;
  void startTimer() {
    isRunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        update();
      } else {
        if (minutes > 0) {
          minutes--;
          seconds = 59;
          update();
        } else {
          isRunning = false;
          timer.cancel();
          update();
        }
      }
    });
  }
}
