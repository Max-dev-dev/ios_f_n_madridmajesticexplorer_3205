import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/cubit/quiz_cubit.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/models/quiz_model.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/pages/home_screen.dart';
import 'package:logger/logger.dart';
import 'package:share_plus/share_plus.dart';

final GlobalKey<HomeScreenState> homeScreenKey = GlobalKey<HomeScreenState>();

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubit()..loadQuestions(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (message) => Center(
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
              loaded: (
                questions,
                currentIndex,
                score,
                isFinished,
                selectedAnswer,
              ) {
                if (isFinished) {
                  return _buildResultScreen(
                    context,
                    score,
                    questions.length,
                    questions,
                    context.read<QuizCubit>().getUserAnswers(),
                  );
                }
                return _buildQuizQuestion(
                  context,
                  questions,
                  currentIndex,
                  selectedAnswer,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuizQuestion(
    BuildContext context,
    List<QuizItem> questions,
    int currentIndex,
    String? selectedAnswer,
  ) {
    final question = questions[currentIndex];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(question.image, fit: BoxFit.cover),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF383838),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: LinearProgressIndicator(
                            value: (currentIndex + 1) / questions.length,
                            backgroundColor: const Color(0xFF999999),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFFFD52B),
                            ),
                            minHeight: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${currentIndex + 1}/${questions.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    question.question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            child: Column(
              children: _buildAnswerButtons(context, question, selectedAnswer),
            ),
          ),
        ],
      ),
    );
  }

  final Logger logger = Logger();

  List<Widget> _buildAnswerButtons(
    BuildContext context,
    QuizItem question,
    String? selectedAnswer,
  ) {
    final answers = {
      'A': question.answerA,
      'B': question.answerB,
      'C': question.answerC,
      'D': question.answerD,
    };

    return answers.entries.map((entry) {
      return _buildAnswerButton(
        context,
        entry.value,
        entry.key,
        question.rightAnswer,
        selectedAnswer,
      );
    }).toList();
  }

  Widget _buildAnswerButton(
    BuildContext context,
    String text,
    String answerKey,
    String correctAnswer,
    String? selectedAnswer,
  ) {
    final correctAnswerKey =
        {
          "answer_a": "A",
          "answer_b": "B",
          "answer_c": "C",
          "answer_d": "D",
        }[correctAnswer] ??
        correctAnswer;

    final isSelected = selectedAnswer != null && selectedAnswer == answerKey;
    final isCorrect = answerKey == correctAnswerKey;
    final hasAnswered = selectedAnswer != '';

    return GestureDetector(
      onTap:
          hasAnswered
              ? null
              : () async {
                context.read<QuizCubit>().selectAnswer(answerKey);
                await Future.delayed(const Duration(seconds: 2));
              },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                hasAnswered
                    ? (isCorrect
                        ? Colors.green
                        : (isSelected ? Colors.red : Colors.grey[800]!))
                    : Colors.grey[800]!,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[700],
              child: Text(
                answerKey.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultScreen(
    BuildContext context,
    int score,
    int total,
    List<QuizItem> questions,
    List<String?> usersAnswers,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Congratulations',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Your score:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '$score/$total',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const HomeScreen(
                                          initialTabIndex: 3,
                                        ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFC9B09),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                              child: const Text(
                                "Try again",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: () {
                                _shareResults(score, total);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF272727),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                              child: const Text(
                                "Share results",
                                style: TextStyle(
                                  color: Color(0xFFFC9B09),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              const Text(
                'Results:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    final selectedAnswer = usersAnswers[index] ?? '';
                    final correctAnswerKey =
                        {
                          "answer_a": "A",
                          "answer_b": "B",
                          "answer_c": "C",
                          "answer_d": "D",
                        }[question.rightAnswer] ??
                        question.rightAnswer;

                    final isCorrect = selectedAnswer == correctAnswerKey;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 12.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. Your answer:',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: isCorrect ? Colors.green : Colors.red,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey[700],
                                  child: Text(
                                    selectedAnswer,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    question.getAnswerText(selectedAnswer),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _shareResults(int score, int total) {
    final String text =
        "I just completed a Madrid knowledge quiz and scored $score out of $total! 🇪🇸✨\n\n"
        "Test your knowledge of Madrid and see if you can beat my score! 🏆\n\n"
        "Let's explore the history, landmarks, and culture of this amazing city together! 🏰🌇\n\n"
        "#MadridQuiz #ExploreMadrid #TriviaChallenge";

    Share.share(text);
  }
}
