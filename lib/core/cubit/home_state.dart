part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetDataLoading extends HomeState {}

final class GetDataSuccess extends HomeState {}

final class GetDataError extends HomeState {}

final class AddToFavoriteLoading extends HomeState {}

final class AddToFavoritesuccess extends HomeState {}

final class AddToFavoriteError extends HomeState {}

final class RemoveFromFavoriteLoading extends HomeState {}

final class RemoveFromFavoritesuccess extends HomeState {}

final class RemoveFromFavoriteError extends HomeState {}
