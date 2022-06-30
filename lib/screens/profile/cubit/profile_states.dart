abstract class ProfileStates{}

class ProfileInitialState extends ProfileStates{}

class GetProfileSuccessState extends ProfileStates{}
class GetProfileLoadingState extends ProfileStates{}
class GetProfileErrorState extends ProfileStates{
  GetProfileErrorState(error);
}

