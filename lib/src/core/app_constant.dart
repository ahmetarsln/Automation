import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'app_assets.dart';

enum GameCategoryType {
  CALCULATOR,
  GUESS_SIGN,
  SQUARE_ROOT,
  MATH_PAIRS,
  CORRECT_ANSWER,
  MAGIC_TRIANGLE,
  MENTAL_ARITHMETIC,
  QUICK_CALCULATION,
  MATH_GRID,
  PICTURE_PUZZLE,
  NUMBER_PYRAMID
}

enum PuzzleType { MATH_PUZZLE, MEMORY_PUZZLE, BRAIN_PUZZLE }

enum TimerStatus {
  restart,
  play,
  pause,
}

enum Gender {
  bayan,
  bay,
}

enum DifficultyType { HIGH, MEDIUM, LOW }

enum DialogType {
  non,
  info,
  over,
  pause,
  exit,
}

class RoutesKeys {
  static const String home ="/";

  static const String login = "/login";
  static const String register = "/register";
  
  
  static const String analysisList = "/analysis";
  static const String analysisNew = "/analysis/new";
  static const String analysisEdit = "/analysis/edit";
  static const String analysisDelete = "/analysis/delete";

  static const String appointmentList = "/appointment";
  static const String appointmentNew = "/appointment/new";
  static const String appointmentEdit = "/appointment/edit";
  static const String appointmentDelete = "/appointment/delete";

  static const String employeList = "/employe";
  static const String employeNew = "/employe/new";
  static const String employeEdit = "/employe/edit";
  static const String employeDelete = "/employe/delete";

  static const String patientList = "/patient";
  static const String patientNew = "/patient/new";
  static const String patientEdit = "/patient/edit";
  static const String patientDelete = "/patient/delete";

  static const String polyclinicList = "/polyclinic";
  static const String polyclinicNew = "/polyclinic/new";
  static const String polyclinicEdit = "/polyclinic/edit";
  static const String polyclinicDelete = "/polyclinic/delete";

  static const String prescriptionList = "/prescription";
  static const String prescriptionNew = "/prescription/new";
  static const String prescriptionEdit = "/prescription/edit";
  static const String prescriptionDelete = "/prescription/delete";

  static const String treatmentList = "/treatment";
  static const String treatmentNew = "/treatment/new";
  static const String treatmentEdit = "/treatment/edit";
  static const String treatmentDelete = "/treatment/delete";
}

class KeyUtil {
  static const IS_DARK_MODE = "isDarkMode";

  static const String splash = 'Splash';
  static const String dashboard = 'Dashboard';
  static const String home = 'Home';

  static const String calculator = 'Calculator';
  static const String guessSign = 'GuessSign';
  static const String correctAnswer = 'CorrectAnswer';
  static const String quickCalculation = 'QuickCalculation';
  static const String mentalArithmetic = 'MentalArithmetic';
  static const String squareRoot = 'SquareRoot';
  static const String mathPairs = 'MathPairs';
  static const String magicTriangle = 'MagicTriangle';
  static const String picturePuzzle = 'PicturePuzzle';
  static const String mathGrid = 'MathGrid';
  static const String numberPyramid = "NumberPyramid";

  static int getTimeUtil(
    GameCategoryType gameCategoryType,
    DifficultyType difficultyType,
  ) {
    switch (gameCategoryType) {
      case GameCategoryType.CALCULATOR:
        return calculatorTimeOut[difficultyType.index];
      case GameCategoryType.GUESS_SIGN:
        return guessSignTimeOut[difficultyType.index];
      case GameCategoryType.SQUARE_ROOT:
        return squareRootTimeOut[difficultyType.index];
      case GameCategoryType.MATH_PAIRS:
        return mathematicalPairsTimeOut[difficultyType.index];
      case GameCategoryType.CORRECT_ANSWER:
        return correctAnswerTimeOut[difficultyType.index];
      case GameCategoryType.MAGIC_TRIANGLE:
        return magicTriangleTimeOut[difficultyType.index];
      case GameCategoryType.MENTAL_ARITHMETIC:
        return mentalArithmeticTimeOut[difficultyType.index];
      case GameCategoryType.QUICK_CALCULATION:
        return quickCalculationTimeOut[difficultyType.index];
      case GameCategoryType.MATH_GRID:
        return mathGridTimeOut[difficultyType.index];
      case GameCategoryType.PICTURE_PUZZLE:
        return picturePuzzleTimeOut[difficultyType.index];
      case GameCategoryType.NUMBER_PYRAMID:
        return numPyramidTimeOut[difficultyType.index];
    }
  }

  static double getScoreUtil(GameCategoryType gameCategoryType) {
    switch (gameCategoryType) {
      case GameCategoryType.CALCULATOR:
        return calculatorScore;
      case GameCategoryType.GUESS_SIGN:
        return guessSignScore;
      case GameCategoryType.SQUARE_ROOT:
        return squareRootScore;
      case GameCategoryType.MATH_PAIRS:
        return mathGridScore;
      case GameCategoryType.CORRECT_ANSWER:
        return correctAnswerScore;
      case GameCategoryType.MAGIC_TRIANGLE:
        return magicTriangleScore;
      case GameCategoryType.MENTAL_ARITHMETIC:
        return mentalArithmeticScore;
      case GameCategoryType.QUICK_CALCULATION:
        return quickCalculationScore;
      case GameCategoryType.MATH_GRID:
        return mathGridScore;
      case GameCategoryType.PICTURE_PUZZLE:
        return picturePuzzleScore;
      case GameCategoryType.NUMBER_PYRAMID:
        return numberPyramidScore;
    }
  }

  static double getScoreMinusUtil(GameCategoryType gameCategoryType) {
    switch (gameCategoryType) {
      case GameCategoryType.CALCULATOR:
        return calculatorScoreMinus;
      case GameCategoryType.GUESS_SIGN:
        return guessSignScoreMinus;
      case GameCategoryType.SQUARE_ROOT:
        return squareRootScoreMinus;
      case GameCategoryType.MATH_PAIRS:
        return mathematicalPairsScoreMinus;
      case GameCategoryType.CORRECT_ANSWER:
        return correctAnswerScoreMinus;
      case GameCategoryType.MAGIC_TRIANGLE:
        return magicTriangleScoreMinus;
      case GameCategoryType.MENTAL_ARITHMETIC:
        return mentalArithmeticScoreMinus;
      case GameCategoryType.QUICK_CALCULATION:
        return quickCalculationScoreMinus;
      case GameCategoryType.MATH_GRID:
        return mathGridScoreMinus;
      case GameCategoryType.PICTURE_PUZZLE:
        return picturePuzzleScoreMinus;
      case GameCategoryType.NUMBER_PYRAMID:
        return numberPyramidScoreMinus;
    }
  }

  static double getCoinUtil(GameCategoryType gameCategoryType) {
    switch (gameCategoryType) {
      case GameCategoryType.CALCULATOR:
        return calculatorCoin;
      case GameCategoryType.GUESS_SIGN:
        return guessSignCoin;
      case GameCategoryType.SQUARE_ROOT:
        return squareRootCoin;
      case GameCategoryType.MATH_PAIRS:
        return mathematicalPairsCoin;
      case GameCategoryType.CORRECT_ANSWER:
        return correctAnswerCoin;
      case GameCategoryType.MAGIC_TRIANGLE:
        return magicTriangleCoin;
      case GameCategoryType.MENTAL_ARITHMETIC:
        return mentalArithmeticCoin;
      case GameCategoryType.QUICK_CALCULATION:
        return quickCalculationCoin;
      case GameCategoryType.MATH_GRID:
        return mathGridCoin;
      case GameCategoryType.PICTURE_PUZZLE:
        return picturePuzzleCoin;
      case GameCategoryType.NUMBER_PYRAMID:
        return numberPyramidCoin;
    }
  }

  //Game TimeOut Constant
  static List<int> calculatorTimeOut = [5, 10, 15];
  static List<int> guessSignTimeOut = [5, 10, 15];
  static List<int> correctAnswerTimeOut = [5, 10, 15];
  static List<int> quickCalculationTimeOut = [20, 30, 40];
  static List<int> quickCalculationPlusTime = [1, 3, 6];

  static List<int> mentalArithmeticTimeOut = [60, 90, 120];
  static List<int> mentalArithmeticLocalTimeOut = [4, 7, 11];
  static List<int> squareRootTimeOut = [5, 10, 15];
  static List<int> mathGridTimeOut = [120, 150, 180];
  static List<int> mathematicalPairsTimeOut = [60, 90, 120];

  static List<int> magicTriangleTimeOut = [60, 90, 120];
  static List<int> picturePuzzleTimeOut = [90, 120, 150];
  static List<int> numPyramidTimeOut = [120, 150, 180];

  //Game Score Constant
  static double calculatorScore = 1;
  static double calculatorScoreMinus = -1;

  static double guessSignScore = 1;
  static double guessSignScoreMinus = -1;

  static double correctAnswerScore = 1;
  static double correctAnswerScoreMinus = -1;

  static double quickCalculationScore = 1;
  static double quickCalculationScoreMinus = -1;

  static double mentalArithmeticScore = 2;
  static double mentalArithmeticScoreMinus = -1;

  static double squareRootScore = 1;
  static double squareRootScoreMinus = -1;

  static double mathematicalPairsScore = 1;
  static double mathematicalPairsScoreMinus = -1;

  static double mathGridScore = 5;
  static double mathGridScoreMinus = 0;

  static double magicTriangleScore = 5;
  static double magicTriangleScoreMinus = 0;

  static double picturePuzzleScore = 2;
  static double picturePuzzleScoreMinus = -1;

  static double numberPyramidScore = 5;
  static double numberPyramidScoreMinus = 0;

  //Game Coin Constant
  static double calculatorCoin = 0.5;
  static double guessSignCoin = 0.5;
  static double correctAnswerCoin = 0.5;
  static double quickCalculationCoin = 0.5;

  static double mentalArithmeticCoin = 1;
  static double squareRootCoin = 0.5;
  static double mathGridCoin = 3;
  static double mathematicalPairsCoin = 1;

  static double magicTriangleCoin = 3;
  static double picturePuzzleCoin = 1;
  static double numberPyramidCoin = 3;
}
