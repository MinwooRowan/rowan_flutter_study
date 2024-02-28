// ignore_for_file: camel_case_types, constant_identifier_names
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'homework7struct.g.dart';

enum ViewType { Grid, List }

enum UserType { master, online, offline, leave }

@riverpod
class People extends _$People {
  @override
  PeopleData? build() {
    return null;
  }

  void setPeopleData(PeopleData peopleData) {
    state = peopleData;
  }
}

@riverpod
class HomeWork7Struct extends _$HomeWork7Struct {
  @override
  CommomData build() {
    return CommomData(
      viewType: ViewType.List,
      myPeopleData: PeopleData(
          imageName: '', name: '', detail: '', type: UserType.master),
      lstNowPeopleData: [],
      lstOldPeopleData: [],
    );
  }

  void initAllData() {
    // state.viewType = ViewType.List;
    state.copyWith(viewType: ViewType.List);
    initmyPeopleData();
    initlstNowPeopleData();
    initlstOldPeopleData();
  }

  CommomData getcommomData() {
    return state;
  }

  void setMyPeopleData(PeopleData peopleData) {
    ref.read(peopleProvider.notifier).setPeopleData(peopleData);
  }

  PeopleData getPeopleData() {
    return state.myPeopleData;
  }

  void setViewType(ViewType viewType) {
    state.copyWith(viewType: viewType);
  }

  ViewType getViewType() {
    return state.viewType;
  }

  ViewType saveAndgetViewType() {
    if (state.viewType == ViewType.Grid) {
      setViewType(ViewType.List);
    } else {
      setViewType(ViewType.Grid);
    }
    return getViewType();
  }

  void initmyPeopleData() {
    state.copyWith(
      myPeopleData: PeopleData(
          imageName: '', name: '', detail: '', type: UserType.master),
    );
  }

  void initlstNowPeopleData() {
    state.lstNowPeopleData.clear();
  }

  List<PeopleData> getlstNowPeopleData() {
    return state.lstNowPeopleData;
  }

  void initlstOldPeopleData() {
    state.lstOldPeopleData.clear();
  }

  List<PeopleData> getlstOldPeopleData() {
    return state.lstOldPeopleData;
  }

  void insertNowPeopleData(PeopleData peopleData) {
    state.lstNowPeopleData.add(peopleData);
  }

  void insertOldPeopleData(PeopleData peopleData) {
    state.lstOldPeopleData.add(peopleData);
  }

  void removePeopleData(PeopleData peopleData) {
    state.lstNowPeopleData.remove(peopleData);
  }
}

class CommomData {
  final ViewType viewType;
  PeopleData myPeopleData;
  final List<PeopleData> lstNowPeopleData;
  final List<PeopleData> lstOldPeopleData;

  CommomData({
    this.viewType = ViewType.List,
    required this.myPeopleData,
    required this.lstNowPeopleData,
    required this.lstOldPeopleData,
  });

  CommomData copyWith({
    ViewType? viewType,
    PeopleData? myPeopleData,
    List<PeopleData>? lstNowPeopleData,
    List<PeopleData>? lstOldPeopleData,
  }) {
    return CommomData(
      viewType: viewType ?? this.viewType,
      myPeopleData: myPeopleData ?? this.myPeopleData,
      lstNowPeopleData: lstNowPeopleData ?? this.lstNowPeopleData,
      lstOldPeopleData: lstOldPeopleData ?? this.lstOldPeopleData,
    );
  }
}

class PeopleData {
  final String imageName;
  final String name;
  final String detail;
  final UserType type;
  PeopleData({
    required this.imageName,
    required this.name,
    required this.detail,
    required this.type,
  });

  PeopleData copyWith({
    String? imageName,
    String? name,
    String? detail,
    UserType? type,
  }) {
    return PeopleData(
      imageName: imageName ?? this.imageName,
      name: name ?? this.name,
      detail: detail ?? this.detail,
      type: type ?? this.type,
    );
  }
}
