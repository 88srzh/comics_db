// Package imports:
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/account/account_container.dart';
import 'package:comics_db_app/domain/entity/account_details.dart';

part 'account_state.dart';

part 'account_event.dart';

part 'account_bloc.freezed.dart';

class AccountBloc extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  AccountBloc(super.initialState) {
    on<AccountDetailsEvent>(((event, emit) async {
      if (event is AccountDetailsEventLoadReset) {
        await onAccountDetailsEventLoadReset(event, emit);
      } else if (event is AccountDetailsEventLoadDetails) {
        await onAccountDetailsEventLoadDetails(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onAccountDetailsEventLoadReset(AccountDetailsEvent event, Emitter<AccountDetailsState> emit) async {
    emit(const AccountDetailsState.initial());
  }

  Future<void> onAccountDetailsEventLoadDetails(AccountDetailsEvent event, Emitter<AccountDetailsState> emit) async {}
}
