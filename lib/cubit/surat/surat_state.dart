part of 'surat_cubit.dart';

//import 'package:equatable/equatable.dart';
//import 'package:flutter_ahlul_quran_app/data/models/surat_model.dart';

abstract class SuratState extends Equatable {
  const SuratState();

  @override
  List<Object> get props => [];
}

class SuratInitial extends SuratState {}

class SuratLoading extends SuratState {}

class SuratLoaded extends SuratState {
  final List<SuratModel> listSurat;
  const SuratLoaded({
    required this.listSurat,
  });

  @override
  List<Object> get props => [listSurat];
}

class SuratError extends SuratState {
  final String message;
  const SuratError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
