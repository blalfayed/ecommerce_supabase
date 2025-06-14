part of 'project_details_cubit.dart';

sealed class ProjectDetailsState extends Equatable {
  const ProjectDetailsState();

  @override
  List<Object> get props => [];
}

final class ProjectDetailsInitial extends ProjectDetailsState {}

final class GetRateLoading extends ProjectDetailsState {}

final class GetRateSuccess extends ProjectDetailsState {}

final class GetRateError extends ProjectDetailsState {}

final class AddOrUpdateRateLoading extends ProjectDetailsState {}

final class AddOrUpdateRateSuccess extends ProjectDetailsState {}

final class AddOrUpdateRateError extends ProjectDetailsState {}
