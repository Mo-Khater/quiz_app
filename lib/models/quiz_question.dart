class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(this.question, this.answers);

  List<String> shuffleAnswers() {
    final List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
