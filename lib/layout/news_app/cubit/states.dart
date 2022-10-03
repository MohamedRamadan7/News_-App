abstract class NewsStatus{}
class NewsInitialState extends NewsStatus{}
class NewsBootomNavState extends NewsStatus{}

class NewsBusinessLodingState extends NewsStatus{}
class NewsBusinessState extends NewsStatus{}
class NewsBusinessErrorState extends NewsStatus{
  final String error;
  NewsBusinessErrorState(this.error);
}

class NewsSportsLodingState extends NewsStatus{}
class NewsSportsState extends NewsStatus{}
class NewsSportsErrorState extends NewsStatus{
  final String error;
  NewsSportsErrorState(this.error);
}

class NewsScienceLodingState extends NewsStatus{}
class NewsScienceState extends NewsStatus{}
class NewsScienceErrorState extends NewsStatus{
  final String error;
  NewsScienceErrorState(this.error);
}

class NewsModeState extends NewsStatus{}

class NewsSearchLodingState extends NewsStatus{}
class NewsSearchState extends NewsStatus{}
class NewsSearchErrorState extends NewsStatus{
  final String error;
  NewsSearchErrorState(this.error);
}
