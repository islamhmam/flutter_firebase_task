abstract class ProgressStates{}

class ProgressInitialState extends ProgressStates{}

class GetProgressSuccessState extends ProgressStates{}
class GetProgressLoadingState extends ProgressStates{}
class GetProgressErrorState extends ProgressStates{
  GetProgressErrorState(error);
}

